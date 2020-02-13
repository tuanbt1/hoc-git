<div class="userprofile">
<h3>{username}'s Profile</h3>
</div>
<div class="account-tab">
<ul class="tabs nav nav-tabs">
<li class="tab-link" data-tab="tab-1"><a href="?option=com_redshop&amp;view=account&amp;Itemid=174">CONTACT INFO</a></li>
<li class="tab-link" data-tab="tab-2"><a href="?option=com_redshop&amp;view=account_shipto&amp;Itemid=174">SHIPPING INFO</a></li>
<li class="tab-link active" data-tab="tab-3"><a href="?option=com_redshop&amp;view=orders&amp;Itemid=174">MY ORDERS</a></li>
</ul>
</div>
<div class="table_billing">
<div class="billing"><!-- ORDER INFO -->
<div class="orderinfo">
<h4>ID:{order_number}</h4>
<div class="order_print">{print}</div>
</div>
<!-- END ORDER INFO --></div>
<div class="billing orderdetail">
<div class="billadd">
<div class="adminform"><fieldset><legend><strong>{billing_address_information_lbl}</strong></legend>
<div class="billrow">{billing_address}</div>
</fieldset></div>
</div>
<div class="shipadd">
<div class="adminform"><fieldset><legend><strong>{shipping_address_information_lbl}</strong></legend>
<div class="billrow">{shipping_address}</div>
</fieldset></div>
</div>
</div>
<div class="method">
<div class="paymenthod">
<div class="adminform"><fieldset><legend><strong>{payment_lbl}</strong></legend>
<div>{payment_method}: <strong>{payment_status}</strong></div>
</fieldset></div>
</div>
<div class="shipmethod">
<div class="adminform"><fieldset><legend><strong>{customer_note_lbl}</strong></legend>
<div>{customer_note}</div>
</fieldset></div>
<div style="display: none;">{shipping_method_lbl}{shipping_method}</div>
</div>
</div>
</div>
<table class="tdborder rdcart" style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
<thead>
<tr>
<th> </th>
<th> </th>
<th> </th>
<th class="rcart-opt-tit"> </th>
<th class="rcart-price-tit"> </th>
<th> </th>
<th> </th>
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
<div class="cartpro-desc">{product_s_desc}</div>
</td>
<td class="rcart-opt">
<div class="tx-att">{product_attribute}</div>
</td>
<td class="rcart-price">{product_price_excl_vat}</td>
<td class="rcart-qty">
<div class="rcart_update">{product_quantity}</div>
</td>
<td class="rcart-remove" align="right"> </td>
</tr>
<!--{product_loop_end}--></tbody>
</table>
<!-- CART below-->
<p> </p>
<!-- Subtotal before delivery charges: -->
<div class="rcart-belowcart">
<div class="rcart-checkout">
<div class="checkout_line">
<div class="title">{product_subtotal_excl_vat_lbl}:</div>
<div class="content">
<div class="singleline">{product_subtotal_excl_vat}</div>
</div>
</div>
<!-- {if discount}-->
<div class="checkout_line">
<div class="title">{discount_lbl}:</div>
<div class="content">
<div class="singleline">{discount}</div>
</div>
</div>
<!-- {discount end if} --> <!-- Shipping rate: -->
<div class="checkout_line">
<div class="title">{shipping_with_vat_lbl}:</div>
<div class="content">
<div class="singleline">{shipping_excl_vat}</div>
</div>
</div>
<!-- {if vat} --> <!-- Tax: -->
<div class="checkout_line">
<div class="title"> </div>
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
<!-- {payment_discount end if}--> <!-- Total: -->
<div class="checkout_line total_line">
<div class="title">{total_lbl}:</div>
<div class="content">
<div class="singleline">{order_total}</div>
</div>
</div>
</div>
<div class="cls_total_bground"> </div>
<div class="rcart-checkout button-checkout">
<div class="btns row">
<div class="btnback absback"><a class="btn-back" href="?option=com_redshop&amp;view=orders&amp;Itemid=174"><?php echo JText::_('COM_REDSHOP_BACK_LBL'); ?></a></div>
<div class="btn-shopmore absshopmore2"> </div>
</div>
</div>
</div>