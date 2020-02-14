<?php
/**
 * @package     Redform.Libraries
 * @subpackage  Core.Model
 *
 * @copyright   Copyright (C) 2012 - 2014 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('_JEXEC') or die;

/**
 * Class RdfCoreModel Submission price
 *
 * This class deals with the creation of necessary object for submission payment
 *
 * @package     Redform.Libraries
 * @subpackage  Core.Model
 * @since       3.0
 */
class RdfCoreModelSubmissionprice extends RModel
{
	/**
	 * @var RdfAnswers
	 */
	protected $answers;

	/**
	 * Data saved to db
	 *
	 * @var object
	 */
	protected $submission;

	protected $price;

	protected $vat;

	protected $submissionPriceItems;

	/**
	 * Constructor
	 *
	 * @param   array  $config  optional config
	 */
	public function __construct($config = array())
	{
		parent::__construct($config);

		if ($config && isset($config['answers']))
		{
			$this->setAnswers($config['answers']);
		}
	}

	/**
	 * Set answers
	 *
	 * @param   RdfAnswers  $answers  answers
	 *
	 * @return object
	 */
	public function setAnswers($answers)
	{
		$this->answers = $answers;

		return $this;
	}

	/**
	 * Update submission price and price items
	 *
	 * @return boolean
	 */
	public function updatePrice()
	{
		$price = $this->getPrice();
		$vat = $this->getVat();

		if (!$price)
		{
			return true;
		}

		$db = $this->_db;
		$query = $db->getQuery(true);

		$row = RTable::getAdminInstance('submitter', array(), 'com_redform');
		$row->load($this->answers->sid);
		$row->price = $price;
		$row->vat = $vat;
		$row->currency = $this->answers->currency;

		$query->update('#__rwf_submitters');
		$query->set('price = ' . $db->quote($price));
		$query->set('vat = ' . $db->quote($vat));
		$query->set('currency = ' . $db->quote($this->answers->currency));
		$query->where('id = ' . $db->Quote($this->answers->sid));
		$db->setQuery($query);

		$row->store();

		$this->submission = $row;

		$this->updateSubmissionPriceItems();
		$this->deleteUnpaidPaymentRequests();

		if (!$this->isPaid())
		{
			$this->createPaymentRequest();
		}

		return true;
	}

	/**
	 * Get price
	 *
	 * @return float|mixed
	 */
	private function getPrice()
	{
		if (!$this->price)
		{
			$params = JComponentHelper::getParams('com_redform');
			$price = $this->answers->getPrice();

			if (!$params->get('allow_negative_total', 1))
			{
				$price = max(array(0, $price));
			}

			$this->price = $price;
		}

		return $this->price;
	}

	/**
	 * Get vat
	 *
	 * @return float|mixed
	 */
	private function getVat()
	{
		if (!$this->vat)
		{
			$params = JComponentHelper::getParams('com_redform');
			$vat = $this->answers->getVat();

			if (!$params->get('allow_negative_total', 1))
			{
				$vat = max(array(0, $vat));
			}

			$this->vat = $vat;
		}

		return $this->vat;
	}

	/**
	 * create Submission Price Items
	 *
	 * @return void
	 */
	private function updateSubmissionPriceItems()
	{
		$this->deletePreviousPriceItems();

		foreach ($this->answers->getFields() as $field)
		{
			$this->createSubmissionPriceItem($field);
		}
	}

	/**
	 * create Submission Price Item from field
	 *
	 * @param   RdfRfield  $field  field
	 *
	 * @return void
	 */
	private function createSubmissionPriceItem($field)
	{
		if (!$price = $field->getPrice())
		{
			return;
		}

		$this->submissionPriceItems = array();

		$row = RTable::getAdminInstance('Submissionpriceitem', array(), 'com_redform');

		$row->submission_id = $this->answers->sid;
		$row->sku = $field->getSku();
		$row->label = $field->getPaymentRequestItemLabel();
		$row->price = round($price, RHelperCurrency::getPrecision($this->answers->getCurrency()));
		$row->vat = round($field->getVat(), RHelperCurrency::getPrecision($this->answers->getCurrency()));

		if (!($row->check() && $row->store()))
		{
			throw new RuntimeException('Couldn\'t create submission price items: ' . $row->getError());
		}

		$this->submissionPriceItems[] = $row;
	}

	/**
	 * Delete previous price items for this submission
	 *
	 * @return void
	 */
	private function deletePreviousPriceItems()
	{
		$query = $this->_db->getQuery(true);

		$query->delete('#__rwf_submission_price_item')
			->where('submission_id = ' . $this->answers->sid);

		$this->_db->setQuery($query);

		if (!$this->_db->execute())
		{
			throw new RuntimeException('Couldn\'t delete submission price items');
		}
	}

