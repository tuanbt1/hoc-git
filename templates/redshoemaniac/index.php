<?php
/**
 * @copyright      Copyright (C) 2013 redComponent
 * @author         redComponent
 * @package        Template
 *
 */

// No direct access
defined('_JEXEC') or die('Restricted access');

// Include the framework
require dirname(__FILE__) . '/wright/wright.php';

// Initialize the framework and
$tpl = Wright::getInstance();
$tpl->addJSScript(JURI::root() . 'templates/' . $this->template . '/js/jquery.flexisel.js');
$tpl->addJSScript(JURI::root() . 'templates/' . $this->template . '/js/js.js');
$tpl->addJSScript(JURI::root() . 'templates/' . $this->template . '/js/select2.min.js');
$tpl->addJSScript(JURI::root() . 'templates/' . $this->template . '/js/jquery.slimscroll.min.js');
$tpl->addJSScript(JURI::root() . 'templates/' . $this->template . '/js/jQuery.select2OptionPicker.js');
$tpl->addJSScript(JURI::root() . 'templates/' . $this->template . '/js/social-likes.js');
$tpl->addJSScript(JURI::root() . 'templates/' . $this->template . '/js/jquery-ui.min.js');
$tpl->addJSScript(JURI::root() . 'templates/' . $this->template . '/js/jquery.ui.touch-punch.min.js');
$tpl->display();
