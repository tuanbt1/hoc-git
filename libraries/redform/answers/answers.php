<?php
/**
 * @package     Redform.Libraries
 * @subpackage  Core
 *
 * @copyright   Copyright (C) 2012 - 2014 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('_JEXEC') or die;

/**
 * Class RdfAnswers
 *
 * This class is a helper to handle submissions
 *
 * @package     Redform.Libraries
 * @subpackage  Core
 * @since       3.0
 */
class RdfAnswers
{
	private $answerId = 0;

	private $fields = null;

	private $formId = 0;

	private $form;

	private $submitter_email = array();

	private $listnames = array();

	private $recipients = array();

	private $basePrice = 0;

	private $baseVat = 0;

	private $isnew = true;

	private $sid = 0;

	private $submitKey;

	private $integration;

	private $currency;

	/**
	 * Constructor
	 */
	public function __construct()
	{
		$this->fields = array();
	}

	/**
	 * Magic method
	 *
	 * @param   string  $property  property name
	 *
	 * @return string
	 *
	 * @throws Exception
	 */
	public function __get($property)
	{
		switch ($property)
		{
			case 'sid':
				return $this->getSid();

			case 'submit_key':
				return $this->getSubmitKey();

			case 'fields':
				return $this->fields;

			case 'currency':
				return $this->currency;
		}

		$trace = debug_backtrace();
		throw new Exception(
			'Undefined property via __get(): ' . $property .
			' in ' . $trace[0]['file'] .
			' on line ' . $trace[0]['line'],
			500
		);

		return null;
	}

	/**
	 * Set form id
	 *
	 * @param   int  $id  form id
	 *
	 * @return void
	 */
	public function setFormId($id)
	{
		$this->formId = (int) $id;
	}

	/**
	 * get form id
	 *
	 * @return integer
	 */
	public function getFormId()
	{
		return $this->formId;
	}

	/**
	 * Set answer id
	 *
	 * @param   int  $id  id
	 *
	 * @return void
	 */
	public function setAnswerId($id)
	{
		$this->answerId = (int) $id;
	}

	/**
	 * Get answer id
	 *
	 * @return integer
	 */
	public function getAnswerId()
	{
		return $this->answerId;
	}

	/**
	 * Set submit key
	 *
	 * @param   string  $key  submit key
	 *
	 * @return void
	 */
	public function setSubmitKey($key)
	{
		$this->submitKey = $key;
	}

	/**
	 * get submit key
	 *
	 * @return string
	 */
	public function getSubmitKey()
	{
		return $this->submitKey;
	}

	/**
	 * Set integration key
	 *
	 * @param   string  $key  integration key
	 *
	 * @return void
	 */
	public function setIntegration($key)
	{
		$this->integration = $key;
	}

	/**
	 * Set currency
	 *
	 * @param   string  $currencyCode  currency code
	 *
	 * @return void
	 */
	public function setCurrency($currencyCode)
	{
		$this->currency = $currencyCode;
	}

	/**
	 * Get currency
	 *
	 * @return string
	 */
	public function getCurrency()
	{
		return $this->currency;
	}

	/**
	 * Get posted newsletters names
	 *
	 * @return mixed
	 */
	public function getListNames()
	{
		if (!$this->listnames)
		{
			$this->listnames = array();

			foreach ($this->fields as $field)
			{
				if ($field->fieldtype == 'email')
				{
					$this->listnames[$field->id] = array('email' => $field->value, 'lists' => $field->getSelectedNewsletters());
				}
			}
		}

		return $this->listnames;
	}

	/**
	 * Return emails associated to submission for notifications
	 *
	 * @param   bool  $filterIsNotNotified  filter out emails which have not notifiy set to true
	 *
	 * @return array
	 */
	public function getSubmitterEmails($filterIsNotNotified = true)
	{
		if (!$this->submitter_email)
		{
			$this->submitter_email = array();

			foreach ($this->fields as $field)
			{
				if ($field->fieldtype == 'email' && ($field->getParam('notify', 1) || !$filterIsNotNotified))
				{
					$this->submitter_email[] = $field->value;
				}
			}
		}

		return $this->submitter_email;
	}

