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
defined('_JEXEC') or die;

/**
 * Base API class, used by clients to interface with userland models.
 */
abstract class ShlApi_Handler extends \ShlBase
{
	/**
	 * @var ShlApi The unique api object.
	 */
	protected $api;

	/**
	 * @var string Namespace fo the client.
	 */
	protected $namespace = '';

	/**
	 * @var string API version the client.
	 */
	protected $version = 'v1';

	/**
	 * \ShlApi_Handler constructor.
	 */
	public function __construct()
	{
		parent::__construct();
		$this->api = \ShlFactory::getThe('api');
	}

	/**
	 * Register all routes with the API layer.
	 */
	abstract public function register();

	/**
	 * A lits of standard options for a route, that should always be present.
	 *
	 * @return array
	 */
	protected function getDefaultRouteOptions()
	{
		return array(
			'version'   => $this->version,
			'auth_type' => \ShlApi_Authorizer::AUTH_LOG_IN,
		);
	}

	/**
	 * Build a list of options for a router, merging default options and passed ones.
	 *
	 * @param array $routeOptions
	 *
	 * @return array
	 */
	protected function buildRouteOptions($routeOptions = array())
	{
		return wbArrayMerge(
			$this->getDefaultRouteOptions(),
			$routeOptions
		);
	}

	/**
	 * Computes an array holding links to current, next, prev, first and last
	 * pages of a list.
	 *
	 * @param \ShlApi_Request $request
	 * @param array          $options Parameters passed in request.
	 * @param int            $total Total number of items existing.
	 *
	 * @return array
	 */
	protected function getPagination($request, $options, $total)
	{
		// at least link to self
		$responseLinks = array(
			'self' => $request->routeLink(),
		);

		$perPage = (int) wbArrayGet($options, 'per_page', 10);
		// @TODO: sanitize, set a per_page maximum value (in plugin settings? should be per route).
		$perPage = min(100, $perPage);
		$totalPages = ceil($total / $perPage);

		$page = (int) wbArrayGet($options, 'page', 1);
		// validate page requested
		$page = $page < 1 ? 1 : $page;

		// first
		if ($totalPages > 1 && $page > 1)
		{
			$responseLinks['first'] = $request->routeLink(
				null,
				array(
					'page'     => 1,
					'per_page' => $perPage
				)
			);
		}

		// next
		if ($page < $totalPages)
		{
			$responseLinks['next'] = $request->routeLink(
				null,
				array(
					'page'     => $page + 1,
					'per_page' => $perPage
				)
			);
		}

		// previous
		if ($page > 1)
		{
			$responseLinks['prev'] = $request->routeLink(
				null,
				array(
					'page'     => $page - 1,
					'per_page' => $perPage
				)
			);
		}

		// last
		if ($totalPages > 1 && $page < $totalPages)
		{
			$responseLinks['last'] = $request->routeLink(
				null,
				array(
					'page'     => $totalPages,
					'per_page' => $perPage
				)
			);
		}

		return $responseLinks;
	}
}
