<?php
/**
 * @package     RedCORE.Plugin
 * @subpackage  System.MVCOverride
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

// No direct access
defined('_JEXEC') or die;

/**
 * Registry codepools and intialize basic override for core classes
 *
 * @since  1.4
 */
class MVCOverrideHelperCodepool
{
	/**
	 * Register global paths to override code
	 *
	 * @var array
	 */
	private static $paths = array();

	/**
	 * Initialize override of some core classes
	 *
	 * @param   array  $classes  Array include classes
	 *
	 * @return void
	 */
	static public function initialize($classes = array())
	{
		$plugin_path = dirname(dirname(__FILE__));
		$classes = (array) $classes;

		if (version_compare(JVERSION, '3.0', '>='))
		{
			$overrideClasses = array(
				'form' => array(
					'source_file' => JPATH_LIBRARIES . '/legacy/model/form.php',
					'class_name' => 'JModelForm',
					'jimport' => '',
					'override_file' => $plugin_path . '/core/model/modelform.php'
				),
				'view' => array(
					'source_file' => JPATH_LIBRARIES . '/legacy/view/legacy.php',
					'class_name' => 'JViewLegacy',
					'jimport' => '',
					'override_file' => $plugin_path . '/core/view/legacy.php'
				),
				'module' => array(
					'source_file' => JPATH_LIBRARIES . '/cms/module/helper.php',
					'class_name' => 'JModuleHelper',
					'jimport' => '',
					'override_file' => $plugin_path . '/core/module/helper.php'
				)
			);
		}
		else
		{
			$overrideClasses = array(
				'form' => array(
					'source_file' => JPATH_LIBRARIES . '/joomla/application/component/modelform.php',
					'class_name' => 'JModelForm',
					'jimport' => 'joomla.application.component.modelform',
					'override_file' => $plugin_path . '/core/model/modelform.php'
				),
				'view' => array(
					'source_file' => JPATH_LIBRARIES . '/joomla/application/component/view.php',
					'class_name' => 'JView',
					'jimport' => 'joomla.application.component.view',
					'override_file' => $plugin_path . '/core/view/view.php'
				),
				'module' => array(
					'source_file' => JPATH_LIBRARIES . '/joomla/application/module/helper.php',
					'class_name' => 'JModuleHelper',
					'jimport' => 'joomla.application.module.helper',
					'override_file' => $plugin_path . '/core/module/helper.php'
				)
			);
		}

		if (count($classes) > 0)
		{
			foreach ($classes as $class)
			{
				$overrideClass = $overrideClasses[$class];
				self::overrideClass($overrideClass['source_file'], $overrideClass['class_name'], $overrideClass['jimport'], $overrideClass['override_file']);
			}
		}
		else
		{
			foreach ($overrideClasses as $overrideClass)
			{
				self::overrideClass($overrideClass['source_file'], $overrideClass['class_name'], $overrideClass['jimport'], $overrideClass['override_file']);
			}
		}
	}

	/**
	 * Override a core classes and just overload methods that need
	 *
	 * @param   string  $sourcePath   Source Path
	 * @param   string  $class        Class
	 * @param   string  $jimport      JImport path
	 * @param   string  $replacePath  Replace Path
	 *
	 * @return void
	 */
	static private function overrideClass($sourcePath, $class, $jimport, $replacePath)
	{
		// Override library class
		if (!file_exists($sourcePath))
		{
			return;
		}

		MVCLoader::setOverrideFile($class, $sourcePath, true, 'LIB_', 'Default');

		if (!empty($jimport))
		{
			jimport($jimport);
		}

		MVCLoader::setOverrideFile($class, $replacePath);
	}

	/**
	 * Add a code pool to override
	 *
	 * @param   string  $path     Path
	 * @param   bool    $reverse  If true - return reverse array
	 *
	 * @return array
	 */
	static public function addCodePath($path = null, $reverse = false)
	{
		if (is_null($path))
		{
			if ($reverse)
			{
				return self::$paths;
			}
			else
			{
				return array_reverse(self::$paths);
			}
		}

		settype($path, 'array');

		foreach ($path as $codePool)
		{
			$codePool = JPath::clean($codePool);

			if (is_dir($codePool))
			{
				array_unshift(self::$paths, $codePool);
			}
		}

		return self::$paths;
	}
}
