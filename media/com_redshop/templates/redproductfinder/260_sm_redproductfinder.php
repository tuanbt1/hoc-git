<!--  <div class="redproductfinder_result_header">
	{order_by} {pagination} {perpagelimit:5} {product_display_limit}

	
	{product_id_lbl} :: {product_id} <br/>
	{product_name}<br/>{product_price}<br/>
	{product_thumb_image}<br/>
	{attribute_template:attributes}<br/>
	{product_s_desc}<br/>
	{product_number_lbl} :: {product_number} <br/>
	{manufacturer_link}<br/>{manufacturer_name}<br/>
	{read_more}<br/>{form_addtocart:add_to_cart1}<br/>

</div> -->
<div class="redproductfinder_result_header">
<p> </p>
<!-- moduletable cate  top-->
<div class="moduletable-cate-top">
<div class="custom">
	<div class="finder-product">
		<div class="finder-name">{order_by}</div>
		<div class="finder-number">{product_display_limit}</div>
	</div>
<h3>{category_main_name}</h3>
<div class="category-img">{category_main_name}<img src="images/catebaner.jpg" alt="" border="0" /></div>
</div>
<!-- end moduletable cate  top-->
<div class="category_box">
<div class="cate-fun-bar funbar row">

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
{product_old_price} <!-- {product_on_sale end if} -->
<div class="funcsearch funcbar">
<div class="price-btn">{product_price} {product_discount_price}</div>
<div class="name-btn">{product_name}</div>
</div>
</div>
</div>
{product_loop_end}</div>
<!--{products end if}-->
<div class="cate-fun-bar pos-bottom funbar row">
<div class="category_sortby col-md-6 col-sm-6"><form action="" method="post" name="orderby_form">

</form>

</div>
<div class="category_pagination col-md-6 col-sm-6">{pagination}</div>
</div>
</div>
</div>
</div>