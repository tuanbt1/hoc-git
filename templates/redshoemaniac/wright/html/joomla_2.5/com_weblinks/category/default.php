<?php
// Wright v.3 Override: Joomla 2.5.18
/**
 * @package		Joomla.Site
 * @subpackage	com_weblinks
 * @copyright	Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die;

/* Wright v.3: Helper */
	include_once(dirname(__FILE__) . '/../../com_content/com_content.helper.php');
/* End Wright v.3: Helper */

JHtml::addIncludePath(JPATH_COMPONENT.'/helpers');
?>
<div class="weblink-category<?php echo $this->pageclass_sfx;?>">
<?php if ($this->params->get('show_page_heading')) : ?>
<div class="page-header">  <?php // Wright v.3: Added page header ?>
	<h1>
		<?php echo $this->escape($this->params->get('page_heading')); ?>
	</h1>
</div>  <?php // Wright v.3: Added page header ?>
<?php endif; ?>
<?php if($this->params->get('show_category_title', 1)) : ?>
<?php
if (!$this->params->get('show_page_heading')) : ?>
<div class="page-header">
<?php endif;
	/* End Wright v.3: Added page header */
?>
	<h2>
		<?php echo JHtml::_('content.prepare', $this->category->title, '', 'com_weblinks.category'); ?>
	</h2>
<?php
	/* Wright v.3: Added page header */
if (!$this->params->get('show_page_heading')) : ?>
</div>
<?php endif;
	/* End Wright v.3: Added page header */
?>
<?php endif; ?>
<?php if ($this->params->get('show_description', 1) || $this->params->def('show_description_image', 1)) : ?>
	<div class="category-desc">
	<?php if ($this->params->get('show_description_image') && $this->category->getParams()->get('image')) : ?>
		<img src="<?php echo $this->category->getParams()->get('image'); ?>"/>
	<?php endif; ?>
	<?php if ($this->params->get('show_description') && $this->category->description) : ?>
		<?php echo JHtml::_('content.prepare', $this->category->description, '', 'com_weblinks.category'); ?>
	<?php endif; ?>
	<div class="clr"></div>
	</div>
<?php endif; ?>
<?php echo $this->loadTemplate('items'); ?>
<?php if (!empty($this->children[$this->category->id])&& $this->maxLevel != 0) : ?>
	<div class="cat-children">
	<h3><?php echo JText::_('JGLOBAL_SUBCATEGORIES') ; ?></h3>
	<?php echo $this->loadTemplate('children'); ?>
	</div>
<?php endif; ?>
</div>
