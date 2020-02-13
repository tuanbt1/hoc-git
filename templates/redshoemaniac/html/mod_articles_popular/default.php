<?php
// Wright v.3 Override: Joomla 2.5.17
/**
 * @package		Joomla.Site
 * @subpackage	mod_articles_popular
 * @copyright	Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die;
?>
<ul class="mostread<?php echo $moduleclass_sfx; ?> row">  <?php // Wright v.3: Added nav nav-list classes ?>
<?php foreach ($list as $item) : ?>
	<li class='col-md-3'>
			<img src='<?php echo json_decode($item->images)->image_intro;?>'/>
		<a href="<?php echo $item->link; ?>">
			<?php echo $item->title; ?></a>
	</li>
<?php endforeach; ?>
</ul>