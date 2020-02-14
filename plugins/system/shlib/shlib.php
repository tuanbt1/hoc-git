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
 *
 */

// no direct access
defined('_JEXEC') or die;

// couple of base path
defined('SHLIB_INSTALL_ROOT_PATH') or define('SHLIB_INSTALL_ROOT_PATH', str_replace(DIRECTORY_SEPARATOR, '/', dirname(__FILE__)));
defined('SHLIB_ROOT_PATH') or define('SHLIB_ROOT_PATH', SHLIB_INSTALL_ROOT_PATH . '/shl_packages/');
defined('SHLIB_LAYOUTS_PATH') or define('SHLIB_LAYOUTS_PATH', SHLIB_INSTALL_ROOT_PATH . '/layouts');
defined('SHLIB_PATH_TO_ZEND') or define('SHLIB_PATH_TO_ZEND', SHLIB_ROOT_PATH . 'ZendFramework-1.11.7-minimal/library/');

// include actual code
$runtimeFile = SHLIB_INSTALL_ROOT_PATH . '/shlib_runtime.php';
if (file_exists($runtimeFile))
{
	include_once $runtimeFile;
}