	/**
	 * Update Payment Request
	 *
	 * @return void
	 */
	private function createPaymentRequest()
	{
		$alreadyPaid = $this->getAlreadyPaid();

		// Create payment request
		$date = JFactory::getDate();
		$row = RTable::getAdminInstance('paymentrequest', array(), 'com_redform');
		$row->submission_id = $this->submission->id;
		$row->created = $date->toSql();
		$row->price = $this->submission->price - $alreadyPaid->price;
		$row->vat = $this->submission->vat - $alreadyPaid->vat;
		$row->currency = $this->submission->currency;

		$row->store();

		$this->createPaymentRequestItems($row->id);

		$entity = RdfEntityPaymentrequest::getInstance();
		$entity->bind($row);

		JPluginHelper::importPlugin('redform');
		$dispatcher = JDispatcher::getInstance();
		$dispatcher->trigger('onRedformAfterCreatePaymentRequest', array($entity));
	}

	/**
	 * Create payment request items
	 *
	 * @param   int  $paymentRequestId  payment request id
	 *
	 * @return void
	 */
	private function createPaymentRequestItems($paymentRequestId)
	{
		$query = $this->_db->getQuery(true)
			->select('sku, label, price, vat')
			->from('#__rwf_submission_price_item')
			->where('submission_id = ' . $this->answers->sid);

		$this->_db->setQuery($query);

		$currentItems = $this->_db->loadObjectList();
		$alreadyPaid = $this->getAlreadyPaidPaymentRequestItems();

		$finalItems = array();

		// First substract already paid
		foreach ($alreadyPaid as $item)
		{
			$finalItems[$item->sku] = $item;
			$finalItems[$item->sku]->price = - $finalItems[$item->sku]->price;
			$finalItems[$item->sku]->vat = - $finalItems[$item->sku]->vat;
		}

		// Then add current items
		foreach ($currentItems as $item)
		{
			if (empty($finalItems[$item->sku]))
			{
				$finalItems[$item->sku] = $item;
			}
			else
			{
				$finalItems[$item->sku]->price += $item->price;
				$finalItems[$item->sku]->vat += $item->vat;
			}
		}

		// Now register result to db
		foreach ($finalItems as $item)
		{
			if (!$item->price)
			{
				// Already paid
				continue;
			}

			// Add a line for difference
			$itemRow = RTable::getAdminInstance('Paymentrequestitem', array(), 'com_redform');

			$itemRow->payment_request_id = $paymentRequestId;
			$itemRow->sku = $item->sku;
			$itemRow->label = $item->label;
			$itemRow->price = $item->price;
			$itemRow->vat = $item->vat;

			$itemRow->store();
		}
	}

	/**
	 * delete Previous Payment Requests
	 *
	 * @return void
	 */
	private function deleteUnpaidPaymentRequests()
	{
		$query = $this->_db->getQuery(true);

		$query->delete('#__rwf_payment_request')
			->where('submission_id = ' . $this->answers->sid)
			->where('paid = 0');

		$this->_db->setQuery($query);

		if (!$this->_db->execute())
		{
			throw new RuntimeException('Couldn\'t delete payment request');
		}
	}

	/**
	 * Check if is paid
	 *
	 * @return string
	 */
	private function isPaid()
	{
		$price = $this->getPrice();
		$vat = $this->getVat();

		$alreadyPaid = $this->getAlreadyPaid();

		return ($price - $alreadyPaid->price == 0) ? true : false;
	}

	/**
	 * Get already paid amount
	 *
	 * @return object properties price and vat
	 */
	private function getAlreadyPaid()
	{
		$query = $this->_db->getQuery(true);

		$query->select('SUM(pr.price) AS price, SUM(pr.vat) AS vat')
			->from('#__rwf_payment_request AS pr')
			->where('pr.submission_id = ' . $this->answers->sid)
			->where('pr.paid = 1')
			->group('pr.submission_id');

		$this->_db->setQuery($query);

		$sums = $this->_db->loadObject();

		$res = new stdclass;
		$res->price = 0;
		$res->vat = 0;

		if ($sums)
		{
			$res->price += $sums->price;
			$res->vat += $sums->vat;
		}

		return $res;
	}

	/**
	 * Get already paid amount
	 *
	 * @return object properties price and vat
	 */
	private function getAlreadyPaidPaymentRequestItems()
	{
		$query = $this->_db->getQuery(true);

		$query->select('i.*')
			->from('#__rwf_payment_request AS pr')
			->innerJoin('#__rwf_payment_request_item AS i ON i.payment_request_id = pr.id')
			->where('pr.submission_id = ' . $this->answers->sid)
			->where('pr.paid = 1');

		$this->_db->setQuery($query);

		$items = $this->_db->loadObjectList();

		// Group by sku
		$skus = array();

		foreach ($items as $item)
		{
			if (empty($skus[$item->sku]))
			{
				$skus[$item->sku] = $item;
			}
			else
			{
				$skus[$item->sku]->price += $item->price;
				$skus[$item->sku]->vat += $item->vat;
			}
		}

		return $skus;
	}
}
