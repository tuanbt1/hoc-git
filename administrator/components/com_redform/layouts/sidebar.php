<?php
/**
 * @package     Redform.Admin
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2012 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

$data = $displayData;

$active = null;

if (isset($data['active']))
{
	$active = $data['active'];
}

$formsClass = ($active === 'forms') ? 'active' : '';
$fieldsClass = ($active === 'fields') ? 'active' : '';
$sectionsClass = ($active === 'sections') ? 'active' : '';
$submittersClass = ($active === 'submitters') ? 'active' : '';
$logsClass = ($active === 'logs') ? 'active' : '';
$optionsClass = ($active === 'config') ? 'active' : '';

$user = JFactory::getUser();

$uri = JUri::getInstance();
$return = base64_encode('index.php' . $uri->toString(array('query')));

RHelperAsset::load('redformbackend.css', 'com_redform');
?>

<ul class="nav nav-tabs nav-stacked">
	<li>
		<a class="<?php echo $formsClass; ?>"
		   href="<?php echo JRoute::_('index.php?option=com_redform&view=forms') ?>">
			<i class="icon-list"></i>
			<?php echo JText::_('COM_REDFORM_FORM_LIST_TITLE') ?>
		</a>
	</li>
	<li>
		<a class="<?php echo $fieldsClass; ?>"
		   href="<?php echo JRoute::_('index.php?option=com_redform&view=fields') ?>">
			<i class="icon-check"></i>
			<?php echo JText::_('COM_REDFORM_FIELD_LIST_TITLE') ?>
		</a>
	</li>
	<li>
		<a class="<?php echo $sectionsClass; ?>"
		   href="<?php echo JRoute::_('index.php?option=com_redform&view=sections') ?>">
			<i class="icon-list"></i>
			<?php echo JText::_('COM_REDFORM_SECTION_LIST_TITLE') ?>
		</a>
	</li>
	<li>
		<a class="<?php echo $submittersClass; ?>"
		   href="<?php echo JRoute::_('index.php?option=com_redform&view=submitters') ?>">
			<i class="icon-user"></i>
			<?php echo JText::_('COM_REDFORM_SUBMITTER_LIST_TITLE') ?>
		</a>
	</li>
	<li>
		<a class="<?php echo $logsClass; ?>"
		   href="<?php echo JRoute::_('index.php?option=com_redform&view=logs') ?>">
			<i class="icon-comments"></i>
			<?php echo JText::_('COM_REDFORM_LOG_LIST_TITLE') ?>
		</a>
	</li>
	<?php if ($user->authorise('core.admin', 'com_redform')): ?>
	<li>
		<a class="<?php echo $optionsClass; ?>"
		   href="<?php echo JRoute::_('index.php?option=com_redcore&view=config&layout=edit&component=com_redform&return=' . $return); ?>">
			<i class="icon-cogs"></i>
			<?php echo JText::_('JToolbar_Options') ?>
		</a>
	</li>
	<?php endif; ?>
</ul>