	/**
	 * Return set recipients
	 *
	 * @return array
	 */
	public function getRecipients()
	{
		if (!$this->recipients)
		{
			// Check for recipients file type
			foreach ($this->fields as $field)
			{
				if ($field->fieldtype == 'recipients' && count($field->value))
				{
					$this->recipients = $this->recipients ? array_merge($this->recipients, $field->value) : $field->value;
				}
			}

			// Check for conditional recipients
			if ($conditional = RdfHelperConditionalrecipients::getRecipients($this->getForm(), $this))
			{
				foreach ($conditional as $recipient)
				{
					$this->recipients[] = $recipient[0];
				}
			}
		}

		return $this->recipients;
	}

	/**
	 * Return fullname value, if field type was set in form
	 *
	 * @return mixed
	 */
	public function getFullname()
	{
		foreach ($this->fields as $field)
		{
			if ($field->fieldtype == 'fullname')
			{
				return $field->value;
			}
		}

		return false;
	}

	/**
	 * Return username value, if field type was set in form
	 *
	 * @return mixed
	 */
	public function getUsername()
	{
		foreach ($this->fields as $field)
		{
			if ($field->fieldtype == 'username')
			{
				return $field->value;
			}
		}

		return false;
	}

	/**
	 * Set an initial price, before fields prices
	 *
	 * @param   float  $price  initial price
	 * @param   float  $vat    initial vat
	 *
	 * @return void
	 */
	public function initPrice($price, $vat = 0.0)
	{
		$this->basePrice = $price;
		$this->baseVat = $vat;
	}

	/**
	 * Return total price
	 *
	 * @return float
	 */
	public function getPrice()
	{
		return $this->getSubmissionPrice();
	}

	/**
	 * Return total vat
	 *
	 * @return float
	 */
	public function getVat()
	{
		$vat = $this->baseVat;

		foreach ($this->fields as $field)
		{
			if ($fieldVat = $field->getVat())
			{
				$vat += round($fieldVat, RHelperCurrency::getPrecision($this->currency));
			}
		}

		return $vat;
	}

	/**
	 * Is it a new submission
	 *
	 * @return boolean
	 */
	public function isNew()
	{
		return $this->isnew;
	}

	/**
	 * Set as new submission
	 *
	 * @param   bool  $val  true if new
	 *
	 * @return void
	 */
	public function setNew($val)
	{
		$this->isnew = $val ? true : false;
	}

	/**
	 * Add field to answers (value must already be set)
	 *
	 * @param   RdfRfield  $field  field
	 *
	 * @return void
	 */
	public function addField($field)
	{
		$this->fields[] = $field;
	}

	/**
	 * Add fields to answers (value must already be set)
	 *
	 * @param   array  $fields  RdfRfield fields
	 *
	 * @return void
	 */
	public function setFields($fields)
	{
		$this->fields = $fields;
	}

	/**
	 * Get fields
	 *
	 * @return RdfRfield[]
	 */
	public function getFields()
	{
		return $this->fields;
	}

