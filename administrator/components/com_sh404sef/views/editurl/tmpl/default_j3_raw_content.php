<?php
/**
 * sh404SEF - SEO extension for Joomla!
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier - Weeblr llc - 2020
 * @package     sh404SEF
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     4.18.2.3981
 * @date        2019-12-23
 */

// Security check to ensure this file is being included by a parent file.
defined('_JEXEC') || die();

?>
<div class="container-fluid">
	<?php

	echo '<div class="alert">' . JText::_('COM_SH404SEF_RAW_CONTENT_PER_URL_HELP') . '</div>';

	$data        = new stdClass();
	$data->label = '<legend>' . JText::_('COM_SH404SEF_RAW_CONTENT_HEAD') . '</legend>';
	echo $this->layoutRenderer['shlegend']->render($data);

	$data        = new stdClass();
	$data->name  = 'raw_content_head_top';
	$data->label = JText::_('COM_SH404SEF_RAW_CONTENT_HEAD_TOP');
	$data->input = '<textarea name="raw_content_head_top" id="raw_content_head_top" cols="60" rows="5">' . $this->rawContent['raw_content_head_top'] . '</textarea>';
	$data->tip   = JText::_('COM_SH404SEF_TT_RAW_CONTENT_HEAD_TOP');
	echo $this->layoutRenderer['custom']->render($data);

	$data        = new stdClass();
	$data->name  = 'raw_content_head_bottom';
	$data->label = JText::_('COM_SH404SEF_RAW_CONTENT_HEAD_BOTTOM');
	$data->input = '<textarea name="raw_content_head_bottom" id="raw_content_head_bottom" cols="60" rows="5">' . $this->rawContent['raw_content_head_bottom'] . '</textarea>';
	$data->tip   = JText::_('COM_SH404SEF_TT_RAW_CONTENT_HEAD_BOTTMOM');
	echo $this->layoutRenderer['custom']->render($data);

	$data        = new stdClass();
	$data->label = '<legend>' . JText::_('COM_SH404SEF_RAW_CONTENT_BODY') . '</legend>';
	echo $this->layoutRenderer['shlegend']->render($data);

	$data        = new stdClass();
	$data->name  = 'raw_content_body_top';
	$data->label = JText::_('COM_SH404SEF_RAW_CONTENT_BODY_TOP');
	$data->input = '<textarea name="raw_content_body_top" id="raw_content_body_top" cols="60" rows="5">' . $this->rawContent['raw_content_body_top'] . '</textarea>';
	$data->tip   = JText::_('COM_SH404SEF_TT_RAW_CONTENT_BODY_TOP');
	echo $this->layoutRenderer['custom']->render($data);

	$data        = new stdClass();
	$data->name  = 'raw_content_body_bottom';
	$data->label = JText::_('COM_SH404SEF_RAW_CONTENT_BODY_BOTTOM');
	$data->input = '<textarea name="raw_content_body_bottom" id="raw_content_body_bottom" cols="60" rows="5">' . $this->rawContent['raw_content_body_bottom'] . '</textarea>';
	$data->tip   = JText::_('COM_SH404SEF_TT_RAW_CONTENT_BODY_BOTTMOM');
	echo $this->layoutRenderer['custom']->render($data);

	?>
</div>
