<?php
/**
 * @package		Joomla.Site
 * @subpackage	mod_related_items
 * @copyright	Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die;

JModelLegacy::addIncludePath(JPATH_SITE.'/components/com_content/models', 'ContentModel');
$modelArticle = JModelLegacy::getInstance('Article', 'ContentModel', array('ignore_request' => true));

// Set application parameters in model
$app = JFactory::getApplication();
$appParams = $app->getParams();
$modelArticle->setState('params', $appParams);

?>
<ul class="relateditems">
<?php foreach ($list as $item) :	$itemDetail = $modelArticle->getItem($item->id);?>
<li class='col-md-3'>
	<img src="<?php echo json_decode($itemDetail->images)->image_intro;?>">
	<a href="<?php echo $item->route; ?>">
		<?php if ($showDate) echo JHTML::_('date', $item->created, JText::_('DATE_FORMAT_LC4')). " - "; ?>
		<?php echo $item->title; ?></a>
</li>
<?php endforeach; ?>
</ul>