	/**
	 * Save submission
	 *
	 * @param   boolean  $validate  validate form fields
	 *
	 * @return int submitter_id
	 *
	 * @throws Exception
	 */
	public function savedata($validate = true)
	{
		$mainframe = Jfactory::getApplication();
		$db = JFactory::getDBO();

		if (empty($this->formId))
		{
			throw new Exception(JText::_('COM_REDFORM_ERROR_NO_FORM_ID'), 404);
		}

		if (!count($this->fields))
		{
			throw new Exception('No field to save !');
		}

		if ($validate && !$this->validate())
		{
			return false;
		}

		if (!$this->sid)
		{
			$this->isnew = true;
		}

		$values = array();
		$fields = array();

		// We need to make sure all table fields are updated: typically, if a field is of type checkbox,
		// if not checked it won't be posted, hence we have to set the value to empty
		$q = " SHOW COLUMNS FROM " . $db->quoteName('#__rwf_forms_' . $this->formId);
		$db->setQuery($q);
		$columns = $db->loadColumn();

		foreach ($this->fields as $v)
		{
			if ($v->id && in_array('field_' . $v->field_id, $columns))
			{
				$fields[] = $db->quoteName('field_' . $v->field_id);
				$values[] = $db->quote($v->getDatabaseValue());
			}
		}

		foreach ($columns as $col)
		{
			if (strstr($col, 'field_') && !in_array($db->quoteName($col), $fields))
			{
				$fields[] = $db->quoteName($col);
				$values[] = $db->quote('');
			}
		}

		if ($this->sid) // Answers were already recorded, update them
		{
			$submitter = $this->getSubmitter($this->sid);

			$query = $db->getQuery(true);

			$query->update($db->quoteName('#__rwf_forms_' . $this->formId))
				->where('id = ' . $submitter->answer_id);

			foreach ($fields as $ukey => $col)
			{
				$query->set($col . " = " . $values[$ukey]);
			}

			$db->setQuery($query);

			if (!$db->execute())
			{
				RdfHelperLog::simpleLog(JText::_('COM_REDFORM_Cannot_update_answers') . ' ' . $db->getErrorMsg());
				throw new Exception(JText::_('COM_REDFORM_UPDATE_ANSWERS_FAILED'));
			}
		}
		else
		{
			$query = $db->getQuery(true);

			$query->insert($db->quoteName('#__rwf_forms_' . $this->formId))
				->columns(implode(', ', $fields))
				->values(implode(', ', $values));

			$db->setQuery($query);

			if (!$db->execute())
			{
				// We cannot save the answers, do not continue
				if (stristr($db->getError(), 'duplicate entry'))
				{
					$mainframe->input->set('ALREADY_ENTERED', true);
					$mainframe->enqueueMessage(JText::_('COM_REDFORM_ALREADY_ENTERED'), 'error');
				}
				else
				{
					throw new Exception(JText::_('COM_REDFORM_Cannot_save_form_answers') . ' ' . $db->getError());
				}

				// We cannot save the answers, do not continue
				RdfHelperLog::simpleLog(JText::_('COM_REDFORM_Cannot_save_form_answers') . ' ' . $db->getError());

				return false;
			}

			$this->answerId = $db->insertid();
			$this->sid = $this->updateSubmitter();
		}

		$this->updateSubmitterPrice();

		RFactory::getDispatcher()->trigger('onAfterRedformSubmitterSaved', array($this));

		return $this->sid;
	}

	/**
	 * Send notification to submitter
	 *
	 * @return boolean
	 */
	public function sendSubmitterNotification()
	{
		$emails = $this->getSubmitterEmails();
		$form = $this->getForm();
		$cond_recipients = RdfHelperConditionalrecipients::getRecipients($form, $this);

		foreach ($emails as $submitter_email)
		{
			$mailer = RdfHelper::getMailer();

			if ($cond_recipients)
			{
				$mailer->From = $cond_recipients[0][0];
				$mailer->FromName = $cond_recipients[0][1];
				$mailer->ClearReplyTos();
				$mailer->addReplyTo($cond_recipients[0]);
			}

			if (JMailHelper::isEmailAddress($submitter_email))
			{
				// Add the email address
				$mailer->AddAddress($submitter_email);

				$subject = $this->replaceTags($form->submissionsubject);
				$mailer->setSubject($subject);

				// Mail submitter
				$submission_body = $form->submissionbody;
				$submission_body = $this->replaceTags($submission_body);
				$htmlmsg = RdfHelper::wrapMailHtmlBody($submission_body, $subject);
				$mailer->MsgHTML($htmlmsg);

				// Send the mail
				if (!$mailer->Send())
				{
					JError::raiseWarning(0, JText::_('COM_REDFORM_NO_MAIL_SEND') . ' (to submitter)');
					RdfHelperLog::simpleLog(JText::_('COM_REDFORM_NO_MAIL_SEND') . ' (to submitter):' . $mailer->error);
				}
			}
		}

		return true;
	}

	/**
	 * Send confirmation notification
	 *
	 * @return boolean
	 */
	public function sendConfirmationNotification()
	{
		$form = $this->getForm();
		$addresses = preg_split('/[,;\s]+/', $form->confirmation_notification_recipients);
		$addresses = array_filter($addresses, array('JMailHelper', 'isEmailAddress'));

		if (!count($addresses))
		{
			return true;
		}

		$mailer = RdfHelper::getMailer();

		foreach ($addresses as $address)
		{
			$mailer->AddAddress($address);
		}

		$subject = $this->replaceTags($form->confirmation_contactperson_subject);
		$mailer->setSubject($subject);

		$body = $form->confirmation_contactperson_body;
		$body = $this->replaceTags($body);
		$htmlmsg = RdfHelper::wrapMailHtmlBody($body, $subject);
		$mailer->MsgHTML($htmlmsg);

		// Send the mail
		if (!$mailer->Send())
		{
			JError::raiseWarning(0, JText::_('COM_REDFORM_NO_MAIL_SEND') . ' (confirmation notification)');
			RdfHelperLog::simpleLog(JText::_('COM_REDFORM_NO_MAIL_SEND') . ' (confirmation notification):' . $mailer->error);
		}

		return true;
	}

