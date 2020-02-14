<?php
/**
 * @package     Redform.Libraries
 * @subpackage  Rfield
 *
 * @copyright   Copyright (C) 2012 - 2014 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('_JEXEC') or die;

/**
 * redFORM field
 *
 * @package     Redform.Libraries
 * @subpackage  Rfield
 * @since       2.5
 */
class RdfRfieldUsername extends RdfRfieldTextfield
{
	protected $type = 'username';

	/**
	 * Try to get a default value from integrations
	 *
	 * @return void
	 */
	public function lookupDefaultValue()
	{
		$default = $this->getLookupDefaultValueIntegration();

		if (!is_null($default))
		{
			$this->value = $default;
		}
		elseif ($this->formIndex == 1 && $this->user->username)
		{
			$this->value = $this->user->username;
		}
		else
		{
			$this->value = parent::lookupDefaultValue();
		}

		return $this->value;
	}
}
