<?php
/**
 * Shlib - programming library
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier 2018
 * @package     shlib
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     0.4.0.692
 * @date                2019-12-19
 */

// no direct access
defined('_JEXEC') or die;

class ShlSystem_Http
{

	// return code
	const RETURN_OK = 200;
	const RETURN_CREATED = 201;
	const RETURN_NO_CONTENT = 204;
	const RETURN_BAD_REQUEST = 400;
	const RETURN_UNAUTHORIZED = 401;
	const RETURN_FORBIDDEN = 403;
	const RETURN_NOT_FOUND = 404;
	const RETURN_PROXY_AUTHENTICATION_REQUIRED = 407;
	const RETURN_INTERNAL_ERROR = 500;
	const RETURN_SERVICE_UNAVAILABLE = 503;

	public static function abort($code = self::RETURN_NOT_FOUND, $cause = '')
	{

		$header = self::getHeader($code, $cause);

		// clean all buffers
		ob_end_clean();

		$msg = empty($cause) ? $header->msg : $cause;
		if (!headers_sent())
		{
			header($header->raw);
		}
		die($msg);
	}

	public static function getHeader($code, $cause = '')
	{

		$code = intval($code);
		$header = new stdClass();

		switch ($code)
		{

			case self::RETURN_OK:
				$header->raw = 'HTTP/1.0 200 OK';
				$header->msg = 'OK';
				break;
			case self::RETURN_CREATED:
				$header->raw = 'HTTP/1.0 201 CREATED';
				$header->msg = 'Created';
				break;
			case self::RETURN_NO_CONTENT:
				$header->raw = 'HTTP/1.0 204 OK';
				$header->msg = 'No content';
				break;

			case self::RETURN_BAD_REQUEST:
				$header->raw = 'HTTP/1.0 400 BAD REQUEST';
				$header->msg = 'Bad request';
				break;
			case self::RETURN_UNAUTHORIZED:
				$header->raw = 'HTTP/1.0 401 UNAUTHORIZED';
				$header->msg = 'Unauthorized';
				break;
			case self::RETURN_FORBIDDEN:
				$header->raw = 'HTTP/1.0 403 FORBIDDEN';
				$header->msg = 'Forbidden access';
				break;
			case self::RETURN_NOT_FOUND:
				$header->raw = 'HTTP/1.0 404 NOT FOUND';
				$header->msg = 'Not found';
				break;
			case self::RETURN_INTERNAL_ERROR:
				$header->raw = 'HTTP/1.0 500 INTERNAL ERROR';
				$header->msg = 'Internal error';
				break;
			case self::RETURN_PROXY_AUTHENTICATION_REQUIRED:
				$header->raw = 'HTTP/1.0 407 PROXY AUTHENTICATION REQUIRED';
				$header->msg = 'Proxy authentication required';
				break;
			case self::RETURN_SERVICE_UNAVAILABLE:
				$header->raw = 'HTTP/1.0 503 SERVICE UNAVAILABLE';
				$header->msg = 'Service unavailable';
				break;

			default:
				$header->raw = 'HTTP/1.0 ' . $code;
				break;
		}

		$header->msg = empty($cause) ? $header->msg : $cause;

		return $header;
	}

	public static function getAllHeaders($prefix = '')
	{
		static $headers = null;

		if (is_null($headers))
		{
			if (strpos(php_sapi_name(), 'cgi') !== false)
			{
				$rawHeaders = $_SERVER;
				$cgiPrefix = 'http_';
			}
			else
			{
				$rawHeaders = getallheaders();
				$cgiPrefix = '';
			}

			// loop, keep only relevant headers
			if (empty($prefix) && empty($cgiPrefix))
			{
				$headers = $rawHeaders;
			}
			else
			{
				$headers = array();
				foreach ($rawHeaders as $headerKey => $headerValue)
				{
					$headerKey = strtoupper($headerKey);
					if (strpos($headerKey, strtoupper($cgiPrefix . $prefix)) === 0)
					{
						// removed HTTP_, only for cgi-types, just in case a header would start with HTTP_
						$headerKey = empty($cgiPrefix) ? $headerKey : preg_replace('/^HTTP_/', '', $headerKey);
						// replace _ with -. We only use dashes (-) but when under *-CGI, dashes in headers are turned
						// (by nginx for instance) into underscores when mapped to CGI variables, HTTP_.....
						// so we just revert that
						$headers[str_replace('_', '-', $headerKey)] = $headerValue;
					}
				}
			}
		}

		return $headers;
	}

	public static function isError($status)
	{
		$status = (int) $status;

		return $status > 399;
	}

	public static function isRedirect($status)
	{
		$status = (int) $status;

		return $status > 299 and $status < 400;
	}

	public static function isSuccess($status)
	{
		$status = (int) $status;

		return $status > 199 and $status < 300;
	}

	/**
	 * Renders an http response and end processing of request
	 *
	 * @param int    $code http status to use for response
	 * @param string $cause Optional text to use as response body
	 */
	public static function render($code = self::RETURN_NOT_FOUND, $cause = '', $type = 'text/html', $otherHeaders = array())
	{
		$header = self::getHeader($code, $cause);

		// clean all buffers
		ob_end_clean();

		$msg = empty($cause) ? $header->msg : $cause;
		if (!headers_sent())
		{
			header($header->raw);
		}

		$otherHeaders['Content-type'] = $type;
		self::outputHeaders($otherHeaders);

		if (!is_null($msg))
		{
			echo $msg;
		}

		die();
	}

	/**
	 * Output an array of headers.
	 *
	 * @param array $headers Key/value array of headers
	 */
	public static function outputHeaders($headers)
	{
		@ob_end_clean();
		if (!headers_sent())
		{
			foreach ($headers as $key => $value)
			{
				header($key . ': ' . $value);
			}
		}
	}

	/**
	 * Perform a server-side 301 redirect to the target URL.
	 *
	 * @param string $target
	 */
	public static function redirectPermanent($target)
	{
		@ob_end_clean();
		if (headers_sent())
		{
			echo '<html><head><meta http-equiv="content-type" content="text/html; charset="UTF-8"'
				. '" /><script>document.location.href=\'' . $target . '\';</script></head><body></body></html>';
		}
		else
		{
			header('Cache-Control: no-cache'); // prevent Firefox5+ and IE9+ to consider this a cacheable redirect
			header('HTTP/1.1 301 Moved Permanently');
			header('Location: ' . $target);
		}
		exit();
	}

	/**
	 * Collect a visitor IP address, including best guesses when site is behind a proxy.
	 *
	 * Bases on https://github.com/geertw/php-ip-anonymizer
	 *
	 * @param bool $anonymize Anonymize the IP address.
	 *
	 * @return string
	 */
	public static function getVisitorIpAddress($anonymize = false)
	{
		if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
		{
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		}
		elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
		{
			$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
		}
		else
		{
			$ip = empty($_SERVER['REMOTE_ADDR']) ? '' : $_SERVER['REMOTE_ADDR'];
		}

		if ($anonymize)
		{
			$packedAddress = inet_pton($ip);
			if (strlen($packedAddress) == 4)
			{
				$ip = inet_ntop(inet_pton($ip) & inet_pton('255.255.255.0'));
			}
			elseif (strlen($packedAddress) == 16)
			{
				$ip = inet_ntop(inet_pton($ip) & inet_pton('ffff:ffff:ffff:ffff:0000:0000:0000:0000'));
			}
			else
			{
				$ip = '';
			}
		}

		return $ip;
	}
}
