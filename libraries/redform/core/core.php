<?php
/**
 * @package     Redform.Libraries
 * @subpackage  Core
 *
 * @copyright   Copyright (C) 2012 - 2014 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('_JEXEC') or die;

jimport('joomla.mail.helper');

require_once JPATH_SITE . '/components/com_redform/redform.defines.php';

/**
 * redFORM API Core
 *
 * @package     Redform.Libraries
 * @subpackage  Core
 * @since       2.5
 */
class RdfCore extends JObject
{
	private $formId;

	private $sids;

	private $submitKey;

	private $answers;

	private $fields;

	/**
	 * constructor
	 */
	public function __construct()
	{
		parent::__construct();
		$lang = JFactory::getLanguage();
		$lang->load('com_redform', JPATH_SITE . '/components/com_redform');
		$lang->load('com_redform', JPATH_SITE, null, true);
	}

	/**
	 * Returns a reference to the global User object, only creating it if it
	 * doesn't already exist.
	 *
	 * @param   int  $form_id  the form to use - Can be an integer or string - If string, it is converted to ID automatically.
	 *
	 * @return RdfCore The  object.
	 */
	public static function getInstance($form_id = 0)
	{
		static $instances;

		if (!isset($instances))
		{
			$instances = array ();
		}

		if (empty($instances[$form_id]))
		{
			$inst = new self;
			$inst->setFormId($form_id);
			$instances[$form_id] = $inst;
		}

		return $instances[$form_id];
	}

	/**
	 * sets form id
	 *
	 * @param   int  $id  form id
	 *
	 * @return void
	 */
	public function setFormId($id)
	{
		if ($this->formId !== $id)
		{
			$this->formId = intval($id);
			$this->fields = null;
		}
	}

	/**
	 * Set associated sids
	 *
	 * @param   array  $ids         submission ids
	 * @param   bool   $resetCache  reset cached data
	 *
	 * @return void
	 */
	public function setSids($ids, $resetCache = true)
	{
		JArrayHelper::toInteger($ids);

		if ($ids !== $this->sids)
		{
			$this->sids = $ids;

			$submitKey = $this->getSidSubmitKey($ids[0]);
			$this->setSubmitKey($submitKey);

			if ($resetCache)
			{
				$this->resetCache();
			}
		}
	}

	/**
	 * Set submit key
	 *
	 * @param   string  $submit_key  submit key
	 * @param   bool    $resetCache  reset cached data
	 *
	 * @return void
	 */
	public function setSubmitKey($submit_key, $resetCache = true)
	{
		if ($this->submitKey !== $submit_key)
		{
			$this->submitKey = $submit_key;

			$sids = $this->getSids($submit_key);

			if ($sids)
			{
				$this->setSids($sids);
			}

			if ($resetCache)
			{
				$this->resetCache();
			}
		}
	}

	/**
	 * Reset cached data
	 *
	 * @return void
	 */
	protected function resetCache()
	{
		$this->answers = null;
	}

	/**
	 * Set reference to submit key / sids
	 *
	 * @param   mixed  $reference  string submit key or array of sid
	 *
	 * @return void
	 */
	public function setReference($reference)
	{
		if (is_array($reference))
		{
			$this->setSids($reference);
		}
		else
		{
			$this->setSubmitKey($reference);
		}
	}

	/**
	 * returns the html code for form elements (only the elements ! not the form itself, or the submit buttons...)
	 *
	 * @param   int    $form_id    id of the form to display
	 * @param   mixed  $reference  optional submit key string, or array of submission_id. For example when we are modifying previous answers
	 * @param   int    $multiple   optional number of instance of forms to display (1 is default)
	 * @param   array  $options    options
	 *
	 * @return string html
	 */
	public function displayForm($form_id, $reference = null, $multiple = 1, $options = array())
	{
		$this->setFormId($form_id);
		$uri = JFactory::getURI();

		$this->setReference($reference);
		$submit_key = $this->submitKey;

		// Was this form already submitted before (and there was an error for example, or editing)
		if ($this->submitKey)
		{
			$model = $this->getSubmissionModel($this->submitKey);

			if (is_array($reference))
			{
				$answers = $model->getSubmission($reference);
			}
			else
			{
				$answers = $model->getSubmission();
			}

			$firstSub = $answers->getFirstSubmission();
			$sid = $firstSub->sid;
		}
		else
		{
			$sid = null;
		}

		$model = $this->getFormModel($form_id);
		$form   = $model->getForm();
		$fieldsHtml = $this->getFormFields($form_id, $submit_key, $multiple, $options);

		$html = RdfLayoutHelper::render(
			'rform.form',
			array(
				'form' => $form,
				'fieldsHtml' => $fieldsHtml,
				'sid' => $sid,
				'referer64' => base64_encode($uri->toString()),
			),
			'',
			array('component' => 'com_redform')
		);

		// Analytics
		if (RdfHelperAnalytics::isEnabled())
		{
			$event = new stdclass;
			$event->category = 'form';
			$event->action = 'display';
			$event->label = "display form {$form->formname}";
			$event->value = null;
			RdfHelperAnalytics::trackEvent($event);
		}

		return $html;
	}

