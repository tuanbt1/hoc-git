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

<div class="control-group">
<div class="shrules-label">
<div class="controls">
<?php
echo $displayData->input;
?>
<?php
$element = $displayData->element;
if (!empty($element['additionaltext']))
{
	echo '<span class = "sh404sef-additionaltext">' . (string) $element['additionaltext'] . '</span>';
}
?>
</div>
</div>
</div>
