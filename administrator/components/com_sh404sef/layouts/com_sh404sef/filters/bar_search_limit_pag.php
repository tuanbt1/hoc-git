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

/**
 * Displays a search input box with a search and a clear button
 */

?>

<div id="shl-main-searchbar-right-block" class="span12">
	<?php
		echo ShlMvcLayout_Helper::render('com_sh404sef.filters.search_all', $displayData->options);
		echo ShlMvcLayout_Helper::render('com_sh404sef.filters.limit_box', $displayData->pagination);
		echo '<div id="shl-top-pagination-container" class="pull-right"></div>';
	?>
</div>
