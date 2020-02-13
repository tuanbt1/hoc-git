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
<div class="gs-order-list">
<div class="ordertitle">
<h4>Order List</h4>
</div>
<table class="table table-hover table-responsive orderlist" border="0" cellspacing="5" cellpadding="5">
<tbody>
<tr class="header"><th class="order_id orderid">{order_id_lbl}</th><th class="ordername">{product_name_lbl}</th><th class="orderdate">{order_date_lbl}</th><th class="ord-status">{order_status_lbl}</th><th class="orderdetail">{order_detail_lbl}</th></tr>
<!--  {product_loop_start} -->
<tr>
<td class="orderid">{order_id}</td>
<td>{order_products}</td>
<td>{order_date}</td>
<td class="ord-status">{order_status}</td>
<td class="ord-detail">{order_detail_link}{reorder_link}</td>
</tr>
<!--  {product_loop_end} --></tbody>
</table>
<p>{pagination}</p>
</div>