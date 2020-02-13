<?php
/**
 * Shlib - programming library
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier 2018
 * @package     shlib
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     0.4.0.692
 * @date		2019-12-19
 */

// no direct access
defined('_JEXEC') or die;

/**
 * Provides compatible calls for various Joomla! base objects
 *
 * @since	0.2.8
 *
 */
class ShlSystem_Factory
{
	public static function dispatcher()
	{
		if (version_compare(JVERSION, '3', 'ge'))
		{
			$dispatcher = JEventDispatcher::getInstance();
		}
		else
		{
			$dispatcher = JDispatcher::getInstance();
		}
		return $dispatcher;
	}
}
