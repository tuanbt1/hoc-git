<?php
/**
 * @package     RedSHOP.Frontend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;
$userhelper = rsUserHelper::getInstance();
$user       = JFactory::getUser();
$Itemid     = JRequest::getInt('Itemid');

$post = (array) $this->billingaddresses;
$post["email1"] = $post["email"] = $post ["user_email"];
if ($user->username)
{
	$post["username"] = $user->username;
}

$create_account = 1;

if ($post["user_id"] < 0)
{
	$create_account = 0;
}
?>
<script type="text/javascript">
	function cancelForm(frm) {
		frm.task.value = 'cancel';
		frm.submit();
	}
</script>
<?php
if ($this->params->get('show_page_heading', 1))
{
	?>
	<h1 class="componentheading<?php echo $this->escape($this->params->get('pageclass_sfx')); ?>">
		<?php echo $this->escape(JText::_('COM_REDSHOP_BILLING_ADDRESS_INFORMATION_LBL')); ?></h1>
<?php
}     ?>
<div class="userprofile">
<h3><?php echo $user->username?>'s Profile</h3>
</div>
<?php if(!DEFAULT_QUOTATION_MODE){?>
<div class='account-tab'>
	<ul class="tabs nav nav-tabs">
		<li class="tab-link active" data-tab="tab-1"><a href='?option=com_redshop&view=account&Itemid=<?php echo $_GET['Itemid'];?>'>CONTACT INFO</a></li>
		<li class="tab-link" data-tab="tab-2"><a href='?option=com_redshop&view=account_shipto&Itemid=<?php echo $_GET['Itemid'];?>'>SHIPPING INFO</a></li>
		<li class="tab-link" data-tab="tab-3"><a href='?option=com_redshop&view=orders&Itemid=<?php echo $_GET['Itemid'];?>'>MY ORDERS</a></li>
	</ul>
</div>
<?php }else{ // END IF ELSE?>
<div class="account-tab">
<ul class="tabs nav nav-tabs">
<li class="tab-link active" data-tab="tab-1"><a href="?option=com_redshop&amp;view=account">CONTACT INFO</a></li>
<li class="tab-link" data-tab="tab-2"><a href="?option=com_redshop&amp;view=account#tab-2">QUOTATION</a></li>
</ul>
</div>
<?php }//END ELSEIF?>
<form class='accbillto' action="<?php echo JRoute::_($this->request_url); ?>" method="post" name="adminForm" id="adminForm"
      enctype="multipart/form-data"><!-- id="billinfo_adminForm" -->
	<fieldset class="adminform">
		<?php echo $userhelper->getBillingTable($post, $this->billingaddresses->is_company, $this->lists, 0, 0, $create_account);?>
		<div class='customerbtn'>
		<input type="submit" class="button submit" name="submitbtn"
				                        value="<?php echo JText::_('COM_REDSHOP_SAVE'); ?>">
		<input type="button" class="button cancel" name="back"
				                         value="<?php echo JText::_('COM_REDSHOP_CANCEL'); ?>"
				                         onclick="javascript:cancelForm(this.form);">
		</div>
	</fieldset>
	<input type="hidden" name="cid" value="<?php echo $this->billingaddresses->users_info_id; ?>"/>
	<input type="hidden" name="user_id" id="user_id" value="<?php echo $post["user_id"]; ?>"/>
	<input type="hidden" name="task" value="save"/>
	<input type="hidden" name="view" value="account_billto"/>
	<input type="hidden" name="address_type" value="BT"/>
	<input type="hidden" name="is_company" id="is_company" value="<?php echo $this->billingaddresses->is_company; ?>"/>
	<input type="hidden" name="Itemid" value="<?php echo $Itemid; ?>"/>
</form>
