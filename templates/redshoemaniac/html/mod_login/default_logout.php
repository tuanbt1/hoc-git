<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_login
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
?>
<form id="login-form" action="<?php echo JRoute::_(JUri::getInstance()->toString(), true, $params->get('usesecure')); ?>" method="post" id="login-form" class="form-vertical">
	<ul class='menu nav navbar-nav'>
		<?php if(!DEFAULT_QUOTATION_MODE){?>
		<li>
		<?php
			echo JText::sprintf('COM_REDSHOP_HINAME', $user->get('username'));
		?>
		<a href='?option=com_redshop&view=account&logout=112&Itemid=174'>Your Account</a></li>
		<?php }else{?>
		<li><a href='?option=com_redshop&view=wishlist&layout=viewwishlist&Itemid=171'>Quotes list</a></li>
		<?php }?>
		<li class='btn-logout'>
		    <a href="#" name="Submit" onclick="document.getElementById('login-form').submit();">Logout</a>
		</li>
	</ul>
	<div class="logout-button">
		<input type="hidden" name="option" value="com_users" />
		<input type="hidden" name="task" value="user.logout" />
		<input type="hidden" name="return" value="<?php echo $return; ?>" />
		<?php echo JHtml::_('form.token'); ?>
	</div>
</form>
