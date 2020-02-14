<?php
/**
 * @copyright Copyright (C) 2008-2009 redCOMPONENT.com. All rights reserved.
 * @license can be read in this package of software in the file license.txt or
 * read on http://redcomponent.com/license.txt
 * Developed by email@recomponent.com - redCOMPONENT.com
 *
 * redPRODUCTFINDER
 */

JLoader::import('forms', JPATH_SITE . '/components/com_redproductfinder/helpers');
JLoader::import('helper', JPATH_SITE . '/modules/mod_redproductforms');

$data = RedproductfinderForms::filterForm($this->item);
$model = $this->getModel('forms');
$attributes = $model->getAttribute();
$attributeProperties = $model->getAttributeProperty();
$attributeSubProperties = $model->getAttributeSubProperty();
$param = JComponentHelper::getParams('com_redproductfinder');
$searchBy = $param->get('search_by');
$cid = 0;
$manufacturer_id = 0;
$template_id = $param->get('prod_template');
$formid = $param->get('form');
$range = ModRedproductForms::getRangeMaxMin($cid, $manufacturer_id);;

?>
<div class="">
	<form action="<?php echo JRoute::_("index.php?option=com_redproductfinder&view=findproducts"); ?>" method="post" name="adminForm" id="redproductfinder-form" class="form-validate">
	<div class="form-horizontal">
		<div class="row-fluid">
			<div class="span9">
			<?php if ($searchBy == 0) : ?>
				<div class="row-fluid form-horizontal-desktop">
					<?php foreach($data as $key => $value) :?>
						<div id='typename-<?php echo $value["typeid"];?>'>
							<label><?php echo $value["typename"];?></label>
							<ul class='taglist'>
								<?php foreach ($value["tags"] as $k_t => $tag) :?>
									<li>
										<span class='taginput' data-aliases='<?php echo $tag["aliases"];?>'><input type="checkbox" name="redform[<?php echo $value["typeid"]?>][tags][]" value="<?php echo $tag["tagid"]; ?>"></span>
										<span class='tagname'><?php echo $tag["tagname"]; ?></span>
									</li>
								<?php endforeach; ?>
							</ul>
						</div>
						<input type="hidden" name="redform[<?php echo $value["typeid"]?>][typeid]" value="<?php echo $value["typeid"]; ?>">
					<?php endforeach;?>
				</div>
			<?php else : ?>
				<div  class="row-fluid form-horizontal-desktop">
					<?php foreach($attributes as $k_a => $attribute) :?>
						<div id='typename-<?php echo $attribute->attribute_id;?>'>
							<label><?php echo $attribute->attribute_name;?></label>
							<ul class='taglist'>
								<?php foreach($attributeProperties as $k_p => $property) :?>
									<?php
									$attname = $model->getAttributeName($property->attribute_id);
									if ($attname[0] == $attribute->attribute_name) : ?>
										<li>
											<span class='taginput'><input type="checkbox" name="redform[properties][]" value="<?php echo $property->property_name; ?>"></span>
											<span class='tagname'><?php echo $property->property_name; ?></span>
											<ul class='taglist'>
											<?php foreach($attributeSubProperties as $k_sp => $subProperty) :?>
												<?php
													$proName = $model->getPropertyName($subProperty->subattribute_id);
													if ($proName[0] == $property->property_name) : ?>
												<li>
													<span class='taginput'>
													<input type="checkbox" name="redform[properties][]" value="<?php echo $subProperty->subattribute_color_name; ?>"></span>
													<span class='tagname'><?php echo $subProperty->subattribute_color_name; ?></span>
												</li>
												<?php endif; ?>
											<?php endforeach;?>
											</ul>
										</li>
									<?php endif; ?>
								<?php endforeach; ?>
							</ul>
						</div>
					<?php endforeach; ?>
				</div>
			<?php endif; ?>
			</div>
		</div>
		<div  class="row-fluid">
			<span><?php echo JText::_("COM_REDPRODUCTFINDER_VIEWS_FORMS_DEFAULT_MIN"); ?></span><span><input type="text" name="redform[filterprice][min]" value="<?php echo $range['min'];?>"/></span>
			<span><?php echo JText::_("COM_REDPRODUCTFINDER_VIEWS_FORMS_DEFAULT_MAX")?></span><span><input type="text" name="redform[filterprice][max]" value="<?php echo $range['max'];?>"/></span>
		</div>
	</div>

	<input type="submit" name="submit" value="submit" />
	<input type="hidden" name="view" value="findproducts" />
	<input type="hidden" name="formid" value="<?php echo $formid; ?>" />
	<input type="hidden" name="redform[template_id]" value="<?php echo $template_id;?>" />
	<input type="hidden" name="redform[cid]" value="<?php echo $cid;?>" />
	<input type="hidden" name="redform[manufacturer_id]" value="<?php echo $manufacturer_id;?>" />
	<?php echo JHtml::_('form.token'); ?>
	</form>
</div>