	/**
	 * Returns html code for the specified form fields
	 * To modify previously posted data, the reference field must contain either:
	 * - submit_key as a string
	 * - an array of submitters ids
	 *
	 * @param   int    $form_id    form id
	 * @param   mixed  $reference  submit_key or array of submitters ids
	 * @param   int    $multi      number of instance of the form to display
	 * @param   array  $options    array of possible options: eventdetails, booking, extrafields
	 *
	 * @return string
	 */
	public function getFormFields($form_id, $reference = null, $multi = 1, $options = array())
	{
		$user      = JFactory::getUser();
		$document  = JFactory::getDocument();
		$app = JFactory::getApplication();

		$model = $this->getFormModel($form_id);
		$form = $model->getForm();
		$form->setRenderOptions($options);
		$fields = $model->getFormFields();

		$this->setReference($reference);
		$submit_key = $this->submitKey;
		$answers = false;

		// Was this form already submitted before (and there was an error for example, or editing)
		if ($this->submitKey)
		{
			$modelSubmission = $this->getSubmissionModel($this->submitKey);

			if (is_array($reference))
			{
				$answers = $modelSubmission->getSubmission($reference);
			}
			else
			{
				$answers = $modelSubmission->getSubmission();
			}
		}
		elseif ($fromSession = $app->getUserState('formdata' . $form->id))
		{
			$answers = $model->getSubmissionFromSession($fromSession);

			// Unset
			$app->setUserState('formdata' . $form->id, null);
		}

		// Css
		$document->addStyleSheet(JURI::base() . 'media/com_redform/css/tooltip.css');
		$document->addStyleSheet(JURI::base() . 'media/com_redform/css/redform.css');

		if (isset($options['currency']) && $options['currency'])
		{
			$currency = $options['currency'];
		}
		else
		{
			$currency = $form->currency;
		}

		if ($multi > 1 && $form->hasMultipleSections())
		{
			// Multi steps isn't compatible with multiple signup
			$multi = 1;
		}

		if ($answers)
		{
			// Set multi to number of answers...
			$multi = count($answers->getSingleSubmissions());
		}
		else
		{
			// Limit to max 30 sumbissions at the same time...
			$multi = min($multi, 30);
		}

		$this->loadCheckScript();

		if ($multi > 1)
		{
			$this->loadMultipleFormScript();
		}

		$formClass = $form->classname ?: '';

		if (!empty($options['ajax_submission']))
		{
			RHelperAsset::load('ajax-submit.js', 'com_redform');
			$formClass .= ($formClass ? ' ' : '' ) . 'redform-ajaxsubmit';
		}

		$html = '<div class="redform-form ' . $formClass . '">';

		if ($form->showname)
		{
			$html .= '<div class="formname">' . $form->formname . '</div>';
		}

		if ($multi > 1)
		{
			if (!$answers)
			{
				// Link to add signups
				$html .= RdfLayoutHelper::render('rform.addsignup', null, '', array('component' => 'com_redform'));
			}
		}

		$initialActive = $answers ? $multi : 1;

		// Loop through here for as many forms there are
		for ($formIndex = 1; $formIndex <= $initialActive; $formIndex++)
		{
			$indexAnswers = $answers ? $answers->getSingleSubmission($formIndex - 1) : false;

			if ($indexAnswers)
			{
				$submitter_id = $indexAnswers->sid;
				$html .= '<input type="hidden" name="submitter_id' . $formIndex . '" value="' . $submitter_id . '" />';
			}

			// Make a collapsable box
			$html .= '<div class="formbox">';

			$indexedFields = $this->prepareFieldsForIndex($fields, $formIndex, $indexAnswers);

			$html .= RdfLayoutHelper::render(
				'rform.fields',
				array(
					'fields' => $indexedFields,
					'index' => $formIndex,
					'user' => $user,
					'options' => $options,
					'answers' => $indexAnswers,
					'form' => $form,
					'multi' => $multi
				),
				'',
				array('component' => 'com_redform')
			);

			if (isset($this->_rwfparams['uid']))
			{
				$html .= '<div>' . JText::_('COM_REDFORM_JOOMLA_USER') . ': '
					. JHTML::_('list.users', 'uid', $this->_rwfparams['uid'], 1, null, 'name', 0) . '</div>';
			}

			// Formfield div
			$html .= '</div>';
		}

		if ($form->activatepayment && isset($options['selectPaymentGateway']) && $options['selectPaymentGateway'])
		{
			$html .= $this->getGatewaySelect($currency);
		}

		// Get an unique id just for the submission
		$uniq = uniqid();

		// Add the captcha, only if initial submit
		if ($form->captchaactive && empty($submit_key))
		{
			JPluginHelper::importPlugin('redform_captcha');
			$captcha = '';
			$dispatcher = JDispatcher::getInstance();
			$results = $dispatcher->trigger('onGetCaptchaField', array(&$captcha));

			if (count($results))
			{
				$html .= RdfLayoutHelper::render(
					'rform.captcha',
					array(
						'captcha_html' => $captcha
					),
					'',
					array('component' => 'com_redform')
				);

				JFactory::getSession()->set('checkcaptcha' . $uniq, 1);
			}
		}

		if (!empty($submit_key))
		{
			// Link to add signups
			$html .= '<input type="hidden" name="submit_key" value="' . $submit_key . '" />';
		}

		if (isset($options['module_id']))
		{
			$html .= '<input type="hidden" name="module_id" value="' . $options['module_id'] . '" />';
		}

		$html .= '<input type="hidden" name="nbactive" value="' . $initialActive . '" />';
		$html .= '<input type="hidden" name="form_id" value="' . $form_id . '" />';
		$html .= '<input type="hidden" name="multi" value="' . $multi . '" />';
		$html .= '<input type="hidden" name="' . self::getToken() . '" value="' . $uniq . '" />';
		$html .= '<input type="hidden" name="submissionurl" value="' . base64_encode(JFactory::getURI()->toString()) . '" />';

		if ($currency)
		{
			$html .= '<input
				type="hidden"
				name="currency"
				value="' . $currency . '"
				precision="' . RHelperCurrency::getPrecision($currency) . '"
				decimal="' . JComponentHelper::getParams('com_redform')->get('decimalseparator', '.') . '"
				thousands="' . JComponentHelper::getParams('com_redform')->get('thousandseparator', ' ') . '"
			/>';
		}

		// End div #redform
		$html .= '</div>';

		return $html;
	}

