<?php
/**
 * @package    RedPRODUCTFINDER.Frontend
 *
 * @copyright  Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 */

/* No direct access */
defined('_JEXEC') or die;

$redcoreLoader = JPATH_LIBRARIES . '/redcore/bootstrap.php';

if (!file_exists($redcoreLoader) || !JPluginHelper::isEnabled('system', 'redcore'))
{
	throw new Exception(JText::_('COM_REDPRODUCTFINDER_REDCORE_INIT_FAILED'), 404);
}

// Bootstraps redCORE
RBootstrap::bootstrap();

$app = JFactory::getApplication();
$input = JFactory::getApplication()->input;

JLoader::import('joomla.html.parameter');

$option = $input->getCmd('option');
$view   = $input->getCmd('view');

JLoader::import('joomla.html.pagination');

$controller = JControllerLegacy::getInstance('Redproductfinder');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
