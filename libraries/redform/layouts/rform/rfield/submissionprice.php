<?php
/**
 * @package     Redform.Site
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2012 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

$data = $displayData;

$properties = $data->getInputProperties();

RHelperAsset::load('form-price.js', 'com_redform');
RHelperAsset::load('accounting.min.js', 'com_redform');

$params = JComponentHelper::getParams('com_redform');
$doc = JFactory::getDocument();
$doc->addScriptDeclaration('var round_negative_price = ' . ($params->get('allow_negative_total', 1) ? 0 : 1) . ";\n");;
?>
<span class="totalprice"></span>