	/**
	 * saves submitted form data
	 *
	 * @param   string  $integration_key  unique key for the 3rd party (allows to prevent deletions from within redform itself for 3rd party,
	 *                                    and to find out which submission belongs to which 3rd party...)
	 * @param   array   $options          options for registration
	 * @param   array   $data             data if empty, the $_POST variable is used
	 *
	 * @return   RdfCoreFormSubmission
	 */
	public function saveAnswers($integration_key, $options = array(), $data = null)
	{
		$model = new RdfCoreFormSubmission($this->formId);
		$result = $model->apisaveform($integration_key, $options, $data);

		return $result;
	}

	/**
	 * adds extra fields from redmember to user object
	 *
	 * @param   object  $user    object user
	 * @param   int     $org_id  organization id
	 *
	 * @return object user
	 */
	protected function getRedmemberfields(&$user, $org_id = null)
	{
		if (!REDFORM_REDMEMBER_INTEGRATION)
		{
			return $user;
		}

		$rmUser = RedmemberApi::getUser($user->id);
		$rmOrganization = null;

		foreach ($rmUser->fields as $rmField)
		{
			$user->{$rmField->fieldcode} = $rmField->value;
		}

		if ($org_id)
		{
			$rmOrganization = RedmemberApi::getOrganization($org_id);
		}
		elseif ($organizations = $rmUser->getOrganizations())
		{
			$firstOrg = reset($organizations);
			$rmOrganization = RedmemberApi::getOrganization($firstOrg['organization_id']);
		}

		if ($rmOrganization)
		{
			$user->organization = $rmOrganization->name;

			foreach ($rmOrganization->fields as $rmField)
			{
				$user->{$rmField->fieldcode} = $rmField->value;
			}
		}

		return $user;
	}

