<?php
/**
 * @package     Redform.Libraries
 * @subpackage  Helper
 *
 * @copyright   Copyright (C) 2012 - 2014 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('_JEXEC') or die('Restricted access');

require_once JPATH_SITE . '/components/com_redform/models/payment.php';

/**
 * Helper class for google analytics
 *
 * @package     Redform.Libraries
 * @subpackage  Helper
 * @since       3.0
 */
class RdfHelperAnalytics
{
	/**
	 * return true if GA is enabled
	 *
	 * @return boolean
	 */
	public static function isEnabled()
	{
		$params = JComponentHelper::getParams('com_redform');

		return $params->get('enable_ga', 0) ? true : false;
	}

	/**
	 * load google analytics
	 *
	 * @return boolean true if analytics is enabled
	 */
	public static function load()
	{
		$params = JComponentHelper::getParams('com_redform');

		if (!$params->get('enable_ga', 0) || !$params->get('ga_code'))
		{
			return false;
		}

		$js_ua = <<<JS
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		  ga('create', '{$params->get('ga_code')}');
		  ga('send', 'pageview');
JS;
		$js_classic = <<<JS
		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', '{$params->get('ga_code')}']);

		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
JS;

		JFactory::getDocument()->addScriptDeclaration($params->get('ga_mode', 0) ? $js_classic : $js_ua);

		return true;
	}

	/**
	 * adds transaction for google ecommerce tracking
	 *
	 * @param   object  $trans  transaction details
	 *
	 * @return string js code
	 */
	public static function addTrans($trans)
	{
		$params = JComponentHelper::getParams('com_redform');

		$id = json_encode($trans->id);
		$affiliation = json_encode($trans->affiliation);
		$revenue = json_encode($trans->revenue);
		$currency = json_encode($trans->currency);

		$js_ua = <<<JS
		  	ga('require', 'ecommerce', 'ecommerce.js');
			ga('ecommerce:addTransaction', {
			'id' : {$id},           // transaction ID - required
			'affiliation' : {$affiliation},  // affiliation or store name
			'revenue' : {$revenue},          // total - required
  			'currency': {$currency}  // local currency code.
			});
JS;

		$js_classic = <<<JS
		_gaq.push(['_addTrans',
			{$id},           // transaction ID - required
			{$affiliation},  // affiliation or store name
			{$revenue}          // total - required
			]);
JS;
		$js = $params->get('ga_mode', 0) ? $js_classic : $js_ua;
		JFactory::getDocument()->addScriptDeclaration($js);

		return $js;
	}

	/**
	 * add item for transaction
	 *
	 * @param   object  $item      item to be added (id, sku, productname, category, price)
	 * @param   int     $quantity  quantity
	 *
	 * @return string js code
	 */
	public static function addItem($item, $quantity = 1)
	{
		$params = JComponentHelper::getParams('com_redform');

		$id = json_encode($item->id);
		$productName = json_encode($item->productname);
		$sku = json_encode($item->sku);
		$category = json_encode($item->category);

		$js_ua = <<<JS
			ga('ecommerce:addItem', {
			'id' : {$id},  // Transaction ID. Required.
			'name' : {$productName},      // Product name. Required.
			'sku' : {$sku},        // SKU/code - required			.
			'category' : {$category},      // Product name. Required.
			'price' : '{$item->price}',    // Unit price.
			'currency' : '{$item->currency}',
			'quantity' : {$quantity}    // Unit quantity.
			});
JS;

		$js_classic = <<<JS
			_gaq.push(['_addItem',
				{$id},  // TTransaction ID. Required.
				{$sku},        // SKU/code - required			.
				{$productName},        // Product name.		.
				{$category},        // Category.
				'{$item->price}',       // Unit price - required
				{$quantity}    // Unit quantity- required
				]);
			_gaq.push(['_set', 'currencyCode', '{$item->currency}']);
JS;

		$js = $params->get('ga_mode', 0) ? $js_classic : $js_ua;
		JFactory::getDocument()->addScriptDeclaration($js);

		return $js;
	}

	/**
	 * add tracktrans code
	 *
	 * @return string js code
	 */
	public static function trackTrans()
	{
		$params = JComponentHelper::getParams('com_redform');

		$js_ua = <<<JS
			ga('ecommerce:send');
JS;

		$js_classic = <<<JS
			_gaq.push(['_trackTrans']);
JS;
		$js = $params->get('ga_mode', 0) ? $js_classic : $js_ua;
		JFactory::getDocument()->addScriptDeclaration($js);

		return $js;
	}

	/**
	 * Adds a pageview
	 *
	 * @param   sting  $page  optional page name
	 *
	 * @return string js code
	 */
	public static function pageView($page = null)
	{
		$params = JComponentHelper::getParams('com_redform');

		if ($page)
		{
			$js_ua = "ga('send', 'pageview', '{$page}');";
			$js_classic = "_gaq.push(['_trackPageview',	'{$page}']);";
		}
		else
		{
			$js_ua = "ga('send', 'pageview');";
			$js_classic = "_gaq.push(['_trackPageview']);";
		}

		$js = $params->get('ga_mode', 0) ? $js_classic : $js_ua;
		JFactory::getDocument()->addScriptDeclaration($js);

		return $js;
	}

	/**
	 * tracks an event
	 *
	 * @param   object  $event  event data
	 *
	 * @return string js code
	 */
	public static function trackEvent($event)
	{
		$params = JComponentHelper::getParams('com_redform');

		$value = $event->value ? $event->value : 1;

		$category = json_encode($event->category);
		$action = json_encode($event->action);
		$label = json_encode($event->label);

		$js_ua = <<<JS
			ga('send', 'event',
			{$category},
			{$action},
			{$label},
			$value
			);
JS;

		$js_classic = <<<JS
			_gaq.push(['_trackEvent',
				{$category},
				{$action},
				{$label},
				$value
				]);
JS;
		$js = $params->get('ga_mode', 0) ? $js_classic : $js_ua;
		JFactory::getDocument()->addScriptDeclaration($js);

		return $js;
	}

