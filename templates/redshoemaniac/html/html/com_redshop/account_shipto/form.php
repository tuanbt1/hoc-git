<?php
/**
 * @package     RedSHOP.Frontend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

$Itemid = JRequest::getInt('Itemid');
$userhelper = rsUserHelper::getInstance();
$user         = JFactory::getUser();
$post = (array) $this->shippingaddresses;

$post['firstname_ST']    = $post['firstname'];
$post['lastname_ST']     = $post['lastname'];
$post['address_ST']      = $post['address'];
$post['city_ST']         = $post['city'];
$post['zipcode_ST']      = $post['zipcode'];
$post['phone_ST']        = $post['phone'];
$post['country_code_ST'] = $post['country_code'];
$post['state_code_ST']   = $post['state_code'];
?>
<script type="text/javascript">
	function cancelForm(frm) {
		frm.task.value = 'cancel';
		frm.submit();
	}
	function validateInfo() {
		var frm = document.adminForm;

		if (frm.firstname.value == '') {
			alert("<?php echo JText::_('COM_REDSHOP_PLEASE_ENTER_FIRST_NAME')?>");
			return false;
		}

		if (frm.lastname.value == '') {
			alert("<?php echo JText::_('COM_REDSHOP_PLEASE_ENTER_LAST_NAME')?>");
			return false;
		}

		if (frm.address.value == '') {
			alert("<?php echo JText::_('COM_REDSHOP_PLEASE_ENTER_ADDRESS')?>");
			return false;
		}

		if (frm.zipcode.value == '') {
			alert("<?php echo JText::_('COM_REDSHOP_PLEASE_ENTER_ZIPCODE')?>");
			return false;
		}

		if (frm.city.value == '') {
			alert("<?php echo JText::_('COM_REDSHOP_PLEASE_ENTER_CITY')?>");
			return false;
		}

		if (frm.phone.value == '') {
			alert("<?php echo JText::_('COM_REDSHOP_PLEASE_ENTER_PHONE')?>");
			return false;
		}

		return true;
	}

</script>
<div class="rsmyaccount">
	<div class='userprofile'>
	<h3><?php echo $user->username;?>'s Profile</h3>
	</div>
	<div class='account-tab'>
		<ul class="tabs nav nav-tabs">
			<li class="tab-link" data-tab="tab-1"><a href='?option=com_redshop&view=account'>CONTACT INFO</a></li>
			<li class="tab-link active" data-tab="tab-2"><a href='?option=com_redshop&view=account_shipto'>SHIPPING INFO</a></li>
			<li class="tab-link" data-tab="tab-3"><a href='?option=com_redshop&view=orders'>MY ORDERS</a></li>
		</ul>
	</div>
	<div class="billingform">
	<form action="<?php echo JRoute::_($this->request_url) ?>" method="post" name="adminForm" id="adminForm">

		<div id="divShipping">
			<fieldset class="adminform">
				<div class='addship_title'>
					<h4>Edit Shipping Address</h4>
				</div>
				<?php    echo $userhelper->getShippingTable($post, $this->billingaddresses->is_company, $this->lists);    ?>
				<div class='btn-shipto'>
					<input type="submit" class="btn btn-default" name="submitbtn"
							                        value="<?php echo JText::_('COM_REDSHOP_SAVE'); ?>">
					<input type="button" class="btn btn-primary" name="back"
							                         value="<?php echo JText::_('COM_REDSHOP_CANCEL'); ?>"
							                         onclick="javascript:cancelForm(this.form);">
				</div>
			</fieldset>
		</div>
		<input type="hidden" name="cid[]" value="<?php echo $this->shippingaddresses->users_info_id; ?>"/>
		<input type="hidden" name="user_id" value="<?php echo $this->billingaddresses->user_id; ?>"/>
		<input type="hidden" name="is_company" value="<?php echo $this->billingaddresses->is_company; ?>"/>
		<input type="hidden" name="email" value="<?php echo $this->billingaddresses->user_email; ?>"/>
		<input type="hidden" name="shopper_group_id" value="<?php echo $this->billingaddresses->shopper_group_id; ?>"/>
		<input type="hidden" name="company_name" value="<?php echo $this->billingaddresses->company_name; ?>"/>
		<input type="hidden" name="vat_number" value="<?php echo $this->billingaddresses->vat_number; ?>"/>
		<input type="hidden" name="tax_exempt" value="<?php echo $this->billingaddresses->tax_exempt; ?>"/>
		<input type="hidden" name="requesting_tax_exempt"
		       value="<?php echo $this->billingaddresses->requesting_tax_exempt; ?>"/>
		<input type="hidden" name="tax_exempt_approved"
		       value="<?php echo $this->billingaddresses->tax_exempt_approved; ?>"/>
		<input type="hidden" name="task" value="save"/>
		<input type="hidden" name="address_type" value="ST"/>
		<input type="hidden" name="view" value="account_shipto"/>
		<input type="hidden" name="Itemid" value="<?php echo $Itemid; ?>"/>
		<input type="hidden" name="option" value="com_redshop"/>
	</form>
	</div>
</div>
