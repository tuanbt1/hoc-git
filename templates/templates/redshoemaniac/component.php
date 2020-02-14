<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
?>
<!DOCTYPE html>
<html>
	<head>
		<jdoc:include type="head" />
		<style>
			html{
				overflow: auto;
			}
			body, .contentpane{
				padding: 0;
				margin: 0;
			}
			.redshop #closewindow{
				width : 100%;
				display: block;
			}
			.redshop #closewindow input{
				display: none;
				color: #fff;
				font-size: 18px;
				font-family: "droidsansregular", Helvetica, Arial, sans-serif;
				background-color: #000;
				width: 110px;
				height: 40px;
				padding: 0;
				margin: 15px 0 0 0;
				font-weight: normal;
				border: none;
			}
			#frmchngAttribute{
				font-size: 24px;
				font-family: "droidsansregular", Helvetica, Arial, sans-serif;
			}
			#frmchngAttribute .attribute_wrapper select{
				padding: 0 0 0 5px;
				border: 1px solid #999;
			}
			#frmchngAttribute input{
				display: inline-block;
				color: #fff;
				font-size: 18px;
				font-family: "droidsansregular", Helvetica, Arial, sans-serif;
				background-color: #000;
				width: 110px;
				height: 40px;
				padding: 0;
				margin: 15px 0 0 0;
				font-weight: normal;
				border: none;
			}
			.product_print, .checkout-bar,
			.rcart-belowcart .rcart-customer-note-below,
			.rcart-belowcart .rcart-checkout .btns,
			.tab-content
			{
				display: none;
			}
			textarea#your_question{
				height: 100px;
			}
			.redshop form{
				text-align: left;
			}
			.table-askquestion label{display : none;}
			.table-askquestion .head{
				font-size: 14px;
				font-family: "droidsansregular", Helvetica, Arial, sans-serif;
				color: #000;
				font-weight: normal;
			}
			.table-askquestion input, .table-askquestion .inputbox{
				margin: 0;
				padding-left: 5px;
				margin-bottom: 5px;
			}
			.table-askquestion #security_code{
				width: 100px;
			}
			.table-askquestion .btn:active{
				box-shadow: none;
			}
			.table-askquestion .btn{
				padding: 10px 0 0 0;
			}
			.table-askquestion textarea{
				padding-left: 5px;
			}
			.table-askquestion img{
				padding-bottom: 10px;
			}
			.table-askquestion .btn input{
				color: #fff;
				font-size: 14px;
				font-family: "droidsansregular", Helvetica, Arial, sans-serif;
				background-color: #86547b;
				width: 110px;
				height: 40px;
				padding: 0;
				margin: 0;
				font-weight: normal;
				border: none;
			}
			.table-askquestion td.captcha tr td:first-child{
				display: none;
			}
			#redshopcomponent .rdcart .rcart-img .product_image img{width:70%!important;}
			#redshopcomponent .rdcart .rcart-opt{ padding: 23px 0px 0px!important;}
			#redshopcomponent .rdcart .rcart-opt-tit{ width:20%!important;}
			.quote{margin: 0 auto 0 -15px!important;}
			.wishlistlogin{
				position: absolute;
				top: 50%;
				left: 0;
				width: 100%;
				display: inline-block;
				transform: translateY(-50%);
				-o-transform: translateY(-50%);
				-moz-transform: translateY(-50%);
				-webkit-transform: translateY(-50%);
			}
		</style>
		<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/style.css" type="text/css" />
	</head>
	<body class="contentpane">
		<jdoc:include type="message" />
		<jdoc:include type="component" />
	</body>
</html>
