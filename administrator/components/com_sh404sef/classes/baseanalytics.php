<?php
/**
 * sh404SEF - SEO extension for Joomla!
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier - Weeblr llc - 2020
 * @package     sh404SEF
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     4.18.2.3981
 * @date        2019-12-23
 */

// Security check to ensure this file is being included by a parent file.
if (!defined('_JEXEC'))
{
	die('Direct Access to this location is not allowed.');
}

/**
 * Implement analytics handling
 *
 * @author shumisha
 *
 */
class Sh404sefClassBaseanalytics
{
	// default end point for the analytics service
	protected $_endPoint = '';

	// account list
	protected $_accounts = array();

	// SEF configuration
	protected $_config = null;

	// options for current request (ie account id, format
	protected $_options = null;

	public function fetchAnalytics($config, $options)
	{
		// store parameters
		$this->_config = $config;
		$this->_options = $options;

		// prepare a default response object
		$response = new stdClass();
		$response->status = true;
		$response->statusMessage = JText::_('COM_SH404SEF_CLICK_TO_CHECK_ANALYTICS');
		$response->note = '';

		// connect to server and fetch data
		try
		{
			$rawResponse = $this->_fetchData();
		}
		catch (Exception $e)
		{
			$response->status = false;
			$response->statusMessage = $e->getMessage();
			return $response;
		}

		// return response
		$response->analyticsData = $rawResponse;

		// attach html select list or input boxes to response, to allow user to filter the data viewed
		$response->filters = $this->_prepareFilters();

		// update date/time display
		$response->statusMessage = JText::sprintf('COM_SH404SEF_UPDATED_ON', strftime('%c'));

		return $response;
	}

	protected function _fetchData()
	{
		// fetch account list from supplier
		$this->_fetchAccountsList();

		// and find about which one to use (use first one is none selected from a previous request
		$this->_options['accountId'] = Sh404sefHelperAnalytics::getDefaultAccountId($this->_accounts);

		// check in case we don' have valid account ID
		if (empty($this->_options['accountId']))
		{
			throw new Sh404sefExceptionDefault('Empty account ID to query analytics API. Contact admin.');
		}

		// create a report object
		$className = 'Sh404sefAdapterAnalytics' . strtolower($this->_config->analyticsType) . 'report' . strtolower($this->_options['report']);
		$report = new $className();

		// ask it to perform API requests as needed,
		$dataResponse = $report->fetchData($this->_config, $this->_options, $this->_endPoint);

		// return data response for further processing
		return $dataResponse;
	}

	/**
	 * Fetch list of accounts, to be overloaded
	 */
	protected function _fetchAccountsList()
	{

	}

	/**
	 * prepare html filters to allow user to select the way she likes
	 * to view reports
	 */
	protected function _prepareFilters()
	{
		// array to hold various filters
		$filters = array();

		return $filters;
	}

	/**
	 * Check if user set parameters and request
	 * data allow inserting tracking snippet
	 */
	protected function _shouldInsertSnippet()
	{
		// get config
		$config = Sh404sefFactory::getConfig();

		// check if we have a tracking code, no need to insert snippet if no tracking code
		if (empty($config->analyticsUgaId) && $config->analyticsEdition == 'uga')
		{
			return false;
		}

		if (empty($config->analyticsGtmId) && $config->analyticsEdition == 'gtm')
		{
			return false;
		}

		$user = JFactory::getUser();
		$userViewLevels = $user->getAuthorisedViewLevels();
		$allowedViewLevels = $config->analyticsViewLevel;

		// check access view first
		$shouldInsert = false;
		if (!empty($allowedViewLevels) && is_array($allowedViewLevels) && !empty($userViewLevels) && is_array($userViewLevels))
		{
			if (array_intersect($allowedViewLevels, $userViewLevels))
			{
				$shouldInsert = true;
			}
		}

		// check if we are set to include tracking code for current user
		$groups = $user->getAuthorisedGroups();
		if (!empty($config->analyticsUserGroups) && sh404sefHelperGeneral::isInGroupList(
				$groups,
				$config->analyticsUserGroups
			)
		)
		{
			$shouldInsert = true;
		}
		if (!empty($config->analyticsUserGroupsDisabled) && sh404sefHelperGeneral::isInGroupList(
				$groups,
				$config->analyticsUserGroupsDisabled
			)
		)
		{
			$shouldInsert = false;
		}
		// check if current IP is on exclusion list
		if (!empty($config->analyticsExcludeIP))
		{
			$ip = ShlSystem_Http::getVisitorIpAddress();
			$exclude = Sh404sefHelperGeneral::checkIPList($ip, $config->analyticsExcludeIP);
			if ($exclude)
			{
				$shouldInsert = false;
			}
		}

		return $shouldInsert;
	}
}