	/**
	 * full submission tracking. adds javascript code to document head
	 *
	 * @param   String  $submit_key  submit key
	 * @param   Array   $options     optional parameters for tracking
	 *
	 * @return string js code
	 */
	public static function recordSubmission($submit_key, array $options = array())
	{
		$submitters = RdfEntitySubmitter::loadBySubmitKey($submit_key);

		if (!$submitters)
		{
			return false;
		}

		$first = reset($submitters);

		$price = array_reduce(
			$submitters,
			function ($carry, $item)
			{
				$carry += $item->price;

				return $carry;
			}
		);

		// Add transaction
		$trans = new stdclass;
		$trans->id = $submit_key;
		$trans->affiliation = isset($options['affiliation']) ? $options['affiliation'] : $first->getForm()->formname;
		$trans->revenue = $price;
		$trans->currency = $first->currency;

		$js = self::addTrans($trans);

		$productname = isset($options['productname']) ? $options['productname'] : null;
		$sku         = isset($options['sku']) ? $options['sku'] : null;
		$category    = isset($options['category']) ? $options['category'] : null;

		// Add submitters as items
		foreach ($submitters as $s)
		{
			$item = new stdclass;
			$item->id = $submit_key;
			$item->productname = $productname ? $productname : 'submitter' . $s->id;
			$item->sku  = $sku ? $sku : 'submitter' . $s->id;
			$item->category  = $category ? $category : '';
			$item->price = $s->price;
			$item->currency = $s->currency;

			$js .= self::addItem($item);
		}

		// Push transaction to server
		$js .= self::trackTrans();

		return $js;
	}

	/**
	 * full transaction tracking. adds javascript code to document head
	 *
	 * @param   String  $cartReference  cart reference
	 * @param   Array   $options        optional parameters for tracking
	 *
	 * @return string js code
	 */
	public static function recordTrans($cartReference, array $options = array())
	{
		if (!$cartReference)
		{
			return false;
		}

		$model = Rmodel::getFrontInstance('payment', array(), 'com_redform');
		$model->setCartReference($cartReference);
		$submitters = $model->getSubmitters();
		$payment   = $model->getPaymentDetails();

		// Add transaction
		$trans = new stdclass;
		$trans->id = $cartReference;
		$trans->affiliation = isset($options['affiliate']) ? $options['affiliate'] : $payment->form;
		$trans->revenue = $model->getPrice();
		$trans->currency = $model->getCurrency();

		$js = self::addTrans($trans);

		$productname = isset($options['productname']) ? $options['productname'] : null;
		$sku         = isset($options['sku']) ? $options['sku'] : null;
		$category    = isset($options['category']) ? $options['category'] : null;

		// Add submitters as items
		foreach ($submitters as $s)
		{
			$item = new stdclass;
			$item->id = $cartReference;
			$item->productname = $productname ? $productname : 'submitter' . $s->id;
			$item->sku  = $sku ? $sku : 'submitter' . $s->id;
			$item->category  = $category ? $category : '';
			$item->price = $s->price;
			$item->currency = $s->currency;

			$js .= self::addItem($item);
		}

		// Push transaction to server
		$js .= self::trackTrans();

		return $js;
	}

	/**
	 * full transaction tracking with measurement protocol
	 *
	 * @param   String  $cartReference  cart reference
	 * @param   Array   $options        optional parameters for tracking
	 *
	 * @return string js code
	 */
	public static function recordTransMeasurementProtocol($cartReference, array $options = array())
	{
		$input = JFactory::getApplication()->input;

		if (isset($options['clientId']))
		{
			$clientId = $options['clientId'];
		}
		else
		{
			$clientId = $input->get('GuaClientId', null);
		}

		$client = new RdfAnalyticsMeasurementprotocolClient(array('clientId' => $clientId));

		$model = JModel::getInstance('payment', 'RedformModel');
		$model->setCartReference($cartReference);
		$submitters = $model->getSubmitters();
		$payment   = $model->getPaymentDetails();

		$transactionId = $cartReference;

		$transaction = new RdfAnalyticsTransaction;
		$transaction->setTransactionId($transactionId);
		$transaction->setAffiliation(isset($options['affiliate']) ? $options['affiliate'] : $payment->form);
		$transaction->setRevenue($model->getPrice());
		$transaction->setCurrency($model->getCurrency());
		$transaction->hit($client);

		$productname = isset($options['productname']) ? $options['productname'] : null;
		$sku         = isset($options['sku']) ? $options['sku'] : null;
		$category    = isset($options['category']) ? $options['category'] : null;

		// Add submitters as items
		foreach ($submitters as $s)
		{
			$item = new RdfAnalyticsItem;
			$item->setTransactionId($transactionId);
			$item->setName($productname ? $productname : 'submitter' . $s->id);
			$item->setSku($sku ? $sku : 'submitter' . $s->id);
			$item->setCategory($category ? $category : '');
			$item->setPrice($s->price);
			$item->setCurrency($s->currency);
			$item->hit($client);
		}

		return true;
	}

	/**
	 * Get hidden field form containing google analytics anonymous cid
	 *
	 * @return string
	 */
	public static function addGuaClientIdHiddenField()
	{
		JHtml::_('behavior.framework');
		JFactory::getDocument()->addScript('/media/com_redform/js/addGuaField.js');

		$html = '<input name="GuaClientId" id="GuaClientId" type="hidden" value=""/>';

		return $html;
	}
}
