<?php
/**
 * Shlib - programming library
 *
 * @author       Yannick Gaultier
 * @copyright    (c) Yannick Gaultier 2018
 * @package      shlib
 * @license      http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version      0.4.0.692
 * @date                2019-12-19
 */

// no direct access
defined('_JEXEC') or die;

/**
 * Joomla version compatibility layer
 *
 * @since    0.4.0
 *
 */
class ShlSystem_Compat
{
	/**
	 * Builds a string based on current Joomla version
	 * Format is 'j' followed by major version
	 */
	public static function getJoomlaVersionPrefix()
	{
		switch (true)
		{
			case version_compare(JVERSION, '4', 'ge'):
				$prefix = 'j4';
				break;
			case version_compare(JVERSION, '3', 'ge'):
				$prefix = 'j3';
				break;
			default:
				throw new \Exception('sh404SEF: unsupported Joomla version!');
				break;
		}

		return $prefix;
	}

	/**
	 * Wrapper handling get_magic_quotes_gpc based on
	 * running php version.
	 * Used until we raise min PHP version to 7+.
	 */
	public static function getMagicQuotesGpc()
	{
		if (version_compare(PHP_VERSION, '5.4', '<='))
		{
			return get_magic_quotes_gpc();
		}
		return false;
	}
}

