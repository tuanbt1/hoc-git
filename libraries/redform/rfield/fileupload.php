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
class RdfRfieldFileupload extends RdfRfield
{
	protected $type = 'fileupload';

	/**
	 * Get and set the value from post data, using appropriate filtering
	 *
	 * @param   int  $signup  form instance number for the field
	 *
	 * @return mixed
	 */
	public function getValueFromPost($signup)
	{
		if ($value = $this->getFileUpload($signup))
		{
			return $value;
		}

		// No upload, look for a previous value
		$input = JFactory::getApplication()->input;
		$this->value = $input->getString($this->getPostName($signup) . '_prev', '');

		return $this->value;
	}

	/**
	 * Return input properties array
	 *
	 * @return array
	 */
	public function getInputProperties()
	{
		$properties = array();
		$properties['type'] = 'file';

		$properties['name'] = $this->getFormElementName();
		$properties['id'] = $this->getFormElementId();

		$properties['class'] = 'fileupload' . trim($this->getParam('class'));

		if ($this->load()->validate)
		{
			$properties['class'] .= ' required';
		}

		if ($maxsize = $this->getParam('maxsize'))
		{
			$properties['class'] .= ' validate-custom' . $this->id;
		}

		if ($placeholder = $this->getParam('placeholder'))
		{
			$properties['placeholder'] = addslashes($placeholder);
		}

		return $properties;
	}

	/**
	 * Returns field value ready to be printed.
	 * Array values will be separated with separator (default '~~~')
	 *
	 * @param   string  $separator  separator
	 *
	 * @return string
	 */
	public function getValueAsString($separator = '~~~')
	{
		return $this->value ? basename($this->value) : $this->value;
	}

	/**
	 * Returns field Input
	 *
	 * @return string
	 */
	public function getInput()
	{
		if ($maxsize = $this->getParam('maxsize'))
		{
			$message = JText::sprintf('LIB_REDFORM_VALIDATION_FILE_TOO_BIG', $this->formatSizeUnits($maxsize));
			$script = <<<JS
	(function($){
		$(function() {
			document.redformvalidator.setHandler('custom{$this->id}', function (value, element) {
				var file = element[0].files[0];
				if (file) {
					var size = file.size;
					var result = size < {$maxsize};

					if (typeof element[0].setCustomValidity === 'function') {
						element[0].setCustomValidity(result ? '' : "{$message}");
					}

					return result;
				}

				return true;
			});
		});
	})(jQuery);
JS;
			JFactory::getDocument()->addScriptDeclaration($script);
		}

		return parent::getInput();
	}

	/**
	 * Check if there was a file uploaded
	 *
	 * @param   int  $signup  signup id
	 *
	 * @return boolean|string
	 *
	 * @throws RuntimeException
	 */
	private function getFileUpload($signup)
	{
		if (!$fullpath = $this->getStoragePath())
		{
			return false;
		}

		$input = JFactory::getApplication()->input;
		$upload = $input->files->get($this->getPostName($signup), array(), 'array');

		if (!$upload || !$upload['size'])
		{
			return false;
		}

		if ($upload['error'])
		{
			throw new RuntimeException('File upload error');
		}

		$maxSizeB = $this->getParam('maxsize', 1000000);

		if ($upload['size'] > $maxSizeB)
		{
			throw new RuntimeException(
				JText::sprintf('COM_REDFORM_ERROR_FILEUPLOAD_SIZE_S_BIGGER_THAN_MAXSIZE_S',
					$this->formatSizeUnits($upload['size']), $this->formatSizeUnits($maxSizeB)
				)
			);
		}

		$src_file = $upload['tmp_name'];

		// Make sure we have a unique name for file
		$dest_filename = uniqid() . '_' . basename(JFile::makeSafe($upload['name']));

		// Start processing uploaded file
		if (is_uploaded_file($src_file))
		{
			if (move_uploaded_file($src_file, $fullpath . '/' . $dest_filename))
			{
				$this->value = $fullpath . '/' . $dest_filename;
			}
			else
			{
				throw new RuntimeException(JText::_('COM_REDFORM_CANNOT_UPLOAD_FILE'));
			}
		}

		return $this->value;
	}

	/**
	 * Return path to storage folder, create if necessary
	 *
	 * @return boolean|string
	 *
	 * @throws RuntimeException
	 */
	private function getStoragePath()
	{
		// Check if the folder exists
		jimport('joomla.filesystem.folder');
		jimport('joomla.filesystem.file');

		$params = JComponentHelper::getParams('com_redform');

		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select('f.formname');
		$query->from('#__rwf_forms AS f');
		$query->where('f.id = ' . $db->Quote($this->load()->form_id));
		$db->setQuery($query);
		$formname = $db->loadResult();

		$filepath = JPATH_SITE . '/' . $params->get('upload_path', 'images/redform');
		$folder = JFile::makeSafe(str_replace(' ', '', $formname));

		$fullpath = $filepath . '/' . $folder;

		if (!JFolder::exists($fullpath))
		{
			if (!JFolder::create($fullpath))
			{
				throw new RuntimeException(JText::_('COM_REDFORM_CANNOT_CREATE_FOLDER') . ': ' . $fullpath);
			}
		}

		if (!is_writable($fullpath))
		{
			throw new RuntimeException(JText::_('COM_REDFORM_PATH_NOT_WRITABLE') . ': ' . $fullpath);
		}

		clearstatcache();

		return $fullpath;
	}

	/**
	 * Human readable file sizes
	 * Snippet from PHP Share: http://www.phpshare.org
	 *
	 * @param   int  $bytes  size in bytes
	 *
	 * @return string
	 */
	private function formatSizeUnits($bytes)
	{
		if ($bytes >= 1073741824)
		{
			$bytes = number_format($bytes / 1073741824, 2) . ' GB';
		}
		elseif ($bytes >= 1048576)
		{
			$bytes = number_format($bytes / 1048576, 2) . ' MB';
		}
		elseif ($bytes >= 1024)
		{
			$bytes = number_format($bytes / 1024, 2) . ' KB';
		}
		elseif ($bytes > 1)
		{
			$bytes = $bytes . ' bytes';
		}
		elseif ($bytes == 1)
		{
			$bytes = $bytes . ' byte';
		}
		else
		{
			$bytes = '0 bytes';
		}

		return $bytes;
	}
}
