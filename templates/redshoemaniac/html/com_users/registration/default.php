<?php
/**
 * @package		Joomla.Site
 * @subpackage	com_users
 * @copyright	Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 * @since		1.6
 */

defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
?>
<div class='registrationbox row'>
<div class='registration-login col-md-6'>
	<div class="registration-loginbox">
		<h4>Sign In</h4>
		<form id="registration-login-form" action="<?php echo JRoute::_('index.php?option=com_users&task=user.login'); ?>" method="post">
			<fieldset>
				<div class="login-fields">
					<label id="username-lbl" for="username" class="">Username</label>
					<input type="text" name="username" id="username" value="" class="validate-username" size="25">
				</div>
				<div class="login-fields password">
					<label id="password-lbl" for="password" class="">Password</label>
					<input type="password" name="password" id="password" value="" class="validate-password" size="25">
				</div>
				<?php if (JPluginHelper::isEnabled('system', 'remember')) : ?>
				<?php endif; ?>
				<div class='btn-loginbox-submit'>
				<button type="submit" class="button"><?php echo JText::_('JLOGIN'); ?></button>
				</div>
				<div class='fotgotpw'>
					<a href="<?php echo JRoute::_('index.php?option=com_users&view=reset'); ?>">
					<?php echo JText::_('COM_USERS_LOGIN_RESET'); ?></a>
				</div>
				<input type="hidden" name="return" value="<?php echo base64_encode('index.php?option=com_redshop&view=account&Itemid='. $_GET['Itemid']); ?>" />
				<?php echo JHtml::_('form.token'); ?>
			</fieldset>
		</form>
	</div>
</div>
<div class="registration<?php echo $this->pageclass_sfx?> col-md-6">
	<div class='freg-inside'>
		<div class='freg-title' >
				<h4>Register</h4>
		</div>

		<form id="member-registration" action="<?php echo JRoute::_('index.php?option=com_users&task=registration.register'); ?>" method="post" class="form-validate" enctype="multipart/form-data">
	<?php foreach ($this->form->getFieldsets() as $fieldset): // Iterate through the form fieldsets and display each one.?>
		<?php $fields = $this->form->getFieldset($fieldset->name);?>
		<?php if (count($fields)):?>
			<fieldset>
				<dl>
			<?php foreach($fields as $field):// Iterate through the fields in the set and display them.?>
				<?php if ($field->hidden):// If the field is hidden, just display the input.?>
					<?php echo $field->input;?>
				<?php else:?>
					<div class='fieldrow'>
					<dt>
						<?php echo $field->label; ?>
						<?php if (!$field->required && $field->type!='Spacer'): ?>
							<span class="optional"><?php echo JText::_('COM_USERS_OPTIONAL'); ?></span>
						<?php endif; ?>
					</dt>
					<dd><?php echo ($field->type!='Spacer') ? $field->input : "&#160;"; ?></dd>
					</div>
				<?php endif;?>
			<?php endforeach;?>
				</dl>
			</fieldset>
		<?php endif;?>
	<?php endforeach;?>
			<div>
				<button type="submit" class="greenbutton com_userreg" onclick="javascript:return true;document.getElementById('member-registration').submit()"><?php echo JText::_('JREGISTER');?></button>
				<input type="hidden" name="option" value="com_users" />
				<input type="hidden" name="task" value="registration.register" />
				<?php echo JHtml::_('form.token');?>
			</div>
		</form>
	</div>
</div>
</div>