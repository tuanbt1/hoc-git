<?php
/**
 * Shlib - programming library
 *
 * @author       Yannick Gaultier
 * @copyright    (c) Yannick Gaultier 2018
 * @package      shlib
 * @license      http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version      0.4.0.692
 * @date                2019-12-19
 */

// Security check to ensure this file is being included by a parent file.
defined('_JEXEC') or die;

Class ShlMvcModel_List extends \JModelList
{
	/**
	 * Constructor
	 *
	 * @param   array $config An array of configuration options (name, state, dbo, table_path, ignore_request).
	 *
	 * @since   11.1
	 */
	public function __construct($config = array())
	{
		parent::__construct($config);

		// Set the model dbo
		if (!array_key_exists('dbo', $config))
		{
			$this->_db = \JFactory::getDbo();
		}
	}

}
