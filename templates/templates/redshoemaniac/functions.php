<?php
/**
 * @package    Template.Template
 *
 * @copyright  Copyright (C) 2005 - 2014 redCOMPONENT.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 *
 * Use this file to add any PHP to the template before it is executed
 */

// Restrict Access to within Joomla
defined('_JEXEC') or die('Restricted access');

$temp_op='';
$temp_view='';
$temp_op= JRequest::getvar('option');
$temp_view= JRequest::getvar('view');

if (($temp_op == 'com_redshop' && $temp_view == 'product') || ($temp_op == 'com_redshop' && $temp_view == 'giftcard'))
{
	$app = JFactory::getApplication();
	$template = $app->getTemplate();
	$js = '
	function onchangePropertyDropdown1(allarg){
		jQuery(document).ready(function($){
			$(".attribute_subproperty select").each(function(){
				if($(this).parent().find(">div").hasClass("select2OptionPicker")){

				}
				else{
					$(this).select2OptionPicker();
				}
			})
			// Add class out stock
		    $(".product-cart-link").each(function(index, val) {
		        var temp=$(this).find(".stockaddtocart");
		        if ($(temp).css("display")!="none") {
		            $(this).addClass("cls_outstock");
		        }else{
		        	$(this).removeClass("cls_outstock");
		        }
		    });
		});
	}
	redSHOP.onChangePropertyDropdown.push( onchangePropertyDropdown1 );
	jQuery(document).ready(function($){
		// Replace stat images
		$(".redshop_product_box").find("img").each(function(){
			var src = $(this).attr("src");
			var a = src.replace("administrator/components/com_redshop/assets/images/star_rating", "templates/'.$template.'/images/star_rating");
			$(this).attr("src", a);
		});
	});
	';
	$document->addScriptDeclaration($js);
}

$bodystyle = "";
$bodyclass = "";

$backgroundimage = $this->params->get('backgroundimage', '');
$backgroundposition = $this->params->get('backgroundposition', 'tile');

if (!empty($backgroundimage))
{
	$bodystyle = 'style="background: url(\'' . $this->baseurl . '/images/' . $backgroundimage . '\');';

	if ($backgroundposition == 'tile')
	{
		$bodystyle .= 'background-repeat: repeat;';
	}
	else
	{
		$bodystyle .= 'background-repeat: no-repeat;';
		$bodystyle .= 'background-size: 100%';
	}

	$bodystyle .= '"';
}

// acypopup
$doc = JFactory::getDocument();
$doc->addScript('https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js');
$domainname = $_SERVER['SERVER_NAME'];
$newpopup = 'jQuery(document).ready(function($) {
	if ( jQuery(".acypopup").length >= 1 ) {
		var acypopup = jQuery(".acypopup");
		var hideAcypopup = $.cookie("hideAcypopup");

		acypopup.prepend("<div class=\"hoverbtn\"><div class=\"minibtn\">&#9866;</div><div class=\"closebtn\">&#10006;</div></div>");

		if(hideAcypopup != "true") {
			setTimeout(function()  {
				acypopup.addClass("shown");
			}, 3000);
		}

		jQuery(".acypopup .closebtn").click(function(){
			acypopup.removeClass("shown");
			$.cookie("hideAcypopup","true",{expires: 7, path: \'/\', domain: \''. $domainname .'\'});
		});
		jQuery(".acypopup .minibtn").click(function(){
			acypopup.toggleClass("minimize");
		});
	}
});';
$document->addScriptDeclaration( $newpopup );