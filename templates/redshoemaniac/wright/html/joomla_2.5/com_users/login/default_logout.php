<?php
// Wright v.3 Override: Joomla 2.5.18
/**
 * @package		Joomla.Site
 * @subpackage	com_users
 * @copyright	Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 * @since		1.5
 */

defined('_JEXEC') or die;
?>
<div class="logout<?php echo $this->pageclass_sfx?>">
	<?php if ($this->params->get('show_page_heading')) : ?>
	<div class="page-header">  <?php // Wright v.3: Added page header ?>
		<h1>
			<?php echo $this->escape($this->params->get('page_heading')); ?>
		</h1>
	</div>  <?php // Wright v.3: Added page header ?>
	<?php endif; ?>

	<?php if (($this->params->get('logoutdescription_show') == 1 && str_replace(' ', '', $this->params->get('logout_description')) != '')|| $this->params->get('logout_image') != '') : ?>
	<div class="logout-description">
	<?php endif ; ?>

		<?php if ($this->params->get('logoutdescription_show') == 1) : ?>
			<?php echo $this->params->get('logout_description'); ?>
		<?php endif; ?>

		<?php if (($this->params->get('logout_image')!='')) :?>
			<img src="<?php echo $this->escape($this->params->get('logout_image')); ?>" class="logout-image" alt="<?php echo JTEXT::_('COM_USER_LOGOUT_IMAGE_ALT')?>"/>
		<?php endif; ?>

	<?php if (($this->params->get('logoutdescription_show') == 1 && str_replace(' ', '', $this->params->get('logout_description')) != '')|| $this->params->get('logout_image') != '') : ?>
	</div>
	<?php endif ; ?>

	<form action="<?php echo JRoute::_('index.php?option=com_users&task=user.logout'); ?>" method="post" class="form-horizontal">  <?php // Wright v.3: Added form-horizontal class ?>
		<div class="control-group">  <?php // Wright v.3: Added control-group class ?>
			<div class="controls">  <?php // Wright v.3: Added controls div ?>
				<button type="submit" class="button btn btn-primary">  <?php // Wright v.3: Added btn-primary class ?>
					<span class="icon-arrow-left icon-white"></span>  <?php // Wright v.3: Added icon ?>
					<?php echo JText::_('JLOGOUT'); ?></button>
				<input type="hidden" name="return" value="<?php echo base64_encode($this->params->get('logout_redirect_url', $this->form->getValue('return'))); ?>" />
				<?php echo JHtml::_('form.token'); ?>
			</div>  <?php // Wright v.3: Added controls div ?>
		</div>
	</form>
</div>
