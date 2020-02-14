<div class="cart-header">
<div class="btn-shopmore">{shop_more}</div>
<div class="title-cart"><?php echo JText::_('COM_REDSHOP_MY_SHOPPING_BAG_LBL'); ?></div>
</div>
<table class="tdborder rdcart" style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
<thead>
<tr><th><?php echo JText::_('COM_REDSHOP_PICTURE_LBL'); ?></th>
	<th><?php echo JText::_('COM_REDSHOP_PRODUCT_NAME_LBL'); ?></th>
	<th><?php echo JText::_('COM_REDSHOP_PRODUCT_DESCRIPTION_LBL'); ?></th>
	<th class="rcart-opt-tit"><?php echo JText::_('COM_REDSHOP_SIZE_AND_COLOR_LBL'); ?></th>
	<th class="rcart-price-tit"><?php echo JText::_('COM_REDSHOP_PRICE_LBL'); ?></th>
	<th><?php echo JText::_('COM_REDSHOP_QUANTITY_LBL'); ?></th><th> </th>
</tr>
</thead>
<tbody><!--{product_loop_start}-->
<tr class="tdborder">
<td class="rcart-img">{product_thumb_image}</td>
<td class="rcart-name">
<div class="cartproducttitle">{product_name}</div>
<div class="cartpro-code">{product_number}</div>
</td>
<td class="rcart-desc">
<div class="cartpro-desc"></div>
</td>
<td class="rcart-opt">
<div class="tx-att">{product_attribute}</div>
<div class="btn-att">{attribute_change}</div>
</td>
<td class="rcart-price">{product_price_excl_vat}</td>
<td class="rcart-qty">
<div class="rcart_update">{update_cart}</div>
</td>
<td class="rcart-remove" align="right">{remove_product}</td>
</tr>
<!--{product_loop_end}--></tbody>
</table>
<!-- CART below-->
<div class="rcart-belowcart">
<div class="rcart-checkout">
<div class="checkout_line">
	<!-- Subtotal before delivery charges: -->
<div class="title"><?php echo JText::_('COM_REDSHOP_SUBTOTAL_BEFORE_CHARGES'); ?></div>
<div class="content">
<div class="singleline">{product_subtotal_excl_vat}</div>
</div>
</div>
<!-- {if discount}-->
<div class="checkout_line">
<div class="title">{discount_lbl}</div>
<div class="content">
<div class="singleline">{discount}</div>
</div>
</div>
<!-- {discount end if} -->
<!-- Shipping rate: -->
<div class="checkout_line">
<div class="title"><?php echo JText::_('COM_REDSHOP_SHIPPING_RATE'); ?></div>
<div class="content">
<div class="singleline">{shipping_excl_vat}</div>
</div>
</div>
<!-- {if vat} -->
<!-- Tax: -->
<div class="checkout_line">
<div class="title"><?php echo JText::_('COM_REDSHOP_TAX'); ?></div>
<div class="content">
<div class="singleline">{tax}</div>
</div>
</div>
<!-- {vat end if} --> <!-- {if payment_discount}-->
<div class="checkout_line">
<div class="title">{payment_discount_lbl}</div>
<div class="content">
<div class="singleline">{payment_order_discount}</div>
</div>
</div>
<!-- {payment_discount end if}-->
<!-- Total: -->
<div class="checkout_line total_line">
<div class="title"><?php echo JText::_('COM_REDSHOP_TOTAL'); ?></div>
<div class="content">
<div class="singleline">{total}</div>
</div>
</div>
</div>
<div class="cls_total_bground"> </div>
<div class="rcart-checkout button-checkout">
<div class="btns">
<div class="btn-checkout">{checkout_button}</div>
<div class="btn-shopmore">{shop_more}</div>
</div>
</div>
</div>