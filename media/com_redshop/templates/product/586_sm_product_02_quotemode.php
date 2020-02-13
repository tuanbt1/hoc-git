<!-- moduletable cate  top-->
<div class="moduletable-cate-top">
<div class="custom">
<h3><a href="{returntocategory_link}">{returntocategory_name}</a></h3>
<p class="category-img"><img src="images/catebaner.jpg" border="0" alt="" /></p>
</div>
</div>
<!-- end moduletable cate  top-->
<div id="prod" class="product">
<div class="redshop_product_box row">
<div class="leftcol col-md-7">
<div class="product_image">{product_thumb_image}</div>
<div class="product_more_images row">{more_images}</div>
</div>
<div class="rightcol col-md-5">
<div class="product_detail_box">
<div class="prod-name row">
<div class="product_name">
<h2>{product_name}</h2>
</div>
</div>
<div class="prod-desc-title ratingstar">
<div class="star">
<div class="star_inside">{product_rating_summary}</div>
</div>
<span>{form_rating}</span></div>
<div class="product_attribute">{attribute_template:kw_attributes}</div>
<div class="prod-stock"><label>Availability: </label>{stock_status:instock:outofstock}
<div class="stocknofica">{stock_notify_flag}</div>
</div>
<div class="row askprice">
<div class="product_price_main">
<div class="product_oldprice col-md-6">{product_old_price}</div>
<div class="product_price col-md-6">{product_price}</div>
</div>
<div class="prod-ask">{ask_question_about_product}</div>
</div>
<div class="prod-social row" style="margin-left: 0; margin-right: 0;">
<div class="facebtn col-md-1">{facebook_like_button2}</div>
<div class="twitterbtn col-md-1">{twitter_button}</div>
<div class="pinterestbtn col-md-1">{pinterest_button}</div>
</div>
<div class="prod-func row">
<div class="prod-getquote row"><!-- {if product_userfield} -->
<h4>Get Quote:</h4>
<div class="upload">{rs_uploadimage_lbl}{rs_uploadimage}</div>
<div class="workdetail">{rs_work_detail_lbl}{rs_work_detail}</div>
<!-- {product_userfield end if} --></div>
<div class="btn-addcart row btn-quotemode">{form_addtocart:add_to_cart2}</div>
</div>
</div>
<!-- decrip + review-->
<div class="below-prod row">
<div class="review-prod">
<div class="gd_header">
<h4 class="title active"><a href="#overview">DESCRIPTION</a></h4>
<h4 class="title"><a href="#review">REVIEW</a></h4>
</div>
<div id="review" class="gd_content clearfix">
<div class="cusreview">{product_rating}</div>
</div>
<div id="overview" class="gd_content clearfix" style="display: block;">
<h4 class="title">Description</h4>
<div>{product_desc}</div>
</div>
</div>
<div class="related-prod">{related_product:related_products}</div>
</div>
<!--END  decrip + review--></div>
</div>
</div>