<?php
/**
 * sh404SEF - SEO extension for Joomla!
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier - Weeblr llc - 2020
 * @package     sh404SEF
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     4.18.2.3981
 * @date		2019-12-23
 */

defined('JPATH_BASE') or die;

?>

<div class="container-fluid">
<?php

foreach ($this->form->getFieldset($this->currentFieldset->name) as $field) :
?>
	<div class="control-group">
	<div class="shrules">
	<div class="controls">
		<?php
        $fieldInput= $field->input;
        $fieldInput = str_replace(
                'onchange="sendPermissions.',
                'onchange="shSendPermissions.',
                $fieldInput
        );
		echo $fieldInput;
		$element = $field->element;
		if (!empty($element['additionaltext'])): ?>
			<span class = "sh404sef-additionaltext"><?php echo (string) $element['additionaltext']; ?></span>
		<?php
		endif;?>
	</div>
	</div>
	</div>
<?php
endforeach;
?>
</div>
