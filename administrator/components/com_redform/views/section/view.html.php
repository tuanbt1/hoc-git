<?php
/**
 * @package     Redform.Backend
 * @subpackage  Views
 *
 * @copyright   Copyright (C) 2012 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('_JEXEC') or die;

/**
 * Section View
 *
 * @package     Redform.Backend
 * @subpackage  Views
 * @since       3.3.8
 */
class RedformViewSection extends RdfView
{
	/**
	 * @var  JForm
	 */
	protected $form;

	/**
	 * @var  object
	 */
	protected $item;

	/**
	 * Display method
	 *
	 * @param   string  $tpl  The template name
	 *
	 * @return  void
	 */
	public function display($tpl = null)
	{
		$this->form	= $this->get('Form');
		$this->item	= $this->get('Item');
		$this->state = $this->get('State');

		parent::display($tpl);
	}

	/**
	 * Get the view title.
	 *
	 * @return  string  The view title.
	 */
	public function getTitle()
	{
		$isNew = (int) $this->item->id <= 0;
		$title = JText::_('COM_REDFORM_SECTION_TITLE');
		$state = $isNew ? JText::_('JNEW') : JText::_('COM_REDFORM_EDIT');

		return $title . ' <small>' . $state . '</small>';
	}

	/**
	 * Get the toolbar to render.
	 *
	 * @return  RToolbar
	 */
	public function getToolbar()
	{
		$group = new RToolbarButtonGroup;
		$canDoCore = RedformHelpersAcl::getActions();

		if ($canDoCore->get('core.edit') || $canDoCore->get('core.edit.own'))
		{
			$save = RToolbarBuilder::createSaveButton('section.apply');
			$saveAndClose = RToolbarBuilder::createSaveAndCloseButton('section.save');

			$group->addButton($save)
				->addButton($saveAndClose);
		}

		if (empty($this->item->id))
		{
			$cancel = RToolbarBuilder::createCancelButton('section.cancel');
		}
		else
		{
			$cancel = RToolbarBuilder::createCloseButton('section.cancel');
		}

		$group->addButton($cancel);

		$toolbar = new RToolbar;
		$toolbar->addGroup($group);

		return $toolbar;
	}
}
