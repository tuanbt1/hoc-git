jQuery(document).ready(function ($) {
    $('#featured').find('.redslider2').each(function(index, el) {
        $('body .wrapper-main').addClass('homewrapper');
    });
    /* POSITION TOP MENU -mobile*/
    $('.moduletable_menu').each(function(index, val) {
        $(this).find('.menu_tree').before('<span class="show_menu_tree"></span>');
        $(this).find('.show_menu_tree').click(function(event) {
            $(this).toggleClass('active');
            $('.topbar').each(function(index, val) {
                $(this).toggleClass('active');
                $(this).find('#nav-menu-mobile').toggleClass('active');
                $(this).find('.menu.nav').each(function(index, val) {
                    $(this).find('.dropdown').append('<span class="touch-menu"></span>');
                    $(this).find('.dropdown-menu').hide();
                    $(this).find('.touch-menu').click(function(event) {
                        $(this).prev().toggle();
                    });
                });
            });
        });
    });
    /* POSITION TOP MENU -mobile*/
    /* add arrow BACKTO TOP*/
    $('#footer > .container >.row').append('<a class="arrow-backtop" href=""></a>');
    $('.arrow-backtop').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });
    $('#footer > .container >.row').append('<a class="arrow-backtoshopcart" href=""></a>');
    $('.arrow-backtoshopcart').hide();
    $(window).scroll(function(){
        if ($(this).scrollTop() > 10) {
            $('.arrow-backtoshopcart').fadeIn();
        } else {
            $('.arrow-backtoshopcart').fadeOut();
        }
    });
    $('.arrow-backtoshopcart').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });
    /* END add arrow BACKTO TOP*/
    $(".dropdown-menu").hover(function () {
        if (!$(this).hasClass("sub-menu")) {
            if (!$(this).parent().eq(0).hasClass("active")) {
                $(this).parent().eq(0).addClass("active rm")
            }
        }
    }, function () {
        if ($(this).parent().hasClass("rm")) {
            $(this).parent().eq(0).removeClass("active rm")
        }
    });
    $(".shopcart .mod_cart_top").click(function () {
        if ($(this).next().is(":hidden")) {
            $(this).addClass("active")
        }
        $(this).next().slideToggle(function () {
            if ($(this).is(":hidden")) {
                $(this).prev().removeClass("active")
            }
        })
    });
    $(".toolbar").find("div").find("h3").click(function () {
        $(this).next().slideToggle()
    });
    $(".menu_tree > li > .dropdown-menu > li").each(function (i, e) {
        if (i == 6) {
            $(e).addClass("abc")
        }
    });
    listnb = 6;
    $(".menu_tree > li > .dropdown-menu").each(function () {
        var newStructure = '<div class="dropdown-menu"><ul>';
        var l = $(this).find("> li").length;
        $(this).find("> li").each(function (key, value) {
            newStructure += "<li>" + $(this).html() + "</li>";
            if ((key + 1) % listnb === 0) {
                newStructure += "</ul>";
                if (key + 1 < l) {
                    newStructure += "<ul>"
                }
            }
        });
        newStructure += "</ul></div>";
        $(this).replaceWith(newStructure)
    });
    var tabs = '<ul class="nav nav-tabs">';
    $("#grid-tab").find(".moduletable").each(function (i, e) {
        $(this).attr("id", "tab" + i);
        $(this).addClass("tab-pane fade");
        $(this).parent().addClass("tab-content");
        $(this).find("h3").hide();
        var cl = "";
        if (i == 0) {
            $(this).addClass("in active");
            cl = "active"
        }
        tabs += '<li class="' + cl + '"><a href="#tab' + i + '" data-toggle="tab">' + $(this).find("h3").html() + "</a></li>"
    });
    tabs += "</ul>";
    $("#grid-tab").prepend(tabs);


    var tabs = '<ul class="nav nav-tabs">';
    $("#grid-tab2").find(".moduletable").each(function (i, e) {
        $(this).attr("id", "tab" + i);
        $(this).addClass("tab-pane fade");
        $(this).parent().addClass("tab-content");
        $(this).find("h3").hide();
        var cl = "";
        if (i == 0) {
            $(this).addClass("in active");
            cl = "active"
        }
        tabs += '<li class="' + cl + '"><a href="#tab' + i + '" data-toggle="tab">' + $(this).find("h3").html() + "</a></li>"
    });
    tabs += "</ul>";
    $("#grid-tab2").prepend(tabs);

    var tabs = '<ul class="nav nav-tabs">';
    $("#grid-tab3").find(".moduletable").each(function (i, e) {
        $(this).attr("id", "tab" + i);
        $(this).addClass("tab-pane fade");
        $(this).parent().addClass("tab-content");
        $(this).find("h3").hide();
        var cl = "";
        if (i == 0) {
            $(this).addClass("in active");
            cl = "active"
        }
        tabs += '<li class="' + cl + '"><a href="#tab' + i + '" data-toggle="tab">' + $(this).find("h3").html() + "</a></li>"
    });
    tabs += "</ul>";
    $("#grid-tab3").prepend(tabs);

    // $('.tab-content .nav-tabs .active').find('>a').each(function(index, val) {
    //     str=$(this).html();
    //     $(this).html(str.replace(' ','<br>'));
    // });
    $('div[id*="grid-tab"] .module').find('>h3').each(function(index, val) {
        str=$(this).html();
        $(this).html(str.replace());
    });
    $(this).find('.module.menucont').removeClass('col-md-2');
    $(".redshop_newsletter").keyup(function(){
        value = $(this).find(".redshop_newsletter_email").val();
        $(this).find(".redshop_newsletter_name").val(value);
    });

    $("#lastest-blog").find(".list-striped").each(function (i, e) {

        $(this).find("li").addClass("col-sm-4");
    });
    $('.sidebar2').find('h3').prepend('<i class="fa-bars"></i>');

    $('.update_cart').find('.inputbox').each(function(i,e){
        $(this).attr("placeholder","gift code");
        $(this).focus(function(event) {
            $(this).attr("placeholder","");
        });
        $(this).blur(function(event) {
            $(this).attr("placeholder","gift code");
        });
    });
    $('.redshop_newsletter').find('.redshop_newsletter_email').each(function(i,e) {
        $(this).attr("placeholder","your email");
        $(this).focus(function(event) {
            $(this).attr("placeholder","");
        });
        $(this).blur(function(event) {
            $(this).attr("placeholder","your email");
        });
    });

    /* hack placeholde for ie9 */
    $('.is_internet .redshop_newsletter').find('.redshop_newsletter_email').each(function(i,e) {
        $(this).attr("value","your email");
        $(this).focus(function(event) {
            $(this).attr("value","");
        });
        $(this).blur(function(event) {
            $(this).attr("value","your email");
        });
    });
    $('.is_internet #redform.redform-form').find('.-contname').each(function(i,e) {
        $(this).attr("value","Your name");
        $(this).focus(function(event) {
            $(this).attr("value","");
        });
        $(this).blur(function(event) {
            $(this).attr("value","Your name");
        });
    });
    $('.is_internet #redform.redform-form').find('.-contemail').each(function(i,e) {
        $(this).attr("value","Email");
        $(this).focus(function(event) {
            $(this).attr("value","");
        });
        $(this).blur(function(event) {
            $(this).attr("value","Email");
        });
    });
    $('.is_internet #redform.redform-form').find('.-contsubject').each(function(i,e) {
        $(this).attr("value","Subject");
        $(this).focus(function(event) {
            $(this).attr("value","");
        });
        $(this).blur(function(event) {
            $(this).attr("value","Subject");
        });
    });
    $('.is_internet #redform.redform-form').find('.-contmess').each(function(i,e) {
        $(this).append("Message");
        $(this).focus(function(event) {
            if($(this).text()=="Message"){
                $(this).empty();
            }
        });
        $(this).blur(function(event) {
            if($(this).text().length==0){
                $(this).append("Message");
            }
        });
    });
    /* END hack placeholde for ie9 */
    $('#redcatproducts').find('.category-price-board').each(function(i,e) {
        if ($(this).find('.cate-prod-oldprice').is(':empty')){
            $(this).find('.cate-prod-price').attr("class","cate-prod-price-main col-md-12");
            $(this).find('.cate-prod-oldprice').remove();
        }
    });
    $('#redshopcomponent').find('.category-price-board').each(function(i,e) {
        if ($(this).find('.cate-prod-oldprice').is(':empty')){
            $(this).find('.cate-prod-price').attr("class","cate-prod-price-main col-md-12");
            $(this).find('.cate-prod-oldprice').remove();
        }
    });
    $('#redcatproducts').find('.funcbar').find('.wish-btn').each(function(i,e) {
        $(this).find('label').hover(function(){
            $(this).css({"cursor": 'pointer'});
        });
        $(this).find('label').click(function(event){
            $(this).parent().find('input').trigger('click');
        });
    });
    $('#prod').find('.funcbar').find('.wish-btn').each(function(i,e) {
        $(this).find('label').hover(function(){
            $(this).css({"cursor": 'pointer'});
        });
        $(this).find('label').click(function(event){
            $(this).parent().find('input').trigger('click');
        });
    });
    $('.funcbar').find('.comp-btn').each(function(i,e) {
        $(this).find('label').hover(function(){
            $(this).css({"cursor": 'pointer'});
        });
        $(this).find('label').click(function(event){
            $(this).parent().find('input').trigger('click');
        });
        $(this).find('div').click(function(event) {
            $(this).find('input').trigger('click');
        });
    });
    $('#prod').find('.product_price_main').each(function(i,e) {
        if ($(this).find('.product_oldprice').is(':empty')){
            $(this).find('.product_price').attr("class","product_price-main col-md-12");
            $(this).find('.product_oldprice').remove();
        }
        $(this).find('.product_oldprice').each(function(index, val) {
            $('.product_image').addClass('sale-active');
        });
    });
    $('#prod .redshop_product_box .product_image').each(function(index, val) {
        $(this).append('<div class="btn-prod-zoom">zoom</div>');
        $(this).find('.btn-prod-zoom').click(function(event) {
            $(this).parent().find('img').trigger('click');
        });
    });
    $('.product_search').find('.inputbox').each(function(i,e) {
        $(this).attr("placeholder","Enter your keywords");
        $(this).focus(function(event) {
            $(this).attr("placeholder","");
            $(this).css({display: 'block'});
        });
        $(this).blur(function(event) {
            $(this).css({display: ''});
            $(this).attr("placeholder","Enter your keywords");
        });
        $(this).keypress(function(e) {
            if(e.which == 13) {
                $('[name="redSHOPSEARCH"]').submit();
            }
        });
    });
    $('.product_search').find('[name="Search"]').click(function(event) {
        event.preventDefault();
        return false;
    });
    $('.compa-noprod').find('td').each(function (i, e) {
        i++;
        $(this).prepend('<span class="numarr">'+i+'</span>');
        $(this).find('a').attr('style','display:none');
    });
    $('.faq-tab').each(function(i, e) {
        $(this).find("h3").each(function(i, v){
            $(this).siblings('p').eq(i+1).hide();
            $(this).click(function(event) {
                if($(this).attr('class')=='active'){
                    $(this).removeClass('active');
                }else {
                    $(this).addClass('active');
                };
                var allP = $(this).siblings("p");
                $(allP).eq(i).toggle('400');
                var id=i;
            });
        });
    });
    $('.product-cart-link').each(function(index, val) {
        var temp=$(this).find('.stockaddtocart');
        if ($(temp).css('display')!='none') {
            $(temp).parent().parent().find('.cart-quantity').css({
                display: 'none'
            });
            $(this).addClass('cls_outstock');
        };
    });
    $('.mod_redshop_products_wrapper .mod_redshop_products_addtocart .addtocart_formclass').find('.cart-link').each(function(index, val) {
	var temp=$(this).find('.stock_addtocart');
	if ($(temp).css('display')!='none') {
            $(temp).parent().parent().parent().parent().parent().find('.mod_redshop_products_image').addClass('imgoutstock');
        };
    });
    $('.btn-quotemode').find('.cart-link').each(function(index, val) {
        var temp=$(this).find('span');
	$(temp).html('GET FREE QUOTE');
	$(temp).parent().parent().find('.cart-quantity').css({display: 'none'});
    });
    $('.customernote').find('textarea').each(function(i,e){
        $(this).attr("placeholder","write your note here...");
        $(this).focus(function(event) {
            $(this).attr("placeholder","");
        });
        $(this).blur(function(event) {
            $(this).attr("placeholder","write your note here...");
        });
    });
    $('.reset').find('.validate-username').each(function(i,e){
        $(this).attr("placeholder","email@email.com");
        $(this).focus(function(event) {
            $(this).attr("placeholder","");
        });
        $(this).blur(function(event) {
            $(this).attr("placeholder","email@email.com");
        });
    });
    $('.cart-link').find('span').each(function(i,e){
       if($(this).text()=='Get Free Quote'){
            $(this).addClass('getquote');
		$('#redcatproducts .category_box_inside .funcbar .wish-btn >div').addClass('getquote_wl');
       }
    });
    $('.prod-getquote .workdetail').find('textarea').each(function(i,e){
        $(this).attr("placeholder","describe the job");
        $(this).focus(function(event) {
            $(this).attr("placeholder","");
        });
        $(this).blur(function(event) {
            $(this).attr("placeholder","describe the job");
        });
    });
    $('.prod-getquote .lotarea').find('input').each(function(i,e){
        $(this).attr("placeholder","# m²");
	if($(this).val()==''){$(this).css('text-align','right');}
        $(this).focus(function(event) {
            $(this).attr("placeholder","");
	    $(this).css('text-align','left');
        });
        $(this).blur(function(event) {
            $(this).attr("placeholder","# m²");
		if($(this).val()==''){$(this).css('text-align','right');}
        });
    });
    $('#').find('a').each(function(i,e){
	$(this).addClass('getquote');
    });
    $('.accbillto').find('.adminform').each(function(i,e){
	$(this).find('.per_info').each(function(i,e){
		$(this).addClass('col-md-6');
		$(this).find('#tblprivate_customer').before('<label>Personal Information</label>');
	});
	$(this).find('.acc_info').addClass('col-md-6');
    });
    /* radio button*/
    $('#redshopcomponent').find('input[type=radio]').each(function(i,e){
       $(this).hide().after('<div class="iconradiobox"></div>');
    });
    $('#redshopcomponent').find('.iconradiobox').click(function(i,e){
        $(this).prev().trigger( "click" );
    });
    jQuery('#redshopcomponent [type="radio"]').change(function(){

        jQuery('#redshopcomponent [type="radio"]').each(function(){
            if( jQuery(this).is(':checked')){
                jQuery(this).next().addClass('radio-checked');
            }else{
                jQuery(this).next().removeClass('radio-checked');
            }
        });
    });
    $('#redshopcomponent').find('.iconradiobox').each(function(i,e){
        if($(this).prev().is(':checked')){
            $(this).addClass('radio-checked');
        }
    });
    /* END radio button*/

    /* CHECKBOX BUTTON*/
    $('#redshopcomponent').find('input[type=checkbox]').each(function(i,e){
        $(this).hide().after('<div class="iconcheckbox"></div>');
        $(this).change(function(event) {
            if($(this).is(':checked')){
                $(this).next().addClass('check-checked');
            }else{
                $(this).next().removeClass('check-checked');
            }
        });
        if($(this).is(':checked')){
            $(this).next().addClass('check-checked');
        }else{
            $(this).next().removeClass('check-checked');
        }
    });
    $('#redshopcomponent').find('.iconcheckbox').click(function(i,e){
        if ($(this).prev().attr('id')=='termscondition') {
            $(this).prev().each(function(index, val) {
                return false;
            });
            $(this).prev().trigger('click').trigger('click');
        }else{
            $(this).prev().each(function(index, val) {
                return false;
            });
            $(this).prev().trigger('click');
        }
    });
    /* END CHECKBOX BUTTON*/
    $('.limitarrow .pagination-links').find('span').click(function(i,e){
	if( href=$(this).children('a').attr('href')){
		window.location.href= href;
	}
    });
    $('.prod-func .prod-getquote .upload .userfield_input').find('input').attr('value','Upload File');
    $('.module .pos2 .navbar-nav').find('li').each(function(i,e){
	var pgurl = window.location.href.substr(window.location.href.lastIndexOf("/")+1);
	pgurl= '/'+pgurl;
	$(this).find('a').each(function(){
        var menuaddress = '/'+$(this).attr('href').substr($(this).attr('href').lastIndexOf("/")+1);
		  if(menuaddress == pgurl){
		  	$(this).addClass('active');
			$(this).parent().parent().show('400').removeClass('collapsed').addClass('in');
			$(this).parent().parent().parent().addClass('active');
		   }
        });
	$(this).find('>a').click(function(){
		window.location = $(this).attr('href');
		return false;
	});
	$(this).click(function(i,e){
		if($(this).hasClass('active')){
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').hide('400');
		}else {
			$(this).addClass('active');
			$(this).find('.dropdown-menu').show('400');
		}
	});
    });

    $(".container-acc .tabs li").click(function() {
        $(".container-acc .tabs li").removeClass('active');
        $(this).addClass("active");
        $(".container-acc .tab-contents").hide().removeClass('active');
        var selected_tab = $(this).find("a").attr("href");
        $(selected_tab).fadeIn().addClass("active");
        return false;
    });
    $("#phone").keydown(function (e) {
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            (e.keyCode == 65 && e.ctrlKey === true) ||
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 return;
        }
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
	$('.redslider2').parent().addClass('mobislider');
    /*-------------- mobitab ----------*/
	$('#sidebar1 .module').each(function(){
		$(this).prepend('<ul class="mobitab"></ul>');
        var temppos= $(this);
        var widthscreen=979;
        $( document ).ready(function() {
            if ($(window).width()<= widthscreen) {
                temppos.find('>div.moduletable').hide();
            };
        });
		var idtemp;
		$idtemp = 1;
		$(this).find('>div').each(function(){
			$(this).attr('id','data'+$idtemp);
            $name_menu='menu'+$idtemp;
            if($(this).hasClass('catemenu')){
                $name_menu='Categories';
            }
            if($(this).hasClass('mod-pro-finder')){
                $name_menu='Product Filter';
            }
            if($(this).find('>h3').html()) {$name_menu=$(this).find('>h3').html();}
			$(this).parent().find('.mobitab').append('<li class="mobibutton" title="data'+ $idtemp +'">'+ $name_menu +'</li>');
			$idtemp=$idtemp+1;
		});
		$(this).find('.mobibutton').click(function(){
			$(this).parent().parent().find('>div').hide('400');
			$(this).parent().find('.active').removeClass('active');
			$(this).addClass('active');
			$(this).parent().parent().find('#'+$(this).attr('title')).toggle();
		});
	});
    /*-------------- END mobitab ----------*/
	$("#member-registration").each(function(){
        var temp= $(this);
		$(this).find('#jform_email2-lbl').hide();
		$(this).find('#jform_email2').hide();
		$(this).find('#jform_email1').keyup(function(){
			$val=$(this).val();
			temp.find('#jform_email2').val($val);
		});
	});
	$('.redcarp .flex-direction-nav').addClass('container');
    $('#menu').find('.dropdown').each(function(index, val) {
        $(this).append('<span class="fun-caret"></span>');
        $(this).find('.dropdown-menu').each(function(index, val) {
            $(this).find('.sub-menu').after('<span class="fun-caret"></span>')
        });
        $(this).find('.fun-caret').click(function(event) {
            $(this).parent().find('>.dropdown-menu').toggle();
        });
    });
    $('.popbar').each(function(index, val) {
        $(this).find('.inside-popbar').after('<div class="touch"></div>');
        $(this).find('.touch').click(function(event) {
            if($(this).parent().find('.inside-popbar').css('display')=='none'){
                $(this).parent().find('.inside-popbar').addClass('active');
            }
            else{
                $(this).parent().find('.inside-popbar').removeClass('active');
            }
        });
    });
    $('.rdcart').find('.rcart-remove').find('>form').each(function(index, val) {
        $img_onclick= $(this).find('>img').attr('onclick');
        $(this).append('<div class="delete_s"></div>');
        $(this).find('.delete_s').attr('onclick',$img_onclick);
    });
    /* slider transition*/
    $('#featured .mobislider').append('<div class="coversl-bottom-right"></div>').prepend('<div class="coversl-top-right"></div>');
    $('#featured .mobislider').append('<div class="coversl-bottom-left"></div>').prepend('<div class="coversl-top-left"></div>');
    /* END slider transition*/
    /* PLACE HOLDER FORM CONTACT*/
    $('.contactform').each(function(index, val) {
        $(this).find('.-contname').each(function(index, val) {
            $(this).attr({placeholder: 'Your name'});
            $(this).blur(function(event) {$(this).attr({placeholder: 'Your name'});});
            $(this).focus(function(event) {$(this).attr({placeholder: ''});});
        });
        $(this).find('.-contemail').each(function(index, val) {
            $(this).attr({placeholder: 'Email'});
            $(this).blur(function(event) {$(this).attr({placeholder: 'Email'});});
            $(this).focus(function(event) {$(this).attr({placeholder: ''});});
        });
        $(this).find('.-contsubject').each(function(index, val) {
            $(this).attr({placeholder: 'Subject'});
            $(this).blur(function(event) {$(this).attr({placeholder: 'Subject'});});
            $(this).focus(function(event) {$(this).attr({placeholder: ''});});
        });
        $(this).find('.-contmess').each(function(index, val) {
            $(this).attr({placeholder: 'Message'});
            $(this).blur(function(event) {$(this).attr({placeholder: 'Message'});});
            $(this).focus(function(event) {$(this).attr({placeholder: ''});});
        });
    });
    /* END PLACE HOLDER FORM CONTACT*/
    /* seach SALE TAG*/
        $('.category_box_inside').find('.sale-tag').each(function(index, val) {
            $(this).next('.funcbar').find('.price-btn').addClass('price-discount');
        });
        $("#productlist .search-result").find(">h3").each(function(index, val) {
            $(this).addClass("noresult-title");
            $(this).parent().prev(".title-keyword").hide();
            $(this).after("<a class=\"homebtn\" href=\"homelink\">\< Home</a>");
        });
    /* END seach SALE TAG*/
    /* cates list*/
    $('.category_box_ls').find('.category_box_ls_inside').hover(function() {
        $(this).addClass('cateshover');
        $(this).find('.category_box_ls_title').each(function(index, val) {
            cateheight= $(this).parent().height();
            cateheight= cateheight/2.2;
            $(this).animate({
                bottom: cateheight
            },"fast");
        });
    }, function() {
        if($(this).hasClass('banner')){
            $(this).find('.category_box_ls_title').fadeOut('slow', function() {
                $(this).css({bottom: '10px'});
                $(this).fadeIn('400');
                $(this).parent().removeClass('cateshover');
            });
        }
        else{
            $(this).removeClass('cateshover');
            $(this).find('.category_box_ls_title').fadeOut('slow', function() {
                $(this).css({bottom: '10px'});
                $(this).fadeIn('400');
            });
        }
    });
    $('.category_box_ls').find('.category_box_ls_inside').each(function(index, val) {
        if($(this).find('.category_box_ls_sdesc').html()!=''){
            $(this).find('.category_box_ls_title').find('a').each(function(index, val) {
                $(this).parent().parent().parent().addClass('banner');
            });
        }
        $(this).find('.category_box_ls_title').each(function(index, val) {
            var temp_widthpos = $(this).width();
            var temp_content  = $(this).find('a');
            var content_width = temp_content.width();
            while(content_width>temp_widthpos){
            	temp_content.css('font-size',parseInt(temp_content.css('font-size'))-1 + "px");
            	temp_widthpos = $(this).width();
            	temp_content  = $(this).find('a');
            	content_width = temp_content.width();
            	$(this).find('>h3').css('width', ' 100%');
            }
        });
    });
    /* END cates list*/
    $('.category_pagination').each(function(index, val) {
        $(this).append('<ul class="page_touch"></ul>');
        page_touch = $(this).find('.page_touch');
        $(this).find('.pagination-next').prependTo(page_touch);
        $(this).find('.pagination-prev').prependTo(page_touch);
    });
    /* custom select at productdetail page*/
    $('.product_attribute select').select2OptionPicker();
    $('.attribute_property .select-buttons').find('li:first-child').each(function(index, val) {
        if($(this).find('>a').html().toUpperCase()=='SELECT COLOR'){//this name must be same with innerhtml element
            $(this).parent().addClass('box-color');
            $(this).addClass('box-color-title');
            $(this).find('>a').html('color:');
        }
        if($(this).find('>a').html().toUpperCase()=='SELECT SIZE'){//this name must be same with innerhtml element
            $(this).parent().addClass('box-size');
            $(this).addClass('box-size-title');
            $(this).find('>a').html('size:');
            $(this).parent().parent().parent().after('<div class="size-guide"><a href="#">Size guide</a></div>');
        }
    });
    $('.attribute_property .select-buttons li').find('>a').each(function(index, val) {
        temp_classname=$(this).html();
        $(this).addClass(temp_classname);
    });

    $('#prod .toggle_box').each(function(index, val) {
        $(this).find('>div').hide();
        $(this).find('.product_s_desc_box').show();
        $('#prod .touch-bar').click(function(event) {
            $(this).toggleClass('active');
            $('.toggle_box').find('.product_s_desc_box').toggle('slow');
            $('.toggle_box').find('.product_full_desc_box').toggle('slow');
        });

    });
    /* END custom select at productdetail page*/
    /* custom select2*/
    $('.accbillto select').select2({
        width: 'element',
        dropdownCssClass: 'main'
    });
    $('.billingform select').select2({
        width: 'element',
        dropdownCssClass: 'main'
    });
    /* END custom select2*/
    /* replace review star*/
    $("#reviews_wrapper #reviews_stars").find("img").each(function(){
        var src = $(this).attr("src");
        var a = src.replace("administrator/components/com_redshop/assets/images/star_rating", "templates/redshoemaniac/images/star_rating");
        $(this).attr("src", a);
    });
        /* replace triger clickstar on reiview*/
        $(".table-reviewbox").find('.iconradiobox').click(function(event) {
            $(this).prevAll('.iconradiobox').addClass('radio-checked');
        });
        /* END replace triger clickstar on reiview*/
    /* END replace review star*/

    /* compare hidden bar*/
    $('div[id*="comp_"]').click(function(){
        $('.compare_product_div').show();
        var total = $('#totalCompareProduct').html();
    });

    $('.compare_product_close').click(function(){
        $('.compare_product_div').hide();
    });
    /* END compare hidden bar*/
    /* btn-compare product comparison page*/
    $('.compa-table .compaaddcart').each(function(index, val) {
        $(this).find('div[name*="exp_"]').each(function(index, val) {
            var_clasname=$(this).attr('name');
            $(this).after('<div id="clc_to_remove" class="'+var_clasname+'">removebtn</div>');
        });
        $(this).find('div[class*="exp_"]').click(function(event) {
            var_cls_name= $(this).attr('class');
            $('.compa-table .remove_btn').find('div[name="'+var_cls_name+'"]').find('>a').each(function(index, val) {
                window.location.href= $(this).attr('href');
            });
        });
    });
    /* END btn-compare product comparison page*/

    /* module related - recommentdation products*/
    $('.recommend_prod .category_box_wrapper').each(function(index, val) {
        var num_prod= 3;
        var append_place= $(this);
        var var_hei= $(this).find('.slide:nth-child(1)').height();
        $(this).css('max-height',var_hei*num_prod);
        $(this).parent('.recommend_prod').append("<button class='nex-btn'>next</button>");
        $(this).parent('.recommend_prod').append("<button class='prev-btn'>previous</button>");
        function scroll_up() {
            if(append_place.hasClass('active')){
                return  false;
            }
            else{
                append_place.addClass('active');
                var slide_header= $(this).parent().find('.slide:nth-child(1)');
                append_place.find('.slide').css({top: '0'}).animate({
                    top: -var_hei
                },1000,function(){
                    $(this).css({top: '0'});
                    append_place.append(slide_header);
                    append_place.removeClass('active');
                });
            }
        }
        function scroll_down() {
            if(append_place.hasClass('active')){
                return  false;
            }
            else{
                append_place.addClass('active');
                var slide_header= $(this).parent().find('.slide:nth-last-child(1)');
                append_place.prepend(slide_header);
                append_place.find('.slide').css({top: -var_hei});
                append_place.find('.slide').animate({
                    top: '0'
                },1000,function(){
                    $(this).css({top: '0'});
                    append_place.removeClass('active');
                });
            }
        }
        $(this).parent('.recommend_prod').find('button.nex-btn').bind('click', scroll_up);
        $(this).parent('.recommend_prod').find('button.prev-btn').on( 'click', scroll_down);
    });
    /* END module related - recommentdation products*/
    /* js addclass supporting design */
    $('.registrationbox .registration #member-registration .fieldrow').each(function(index, val) {
        var temp_thispos=$(this);
        $(this).find('#jform_password2').each(function(index, val) {
            temp_thispos.addClass('com_user_confir_pass');
        });
        $(this).find('#jform_password1').each(function(index, val) {
            temp_thispos.addClass('com_user_pass');
        });
    });
    /* END js addclass supporting design */
    /* fix itemid of module compare */
    $('.compare_product_div_inner >form').each(function(index, val) {
        var url_action=$(this).attr('action');
        url_action= url_action.replace(/&Itemid=[0-9]+/g, "&Itemid=206");
        $(this).attr('action',url_action);
    });
    /* END fix itemid of module compare */

    $('#system-message-container .alert .close').click(function(event) {
        console.log('click'); // fixed icons close doesn't work on mobile safari
    });
    $('.rcart-opt').find('.checkout_subattribute_title').each(function(index, el) {
        var t_trim = $(this).html().trim();
        if (t_trim==':') {
            $(this).html('');
        };
    });
    /* hide #featured position in view product page*/
    $('#prod').each(function(index, el) {
        $('#featured').hide();
    });
    /* END hide #featured position in view product page*/
});
