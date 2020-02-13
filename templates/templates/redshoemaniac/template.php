<?php
/**
 * @package    Template.Template
 *
 * @copyright  Copyright (C) 2005 - 2014 redCOMPONENT.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 */

// No direct access
defined('_JEXEC') or die('Restricted access');

	$temp_op ='';
	$temp_view ='';
	$temp_layout ='';
	$temp_layout= JRequest::getVar('layout');
	$temp_op= JRequest::getVar('option');
	$temp_view= JRequest::getVar('view');
?>
<!DOCTYPE html>
	<html>
	<head>
		<!--
            ##########################################
            ## redComponent ApS                     ##
            ## Blangstedgaardsvej 1                 ##
            ## 5220 Odense SØ                       ##
            ## Danmark                              ##
            ## support@redcomponent.com             ##
            ## http://www.redcomponent.com          ##
            ## Dato: 2013-04-23                     ##
            ##########################################
        -->

		<w:head />
	</head>
	<body class="<?php echo $bodyclass ?>">
		<div class="wrapper-main">
			<div class='logobar'>
				<div class="container">
					<!-- header -->
					<header id="header">
						<div class="row clearfix">
			                <w:logo name="top"   />
							<div class="clear"></div>
						</div>
					</header>
				</div>
			</div>
			<div class='topbar'>
				<div class='container'>
					<div class='menu-mobile'>
						<?php if ($this->countModules('menu-mobile')) : ?>
							<!-- menu -->
								<w:nav name="menu-mobile" />
						<?php endif; ?>
					</div>
				</div>
			</div>
			<?php if ($this->countModules('breadcrumbs')) : ?>
				<!-- breadcrumbs -->
				<div id="breadcrumbs" class="container">
					<w:module type="single" name="breadcrumbs" chrome="none" />
				</div>
			<?php endif; ?>
			<?php if ($this->countModules('featured')) : ?>
				<!-- featured -->
				<div id="featured" class='container'>
					<w:module type="none" name="featured" chrome="xhtml" />
				</div>
			<?php endif; ?>
			<div class="container">
				<?php if ($this->countModules('grid-top')) : ?>
					<!-- grid-top -->
					<div id="grid-top">
						<w:module type="row" name="grid-top" chrome="wrightflexgrid" />
					</div>
				<?php endif; ?>
				<?php if ($this->countModules('grid-top2')) : ?>
					<!-- grid-top2 -->
					<div id="grid-top2">
						<w:module type="row" name="grid-top2" chrome="wrightflexgrid" />
					</div>
				<?php endif; ?>

				<?php if ($this->countModules('grid-tab')) : ?>
					<!-- grid-tab -->
					<div id="grid-tab" class='row'>
						<w:module type="none" name="grid-tab" chrome="wrightflexgrid" />
					</div>
				<?php endif; ?>

				<?php if ($this->countModules('grid-tab2')) : ?>
					<!-- grid-tab -->
					<div id="grid-tab2" class='row'>
						<w:module type="none" name="grid-tab2" chrome="wrightflexgrid" />
					</div>
				<?php endif; ?>

				<?php if ($this->countModules('grid-tab3')) : ?>
					<!-- grid-tab -->
					<div id="grid-tab3" class='row'>
						<w:module type="none" name="grid-tab3" chrome="wrightflexgrid" />
					</div>
				<?php endif; ?>
				<?php if ($this->countModules('breadcrumbs-blog')) : ?>
					<!-- breadcrumbs -->
					<div id="breadcrumbs" class="col-md-12">
						<w:module type="single" name="breadcrumbs-blog" chrome="none" />
					</div>
				<?php endif; ?>
				<div id="above-maincontent" class="row">
						<?php if ($this->countModules('custom-image')) : ?>
							<!-- custom image -->
							<div id="custom-image" class="col-md-12">
								<w:module type="none" name="custom-image" chrome="none" />
							</div>
						<?php endif; ?>
				</div>
				<div id="main-content" class="row">
					<!-- sidebar1 -->
					<?php if($temp_op=='com_redshop' && ($temp_view=='account_billto' || $temp_view=='quotation_detail' || $temp_view=='order_detail' || $temp_view=='orders' || $temp_view=='account_shipto'|| $temp_view=='cart'|| $temp_view=='checkout' || $temp_view=='account' || $temp_view=='quotation' || ($temp_view=='order_detail' && $temp_layout=='receipt'))){?>
						<script>
							jQuery(document).ready(function ($) {
							$('#main').removeClass('col-md-9');
							$('#main').addClass('col-md-12');
							});
						</script>
					<?php } else{?>
					<?php
						if(($temp_view=='product' && $temp_layout=='compare')||($temp_op=='com_redshop' && $temp_view=='login')||($temp_op=='com_redshop' && $temp_view=='password')||($temp_op=='com_users' && ($temp_view=='login'||$temp_view=='registration'||$temp_view=='reset'))){?>
						<script>
							jQuery(document).ready(function ($) {
							$('#main').removeClass('col-md-9');
							$('#main').addClass('col-md-12');
							});
						</script>
					<?php }else{?>
					<?php if($temp_op=='com_content' && $temp_view=='category' && $temp_layout=='blog'){?>
						<script>
							jQuery(document).ready(function ($) {
							$('#main').removeClass('col-md-9');
							$('#main').addClass('col-md-12');
							});
						</script>
					<?php }else{?>
					<?php if($temp_op=='com_redshop' && $temp_view=='product' && JRequest::getvar("pid")){?>
						<script>
							jQuery(document).ready(function ($) {
							$('#main').removeClass('col-md-9');
							$('#main').addClass('col-md-12');
							});
						</script>
					<?php }else{?>
					<aside id="sidebar1">
						<w:module name="sidebar1" chrome="xhtml" />
					</aside>
					<?php }?>
					<?php }?>
					<?php }?>
					<?php }?>
					<!-- main -->
					<section id="main">
						<?php if ($this->countModules('above-content')) : ?>
							<!-- above-content -->
							<div id="above-content">
								<w:module type="none" name="above-content" chrome="xhtml" />
							</div>
						<?php endif; ?>
						<!-- component -->
						<w:content />
						<?php if ($this->countModules('below-content')) : ?>
							<!-- below-content -->
							<div id="below-content">
								<w:module type="none" name="below-content" chrome="xhtml" />
							</div>
						<?php endif; ?>
					</section>
					<!-- sidebar2 -->
					<aside id="sidebar2">
						<w:module name="sidebar2" chrome="xhtml" />
					</aside>
				</div>
				<?php if ($this->countModules('grid-below-content')) : ?>
					<!-- grid-bottom -->
					<div id="grid-below-content">
						<w:module type="row" name="grid-below-content" chrome="wrightflexgrid" />
					</div>
				<?php endif; ?>

				<!-- block module also bought for only cart page -->
				<?php if($temp_op=='com_redshop' && $temp_view=='cart'){?>
				<?php if ($this->countModules('grid-bottom')) : ?>
					<!-- grid-bottom -->
					<div id="grid-bottom">
						<w:module type="row" name="grid-bottom" chrome="wrightflexgrid"/>
					</div>
				<?php endif; ?>
				<?php }//ENDIF?>
				<!-- END block module also bought for only cart page -->
			</div>
		</div>
		<!-- footer -->
		<div class="wrapper-footer">
			<footer id="footer" <?php if ($this->params->get('stickyFooter', 1)) : ?> class="sticky"<?php endif;?>>
				<div class="container">
					<?php if ($this->countModules('grid-bottom2')) : ?>
						<!-- grid-bottom2 -->
						<div id="grid-bottom2">
							<w:module type="row" name="grid-bottom2" chrome="wrightflexgrid" />
						</div>
					<?php endif; ?>
					<?php if ($this->countModules('bottom-menu')) : ?>
						<!-- bottom-menu -->
						<w:nav containerClass="" rowClass="row" name="bottom-menu" />
					<?php endif; ?>
					<?php if ($this->countModules('social-menu')) : ?>
						<!-- grid-socialmenu -->
						<div id="social-menu">
							<w:module type="row" name="social-menu" chrome="xhtml" />
						</div>
					<?php endif; ?>
					<?php if ($this->countModules('footer')) : ?>
						<div class="container">
						<w:module type="row" name="footer" chrome="wrightflexgrid" />
						</div>
						<a class="arrow-backtop" href=""></a>
					<?php endif; ?>

				</div>
			</footer>
		</div>

		<w:footer />
		<?php if ($this->countModules('acypopup')) : ?>
			<div class="acypopup">
				<w:module name="acypopup" chrome="xhtml" />
			</div>
		<?php endif; ?>
	</body>
	</html>
