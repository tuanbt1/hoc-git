<?php
/**
 * @build_title_build@
 *
 * @author                  @build_author_build@
 * @copyright               @build_copyright_build@
 * @package                 @build_package_build@
 * @license                 @build_license_build@
 * @version                 @build_version_full_build@
 *
 * @build_current_date_build@
 */

// Security check to ensure this file is being included by a parent file.
defined('_JEXEC') or die;

/**
 */
abstract class ShlPlatform implements \ShlPlatform_Interface
{
	const JOOMLA = 'joomla';
	const WORDPRESS = 'wordpress';

	private static $platformName = null;
	private static $platform     = null;

	protected $_name = '';

	/**
	 * Detects running platform and create an instance
	 *
	 */
	public static function get()
	{
		if (is_null(self::$platformName))
		{
			self::$platformName = self::detectPlatform();
			$className = '\ShlPlatform_' . ucfirst(self::$platformName);
			self::$platform = new $className;
		}

		return self::$platform;
	}

	/**
	 * Whether we are on Joomla
	 *
	 * @return bool
	 */
	public static function isJoomla()
	{
		return self::JOOMLA == self::$platformName;
	}

	/**
	 * Whether we are on WordPress
	 *
	 * @return bool
	 */
	public static function isWordpress()
	{
		return self::WORDPRESS == self::$platformName;
	}

	/**
	 * Detects current platfrom, between supported ones.
	 *
	 * @return string The current platform name
	 * @throws Exception If not on a supported platform
	 */
	private static function detectPlatform()
	{
		// WP
		if (
			defined('ABSPATH')
			&&
			defined('DB_NAME')
			&&
			defined('WPINC')
		)
		{
			return self::WORDPRESS;
		}

		// Joomla
		if (
			defined('_JEXEC')
			&&
			defined('JPATH_BASE')
		)
		{
			return self::JOOMLA;
		}

		// don't go unnoticed
		throw new \Exception('wblib: Unsupported platform.');
	}

	/**
	 * Getter for platform name
	 *
	 * @return string
	 */
	public function getName()
	{
		return $this->_name;
	}
}
