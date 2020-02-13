<?php
/**
 * @package     RedSHOP.Frontend
 * @subpackage  mod_redshop_login
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die('Restricted access'); ?>
<?php

$forgot_password = $params->get('forgot_password', 0);
$forgot_username = $params->get('forgot_username', 0);
$creat_account = $params->get('creat_account', 0);
$remember_me = $params->get('remember_me', 0);
$layout = $params->get('layout', 0);
$Itemid = JRequest::getInt('Itemid');

?>
<?php if ($type == 'logout') : ?>
	<form action="<?php echo JRoute::_('index.php', true, $params->get('usesecure')); ?>" method="post" name="login" id="form-login">
		<ul class='menu nav navbar-nav'>
			<?php if(!DEFAULT_QUOTATION_MODE){?>
			<li><a href='?option=com_redshop&view=wishlist&layout=viewwishlist'>Wish list</a></li>
			<?php }else{?>
			<li><a href='?option=com_redshop&view=wishlist&layout=viewwishlist'>Quotes list</a></li>
			<?php }?>
			<li><a href='?option=com_redshop&view=account'>Your Account</a></li>
			<li>
			    <a href="#" name="Submit" onclick="document.getElementById('form-login').submit();">Logout</a>
			</li>
		</ul>
		<input type="hidden" name="option" value="com_users"/>
		<input type="hidden" name="task" value="user.logout"/>
		<input type="hidden" name="return" value="<?php echo $return; ?>"/>
		<?php echo JHtml::_('form.token'); ?>
	</form>
<?php else : ?>
	<?php
	if (JPluginHelper::isEnabled('authentication', 'openid')) :
		$lang->load('plg_authentication_openid', JPATH_ADMINISTRATOR);
		$langScript = 'var JLanguage = {};' .
			' JLanguage.WHAT_IS_OPENID = \'' . JText::_('COM_REDSHOP_WHAT_IS_OPENID') . '\';' .
			' JLanguage.LOGIN_WITH_OPENID = \'' . JText::_('COM_REDSHOP_LOGIN_WITH_OPENID') . '\';' .
			' JLanguage.NORMAL_LOGIN = \'' . JText::_('COM_REDSHOP_NORMAL_LOGIN') . '\';' .
			' var modlogin = 1;';
		$document   = JFactory::getDocument();
		$document->addScriptDeclaration($langScript);
		JHTML::_('script', 'openid.js');
	endif; ?>
	<?php if (!$layout)
	{ ?>
	<ul class='menu nav navbar-nav'>
		<?php if(!DEFAULT_QUOTATION_MODE){?>
		<li><a href='?option=com_redshop&view=wishlist&layout=viewwishlist'>Wish list</a></li>
		<?php }else{?>
		<li><a href='?option=com_redshop&view=wishlist&layout=viewwishlist'>Quotes list</a></li>
		<?php }?>
		<li><a href='?option=com_redshop&view=account'>Your Account</a></li>
		<li><span>Welcome visitor, you can <a href='?option=com_users&view=login' class='tx-login'>login</a> or <a class='tx-signup' href='?option=com_users&view=registration'>create an account</a></span></li>
	</ul>
	<?php }
	else
	{ ?>
	<ul class='menu nav navbar-nav'>
		<?php if(!DEFAULT_QUOTATION_MODE){?>
		<li><a href='?option=com_redshop&view=wishlist&layout=viewwishlist'>Wish list</a></li>
		<?php }else{?>
		<li><a href='?option=com_redshop&view=wishlist&layout=viewwishlist'>Quotes list</a></li>
		<?php }?>
		<li><a href='?option=com_redshop&view=account'>Your Account</a></li>
		<li><span>Welcome visitor, you can <a href='?option=com_users&view=login' class='tx-login'>login</a> or <a class='tx-signup' href='?option=com_users&view=registration'>create an account</a></span></li>
	</ul>
	<?php } ?>

<?php endif; ?>