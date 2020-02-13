<div id="prod" class="product">
<div class="redshop_product_box row">
<div class="leftcol col-md-6">
<div class="product_image {rs_new_tag_product}">{product_thumb_image}</div>
<div class="product_more_images row">{more_images}</div>
</div>
<div class="rightcol col-md-6">
<div class="product_detail_box">
<div class="prod-name row">
<div class="productnumber">{product_number}</div>
<div class="product_name">
<h2>{product_name}</h2>
</div>
</div>
<div class="product_price_main">{if product_on_sale}
<div class="product_oldprice">{product_old_price}</div>
{product_on_sale end if}
<div class="product_price">{product_price}</div>
</div>
<div class="toggle_box">
<div class="product_s_desc_box"><span><?php echo JText::_('COM_REDSHOP_DESCRIPTION_LBL'); ?></span>{product_s_desc}</div>
<div class="product_full_desc_box"><span><?php echo JText::_('COM_REDSHOP_DESCRIPTION_LBL'); ?></span>{product_desc}
<div class="pro_brand"><span><?php echo JText::_('COM_REDSHOP_BRAND_LBL'); ?></span>{rs_brand}</div>
<div class="pro_material"><span><?php echo JText::_('COM_REDSHOP_MATERIAL_LBL'); ?></span>{rs_material}</div>
<div class="pro_catalog"><span><?php echo JText::_('COM_REDSHOP_CATALOGUE_LBL'); ?></span>{rs_catalog_download}</div>
</div>
</div>
<div class="prod-stock"><label><?php echo JText::_('COM_REDSHOP_AVAILABILITY_LBL'); ?></label>
<div class="stocknofica">{stock_status}</div>
</div>
<div class="row askprice">
<div class="prod-ask">{ask_question_about_product}</div>
</div>
<div class="touch-bar"> </div>
<div class="product_attribute">{attribute_template:sm_attributes}</div>
<div class="prod-func row">
<div class="btn-addcart">{form_addtocart:add_to_cart2}</div>
<div class="btn-account">
<div class="wish-btn">{wishlist_button}</div>
<div id="comp_{product_id}" class="comp-btn">{compare_products_button}</div>
<!-- compbuton -->
<div class="comparebox">
<div class="compare_product_div">
<div class="compare_product_close"> </div>
<div class="compare_product_div_inner">{compare_product_div}</div>
<div class="compare_product_bottom"> </div>
</div>
</div>
<!-- END compbuton --></div>
</div>
<div class="prod-social row" style="margin-left: 0; margin-right: 0;">
<div class="facebtn">{facebook_like_button2}</div>
<div class="twitterbtn">{twitter_button}</div>
<div class="ggplustbtn">{googleplus_button}</div>
<div class="pinterestbtn">{pinterest_button}</div>
</div>
</div>
</div>
</div>
<div class="below-prod row">
<div class="reviewbox col-md-7">
<div class="title-reviewbox"><?php echo JText::_('COM_REDSHOP_PRODUCT_REVIEW_LBL'); ?></div>
<div class="formreview">{form_rating_without_link}</div>
<div class="cusreview">{product_rating}</div>
</div>
<div class="productbox col-md-5">{related_product:sm_related_products}</div>
</div>
</div>