	/**
	 * returns an array of objects with properties sid, submit_key, form_id, fields
	 *
	 * @param   mixed  $reference  submit_key string or array int submitter ids
	 *
	 * @return RdfCoreFormSubmission
	 */
	public function getAnswers($reference)
	{
		$this->setReference($reference);

		if ($this->submitKey)
		{
			$model = $this->getSubmissionModel($this->submitKey);

			if (is_array($reference))
			{
				$answers = $model->getSubmission($reference);
			}
			else
			{
				$answers = $model->getSubmission();
			}
		}
		else
		{
			$answers = false;
		}

		return $answers;
	}

	/**
	 * Get cart reference associated to submit key
	 *
	 * @param   string  $submitKey  submit key
	 *
	 * @return mixed
	 */
	public function getSubmitkeyCartReference($submitKey)
	{
		return $this->getAnswers($submitKey)->getCartReference();
	}

	/**
	 * returns RdfAnswers for sid
	 *
	 * @param   int  $sid  submitter id
	 *
	 * @return RdfAnswers
	 */
	public function getSidAnswers($sid)
	{
		$submission = $this->getAnswers(array($sid));

		return $submission->getSubmissionBySid($sid);
	}

	/**
	 * Return fields associated to form
	 *
	 * @param   int  $form_id  form id
	 *
	 * @return array RdfRfield
	 */
	public function getFields($form_id= null)
	{
		if ($form_id)
		{
			$this->setFormId($form_id);
		}

		if (empty($this->fields))
		{
			$model_redform = $this->getFormModel($this->formId);
			$this->fields = $model_redform->getFormFields();
		}

		return $this->fields;
	}

	/**
	 * return form status
	 *
	 * @param   int  $form_id  form id
	 *
	 * @return boolean
	 */
	public function getFormStatus($form_id)
	{
		$form = RdfEntityForm::load($form_id);

		return $form->checkFormStatus();
	}

	/**
	 * return form redirect
	 *
	 * @param   int  $form_id  form id
	 *
	 * @return mixed false if not set, or string
	 */
	public function getFormRedirect($form_id)
	{
		$model = $this->getFormModel($form_id);

		$redirect = trim($model->getForm()->redirect);

		return $redirect ? $redirect : false;
	}

	/**
	 * get emails associted to submission key or sids
	 *
	 * @param   mixed  $reference       submit_key or array of sids
	 * @param   bool   $requires_email  email required, returns false if no email field
	 *
	 * @return array or false
	 */
	public function getSubmissionContactEmails($reference, $requires_email = true)
	{
		$answers = $this->getAnswers($reference);

		$results = array();

		foreach ($answers->getSingleSubmissions() as $rdfanswers)
		{
			$emails = array();
			$fullnames = array();
			$usernames = array();

			// First look for email fields
			foreach ((array) $rdfanswers->fields as $f)
			{
				if ($f->fieldtype == 'email')
				{
					if ($f->getParam('notify', 1) && JMailHelper::isEmailAddress($f->getValue()))
					{
						// Set to receive notifications ?
						$emails[] = $f->getValue();
					}
				}

				if ($f->fieldtype == 'username')
				{
					$usernames[] = $f->getValue();
				}

				if ($f->fieldtype == 'fullname')
				{
					$fullnames[] = $f->getValue();
				}
			}

			if (!count($emails) && $requires_email)
			{
				// No email field
				return false;
			}

			$result = array();

			foreach ($emails as $k => $val)
			{
				$result[$k]['email']    = $val;
				$result[$k]['username'] = isset($usernames[$k]) ? $usernames[$k] : '';
				$result[$k]['fullname'] = isset($fullnames[$k]) ? $fullnames[$k] : '';

				if (!isset($result[$k]['fullname']) && isset($result[$k]['username']))
				{
					$result[$k]['fullname'] = $result[$k]['username'];
				}
			}

			$results[$rdfanswers->sid] = $result;
		}

		return $results;
	}

