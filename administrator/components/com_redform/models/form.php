<?php
/**
 * @package     Redform.Backend
 * @subpackage  Models
 *
 * @copyright   Copyright (C) 2008 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('_JEXEC') or die;

/**
 * Form Model
 *
 * @package     Redform.Backend
 * @subpackage  Models
 * @since       2.5
 */
class RedformModelForm extends RModelAdmin
{
	/**
	 * Method to save the form data.
	 *
	 * @param   array  $data  The form data.
	 *
	 * @return  boolean  True on success.
	 */
	public function save($data)
	{
		if (!parent::save($data))
		{
			return false;
		}

		$formId = $this->getState($this->getName() . '.id');

		$this->AddFormTable($formId);

		// Check form fields against table structure
		$this->checkFields($formId);

		// Clear the cache
		$this->cleanCache();

		return true;
	}

	/**
	 * Method to test whether a record can be deleted.
	 *
	 * @param   object  $record  A record object.
	 *
	 * @return  boolean  True if allowed to delete the record. Defaults to the permission for the component.
	 *
	 * @since   11.1
	 */
	protected function canDelete($record)
	{
		if (!parent::canDelete($record))
		{
			return false;
		}

		// Check that there are no submitters
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select('id');
		$query->from('#__rwf_submitters');
		$query->where('form_id = ' . $record->id);

		$db->setQuery($query);
		$res = $db->loadResult();

		if ($res)
		{
			$this->setError('COM_REDFORM_FORM_DELETE_ERROR_FORM_HAS_SUBMITTERS');

			return false;
		}

		return true;
	}

	/**
	 * Adds a table if it doesn't exist yet
	 *
	 * @param   int  $formid  form id
	 *
	 * @return boolean true on success
	 *
	 * @throws Exception
	 */
	private function AddFormTable($formid)
	{
		$db = JFactory::getDBO();

		// Construct form name
		$q = "SHOW TABLES LIKE " . $db->Quote($db->getPrefix() . 'rwf_forms_' . $formid);
		$db->setQuery($q);
		$result = $db->loadColumn();

		if (count($result) == 0)
		{
			// Table doesn't exist, need to create it
			$q = "CREATE TABLE " . $db->quoteName('#__rwf_forms_' . $formid) . " (";
			$q .= $db->quoteName('id') . " INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ";
			$q .= ") COMMENT = " . $db->Quote('redFORMS Form ' . $formid);
			$db->setQuery($q);

			if (!$db->query())
			{
				throw new Exception($db->getError());
			}
		}

		return true;
	}

	/**
	 * Clones the forms and their fields
	 *
	 * @param   array  $cids  id(s) of form(s) to clone
	 *
	 * @return boolean
	 *
	 * @throws Exception
	 */
	public function copy($cids = array())
	{
		foreach ($cids as $cid)
		{
			// Get the form
			$form = $this->getTable('Form', 'RedformTable');
			$form->load($cid);

			// Copy the form
			$form->id = null;
			$form->formname = JText::_('COM_REDFORM_Copy_of') . ' ' . $form->formname;

			if (!$form->store())
			{
				throw new Exception('Failed copying form');
			}

			// Add form table
			$this->AddFormTable($form->id);

			// Get associated fields
			$db = JFactory::getDbo();
			$query = $db->getQuery(true)->select('id')->from('#__rwf_form_field')->where('form_id = ' . $cid);
			$db->setQuery($query);
			$fields = $db->loadColumn();

			// Now copy the fields
			foreach ($fields as $field_id)
			{
				// Fetch field
				$field = $this->getTable('Formfield', 'RedformTable');
				$field->load($field_id);

				// Copy the field
				$field->id = null;
				$field->form_id = $form->id;

				if (!$field->store())
				{
					throw new Exception('Failed copying fields');
				}
			}
		}

		return true;
	}

	/**
	 * Returns form fields as options
	 *
	 * @param   null  $id  form id
	 *
	 * @return array
	 */
	public function getFieldsOptions($id = null)
	{
		if (!($id) && $this->_id)
		{
			$id = $this->_id;
		}

		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select('f.id AS value, f.field AS text');
		$query->from('#__rwf_fields AS f');
		$query->join('INNER', '#__rwf_form_field AS ff ON ff.field_id = f.id');
		$query->where('ff.form_id = ' . (int) $id);
		$query->order('f.field');

		$db->setQuery($query);
		$res = $db->loadObjectList();

		return $res;
	}

	/**
	 * Check form fields against table structure
	 *
	 * @param   int  $formId  form id
	 *
	 * @return void
	 *
	 * @throws Exception
	 */
	public function checkFields($formId)
	{
		$tableFields = $this->_db->getTableColumns('#__rwf_forms_' . $formId);

		$model = RModel::getAdminInstance('formfields', array('ignore_request' => true), 'com_redform');
		$model->setState('filter.form_id', $formId);

		$fields = $model->getItems();

		foreach ($fields as $f)
		{
			if (!in_array('field_' . $f->field_id, array_keys($tableFields)))
			{
				$table = $this->getTable('formfield');
				$table->load($f->id);
				$table->store();
			}
		}
	}
}
