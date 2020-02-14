<?php
/**
 * ant_title_ant
 *
 * @author       ant_author_ant
 * @copyright    ant_copyright_ant
 * @package      ant_package_ant
 * @license      ant_license_ant
 * @version      ant_version_ant
 *
 * ant_current_date_ant
 */

// Security check to ensure this file is being included by a parent file.
defined('_JEXEC') or die();

/**
 * A thin interface class to the host system (CMS)
 *
 */
Interface ShlPlatform_Interface
{
	public function getName();

	public function getUser($id = null);

	public function getUri($url = '');

	public function getMethod();

	public function getCSRFToken();

	public function checkCSRFToken();

	public function getCurrentUrl();

	public function getBaseUrl($pathOnly = true);

	public function getRootUrl($pathOnly = true);

	public function getRootPath();

	public function getRewritePrefix();

	public function getCurrentLanguageTag($full = true);

	public function t($key, $options = array('js_safe' => false, 'lang' => ''));

	public function tprintf($key);

	// authorization
	public function authorize($options = array());

}
