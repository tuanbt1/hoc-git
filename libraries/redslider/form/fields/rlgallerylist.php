<?php
/**
 * @package     RedSLIDER.Backend
 * @subpackage  Field
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

JLoader::import('joomla.form.formfield');
JFormHelper::loadFieldClass('list');

/**
 * RedSLIDER section select list
 *
 * @package     RedSLIDER.Backend
 * @subpackage  Field.RLGalleryLst
 *
 * @since       2.0
 */
class JFormFieldRLGalleryList extends JFormFieldList
{
	/**
	 * The form field type.
	 *
	 * @var		string
	 */
	protected $type = 'RLGalleryList';

	/**
	 * Method to get the field input markup for a generic list.
	 * Use the multiple attribute to enable multiselect.
	 * 
	 * @return  string  The field input markup.
	 */
	public function getInput()
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select($db->qn('id') . ', ' . $db->qn('title'))
			->from($db->qn('#__redslider_galleries'))
			->where($db->qn('published') . ' = 1');

		$db->setQuery($query);

		$items = $db->loadObjectList();

		$options = array();

		if (count($items) > 0)
		{
			foreach ($items as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->title);
			}
		}

		$options = array_merge(parent::getOptions(), $options);

		$attr = '';

		// Initialize some field attributes.
		$attr .= $this->element['class'] ? ' class="' . (string) $this->element['class'] . '"' : '';
		$attr .= $this->element['size'] ? ' size="' . (int) $this->element['size'] . '"' : '';

		// Initialize JavaScript field attributes.
		$attr .= $this->element['onchange'] ? ' onchange="' . (string) $this->element['onchange'] . '"' : '';

		return JHTML::_('select.genericlist', $options, $this->name, trim($attr), 'value', 'text', $this->value, $this->id);
	}
}