<?php
	$temp_op ='';
	$temp_view ='';
	$temp_layout ='';
	$temp_layout= JRequest::getVar('layout');
	$temp_op= JRequest::getVar('option');
	$temp_view= JRequest::getVar('view');

    if ($temp_op == 'com_content' && $temp_view == 'category' && $temp_layout == 'blog') {
    	echo "<script>
			jQuery(document).ready(function ($) {
				$('#featured').hide();
			});
		</script>";
    };
	if($temp_op=='com_redshop' && ($temp_view=='category' )){
		if ($temp_layout=='products' || ($temp_layout=='detail' || JRequest::getvar("cid")) ) {
			echo "
				<script>
				jQuery(document).ready(function ($) {
					$('#sidebar1').each(function(index, val) {
						var mobitab = $(this).find('.mobitab');
						$(this).find('.moduletable.catemenu').each(function(){
							var id_data = $(this).attr('id');
							mobitab.find('.mobibutton').each(function(){
								if($(this).attr('title')== id_data)
									$(this).remove();
							});
							$(this).remove();
						});
					});
				});
				</script>
			";
		}else{
			echo "
				<script>
				jQuery(document).ready(function ($) {
					$('#sidebar1').each(function(index, val) {
						var mobitab = $(this).find('.mobitab');
						$(this).find('.moduletable.productcomp').each(function(){
							var id_data = $(this).attr('id');
							mobitab.find('.mobibutton').each(function(){
								if($(this).attr('title')== id_data)
									$(this).remove();
							});
							$(this).remove();
						});
						$(this).find('.moduletable.mod-catelist').each(function(){
							var id_data = $(this).attr('id');
							mobitab.find('.mobibutton').each(function(){
								if($(this).attr('title')== id_data)
									$(this).remove();
							});
							$(this).remove();
						});
						$(this).find('.catemenu').show();
					});
				});
				</script>
			";
		}
	}
?>