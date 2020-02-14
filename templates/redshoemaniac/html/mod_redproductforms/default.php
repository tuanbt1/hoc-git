<?php
/**
 * @copyright Copyright (C) 2008-2009 redCOMPONENT.com. All rights reserved.
 * @license can be read in this package of software in the file license.txt or
 * read on http://redcomponent.com/license.txt
 * Developed by email@recomponent.com - redCOMPONENT.com
 */

defined('_JEXEC') or die('Restricted access');
$input = JFactory::getApplication()->input;
$redform = $input->post->get('redform', array(), "filter");
//$range['min'] = $range['min'] - 10;
//$range['max'] = $range['max'] + 10;

if ($redform)
{
	$pk = $redform;
}
else
{
	$json = $input->post->get('jsondata', "", "filter");
	$pk = json_decode($json, true);
}

$catid = $pk['cid'];
$manufacturerid = $pk['manufacturer_id'];
$filter = $pk['filterprice'];
$properties = $pk['properties'];
$min = $filter['min'];
$max = $filter['max'];

if (isset($pk)) foreach ( $pk as $k => $value )
{
	if (!isset($value["tags"]))
	{
		continue;
	}

	foreach ( $value["tags"] as $k_t => $tag )
	{
		$keyTags[] = $tag;
	}
}
?>
<div class="<?php echo $module_class_sfx; ?>">
	<div class='cls-refine'>
		<div class='clean-btn clean-all'><?php echo JText::_('COM_PRODUCTFINDER_CLEAR_ALL_BTN');?></div>
		<label><?php echo JText::_('COM_PRODUCTFINDER_REFINE_LBL');?></label>
	</div>
	<div class="slide-wrapper">
		<div class="clean-btn clean-range"><?php echo JText::_('COM_PRODUCTFINDER_CLEAR_BTN');?></div>
		<label><?php echo JText::_('COM_PRODUCTFINDER_PRICE_LBL');?></label>
		<div class='slider-desc'><?php echo JText::_('COM_PRODUCTFINDER_PRICE_DESC');?></div>
		<div id="slider-range"></div>
	</div>
	<form action="<?php echo JRoute::_("index.php?option=com_redproductfinder"); ?>" method="post" name="adminForm" id="redproductfinder-form" class="form-validate">
	<div class="form-horizontal">
		<div class="row-fluid">
			<div class="span9">
			<?php if ($searchBy == 0) { ?>
				<div class="row-fluid form-horizontal-desktop search_by_typetag">
					<?php foreach($lists as $k => $type) :?>
						<div id='typename-<?php echo $type["typeid"];?>'>
							<label><?php echo $type["typename"];?></label>
							<ul class='taglist'>
								<?php foreach ($type["tags"] as $k_t => $tag) :?>
									<li>
										<span class='taginput' data-aliases='<?php echo $tag["aliases"];?>'>
										<input <?php foreach ($keyTags as $key => $keyTag) {
											if ($keyTag == $tag["tagid"]) echo 'checked="checked"'; else echo ''; } ?>
										 type="checkbox" name="redform[<?php echo $type["typeid"]?>][tags][]" value="<?php echo $tag["tagid"]; ?>"></span>
										<span class='tagname'><?php echo $tag["tagname"]; ?></span>
									</li>
								<?php endforeach; ?>
							</ul>
						</div>
						<input type="hidden" name="redform[<?php echo $type["typeid"]?>][typeid]" value="<?php echo $type["typeid"]; ?>">
					<?php endforeach;?>
				</div>
			<?php } else { ?>
				<div class="row-fluid form-horizontal-desktop search_by_attr">
					<?php foreach($attributes as $k_a => $attribute) :?>
						<div id='typename-<?php echo $attribute->attribute_id;?>'>
							<label><?php echo $attribute->attribute_name;?></label>
							<ul class='taglist'>
								<?php foreach($attributeProperties as $k_p => $property) :?>
									<?php
									$attname = $model->getAttributeName($property->attribute_id);
									if ($attname[0] == $attribute->attribute_name) { ?>
										<li>
											<span class='taginput' data-aliases='<?php echo $attribute->attribute_name;?>'>
											<input type="checkbox" <?php if (isset($properties)) foreach ($properties as $ppt) {
											if ($ppt == $property->property_name) echo 'checked="checked"'; else echo ''; } ?>
											 name="redform[properties][]" value="<?php echo $property->property_name; ?>"></span>
											<span class='tagname'><?php echo $property->property_name; ?></span>

											<ul class='taglist'>
											<?php foreach($attributeSubProperties as $k_sp => $subproperty) :?>
												<?php
													$proname = $model->getPropertyName($subproperty->subattribute_id);
													if ($proname[0] == $property->property_name) { ?>
												<li>
													<span class='taginput'>
													<input type="checkbox" name="redform[properties][]" value="<?php echo $subproperty->subattribute_color_name; ?>"></span>
													<span class='tagname'><?php echo $subproperty->subattribute_color_name; ?></span>

												</li>
												<?php } ?>
											<?php endforeach;?>
											</ul>
										</li>
									<?php } ?>
								<?php endforeach;?>
							</ul>
						</div>
					<?php endforeach;?>
				</div>
			<?php } ?>
			</div>
		</div>
		<div  class="row-fluid" style="display: none;">
			Min: <input type="text" name="redform[filterprice][min]" value="<?php echo $range['min'];?>"/>
			Max: <input type="text" name="redform[filterprice][max]" value="<?php echo $range['max'];?>"/>
		</div>
	</div>
	<input type="submit" style="display: none;" name="submit" value="submit" />
	<input type="hidden" name="task" value="findproducts.find" />
	<input type="hidden" name="formid" value="<?php echo $formid; ?>" />
	<input type="hidden" name="view" value="<?php echo $view; ?>" />
	<input type="hidden" name="redform[template_id]" value="<?php echo $template_id;?>" />
	<input type="hidden" name="redform[cid]" value="<?php if ($cid) echo $cid; else echo $catid;?>" />
	<input type="hidden" name="redform[manufacturer_id]" value="<?php if ($manufacturer_id) echo $manufacturer_id; else echo $manufacturerid;?>" />
	<input type="hidden" name="limitstart" value="0" />
	<input type="hidden" name="Itemid" value="<?php echo $Itemid; ?>" >
	<input type="hidden" name="order_by" value=""/>
