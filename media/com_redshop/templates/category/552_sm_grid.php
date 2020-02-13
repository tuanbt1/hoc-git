<!-- moduletable cate  top-->
<div class="moduletable-cate-top">
<div class="custom">
<h3>{category_main_name}</h3>
<div class="category-img"><span>{category_main_name}</span><img src="images/catebaner.jpg" border="0" alt="" /></div>
</div>
<!-- end moduletable cate  top-->
<div class="category_box">
<div class="cate-fun-bar funbar row">
<div class="category_sortby col-md-6 col-sm-6">
	<label><?php echo JText::_('COM_REDSHOP_SORTBY_LBL'); ?></label>
	<form action="" method="post" name="orderby_form">
		<div class="button_g">
			<button id="order_by" name="order_by" value="id" type="submit"><?php echo JText::_('COM_REDSHOP_NEW_ARRIVAL_LBL'); ?></button>
			<button id="order_by" name="order_by" value="price" type="submit">$-$$$</button>
			<button id="order_by" name="order_by" value="price_desc" type="submit">$$$-$</button>
		</div>
		<input id="texpricemin" type="hidden" name="texpricemin" value="0" />
		<input id="texpricemax" type="hidden" name="texpricemax" value="0" />
		<input id="manufacturer_id" type="hidden" name="manufacturer_id" value="0" />
		<input id="category_template" type="hidden" name="category_template" value="552" />
	</form>
	<div class="count_totalproduct">{total_product}</div>
</div>
<div class="category_pagination col-md-6 col-sm-6">{pagination}</div>
</div>
<!--{if products}-->
<div class="searchwrapper category_box_wrapper">{product_loop_start}
<div class="search_box_outside category_box_outside col-md-4 col-sm-4">
<div class="category_box_inside">
<div class="cate_prod_image searchimg {stock_status:out_stock_cls}">{product_thumb_image}</div>
<div class="new-tag {producttag:rs_new_tag_product}">new</div>
<!-- {if product_on_sale} -->
<div class="sale-tag">Sale</div>
 {product_old_price}
<!-- {product_on_sale end if} -->
<div class="funcsearch funcbar">
<div class="price-btn">{product_price} {product_discount_price}</div>
<div class="name-btn">{product_name}</div>
</div>
</div>
</div>
{product_loop_end}</div>
<!--{products end if}-->
<div class="cate-fun-bar pos-bottom funbar row">
<div class="category_sortby col-md-6 col-sm-6">
	<label><?php echo JText::_('COM_REDSHOP_SORTBY_LBL'); ?></label>
	<form action="" method="post" name="orderby_form">
		<div class="button_g">
			<button id="order_by" name="order_by" value="id" type="submit"><?php echo JText::_('COM_REDSHOP_NEW_ARRIVAL_LBL'); ?></button>
			<button id="order_by" name="order_by" value="price" type="submit">$-$$$</button>
			<button id="order_by" name="order_by" value="price_desc" type="submit">$$$-$</button>
		</div>
	</form>
	<div class="count_totalproduct">{total_product}</div>
</div>
<div class="category_pagination col-md-6 col-sm-6">{pagination}</div>
</div>
</div>
</div>