<?php
/**
 * @package		Joomla.Site
 * @subpackage	mod_custom
 * @copyright	Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die;
$str_social_content  = '<ul class="social-likes social-likes_notext social-likes_light" data-url="">';
$end_social_content = '</ul>';
$fb_btn = '<li class="facebook" title="facebook" data-via="facebook" data-related="facebook" data-url="http://this_tag_should_not_remove/" data-title="facebook"></li>';
$twi_btn = '<li class="twitter" title="twitter" data-via="twitter" data-related="twitter" data-url="http://this_tag_should_not_remove/" data-title="twitter"></li>';
$ggplus_btn = '<li class="plusone" title="plusone" data-via="plusone" data-related="plusone" data-url="http://this_tag_should_not_remove/" data-title="plusone"></li>';
$pint_btn = '<li class="pinterest" title="pinterest" data-via="pinterest" data-related="pinterest" data-url="http://this_tag_should_not_remove/" data-title="pinterest"></li>';
?>


<div class="custom" <?php if ($params->get('backgroundimage')): ?> style="background-image:url(<?php echo $params->get('backgroundimage');?>)"<?php endif;?> >
	<?php
		if (strpos($module->content,'{social_start}') !== false) {
			$custom_content = strip_tags($module->content);
			$custom_content = str_replace('{social_start}',$str_social_content,$custom_content);
			$custom_content = str_replace('{social_end}',$end_social_content,$custom_content);
			$custom_content = str_replace('{social_fb}',$fb_btn,$custom_content);
			$custom_content = str_replace('{social_twi}',$twi_btn,$custom_content);
			$custom_content = str_replace('{social_gg}',$ggplus_btn,$custom_content);
			$custom_content = str_replace('{social_pint}',$pint_btn,$custom_content);
			echo $custom_content;
		}else{
			echo $module->content;
		}
	?>
</div>
