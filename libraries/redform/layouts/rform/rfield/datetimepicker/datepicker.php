<?php
/**
 * @package     RedEVENT
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2008 - 2016 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

$data = $displayData;

/** @var JFormFieldTimePicker $field */
$field = $data['field'];
$class = $data['class'];
$id = $data['id'];
$required = (bool) $data['required'];
$value = $data['value'];
$name = $data['name'];
$dateformat = $data['dateformat'];
$altDateformat = $data['altDateformat'];

$options = json_encode(
	array(
		'altField'      => '#' . $id,
		'dateFormat'    => $dateformat,
		'altFormat'     => $altDateformat,
		'minDate'       => $data['minDate'],
		'maxDate'       => $data['maxDate'],
		'showWeek' => true
	)
);

// Add jquery UI js.
JHtml::_('rjquery.datepicker');
RHelperAsset::load('jquery-ui-timepicker-addon.js', 'com_redform');
RHelperAsset::load('jquery-ui-timepicker-addon.css', 'com_redform');

$script = <<<JS
	(function($){
		$(function(){
			var options = $options;
			$('#{$id}_v').datepicker(options);
			
			try {
				var current = $.datepicker.parseDate(options.altFormat, $('#{$id}').val());
				$('#{$id}_v').datepicker('setDate', current);
			}
			catch (e) {
				// do nothing
			}
			
			$('#{$id}_v').change(function(){
				if ($(this).val() == "") {
					$('#{$id}').val('');
				}
			});
		});
	})(jQuery);
JS;

// Add the script to the document.
JFactory::getDocument()->addScriptDeclaration($script);
?>
<div class="input-append">
	<?php if ($required) : ?>
		<input class="<?php echo $class ?>" name="<?php echo $name ?>_v" type="text"
		       id="<?php echo $id ?>_v" value="<?php echo $value ?>" />
		<input class="required <?php echo $class ?> " name="<?php echo $name ?>" type="hidden"
		       id="<?php echo $id ?>" required="required" value="<?php echo $value ?>" />
	<?php else : ?>
		<input class="<?php echo $class ?>" name="<?php echo $name ?>_v" type="text"
		       id="<?php echo $id ?>_v" />
		<input class="<?php echo $class ?>" name="<?php echo $name ?>" type="hidden"
		       id="<?php echo $id ?>" value="<?php echo $value ?>" />
	<?php endif; ?>
</div>