	/**
	 * Get first possible email associated to submission
	 *
	 * @param   mixed  $reference       submit_key or array of sids
	 * @param   bool   $requires_email  email required, returns false if no email field
	 *
	 * @return boolean|mixed
	 */
	public function getSubmissionContactEmail($reference, $requires_email = true)
	{
		$all = $this->getSubmissionContactEmails($reference, $requires_email);

		return count($all) ? current(current($all)) : false;
	}

	/**
	 * Get emails associted to sid
	 *
	 * @param   int  $sid  sid
	 *
	 * @return array or false
	 */
	public function getSidContactEmails($sid)
	{
		$res = $this->getSubmissionContactEmails(array($sid), $requires_email = true);

		if ($res)
		{
			return $res[$sid];
		}

		return false;
	}

	/**
	 * return key sids
	 *
	 * @param   string  $key  submit key
	 *
	 * @return mixed
	 */
	public function getSids($key)
	{
		$db = JFactory::getDBO();

		$query = " SELECT s.id "
			. " FROM #__rwf_submitters as s "
			. " WHERE submit_key = " . $db->quote($key);
		$db->setQuery($query);

		return $db->loadColumn();
	}

	/**
	 * Return submit ley for sid
	 *
	 * @param   int  $sid  sid
	 *
	 * @return mixed
	 */
	public function getSidSubmitKey($sid)
	{
		$db = JFactory::getDBO();

		$query = " SELECT s.submit_key "
			. " FROM #__rwf_submitters as s "
			. " WHERE id = " . $db->quote($sid);
		$db->setQuery($query);

		return $db->loadResult();
	}

	/**
	 * get form object
	 *
	 * @param   int  $form_id  form id
	 *
	 * @return object or false if not found
	 */
	public function getForm($form_id = null)
	{
		if (!$form_id)
		{
			$form_id = $this->formId;
		}

		if (!isset($this->_form) || $this->_form->id <> $form_id)
		{
			$model = $this->getFormModel($form_id);
			$this->_form = $model->getForm();
		}

		return $this->_form;
	}

	/**
	 * submit form using user data from redmember
	 *
	 * @param   int     $user_id      user id
	 * @param   string  $integration  integration key
	 * @param   array   $options      extra submission data
	 *
	 * @return int/array submission_id, or array of submission ids in case of success, 0 otherwise
	 */
	public function quickSubmit($user_id, $integration = null, $options = null)
	{
		if (!$user_id)
		{
			$this->setError('user id is required');

			return false;
		}

		if (!$this->formId)
		{
			$this->setError('form id not set');

			return false;
		}

		// Get User data
		$userData = $this->getUserData($user_id, isset($options['organization_id']) ? $options['organization_id'] : null);

		$fields = $this->prepareUserData($userData);

		$model = new RdfCoreFormSubmission($this->formId);

		if (!$result = $model->quicksubmit($fields, $integration, $options))
		{
			$this->setError($model->getError());

			return false;
		}

		return $result;
	}

	/**
	 * pulls users data
	 *
	 * should get it from redmember
	 *
	 * @param   int  $user_id  user id
	 * @param   int  $org_id   organization id
	 *
	 * @return JUser
	 */
	protected function getUserData($user_id, $org_id = null)
	{
		$user = JFactory::getUser($user_id);
		$this->getRedmemberfields($user, $org_id);

		return $user;
	}

	/**
	 * prepares data for saving
	 *
	 * @param   JUser  $userData    user
	 * @param   int    $form_index  form index
	 *
	 * @return array
	 */
	protected function prepareUserData($userData, $form_index = 1)
	{
		$fields = $this->getFields();

		foreach ($fields as $field)
		{
			$field->setFormIndex($form_index);
			$field->setUser($userData);
			$field->setValue(null, true);
		}

		return $fields;
	}

