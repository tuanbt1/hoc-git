<?php
/**
 * Shlib - programming library
 *
 * @author       Yannick Gaultier
 * @copyright    (c) Yannick Gaultier 2018
 * @package      shlib
 * @license      http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version      0.4.0.692
 * @date        2019-12-19
 */

defined('_JEXEC') or die;

class ShlSystem_Acl
{
	/**
	 * @var array Holds previously retrieved auth.
	 */
	static $_cache = array();

	/**
	 * Creates and returns an array with all permissions for a given user
	 *
	 * @param string             $actionName
	 * @param string             $asset Asset name.
	 * @param null| int | Object $user the user, either its id or a user object. If null, current user is used
	 *
	 * @return array an array of booleans indexed on action names, true is user can perform the action
	 */
	public function userCan($actionName, $asset = null, $user = null)
	{
		if (is_null($user))
		{
			$user = \JFactory::getUser();
		}
		else if (is_int($user))
		{
			$user = \JFactory::getUser($user);
		}
		else if (!is_object($user) || !isset($user->id))
		{
			return false;
		}

		$sig = wbDotJoin($user->id, empty($asset) ? 'root' : $asset, $actionName);
		if (empty(self::$_cache[$sig]))
		{
			self::$_cache[$sig] = (bool) $user->authorise($actionName, $asset);
		}
		// if user not seen before, load its action data
		return self::$_cache[$sig];
	}
}
