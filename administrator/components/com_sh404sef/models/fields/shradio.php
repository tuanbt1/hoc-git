<?php
/**
 * sh404SEF - SEO extension for Joomla!
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier - Weeblr llc - 2020
 * @package     sh404SEF
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     4.18.2.3981
 * @date		2019-12-23
 */

defined('JPATH_BASE') or die;

/**
 * Form Field class for the Joomla Framework.
 *
 * @package		Joomla.Administrator
 * @subpackage	com_menus
 */
class JFormFieldShradio extends JFormFieldRadio
{
	/**
	 * The form field type.
	 *
	 * @var		string
	 */
	protected $type = 'Shradio';

	/**
	 * Method to get certain otherwise inaccessible properties from the form field object.
	 *
	 * @param   string  $name  The property name for which to the the value.
	 *
	 * @return  mixed  The property value or null.
	 *
	 */
	public function __get($name)
	{
$stop = 1;
		switch ($name)
		{
			case 'element':
				return $this->$name;
				break;
		}

		$value = parent::__get($name);
		return $value;
	}
}
