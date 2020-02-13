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
class ShlPlatform_Joomla extends \ShlPlatform implements \ShlPlatform_Interface
{
	protected $_name = 'joomla';

	public function getUser($id = null)
	{
		return \JFactory::getUser($id);
	}

	public function getUri($url = '')
	{
		$url = empty($url) ? 'SERVER' : $url;
		return \JUri::getInstance($url);
	}

	public function getMethod()
	{
		return \JFactory::getApplication()->input->getMethod();
	}

	public function getCSRFToken($forceNew = false)
	{
		return \JSession::getFormToken($forceNew);
	}

	public function checkCSRFToken($method = 'post')
	{
		return \JSession::checkToken(strtolower($method));
	}

	public function getCurrentUrl()
	{
		return \JFactory::getUri()->toString();
	}

	public function getBaseUrl($pathOnly = true)
	{
		return \JUri::base($pathOnly);
	}

	public function getRootUrl($pathOnly = true)
	{
		return \JUri::root($pathOnly);
	}

	public function getRootPath()
	{
		return JPATH_ROOT;
	}

	public function getRewritePrefix()
	{
		static $prefix = null;

		if (is_null($prefix))
		{
			if (!\JFactory::getConfig()->get('sef_rewrite', 0))
			{
				$prefix .= 'index.php/';
			}
		}
		return $prefix;
	}

	public function getCurrentLanguageTag($full = true)
	{
		$langTag = \JFactory::getLanguage()->getTag();

		return $langTag;
	}

	public function t($key, $options = array('js_safe' => false, 'lang' => ''))
	{
		$options['jsSafe'] = !empty($options['js_safe']);

		return \JText::_($key, $options);
	}

	public function tprintf($key)
	{
		$args = func_get_args();

		return call_user_func_array('\JText::sprintf', $args);
	}

	// html operations
	public function setHttpStatus($code, $message)
	{
		\JError::raiseError((int) $code, $message);

		return $this;
	}

	// authorization
	public function authorize($options = array())
	{
		$action = wbArrayGet($options, 'action');
		$subject = wbArrayGet($options, 'subject');
		$userId = wbArrayGet($options, 'user_id');
		return \JFactory::getUser($userId)->authorise($action, $subject);
	}

}