	/**
	 * Return submission(s) price(s) associated to a submit_key
	 *
	 * @param   string  $submit_key  submit key
	 *
	 * @return array indexed by submitter_id
	 */
	public static function getSubmissionPrice($submit_key)
	{
		$model = new RdfCoreModelSubmission;

		return $model->getSubmissionPrice($submit_key);
	}

	/**
	 * Return field for gateway select
	 *
	 * @param   string  $currency  currency to use as filtering
	 *
	 * @return boolean|string
	 */
	protected function getGatewaySelect($currency)
	{
		$paymentDetails = new stdclass;
		$paymentDetails->currency = $currency;

		$helper = new RdfCorePaymentGateway($paymentDetails);

		$options = $helper->getOptions();

		if (!$options)
		{
			return false;
		}

		if (count($options) == 1)
		{
			// Just a hidden field
			$html = '<input name="gw" type="hidden" value="' . $options[0]->value . '"/>';
		}
		else
		{
			$html = RdfHelperLayout::render('rform.gateway', compact('options'), '', array('component' => 'com_redform'));
		}

		return $html;
	}

	/**
	 * Return true if submission was paid
	 *
	 * @param   string  $submit_key  submission submit key
	 *
	 * @return mixed
	 */
	public function isPaidSubmitkey($submit_key)
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select('pr.id');
		$query->from('#__rwf_payment_request AS pr');
		$query->join('INNER', '#__rwf_submitters AS s ON s.id = pr.submission_id');
		$query->where('s.submit_key = ' . $db->quote($submit_key));
		$query->where('pr.paid = 0');

		$db->setQuery($query);
		$res = $db->loadResult();