	/**
	 * Get form data from table
	 *
	 * @return mixed|object|string
	 */
	protected function getForm()
	{
		if (!$this->form)
		{
			$model = new RdfCoreModelForm($this->formId);
			$this->form = $model->getForm();
		}

		return $this->form;
	}

	/**
	 * Replace tags
	 *
	 * @param   string  $text  text
	 *
	 * @return mixed
	 */
	public function replaceTags($text)
	{
		$form = $this->getForm();
		$replacer = new RdfHelperTagsreplace($form, $this);
		$text = $replacer->replace($text);

		return $text;
	}

	/**
	 * Fields validation
	 *
	 * @return boolean
	 */
	protected function validate()
	{
		$res = true;

		foreach ($this->fields as $field)
		{
			if ($field->published)
			{
				if (!$field->validate())
				{
					throw new RuntimeException($field->getError());
				}
			}
		}

		return $res;
	}

	/**
	 * Update submitters table
	 *
	 * @return boolean
	 */
	protected function updateSubmitter()
	{
		$db = JFactory::getDBO();
		$mainframe = JFactory::getApplication();

		if (!$this->submitKey)
		{
			throw new RuntimeException(JText::_('COM_REDFORM_ERROR_SUBMIT_KEY_MISSING'));
		}

		// Prepare the submitter details
		$row = RTable::getInstance('Submitter', 'RedformTable');

		if ($this->sid)
		{
			$row->load($this->sid);
		}
		else
		{
			$row->submission_ip = getenv('REMOTE_ADDR');
			$row->language = $mainframe->getLanguage()->getTag();

			if (!$mainframe->isAdmin())
			{
				$row->user_id = JFactory::getUser()->id;
			}
		}

		$row->form_id = $this->formId;
		$row->submit_key = $this->submitKey;
		$row->answer_id = $this->answerId;
		$row->integration = $this->integration;
		$row->submission_date = date('Y-m-d H:i:s', time());
		$row->submitternewsletter = ($this->listnames && count($this->listnames)) ? 1 : 0;

		// Pre-save checks
		if (!$row->check())
		{
			RdfHelperLog::simpleLog(JText::_('COM_REDFORM_There_was_a_problem_checking_the_submitter_data') . ': ' . $row->getError());
			throw new RuntimeException(JText::_('COM_REDFORM_There_was_a_problem_checking_the_submitter_data'));
		}

		// Save the changes
		if (!$row->store())
		{
			if (stristr($db->getError(), 'Duplicate entry'))
			{
				RdfHelperLog::simpleLog(JText::_('COM_REDFORM_You_have_already_entered_this_form'));
				throw new RuntimeException(JText::_('COM_REDFORM_You_have_already_entered_this_form'));
			}
			else
			{
				RdfHelperLog::simpleLog(JText::_('COM_REDFORM_There_was_a_problem_storing_the_submitter_data') . ': ' . $row->getError());
				throw new RuntimeException(JText::_('COM_REDFORM_There_was_a_problem_storing_the_submitter_data'));
			}

			return false;
		}

		return $row->id;
	}

	/**
	 * Write price corresponding to answers in submitters table
	 *
	 * @return boolean|mixed
	 */
	protected function updateSubmitterPrice()
	{
		if (!$this->sid)
		{
			return false;
		}

		$model = new RdfCoreModelSubmissionprice;
		$model->setAnswers($this);

		return $model->updatePrice();
	}

	/**
	 * Calculate price from base price and fields values
	 *
	 * @return float
	 */
	protected function getSubmissionPrice()
	{
		$price = $this->basePrice;

		foreach ($this->fields as $field)
		{
			if ($fieldPrice = $field->getPrice())
			{
				$price += round($fieldPrice, RHelperCurrency::getPrecision($this->currency));
			}
		}

		return $price;
	}

