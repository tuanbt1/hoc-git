<?php
/**
 * @package    RedPRODUCTFINDER.Frontend
 *
 * @copyright  Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

JLoader::import('helper', JPATH_SITE . '/modules/mod_redproductforms');

$lists = ModRedproductForms::getList($params);
$model = JModelLegacy::getInstance("Forms", "RedproductfinderModel");
$attributes = $model->getAttribute();
$attributeProperties = $model->getAttributeProperty();
$attributeSubProperties = $model->getAttributeSubProperty();
$templateId = $params->get("template_id");
$view = JFactory::getApplication()->input->get("view");
$option = JFactory::getApplication()->input->get("option");
$formid = $params->get("form_id");
$module_class_sfx = $params->get("moduleclass_sfx");
$app = JFactory::getApplication();

// Get search by tag or type from component
$paramComponent = JComponentHelper::getParams('com_redproductfinder');
$searchBy = $paramComponent->get('search_by');
$Itemid = $app->input->get("Itemid", 0);

$cid = 0;
$manufacturer_id = 0;

switch ($option)
{
	case "com_redproductfinder":
			switch ($view)
			{
				case "findproducts":
					$cid = $app->input->get("cid", 0, "INT");
					$manufacturer_id = $app->input->get("manufacturer_id", 0, "INT");
				break;
			}
		break;
	case "com_redshop":
			switch ($view)
			{
				case "category":
					$cid = $app->input->get("cid", 0, "INT");
					$manufacturer_id = $app->input->get("manufacturer_id", 0, "INT");
					break;
				case "manufacturers":
					$params = $app->getParams('com_redshop');
					$manufacturer_id = $params->get("manufacturerid");
					break;
			}
		break;
}

$range = ModRedproductForms::getRangeMaxMin($cid, $manufacturer_id);

require JModuleHelper::getLayoutPath('mod_redproductforms');