</form>
</div>

<style type="text/css">
	.slide-wrapper >div:not(#slider-range)
	{
		height: auto!important;
		overflow: visible!important;
		margin: 0px!important;
	}

	#slider-range
	{
		margin: 17px auto 9px auto!important;
		overflow: visible!important;
	}
</style>
<?php
	$range_min = round($range['min']);
	$range_max = round($range['max']);
	$min_slide = (($range_max-$range_min)/10) + $range_min;
	$max_slide = $range_max-(($range_max-$range_min)/10);
?>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		var select_tab = function(tabs){
			var tabcontent = tabs.find('.tabheader-bar');
			if ( tabcontent.length > 0 ) {
				tabs.append('<div id="tab-wrapper"></div>');
				tab_wrapper = tabs.find('#tab-wrapper');
				tabs.find('.tabheader-bar').appendTo(tab_wrapper);
				tabs.find('.tabs-panel').appendTo(tab_wrapper);
				tab_wrapper.find('.tabheader-bar').find('li:first-of-type').addClass('active');
				tab_wrapper.find('.tabs-panel:first-of-type').addClass('active');
			};
		}

		$('#slider-range').slider({
			range: true,
            step: 100,
			min: <?php echo $range_min;?>,
			max: <?php echo $range_max;?>,
			values: [ <?php echo $min_slide;?>, <?php echo $max_slide;?> ],
			slide: function(event, ui){
				$("[name='redform[filterprice][min]']").val(ui.values[ 0 ]);
				$("[name='redform[filterprice][max]']").val(ui.values[ 1 ]);

				$(this).find('.min_tab').html('$' + ui.values[ 0 ]);
				$(this).find('.max_tab').html('$' + ui.values[ 1 ]);
			},
			change: function(event, ui){
				//submit form when sliding range
				$("#redproductfinder-form").submit();
			},
			create: function(event, ui){
				$(this).find('span:first-of-type').append('<i class="min_tab"></i>');
				$(this).find('span:first-of-type').next().append('<i class="max_tab"></i>');
				$(this).find('.min_tab').html('$' + $('#slider-range').slider( "values", 0 ));
				$(this).find('.max_tab').html('$' + $('#slider-range').slider( "values", 1 ));
			}
		});
		$("[name='redform[filterprice][min]']").val($('#slider-range').slider( "values", 0 ));
		$("[name='redform[filterprice][max]']").val($('#slider-range').slider( "values", 1 ));

		/* moblie slider able */
		if ($(window).width()<1024 && $(window).width()>768){
			$('#slider-range').slider( "values", 0 ).draggable();
			$('#slider-range').slider( "values", 1 ).draggable();
		}
		/* END moblie slider able */

		<?php if ($searchBy == 0) {?>
		$('#redproductfinder-form').each(function(index, el) {
			var finder_form = $(this);
			var parent_suffix = '-parent';
			var parent_tagname = [];
			$(this).find('[id*="typename-"]').each(function(index, el) {
				cur_typename = $(this);
				$(this).find('.taginput').each(function(index, el) {
					if ($(this).is('[data-aliases*="'+parent_suffix+'"]')) {
						parent_tagname.push($(this).attr('data-aliases'));
					};
				});
				$(this).find('>.taglist').each(function(index, el) {
					if (parent_tagname.length>0) {
						//create tabheader
						$(this).before('<ul class="tabheader-bar"></ul>');

						while(parent_tagname.length > 0){
							root_tagname = parent_tagname.pop();
							child_tagname = root_tagname.replace(parent_suffix, "");

							//create selecttab
							$(this).after('<div id="tab-'+root_tagname+'"><ul></ul></div>');

							// append elemt to created selecttab
							$(this).find('[data-aliases="'+child_tagname+'"]').each(function(index, el) {
								var temp_pos = $('div#tab-'+root_tagname).find('>ul');
								$(this).parent('li').appendTo(temp_pos);
							});

							$(this).find('[data-aliases="'+root_tagname+'"]').each(function(index, el) {
								$(this).parent('li').appendTo(cur_typename.find('ul.tabheader-bar'));
							});
						}
						//remove this empty ul
						$(this).remove();
					};
				});
				//change this list into filter filed
				$(this).find('.tabheader-bar').each(function(index, el) {
					$(this).find('>li').each(function(index, el) {
						li_aliases = $(this).find('.taginput').attr('data-aliases');
						li_title = $(this).find('.tagname').html();
						li_content = "<a href='#tab-"+li_aliases+"'>"+li_title+"</a>";
						$(this).html(li_content);
					});
				});
				//add html to tab by jquery UI
				$(this).tabs();
			});
		});
		<?php } else { ?>
			$('#redproductfinder-form').each(function(index, el) {
				$(this).find('[id*="typename-"]').each(function(index, el) {
					tab_num = 0;
					tab_header = $(this);
					$(this).find('>.taglist').each(function(index, el) {
						tag_header = $(this);
						tag_header_data = $(this).find('>li').find('>.taginput').attr('data-aliases');
						if( $(this).html().trim().length != 0 ){
							if ( $(this).find('.taglist').html().trim().length != 0) {
								$(this).addClass('tabheader-bar');
								$(this).find('>li').each(function(index, el) {
									tab_num++;
									tab_or_name = tag_header_data+'_'+tab_num;
									tab_link = '#'+tab_or_name;
									$(this).find('>.taglist').each(function(index, el) {
										$(this).appendTo(tab_header).wrapAll('<div id="'+tab_or_name+'" class="tabs-panel"></div>');
									});
									$(this).find('.taginput').hide();
									$(this).wrapInner('<a href="'+tab_link+'"></a>');
								});
							}else{
								$(this).find('>li').each(function(index, el) {
									$(this).find('>.taglist').each(function(index, el) {
										if ($(this).html().trim().length == 0) {
											$(this).remove();
										};
									});
								});
							}
						}
					});
					select_tab($(this));
				});
			});
		<?php }// END elseif ?>
		var ajaxpos = $('#redshopcomponent');
		$('html, body').append('<div id="coverwrapper"><div class="spinner"><div class="spinner-container container1"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div><div class="spinner-container container2"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div><div class="spinner-container container3"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div></div></div>');
		$("#redproductfinder-form").submit(function(ev) {
		    var frm = $("#redproductfinder-form");
		    $.ajax({
					type: "POST",
					url: frm.attr('action'),
					data: frm.serialize(), // serializes the form's elements.
					beforeSend: function(){
						$('#coverwrapper').fadeIn(50);
					},
					success: function(data)
					{
						if (data !== 'false')
						{
							ajaxpos.html(data);
						}else{
							var empty_finder = '<div class="product_finder_nofound"><span><?php echo JText::_("COM_PRODUCTFINDER_NO_PRODUCT_FOUND");?></span></div>';
							ajaxpos.html(empty_finder);
						}
						$('#coverwrapper').fadeOut(400);
						/* replace pagination */
					    $('.category_pagination .pagination').each(function(index, val) {
					        $(this).append('<ul class="page_touch"></ul>');
					        page_touch = $(this).find('.page_touch');
					        $(this).find('.icon-step-forward').after("<?php echo JText::_('JNEXT')?>").parent().parent('li').prependTo(page_touch);
					        $(this).find('.icon-step-backward').after("<?php echo JText::_('JPREV')?>").parent().parent('li').prependTo(page_touch);
					    });
					    /* END replace pagination */
					}
		         });
		    return false; // avoid to execute the actual submit of the form.
		    ev.preventDefault();
		});

		//submit form when input clicked
		var submit_frm = $("#redproductfinder-form");
		$("#redproductfinder-form").each(function(index, el) {
			var submit_frm = $(this);
			$(this).find('input').on('change', function(event) {
				submit_frm.submit();
			});
		});

		$('[data-aliases="Color"]').each(function(index, el) {
			cls_tag_color = $(this).next('.tagname').hide().html();
			$(this).addClass(cls_tag_color);
		});

		var resetform =	function (form) {
			$(form).find('.checked').removeClass('checked');
			$(form).find('input:text, input:password, input:file, select, textarea').val('');
			$(form).find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
			submit_frm.submit();
		}
		var resetslider = function(){
			$('#slider-range').slider( "values", [ <?php echo $min_slide;?>, <?php echo $max_slide;?> ]);
			$("[name='redform[filterprice][min]']").val(<?php echo $min_slide;?>);
			$("[name='redform[filterprice][max]']").val(<?php echo $max_slide;?>);
			$('#slider-range').find('.min_tab').html('$' + $('#slider-range').slider( "values", 0 ));
			$('#slider-range').find('.max_tab').html('$' + $('#slider-range').slider( "values", 1 ));
			submit_frm.submit();
		}
		$('#redproductfinder-form').each(function(index, el) {
			$(this).find('input:not([type="submit"]):not([type="hidden"])').each(function(index, el) {
				$(this).before('<div class="check_icon"></div>');
				$(this).bind('change', function(event) {
					if ($(this).is(':checked')) {
						$(this).prev().addClass('checked');
					}else{
						$(this).prev().removeClass('checked');
					}
				});
				$(this).hide();
			});
			$(this).find('.check_icon').click(function(event) {
				$(this).next('input').trigger('click');
			});
			$(this).find('[id*="typename-"]').each(function(index, el) {
				$(this).prepend('<div class="clean-btn clean"><?php echo JText::_('COM_PRODUCTFINDER_CLEAR_BTN');?></div>');
			});
			$(this).find('.clean-btn.clean').click(function(event) {
				resetform($(this).parent());
			});
			$('.clean-all').click(function(event) {
				$('#redproductfinder-form').find('.clean-btn').each(function(index, el) {
					$(this).trigger('click');
					resetslider();
				});
			});
		});
		$('.slide-wrapper').find('.clean-range').click(function(event) {
			resetslider();
		});
		$('#redproductfinder-form').each(function(index, el) {
			$(this).find('.tabs-panel').find('ul').slimScroll({
				height: '218px'
			});
		});
		/* select_tab */
		$('#tab-wrapper').each(function(index, el) {
			root_tab = $(this);
			$(this).find('.tabheader-bar').find('a').each(function(index, el) {
				root_panel = $(this);
				$(this).click(function(event) {
					root_tab.find('.active').removeClass('active');
					root_panel.find('li.active').removeClass('active');
					tab_tag = $(this).attr('href');
					$(this).parent().addClass('active');
					root_tab.find(tab_tag).addClass('active');

					return false;
					event.preventDefault();
				});
			});
		});
	});
</script>