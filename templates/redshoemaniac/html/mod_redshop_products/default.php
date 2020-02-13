<?php
/**
 * @package     RedSHOP.Frontend
 * @subpackage  mod_redshop_products
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die('Restricted access');
JHTML::_('behavior.tooltip');
JHTML::_('behavior.modal');

$uri = JURI::getInstance();
$url = $uri->root();

$Itemid = JRequest::getInt('Itemid');
$user   = JFactory::getUser();
$option = 'com_redshop';

$document = JFactory::getDocument();
$document->addStyleSheet('modules/mod_redshop_products/css/products.css');

// Include redshop js file.
// ;
JLoader::import('images', JPATH_ADMINISTRATOR . '/components/com_redshop/helpers');

// Lightbox Javascript
JHtml::script('com_redshop/attribute.js', false, true);
JHtml::script('com_redshop/common.js', false, true);
JHtml::script('com_redshop/redbox.js', false, true);
JHTML::Stylesheet('fetchscript.css', 'components/com_redshop/assets/css/');


$producthelper   = new producthelper;
$redhelper       = new redhelper;
$redTemplate     = Redtemplate::getInstance();
$extraField      = new extraField;
$stockroomhelper = rsstockroomhelper::getInstance();
$config        = Redconfiguration::getInstance();

$module_id = "mod_" . $module->id;

echo "<div id='" . $module_id . "' class='row mod_redshop_products_wrapper'>";

for ($i = 0; $i < count($rows); $i++)
{
	$row = $rows[$i];

	$category_id = $producthelper->getCategoryProduct($row->product_id);

	$ItemData = $producthelper->getMenuInformation(0, 0, '', 'product&pid=' . $row->product_id);

	if (count($ItemData) > 0)
	{
		$Itemid = $ItemData->id;
	}
	else
	{
		$Itemid = $redhelper->getItemid($row->product_id, $category_id);
	}

	$link = JRoute::_('index.php?option=' . $option . '&view=product&pid=' . $row->product_id . '&cid=' . $category_id .'&Itemid='.$Itemid);

	if (isset($verticalProduct) && $verticalProduct)
		echo "<div class='mod_redshop_products'>";
	else
		echo "<div class='mod_redshop_products_horizontal col-md-3 col-sm-6'>";

	echo "<div class='mod_redshop_products_outer'><div class='mod_redshop_products_inner'>";

	$productInfo = $producthelper->getProductById($row->product_id);

	$outstock_status='';
	$stock_status='';
	$stockStatus_outstock='';

	if ($showStockroomStatus == 1)
	{
		$isStockExists = $stockroomhelper->isStockExists($row->product_id);

		if (!$isStockExists)
		{
			$isPreorderStockExists = $stockroomhelper->isPreorderStockExists($row->product_id);
		}

		if (!$isStockExists)
		{
			$productPreorder = $row->preorder;

			if (($productPreorder == "global" && ALLOW_PRE_ORDER) || ($productPreorder == "yes") || ($productPreorder == "" && ALLOW_PRE_ORDER))
			{
				if (!$isPreorderStockExists)
				{
					$stockStatus = "<div class=\"modProductStockStatus mod_product_outstock\"><span></span>" . JText::_('COM_REDSHOP_OUT_OF_STOCK') . "</div>";
					$stockStatus_outstock = "<div class='mod_redshop_products_image img-outstock'><a href='" . $link . "' title='$row->product_name'></a></div>";
				}
				else
				{
					$stockStatus = "<div class=\"modProductStockStatus mod_product_preorder\"><span></span>" . JText::_('COM_REDSHOP_PRE_ORDER') . "</div>";
				}
			}
			else
			{
				$stockStatus = "<div class=\"modProductStockStatus mod_product_outstock\"><span></span>" . JText::_('COM_REDSHOP_OUT_OF_STOCK') . "</div>";
				$stockStatus_outstock = "<div class='mod_redshop_products_image img-outstock'><a href='" . $link . "' title='$row->product_name'></a></div>";
			}
		}
		else
		{
			$stockStatus = "<div class=\"modProductStockStatus mod_product_instock\"><span></span>" . JText::_('COM_REDSHOP_AVAILABLE_STOCK') . "</div>";
		}
	}

	if ($image)
	{
		$thumb = $productInfo->product_full_image;

		if (WATERMARK_PRODUCT_IMAGE)
		{
			$thumImage = $redhelper->watermark('product', $thumb, $thumbWidth, $thumbHeight, WATERMARK_PRODUCT_THUMB_IMAGE, '0');
			echo "<div class=\"mod_redshop_products_image\"><img src=\"" . $thumImage . "\"></div>";
		}
		else
		{
			$thumImage = RedShopHelperImages::getImagePath(
							$thumb,
							'',
							'thumb',
							'product',
							$thumbWidth,
							$thumbHeight,
							USE_IMAGE_SIZE_SWAPPING
						);
			if (!empty($stockStatus_outstock))
			{
				echo $stockStatus_outstock;
			}else{
				echo "<div class=\"mod_redshop_products_image\"><a href=\"" . $link . "\" title=\"$row->product_name\"><img src=\"" . $thumImage . "\"></a></div>";
			}
		}
	}

	// if (!empty($stockStatus))
	// {
	// 	echo $stockStatus;
	// }

		
	$pname      = $config->maxchar($row->product_name, CATEGORY_PRODUCT_TITLE_MAX_CHARS, CATEGORY_PRODUCT_TITLE_END_SUFFIX);

	echo "<div class='mod_redshop_products_title'><a href='" . $link . "' title=''>" . $pname . "</a></div>";

	if (!$row->not_for_sale && $showPrice)
	{
		$productArr = $producthelper->getProductNetPrice($row->product_id);

		if ($showVat != '0')
		{
			$productPrice           = $productArr['product_main_price'];
			$productPriceDiscount   = $productArr['productPrice'] + $productArr['productVat'];
			$productOldPrice 		= $productArr['product_old_price'];
		}
		else
		{
			$productPrice          = $productArr['product_price_novat'];
			$productPriceDiscount = $productArr['productPrice'];
			$productOldPrice 		= $productArr['product_old_price_excl_vat'];
		}

		if (SHOW_PRICE && (!DEFAULT_QUOTATION_MODE || (DEFAULT_QUOTATION_MODE && SHOW_QUOTATION_PRICE)))
		{
			if (!$productPrice)
			{
				$productDiscountPrice = $producthelper->getPriceReplacement($productPrice);
			}
			else
			{
				$productDiscountPrice = $producthelper->getProductFormattedPrice($productPrice);
			}

			$displyText = "<div class=\"mod_redshop_products_price ".$outstock_status."\">" . $productDiscountPrice . "</div>";

			if ($row->product_on_sale && $productPriceDiscount > 0)
			{
				if ($productOldPrice > $productPriceDiscount)
				{
					$displyText = "";
					$savingPrice     = $productOldPrice - $productPriceDiscount;

					if ($showDiscountPriceLayout)
					{
						// echo "<div id=\"mod_redoldprice\" class=\"mod_redoldprice\">" . $producthelper->getProductFormattedPrice($productOldPrice) . "</div>";
						$productPrice = $productPriceDiscount;
						echo "<div id=\"mod_redmainprice\" class=\"mod_redshop_products_price price-discount\">" . $producthelper->getProductFormattedPrice($productPriceDiscount) . "</div>";
						// echo "<div id=\"mod_redsavedprice\" class=\"mod_redsavedprice\">" . JText::_('COM_REDSHOP_PRODCUT_PRICE_YOU_SAVED') . ' ' . $producthelper->getProductFormattedPrice($savingPrice) . "</div>";
						echo "<div class='mod_redshop_products_label_sale'>".JText::_('COM_REDSHOP_MOD_LB_SALE')."</div>";
					}
					else
					{
						$productPrice = $productPriceDiscount;
						echo "<div class=\"mod_redshop_products_price ".$outstock_status."\">" . $producthelper->getProductFormattedPrice($productPrice) . "</div>";
					}
				}
			}

			echo $displyText;
		}
	}


	$show_short_description = $showShortDescription;
	if ($show_short_description)
	{
		$p_s_desc = $config->maxchar($row->product_s_desc, CATEGORY_PRODUCT_SHORT_DESC_MAX_CHARS, CATEGORY_PRODUCT_SHORT_DESC_END_SUFFIX);
		echo "<div class='mod_redshop_products_desc'>" . $p_s_desc . "</div>";
	}

	$show_readmore = $showReadmore;
	if ($show_readmore)
	{
		echo "<div class='mod_redshop_products_readmore'><a href='" . $link . "'>" . JText::_('COM_REDSHOP_TXT_READ_MORE') . "</a>&nbsp;</div>";
	}

	if (isset($showAddToCart) && $showAddToCart)
	{
		// Product attribute  Start
		$attributes_set = array();

		if ($row->attribute_set_id > 0)
		{
			$attributes_set = $producthelper->getProductAttribute(0, $row->attribute_set_id, 0, 1);
		}

		$attributes = $producthelper->getProductAttribute($row->product_id);
		$attributes = array_merge($attributes, $attributes_set);
		$totalatt   = count($attributes);

		// Product attribute  End


		// Product accessory Start
		$accessory      = $producthelper->getProductAccessory(0, $row->product_id);
		$totalAccessory = count($accessory);

		// Product accessory End


		/*
		 * collecting extra fields
		 */
		$count_no_user_field = 0;
		$hidden_userfield    = "";
		$userfieldArr        = array();

		if (AJAX_CART_BOX)
		{
			$ajax_detail_template_desc = "";
			$ajax_detail_template      = $producthelper->getAjaxDetailboxTemplate($row);

			if (count($ajax_detail_template) > 0)
			{
				$ajax_detail_template_desc = $ajax_detail_template->template_desc;
			}

			$returnArr          = $producthelper->getProductUserfieldFromTemplate($ajax_detail_template_desc);
			$template_userfield = $returnArr[0];
			$userfieldArr       = $returnArr[1];

			if ($template_userfield != "")
			{
				$ufield = "";

				for ($ui = 0; $ui < count($userfieldArr); $ui++)
				{
					$product_userfileds = $extraField->list_all_user_fields($userfieldArr[$ui], 12, '', '', 0, $row->product_id);
					$ufield .= $product_userfileds[1];

					if ($product_userfileds[1] != "")
					{
						$count_no_user_field++;
					}

					$template_userfield = str_replace('{' . $userfieldArr[$ui] . '_lbl}', $product_userfileds[0], $template_userfield);
					$template_userfield = str_replace('{' . $userfieldArr[$ui] . '}', $product_userfileds[1], $template_userfield);
				}

				if ($ufield != "")
				{
					$hidden_userfield = "<div style='display:none;'><form method='post' action='' id='user_fields_form_" . $row->product_id . "' name='user_fields_form_" . $row->product_id . "'>" . $template_userfield . "</form></div>";
				}
			}
		}

		// End

		$addtocart = $producthelper->replaceCartTemplate($row->product_id, $category_id, 0, 0, "{form_addtocart:add_to_cart1}", false, $userfieldArr, $totalatt, $totalAccessory, $count_no_user_field, $module_id);

		echo "<div class='mod_redshop_products_addtocart'>";
		if ($show_readmore)
		{
			echo "<div class='btnreadmore'><a href='" . $link . "'>" . JText::_('COM_REDSHOP_TXT_READ_MORE') . "</a>&nbsp;</div>";
		}
		echo "" . $addtocart . $hidden_userfield . "</div>";
	}

	echo "</div></div></div>";
}

echo "</div>";

?>

<script type="text/javascript">
jQuery(document).ready(function($){
	$(".moduletable #<?php echo $module_id ?>").flexisel({
		visibleItems : 4,
		enableResponsiveBreakpoints: false,
		animationSpeed: 1000
	});

});
</script>
