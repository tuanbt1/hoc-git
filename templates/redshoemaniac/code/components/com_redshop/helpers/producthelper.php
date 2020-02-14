<?php
class producthelper extends producthelperDefault
{
/**
	 * Parse related product template
	 *
	 * @param   string   $template_desc  Template Contents
	 * @param   integer  $product_id     Product Id
	 *
	 * @todo    Move this functionality to library helper and convert this code into JLayout
	 *
	 * @return  string   Parsed Template HTML
	 */

	public function makeAttributeOrder($order_item_id = 0, $is_accessory = 0, $parent_section_id = 0, $stock = 0, $export = 0, $data = '')
	{
		$stockroomhelper   = new rsstockroomhelper;
		$order_functions   = new order_functions;
		$displayattribute  = "";
		$chktag            = $this->getApplyattributeVatOrNot($data);
		$product_attribute = "";
		$quantity          = 0;
		$stockroom_id      = "0";
		$orderItemdata     = $order_functions->getOrderItemDetail(0, 0, $order_item_id);

		$products = $this->getProductById($orderItemdata[0]->product_id);

		if (count($orderItemdata) > 0 && $is_accessory != 1)
		{
			$product_attribute = $orderItemdata[0]->product_attribute;
			$quantity          = $orderItemdata[0]->product_quantity;
			$stockroom_id      = $orderItemdata[0]->stockroom_id;
		}

		$orderItemAttdata = $order_functions->getOrderItemAttributeDetail($order_item_id, $is_accessory, "attribute", $parent_section_id);

		// Get Attribute middle template
		$attribute_middle_template = $this->getAttributeTemplateLoop($data);
		$attribute_final_template = '';

		if (count($orderItemAttdata) > 0)
		{
			for ($i = 0; $i < count($orderItemAttdata); $i++)
			{
				$attribute            = $this->getProductAttribute(0, 0, $orderItemAttdata[$i]->section_id);
				$hide_attribute_price = 0;

				if (count($attribute) > 0)
				{
					$hide_attribute_price = $attribute[0]->hide_attribute_price;
				}

				if (!strstr($data, '{remove_product_attribute_title}'))
				{
					$displayattribute .= "<div class='checkout_attribute_title'>" . urldecode($orderItemAttdata[$i]->section_name) . ":</div>";
				}

				// Assign Attribute middle template in tmp variable
				$tmp_attribute_middle_template = $attribute_middle_template;
				$tmp_attribute_middle_template = str_replace("{product_attribute_name}", urldecode($orderItemAttdata[$i]->section_name), $tmp_attribute_middle_template);

				$orderPropdata = $order_functions->getOrderItemAttributeDetail($order_item_id, $is_accessory, "property", $orderItemAttdata[$i]->section_id);

				// Initialize attribute calculated price
				$propertyCalculatedPriceSum = $orderItemdata[0]->product_item_old_price;

				for ($p = 0; $p < count($orderPropdata); $p++)
				{
					$property_price = $orderPropdata[$p]->section_price;

					if ($stock == 1)
					{
						$stockroomhelper->manageStockAmount($orderPropdata[$p]->section_id, $quantity, $orderPropdata[$p]->stockroom_id, "property");
					}

					$property      = $this->getAttibuteProperty($orderPropdata[$p]->section_id);
					$virtualNumber = "";

					if (count($property) > 0 && $property[0]->property_number)
					{
						$virtualNumber = "<div class='checkout_attribute_number'>" . $property[0]->property_number . "</div>";
					}

					if (!empty($chktag))
					{
						$property_price = $orderPropdata[$p]->section_price + $orderPropdata[$p]->section_vat;
					}

					if ($export == 1)
					{
						$disPrice = " (" . $orderPropdata[$p]->section_oprand . REDCURRENCY_SYMBOL . $property_price . ")";
					}
					else
					{
						$disPrice = "";

						if (!$hide_attribute_price)
						{
							$disPrice = " (" . $orderPropdata[$p]->section_oprand . $this->getProductFormattedPrice($property_price) . ")";
						}

						$propertyOperand = $orderPropdata[$p]->section_oprand;

						// Show actual productive price
						if ($property_price > 0)
						{
							$productAttributeCalculatedPriceBase = redhelper::setOperandForValues($propertyCalculatedPriceSum, $propertyOperand, $property_price);

							$productAttributeCalculatedPrice = $productAttributeCalculatedPriceBase - $propertyCalculatedPriceSum;
							$propertyCalculatedPriceSum      = $productAttributeCalculatedPriceBase;
						}

						if (!strstr($data, '{product_attribute_price}'))
						{
							$disPrice = '';
						}

						if (!strstr($data, '{product_attribute_number}'))
						{
							$virtualNumber = '';
						}
					}

					$displayattribute .= "<div class='checkout_attribute_wrapper'><div class='checkout_attribute_price'>" . urldecode($orderPropdata[$p]->section_name) . $disPrice . "</div>" . $virtualNumber . "</div>";

					// Replace attribute property price and value
					$tmp_attribute_middle_template = str_replace("{product_attribute_value}", urldecode($orderPropdata[$p]->section_name), $tmp_attribute_middle_template);
					$tmp_attribute_middle_template = str_replace("{product_attribute_value_price}", $disPrice, $tmp_attribute_middle_template);

					// Assign tmp variable to looping variable to get copy of all texts
					$attribute_final_template .= $tmp_attribute_middle_template;

					$orderSubpropdata = $order_functions->getOrderItemAttributeDetail($order_item_id, $is_accessory, "subproperty", $orderPropdata[$p]->section_id);

					for ($sp = 0; $sp < count($orderSubpropdata); $sp++)
					{
						$subproperty_price = $orderSubpropdata[$sp]->section_price;

						if ($stock == 1)
						{
							$stockroomhelper->manageStockAmount($orderSubpropdata[$sp]->section_id, $quantity, $orderSubpropdata[$sp]->stockroom_id, "subproperty");
						}

						$subproperty   = $this->getAttibuteSubProperty($orderSubpropdata[$sp]->section_id);
						$virtualNumber = "";

						if (count($subproperty) > 0 && $subproperty[0]->subattribute_color_number)
						{
							$virtualNumber = "<div class='checkout_subattribute_number'>[" . $subproperty[0]->subattribute_color_number . "]</div>";
						}

						if (!empty($chktag))
						{
							$subproperty_price = $orderSubpropdata[$sp]->section_price + $orderSubpropdata[$sp]->section_vat;
						}

						if ($export == 1)
						{
							$disPrice = " (" . $orderSubpropdata[$sp]->section_oprand . REDCURRENCY_SYMBOL . $subproperty_price . ")";
						}
						else
						{
							$disPrice = "";

							if (!$hide_attribute_price)
							{
								$disPrice = " (" . $orderSubpropdata[$sp]->section_oprand . $this->getProductFormattedPrice($subproperty_price) . ")";
							}

							$subPropertyOperand = $orderSubpropdata[$sp]->section_oprand;

							// Show actual productive price
							if ($subproperty_price > 0)
							{
								$productAttributeCalculatedPriceBase = redhelper::setOperandForValues($propertyCalculatedPriceSum, $subPropertyOperand, $subproperty_price);

								$productAttributeCalculatedPrice = $productAttributeCalculatedPriceBase - $propertyCalculatedPriceSum;
								$propertyCalculatedPriceSum      = $productAttributeCalculatedPriceBase;
							}

							if (!strstr($data, '{product_attribute_price}'))
							{
								$disPrice = '';
							}

							if (!strstr($data, '{product_attribute_number}'))
							{
								$virtualNumber = '';
							}
						}

						if (!strstr($data, '{remove_product_subattribute_title}'))
						{
							$displayattribute .= "<div class='checkout_subattribute_title'>" . urldecode($subproperty[0]->subattribute_color_title) . "</div>";
						}

						$displayattribute .= "<div class='checkout_subattribute_wrapper'><div class='checkout_subattribute_price'>" . urldecode($orderSubpropdata[$sp]->section_name) . $disPrice . "</div>" . $virtualNumber . "</div>";
					}

					// Format Calculated price using Language variable
					$productAttributeCalculatedPrice = '';
					$productAttributeCalculatedPrice = $this->getProductFormattedPrice(
						$productAttributeCalculatedPrice
					);
					$productAttributeCalculatedPrice = JText::sprintf('COM_REDSHOP_CART_PRODUCT_ATTRIBUTE_CALCULATED_PRICE', $productAttributeCalculatedPrice);
					$tmp_attribute_middle_template   = str_replace(
						"{product_attribute_calculated_price}",
						$productAttributeCalculatedPrice,
						$tmp_attribute_middle_template
					);
				}
			}
		}
		else
		{
			$displayattribute = $product_attribute;
		}

		if (isset($products->use_discount_calc) && $products->use_discount_calc == 1)
		{
			$displayattribute = $displayattribute . $orderItemdata[0]->discount_calc_data;
		}

		$data = new stdClass;
		$data->product_attribute = $displayattribute;
		$data->attribute_middle_template = $attribute_final_template;
		$data->attribute_middle_template_core = $attribute_middle_template;

		return $data;
	}
}
