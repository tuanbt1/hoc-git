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
defined('_JEXEC') || die;

/**
 * Initialization of the plugin
 */
class ShlFactory
{
	/**
	 * Stores built objects
	 *
	 * @var array
	 */
	static protected $objects = array();

	/*
	 * Instance created by static facades
	 */
	static protected $instances = array();

	/**
	 * Create a new instance of an object of the requested class
	 * passing in optional array of parameters to its constructor
	 * Only works for array of params, or a single params
	 *
	 * @param string $class
	 * @param mixed  $args
	 *
	 * @return mixed
	 */
	public static function getA($class, $args = null)
	{
		/** @noinspection Annotator */
		return self::getFactory(__CLASS__)->getObject('a', $class, $args);
	}

	/**
	 * Singleton method, can pass parameters to the constructor
	 *
	 * @param string $class
	 * @param array  $args
	 *
	 * @return mixed
	 *
	 */
	public static function getThe($class, $args = null)
	{
		/** @noinspection Annotator */
		return self::getFactory(__CLASS__)->getObject('the', $class, $args);
	}

	/**
	 * Multiton method, can pass parameters to the constructor
	 *
	 * @param string $class
	 * @param string $key
	 * @param array  $args
	 *
	 * @return mixed
	 */
	public static function getThis($class, $key, $args = null)
	{
		/** @noinspection Annotator */
		return self::getFactory(__CLASS__)->getObject('this', $class, $args, $key);
	}

	/**
	 * Builder for factory instance
	 *
	 * @param string $factoryClass
	 *
	 * @return WblFactory
	 */
	protected static function getFactory($factoryClass)
	{
		if (empty(self::$instances[$factoryClass]))
		{
			self::$instances[$factoryClass] = new static();
		}

		return self::$instances[$factoryClass];
	}

	/**
	 * Manages storage of objects
	 *
	 * @param        $method
	 * @param        $class
	 * @param null   $args
	 * @param string $key
	 *
	 * @return mixed
	 * @throws Exception
	 */
	protected function getObject($method, $class, $args = null, $key = '')
	{

		// then instantiate object
		switch ($method)
		{
			// return new object at each call
			case 'a':
				$object = $this->buildObject($method, $class, $args, $key);
				break;

			// singleton
			case 'the':
				if (empty(self::$objects[$class]))
				{
					self::$objects[$class] = $this->buildObject($method, $class, $args, $key);
				}

				$object = self::$objects[$class];
				break;

			// multiton
			case 'this':
				if (empty($key))
				{
					throw new Exception('wbLib: no key specified while using method ' . $method . ', requesting object ' . $class);
				}

				$signature = $class . ' . ' . $key;
				if (empty(self::$objects[$signature]))
				{
					self::$objects[$signature] = $this->buildObject($method, $class, $args, $key);
				}

				$object = self::$objects[$signature];
				break;

			// invalid method
			default:
				$this->invalidMethod($method, $class, $args, $key);
				break;
		}

		/** @noinspection PhpUndefinedVariableInspection */
		return $object;
	}

	/**
	 * Build an object, with optional arguments
	 *
	 * @param        $method
	 * @param        $class
	 * @param null   $args
	 *
	 * @param string $key
	 *
	 * @return mixed
	 * @throws Exception
	 *
	 */
	protected function buildObject($method, $class, $args = null, $key = '')
	{
		switch ($class)
		{
			case 'api':
				if ('the' !== $method)
				{
					throw new Exception('wbLib: invalid factory method for class ' . $class);
				}
				return new ShlApi();
				break;
			case 'platform':
				if ('the' !== $method)
				{
					throw new Exception('wbLib: invalid factory method for class ' . $class);
				}
				return ShlPlatform::get();
				break;
			// In descendant, build here objects for classes that require
			// specific build process
			// case 'SomeClass':
			//   return xxxx
			// break;
			// simply build an object of a class
			default:
				if (class_exists($class))
				{
					if (is_null($args))
					{
						return new $class();
					}
					else
					{
						return new $class($args);
					}
				}
				break;
		}

		return null;
	}

	/**
	 * Throw an invalid method exception
	 *
	 * @param        $method
	 * @param        $class
	 * @param null   $args
	 * @param string $key
	 *
	 * @throws Exception
	 */
	protected function invalidMethod($method, $class, $args = null, $key = '')
	{
		throw new Exception('wbLib: invalid method ' . $method . ' when requesting object ' . $class);
	}
}
