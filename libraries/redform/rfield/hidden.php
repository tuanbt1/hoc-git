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
class RdfRfieldHidden extends RdfRfieldTextfield
{
	protected $type = 'hidden';

	protected $hidden = true;

	/**
	 * Return input properties array
	 *
	 * @return array
	 */
	public function getInputProperties()
	{
		$properties = parent::getInputProperties();
		$properties['type'] = 'hidden';

		return $properties;
	}

	/**
	 * Try to get a default value from integrations
	 *
	 * @return void
	 */
	public function lookupDefaultValue()
	{
		$app = JFactory::getApplication();

		$default = $this->getLookupDefaultValueIntegration();

		if (!is_null($default))
		{
			$this->value = $default;
		}
		elseif ($this->load()->redmember_field)
		{
			$this->value = $this->user->get($this->load()->redmember_field);
		}
		else
		{
			switch ($this->getParam('valuemethod', 'constant'))
			{
				case 'jrequest':
					$varname = $this->getParam('jrequestvar');

					if (!$varname)
					{
						$app->enqueueMessage(JText::_('COM_REDFORM_ERROR_HIDDEN_FIELD_VARNAME_NOT_DEFINED'), 'warning');
					}
					else
					{
						$this->value = $app->input->get($varname);
					}
					break;

				case 'phpeval':
					$code = $this->getParam('phpeval');
					$this->value = eval($code);
					break;

				case 'constant':
				default:
					$this->value = $this->load()->default;
			}
		}

		return $this->value;
	}
}
