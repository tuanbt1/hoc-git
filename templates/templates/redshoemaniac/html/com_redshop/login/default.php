<?php
/**
 * @package     RedSHOP.Frontend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;
JHTML::_('behavior.tooltip');
$app        = JFactory::getApplication();
$Itemid     = JRequest::getInt('Itemid');
$loginlink  = 'index.php?option=com_redshop&view=login&Itemid=' . $Itemid;
$mywishlist = JRequest::getString('wishlist');

if ($mywishlist != '')
{
	$newuser_link = 'index.php?wishlist=' . $mywishlist . '&option=com_redshop&view=registration&Itemid=' . $Itemid;
}
else
{
	$newuser_link = 'index.php?option=com_redshop&view=registration&Itemid=' . $Itemid;
}

$forgotpwd_link = 'index.php?option=com_redshop&view=password&Itemid=' . $Itemid;

$params       = $app->getParams('com_redshop');
$returnitemid = $params->get('login', $Itemid);

?>
<div class='login<?php if(isset($this->pageclass_sfx))echo $this->pageclass_sfx;?>'>
<div class="loginbox row ">
	<h4>Login</h4>
	<form action="<?php echo JRoute::_($loginlink); ?>" method="post">

		<fieldset>
			<div class="login-fields">
				<label id="username-lbl" for="username" ><?php echo JText::_('COM_REDSHOP_USERNAME'); ?></label>
				<input style='width: 188px' class="inputbox_lbl" type="text" id="username" name="username"/>
			</div>
			<div class="login-fields">
				<label id="username-lbl" for="username" ><?php echo JText::_('COM_REDSHOP_PASSWORD'); ?></label>
				<input style='width: 188px' class="inputbox-lbl" id="password" name="password" type="password"/>
			</div>
			<div class='fotgotpw'>
			<a href="<?php echo JRoute::_($forgotpwd_link); ?>">
				<?php echo JText::_('COM_REDSHOP_FORGOT_PWD_LINK'); ?>
			</a>
			</div>
			<input type="submit" name="submit" class="button" value="<?php echo JText::_('COM_REDSHOP_LOGIN'); ?>">
		</fieldset>
			<input type="hidden" name="task" id="task" value="setlogin">
			<input type="hidden" name="mywishlist" id="mywishlist" value="<?php echo JRequest::getString('wishlist'); ?>">
			<input type="hidden" name="returnitemid" id="returnitemid" value="<?php echo $returnitemid; ?>">
			<input type="hidden" name="option" id="option" value="com_redshop"/>
	</form>
</div>
</div>