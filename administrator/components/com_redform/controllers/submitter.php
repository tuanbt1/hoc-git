<?php
/**
 * @package     Redform.Backend
 * @subpackage  Controllers
 *
 * @copyright   Copyright (C) 2008 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('_JEXEC') or die;

/**
 * Submitter Controller
 *
 * @package     Redform.Backend
 * @subpackage  Controllers
 * @since       1.5
 */
class RedformControllerSubmitter extends RdfControllerForm
{
	/**
	 * Method to save a record.
	 *
	 * @param   string  $key     The name of the primary key of the URL variable.
	 * @param   string  $urlVar  The name of the URL variable if different from the primary key (sometimes required to avoid router collisions).
	 *
	 * @return  boolean  True if successful, false otherwise.
	 */
	public function save($key = null, $urlVar = null)
	{
		$app = JFactory::getApplication();

		// Save redform data
		$rfcore = new RdfCore;

		try
		{
			$result = $rfcore->saveAnswers('');
			$this->setMessage(JText::_('COM_REDFORM_SUBMISSION_SAVE_SUCCESS'));
		}
		catch (Exception $e)
		{
			$msg = JText::_('COM_REDFORM_SUBMISSION_SAVE_FAILED');
			$this->setMessage($msg . ' - ' . $e->getMessage(), 'error');
		}

		// Redirect the user and adjust session state based on the chosen task.
		switch ($this->getTask())
		{
			case 'apply':
				$this->setRedirect(
					$this->getRedirectToItemRoute($this->getRedirectToItemAppend($app->input->getInt('submitter_id1', 0), 'id'))
				);
				break;

			default:
				$this->setRedirect(
					$this->getRedirectToListRoute($this->getRedirectToListAppend())
				);
				break;
		}

		return true;
	}
}
