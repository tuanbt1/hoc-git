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
$Itemid = JRequest::getInt('Itemid');?>
<div class="reset flogin-checkout">
	<div class='resetpw'>
	<h4>Password Recover</h4>
	<form id="user-registration" action="" method="post" class="form-validate">
		<p><?php echo JText::_('COM_REDSHOP_RESET_PASSWORD_DESCRIPTION'); ?></p>
		<fieldset>
			<dl>
				<dd>Email</dd>
				<dt></dt>
				<dd><input class="validate-username required invalid" type="text" id="email" name="email"/></dd>
			</dl>
		</fieldset>
		<div>
			<input type="hidden" name="task" id="task" value="reset">
			<input type="hidden" name="Itemid" id="Itemid" value="<?php echo $Itemid; ?>">
			<input type="submit" name="submit" value="<?php echo JText::_('COM_REDSHOP_RESET_PASSWORD_BUTTON'); ?>" class="button">
		</div>
	</form>
	</div>
</div>