		return $res ? false : true;
	}

	/**
	 * Load javascript for multiple form
	 *
	 * @return void
	 */
	protected function loadMultipleFormScript()
	{
		JText::script('COM_REDFORM_MAX_SIGNUP_REACHED');
		JText::script('COM_REDFORM_FIELDSET_SIGNUP_NB');
		JText::script('LIB_REDFORM_REMOVE');
		JText::script('COM_REDFORM_SHOW_ALL_USERS');
		JText::script('COM_REDFORM_HIDE_ALL_USERS');
		RHelperAsset::load('form-multiple.js', 'com_redform');
	}

	/**
	 * Load javascript for form price
	 *
	 * @return void
	 */
	protected function loadPriceScript()
	{
		$params = JComponentHelper::getParams('com_redform');

		JText::script('COM_REDFORM_Total_Price');
		$doc = JFactory::getDocument();
		$doc->addScriptDeclaration('var round_negative_price = ' . ($params->get('allow_negative_total', 1) ? 0 : 1) . ";\n");
		RHelperAsset::load('form-price.js', 'com_redform');
	}

	/**
	 * Load javascript for form validation
	 *
	 * @return void
	 */
	protected function loadCheckScript()
	{
		RHtmlMedia::loadFrameworkJs();
		RHelperAsset::load('redform-validate.js', 'com_redform');
		JText::script('LIB_REDFORM_VALIDATION_FIELD_INVALID');
		JText::script('COM_REDFORM_VALIDATION_CHECKBOX_IS_REQUIRED');
		JText::script('COM_REDFORM_VALIDATION_CHECKBOXES_ONE_IS_REQUIRED');
		JText::script('LIB_REDFORM_FORM_VALIDATION_ERROR_FIELD_IS_REQUIRED');
		JText::script('LIB_REDFORM_VALIDATION_ERROR_USERNAME_INVALID_FORMAT');
		JText::script('LIB_REDFORM_VALIDATION_ERROR_PASSWORD_INVALID_FORMAT');
		JText::script('LIB_REDFORM_VALIDATION_ERROR_NUMERIC_INVALID_FORMAT');
		JText::script('LIB_REDFORM_VALIDATION_ERROR_EMAIL_INVALID_FORMAT');
		JText::script('LIB_REDFORM_VALIDATION_ERROR_FUTURE_DATE');
	}

	/**
	 * Return Form model
	 *
	 * @param   int  $formId  form id
	 *
	 * @return RdfCoreModelForm
	 */
	protected function getFormModel($formId)
	{
		static $instances = array();

		if (!isset($instances[$formId]))
		{
			$model = new RdfCoreModelForm($formId);
			$instances[$formId] = $model;
		}

		return $instances[$formId];
	}

	/**
	 * Return Submission model
	 *
	 * @param   string  $submitKey  submit key for submission
	 *
	 * @return RdfCoreModelSubmission
	 */
	protected function getSubmissionModel($submitKey = null)
	{
		static $instances = array();

		if (is_null($submitKey) && $this->submitKey)
		{
			$submitKey = $this->submitKey;
		}

		if (!$submitKey)
		{
			return new RdfCoreModelSubmission;
		}

		if (!isset($instances[$submitKey]))
		{
			$model = new RdfCoreModelSubmission;
			$model->setSubmitKey($submitKey);
			$instances[$submitKey] = $model;
		}

		return $instances[$submitKey];
	}

	/**
	 * Get form token
	 *
	 * @param   bool  $forcenew  force new token
	 *
	 * @return string
	 */
	public static function getToken($forcenew = false)
	{
		$user = JFactory::getUser();
		$session = JFactory::getSession();

		if (!$session->has('redformtoken') || $forcenew)
		{
			$token = $session->getToken($forcenew);
			$session->set('redformtoken', $token);
		}
		else
		{
			$token = $session->get('redformtoken');
		}

		$hash = JApplication::getHash($user->get('id', 0) . $token);

		return $hash;
	}

	/**
	 * Delete submissions
	 *
	 * @param   mixed  $pk  id or array of id of submitters to delete
	 *
	 * @return void
	 *
	 * @throws InvalidArgumentException
	 */
	public function deleteSubmission($pk)
	{
		if (!$pk)
		{
			throw new InvalidArgumentException('Missing sids for deletion');
		}

		if ($pk && !is_array($pk))
		{
			$pk = array($pk);
		}

		JArrayHelper::toInteger($pk);

		JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_redform/tables');
		$table = JTable::getInstance('Submitter', 'RedformTable');

		$table->delete($pk, true);
	}

	/**
	 * Get payments requests details indexed by sids
	 *
	 * @param   array  $sids  submission ids
	 *
	 * @return array
	 */
	public static function getSubmissionsPaymentRequests($sids)
	{
		if (!count($sids))
		{
			return false;
		}

		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select('pr.*, c.invoice_id')
			->from('#__rwf_payment_request AS pr')
			->join('LEFT', '#__rwf_cart_item AS ci ON ci.payment_request_id = pr.id')
			->join('LEFT', '#__rwf_cart AS c ON c.id = ci.cart_id')
			->where('pr.submission_id IN (' . implode(', ', $sids) . ')')
			->order('pr.id DESC');

		$db->setQuery($query);
		$paymentRequests = $db->loadObjectList();

		$res = array();

		foreach ($paymentRequests as $paymentRequest)
		{
			if (!isset($res[$paymentRequest->submission_id]))
			{
				$res[$paymentRequest->submission_id] = array();
			}

			$res[$paymentRequest->submission_id][] = $paymentRequest;
		}

		return $res;
	}

	/**
	 * Prepare fields with proper index and answers
	 *
	 * @param   RdfRfield[]  $fields        fields
	 * @param   int          $index         form index
	 * @param   RdfAnswers   $indexAnswers  answers for index
	 *
	 * @return RdfRfield[]
	 */
	protected function prepareFieldsForIndex($fields, $index, $indexAnswers)
	{
		$app = JFactory::getApplication();
		$user = JFactory::getUser();

		// Redmember integration: pull extra fields
		if ($user->get('id') && REDFORM_REDMEMBER_INTEGRATION)
		{
			$this->getRedmemberfields($user);
		}

		$indexed = array();

		foreach ($fields as $fieldOrg)
		{
			if (!($app->isAdmin() || $fieldOrg->published))
			{
				// Only display unpublished fields in backend form
				continue;
			}

			$field = clone $fieldOrg;

			$field->setFormIndex($index);
			$field->setUser($user);

			// Set value if editing
			if ($indexAnswers && $field->id)
			{
				$value = $indexAnswers->getFormFieldAnswer($field->id);
				$field->setValue($value, true);
			}
			else
			{
				$field->lookupDefaultValue();
			}

			$indexed[] = $field;
		}

		return $indexed;
	}
}
