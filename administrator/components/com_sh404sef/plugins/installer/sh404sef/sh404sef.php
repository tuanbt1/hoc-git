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

defined('_JEXEC') or die;

/**
 * Handle commercial extension update authorization
 *
 * @since       2.5
 */
class PlgInstallerSh404sef extends JPlugin
{
	/**
	 * @var    String  base update url, to decide whether to process the event or not
	 * @since  2.5
	 */
	private $baseUrl = array(
		'https://u1.weeblr.com/dist/sh404sef/full'          => 'sh404sef',
		'https://u1.weeblr.com/dist/sh404sef-importer/full' => 'sh404sef-importer'
	);

	/**
	 * @var    String  extension identifier, to retrieve its params
	 * @since  2.5
	 */
	private $extension = 'com_sh404sef';

	/**
	 * @var    String    An id for your product, to be used by the web site when deciding to allow access
	 *                    Not mandatory, depends on subscription management system
	 * @since  2.5
	 */
	private $productId = '';

	/**
	 * @var    String    An edition type (full, free, lite,...) for the product
	 *                    Not mandatory, depends on subscription management system
	 * @since  2.5
	 */
	private $productEdition = 'full';

	/**
	 * Handle adding credentials to package download request
	 *
	 * @param string $url url from which package is going to be downloaded
	 * @param array  $headers headers to be sent along the download request (key => value format)
	 *
	 * @return  boolean    true        always true
	 *
	 * @since   2.5
	 */
	public function onInstallerBeforePackageDownload(&$url, &$headers)
	{
		// are we trying to update our extension?
		foreach ($this->baseUrl as $baseUrl => $productId)
		{
			if (wbStartsWith($url, $baseUrl))
			{
				$this->productId = $productId;
				break;
			}
		}

		// not one of our URLs.
		if (empty($this->productId))
		{
			return true;
		}

		// read credentials from extension params or any other source
		$credentials = $this->fetchCredentials($url, $headers);

		// bind credentials to request, either in the urls, or using headers
		// or a combination of both
		$this->bindCredentials($credentials, $url, $headers);

		return true;
	}

	/**
	 * Bind credentials to the download request.
	 * In Joomla 4, update key is manager by Joomla and added to the URL.
	 * Prior to J4, we are using a header. Better but not how it was done in J4.
	 *
	 * @param array  $credentials whatever credentials were retrieved for the current user/website
	 * @param string $url url from which package is going to be downloaded
	 * @param array  $headers headers to be sent along the download request (key => value format)
	 *
	 * @return void
	 */
	private function bindCredentials($credentials, &$url, &$headers)
	{
		$headers['X-download-auth-ts'] = time();
		$headers['X-download-auth-id'] = $credentials['id'];
	}

	/**
	 * Retrieve user credentials
	 *
	 * @param $url
	 * @param $headers
	 *
	 * @return mixed an array with credentials (id, secret), or null if none found
	 */
	private function fetchCredentials($url, $headers)
	{
		if (version_compare(JVERSION, '4', 'ge'))
		{
			// j4 adds credentials itself, from update keys manager
			return array('id' => '');
		}

		// fetch credentials from extension parameters
		// Get the component information from the #__extensions table
		JLoader::import('joomla.application.component.helper');
		$component   = JComponentHelper::getComponent($this->extension);
		$credentials = array('id' => trim($component->params->get('update_credentials_access', '')));

		// no update id found, display error
		if (empty($credentials['id']))
		{
			JPlugin::loadLanguage('com_sh404sef', JPATH_ADMINISTRATOR);
			$app = JFactory::getApplication();
			$app->enqueueMessage(JText::sprintf('COM_SH404SEF_UPDATE_NO_CREDENTIALS', 'https://weeblr.com/documentation/products.sh404sef/4/installation-update/updating.html'), 'error');
			$app->redirect('index.php?option=com_installer&view=update');
		}

		return $credentials;
	}
}

