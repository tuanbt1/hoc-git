<?php
/**
 * @package     Redform.Library
 * @subpackage  Entity
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Paymentrequestitem entity.
 *
 * @since  3.0
 */
class RdfEntityPaymentrequestitem extends RdfEntityBase
{
	/**
	 * Get submitter
	 *
	 * @return RdfEntityPaymentrequest
	 */
	public function getPaymentrequest()
	{
		$item = $this->getItem();

		$pr = RdfEntityPaymentrequest::load($item->payment_request_id);

		return $pr;
	}
}
