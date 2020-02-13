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
$attribs = array();

if (isset($properties['class']))
{
	$attribs['class'] = $properties['class'];
}

if (isset($properties['readonly']))
{
	$attribs['readonly'] = 'readonly';
}

if (isset($properties['dateformat']))
{
	$attribs['dateformat'] = $properties['dateformat'];
}
?>
<?php echo JHTML::_('calendar', $data->getValue(), $properties['name'], $properties['id'],
	$properties['dateformat'],
	$attribs
);
