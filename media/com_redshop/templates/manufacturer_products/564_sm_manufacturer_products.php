<div class="moduletable-cate-top">
<div class="row manufacturer_products">
<div class="manufacturer_img">{manufacturer_image}</div>
<div class="manufacturer_description">
<div class="manu-name">
<h3 class="manufacturer_name">{manufacturer_name}</h3>
</div>
{manufacturer_description}</div>
</div>
<div class="category_box">
<div class="cate-fun-bar funbar row">
<div class="category_sortby col-md-6 col-sm-6"><label>Sort by:</label><form action="" method="post" name="orderby_form">
<div class="button_g"><button id="order_by" name="order_by" value="id" type="submit">New Arrival</button> <button id="order_by" name="order_by" value="price" type="submit">$-$$$</button> <button id="order_by" name="order_by" value="price_desc" type="submit">$$$-$</button></div>
<input id="texpricemin" type="hidden" name="texpricemin" value="0" /> <input id="texpricemax" type="hidden" name="texpricemax" value="0" /> <input id="manufacturer_id" type="hidden" name="manufacturer_id" value="0" /> <input id="category_template" type="hidden" name="category_template" value="552" /></form>
<div class="count_totalproduct">{total_product}</div>
</div>
<div class="category_pagination col-md-6 col-sm-6">{pagination}</div>
</div>
<div class="searchwrapper category_box_wrapper manufact_box_wrapper"><!-- {product_loop_start} -->
<div class="search_box_outside col-md-4 col-sm-4">
<div class="category_box_inside">
<div class="cate_prod_image searchimg {stock_status:out_stock_cls}">{product_thumb_image}</div>
<div class="new-tag {producttag:rs_new_tag_product}">new</div>
<!-- {if product_on_sale} -->
<div class="sale-tag">Sale</div>
<!-- {product_on_sale end if} -->
<div class="funcsearch funcbar">
<div class="price-btn">{product_price}</div>
<div class="name-btn">{product_name}</div>
</div>
</div>
</div>
<!-- {product_loop_end} --></div>
<div class="cate-fun-bar pos-bottom funbar row">
<div class="category_sortby col-md-6 col-sm-6"><label>Sort by:</label><form action="" method="post" name="orderby_form">
<div class="button_g"><button id="order_by" name="order_by" value="id" type="submit">New Arrival</button> <button id="order_by" name="order_by" value="price" type="submit">$-$$$</button> <button id="order_by" name="order_by" value="price_desc" type="submit">$$$-$</button></div>
<input id="texpricemin" type="hidden" name="texpricemin" value="0" /> <input id="texpricemax" type="hidden" name="texpricemax" value="0" /> <input id="manufacturer_id" type="hidden" name="manufacturer_id" value="0" /> <input id="category_template" type="hidden" name="category_template" value="552" /></form>
<div class="count_totalproduct">{total_product}</div>
</div>
<div class="category_pagination col-md-6 col-sm-6">{pagination}</div>
</div>
</div>
</div>