	/**
	 * Return shortened answers form
	 *
	 * @deprecated kept for backwards compatibility with replacer of [answer_<id>]
	 *
	 * @return array
	 */
	public function getAnswers()
	{
		$answers = array();

		foreach ($this->fields as $field)
		{
			$answers[] = array('field' => $field->field, 'field_id' => $field->id, 'value' => $field->getValue(), 'type' => $field->fieldtype);
		}

		return $answers;
	}

	/**
	 * Return shortened answers form
	 *
	 * @return array
	 */
	public function getFieldsValues()
	{
		$answers = array();

		foreach ($this->fields as $field)
		{
			$answers[] = array('field' => $field->field, 'field_id' => $field->field_id, 'value' => $field->getValue(), 'type' => $field->fieldtype);
		}

		return $answers;
	}

	/**
	 * return answer for specified field
	 *
	 * @param   int  $field_id  field id
	 *
	 * @return string
	 */
	public function getFieldAnswer($field_id)
	{
		foreach ($this->fields as $field)
		{
			if ($field->field_id == $field_id)
			{
				return $field->getValue();
			}
		}

		return false;
	}

	/**
	 * return answer for specified form field
	 *
	 * @param   int  $form_field_id  form field id
	 *
	 * @return string
	 */
	public function getFormFieldAnswer($form_field_id)
	{
		foreach ($this->fields as $field)
		{
			if ($field->id == $form_field_id)
			{
				return $field->getValue();
			}
		}

		return false;
	}

	/**
	 * loads answers of specified submitter
	 *
	 * @param   int  $submitter_id  submitter id
	 *
	 * @return true on success
	 */
	public function getSubmitterAnswers($submitter_id)
	{
		$db = JFactory::getDbo();
		$sid = (int) $submitter_id;

		// Get submission details first, to get the fieds
		$submitter = $this->getSubmitter($sid);

		if (!$submitter)
		{
			Jerror::raisewarning(0, JText::_('COM_REDFORM_unknown_submitter'));

			return false;
		}

		// Get fields
		$query = $db->getQuery(true);

		$query->select('f.id');
		$query->from('#__rwf_fields AS f');
		$query->join('INNER', '#__rwf_form_field AS ff ON ff.field_id = f.id');
		$query->where('ff.form_id = ' . $db->quote($submitter->form_id));
		$query->where('ff.published = 1');
		$query->order('ff.ordering');

		$db->setQuery($query);
		$fieldIds = $db->loadColumn();

		$fnames = array();

		foreach ($fieldIds as $fid)
		{
			$fnames[] = $db->quote('f.field_' . $fid);
		}

		// Get values
		$query = $db->getQuery(true);

		$query->select($fnames);
		$query->from('#__rwf_forms_' . $submitter->form_id . ' AS f ');
		$query->where('f.id = ' . $db->quote($submitter->answer_id));

		$db->setQuery($query);
		$answers = $db->loadObject();

		if (!$answers)
		{
			Jerror::raisewarning(0, JText::_('COM_REDFORM_error_getting_submitter_answers'));

			return false;
		}

		$fields = array();

		foreach ($fieldIds as $fid)
		{
			$field = RdfRfieldFactory::getFormField($fid);

			$property = 'field_' . $field->field_id;

			if (isset($answers->$property))
			{
				$field->setValue($answers->$property);
			}

			$fields[] = $field;
		}

		return $fields;
	}

	/**
	 * Return data from submitters table
	 *
	 * @param   int  $id  submitter id
	 *
	 * @return mixed
	 */
	protected function getSubmitter($id)
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select('s.*');
		$query->from('#__rwf_submitters AS s');
		$query->where('s.id = ' . $db->quote($id));

		$db->setQuery($query);
		$res = $db->loadObject();

		return $res;
	}

	/**
	 * Set sid
	 *
	 * @param   int  $sid  submitter id
	 *
	 * @return RdfAnswers
	 */
	public function setSid($sid)
	{
		$this->sid = $sid;

		return $this;
	}

	/**
	 * Get sid
	 *
	 * @return integer
	 */
	public function getSid()
	{
		return $this->sid;
	}

	/**
	 * Returns simple object field => value to save to session
	 *
	 * @return stdclass
	 */
	public function toSession()
	{
		$answers = new stdclass;

		foreach ($this->fields as $field)
		{
			if ($field->id)
			{
				$tablefield = 'field_' . $field->field_id;
				$answers->$tablefield = $field->getValue();
			}
		}

		return $answers;
	}
}
