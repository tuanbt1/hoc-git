<?php
/**
 * @package     RedSHOP.Frontend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

JHtml::_('behavior.framework');

$url = JUri::base();
$input = JFactory::getApplication()->input;
$wishlists = $this->wishlist;
$productId = $input->getInt('product_id', 0);
$flage = ($productId && count($wishlists) > 0) ? true : false;
$Itemid = $input->getInt('Itemid', 0);
?>
<div id="newwishlist" style="display:<?php echo $flage ? 'none' : 'block'; ?>">
	<?php
	if ($this->params->get('show_page_heading', 1))
	{
		$pagetitle = JText ::_('COM_REDSHOP_CREATE_NEWWISHLIST');
		?>
		<h4 class="componentheading<?php echo $this->escape($this->params->get('pageclass_sfx')); ?>">Create Wishlist</h4>
	<?php
	}
	?>
	<form name="newwishlistForm" method="post" action="">
		<table>
			<tr><td colspan='2'>&nbsp</td></tr>
			<tr>
				<td>
					<label for="txtWishlistname">Wishlist name: </label>
				</td>
				<td>
					<input type="input" name="txtWishlistname" id="txtWishlistname"/>
				</td>
			</tr>
			<tr height='100px'>
				<td class='wishls-groupbtn' colspan="2" align="left">
					<input type="button" class="wishls-addbtn" value="<?php echo JText::_('COM_REDSHOP_CREATE_SAVE'); ?>"
					       onclick="checkValidation()"/>&nbsp;
					<?php
					if (JRequest::getInt('loginwishlist') == 1) : ?>

					<?php
						$mywishlist_link = JRoute::_('index.php?view=wishlist&task=viewwishlist&option=com_redshop&Itemid=' . $Itemid);
					?>
						<a href="<?PHP echo $mywishlist_link; ?>"><input class="wishls-addbtn" type="button"
						                                                 value="<?php echo JText::_('COM_REDSHOP_CANCEL'); ?>"/></a>
					<?php else : ?>
						<input type="button" class="wishls-addbtn" value="<?php echo JText::_('COM_REDSHOP_CANCEL'); ?>"
						       onclick="window.parent.SqueezeBox.close();"/>
					<?php endif; ?>
				</td>
			</tr>
		</table>
		<input type="hidden" name="view" value="wishlist"/>
		<input type="hidden" name="option" value="com_redshop"/>
		<input type="hidden" name="task" value="createsave"/>
	</form>
</div>
<?php
if ($flage) : ?>
	<div id="wishlist">
		<?php
		if ($this->params->get('show_page_heading', 1))
		{
			$pagetitle = JText::_('COM_REDSHOP_MY_WISHLIST');
			?>
			<h4 class="componentheading<?php echo $this->escape($this->params->get('pageclass_sfx')); ?>"><?php echo $pagetitle; ?></h4>
			<div class='createwl'>
				<?php if ($flage) : ?>
					<input class='input-createwl' type="checkbox" name="chkNewwishlist" id="chkNewwishlist"
					       onchange="changeDiv(this);"/><a class='text-createwl'><?php echo JText::_('COM_REDSHOP_CREATE_NEW_WISHLIST'); ?></a>
				<?php endif;
				?>
			</div>
		<?php
		}
		?>
		<form name="adminForm" id="adminForm" method="post" action="">

			<table class="adminlist" cellpadding="5" cellspacing="5">
				<thead>
				<tr style='border-bottom: 1px solid #000'>
					<th width="5%" class="title" align="left">
						<?php echo JHtml::_('redshopgrid.checkall'); ?>
					</th>
					<th width="5%" align="left">
						#
					</th>
					<th class="title" width="30%">
						<?php echo JText::_('COM_REDSHOP_WISHLIST_NAME'); ?>
					</th>
				</tr>
				</thead>
				<tbody>
				<?php
				$k = 0;
				$i = 0;

				foreach ($wishlists as $wishlist)
				{
					$row = $wishlist;
					?>
					<tr class="<?php echo "row$k"; ?>" style='height: 45px;'>
						<td align="left">
							<?php echo JHTML::_('grid.id', $i, $row->wishlist_id, false, 'wishlist_id'); ?>
						</td>
						<td align="left">
							<?php echo ($i + 1); ?>
						</td>
						<td>
							<?php echo $row->wishlist_name; ?>
						</td>
					</tr>
					<?php
					$k = 1 - $k;
				}
				?>
				<tr height='100px'>
					<td class='wishls-groupbtn' colspan="3" align="left">
						<input type="button" class="wishls-addbtn" value="<?php echo JText::_('COM_REDSHOP_ADD_TO_WISHLIST'); ?>"
						       onclick="submitform();"/>&nbsp;
						<input type="button" class="wishls-addbtn" value="<?php echo JText::_('COM_REDSHOP_CANCEL'); ?>"
						       onclick="window.parent.SqueezeBox.close();"/>
					</td>
				</tr>
				</tbody>
			</table>
			<input type="hidden" name="<?php echo JSession::getFormToken() ?>" value="1" />
            <input type="hidden" name="product_id" value="<?php echo $input->getInt('product_id', 0) ?>" />
			<input type="hidden" name="attribute_id" value="<?php echo $input->getRaw('attribute_id', '') ?>" />
			<input type="hidden" name="property_id" value="<?php echo $input->getRaw('property_id', '') ?>" />
			<input type="hidden" name="subattribute_id" value="<?php echo $input->getRaw('subattribute_id', '') ?>" />
			<input type="hidden" name="view" value="wishlist" />
			<input type="hidden" name="boxchecked" value="0" />
			<input type="hidden" name="option" value="com_redshop" />
			<input type="hidden" name="task" value="savewishlist" />
		</form>
	</div>

	<script language="javascript" type="text/javascript">
		function submitform() {
			if (document.adminForm.boxchecked.value == '0')
				alert("<?php echo JText::_('COM_REDSHOP_PLEASE_SELECT_WISHLIST')?>");
			else
				document.adminForm.submit();
		}
		function changeDiv(element) {
			if (element.checked) {
				document.getElementById('newwishlist').style.display = 'block';
				document.getElementById('wishlist').style.display = 'none';
			}
			else {
				document.getElementById('newwishlist').style.display = 'none';
				document.getElementById('wishlist').style.display = 'block';
			}
		}
	</script>
<?php endif; ?>
<script language="javascript" type="text/javascript">
	function checkValidation() {
		if (trim(document.newwishlistForm.txtWishlistname.value) == "")
			alert("<?php echo JText::_('COM_REDSHOP_PLEASE_ENTER_WISHLIST_NAME')?>");
		else
			document.newwishlistForm.submit();
	}
	jQuery(document).ready(function ($) {
		$('#wishlist .createwl .text-createwl').click(function(event) {
			$('#wishlist .createwl .input-createwl').trigger('click');
		});
	});
</script>
<style>
/* wishlist popup*/
html{
	overflow: auto;
}
body, .contentpane{
	padding: 0;
	margin: 0;
}
#wishlist .componentheading,#newwishlist .componentheading{
	margin: 0;
}
#wishlist h4,#newwishlist h4{
	font-size: 20px;
	font-family:  "droidsansregular", Helvetica, Arial, sans-serif;
	color: #000;
	font-weight: normal;
	text-transform: uppercase;
	display: inline-block;
}
#wishlist .text-createwl{
	font-size: 14px;
	font-family:  "droidsansregular", Helvetica, Arial, sans-serif;
	color: #555;
	text-decoration: underline;
}
#wishlist .createwl, #wishlist h1{
	display: inline-block;
}
#wishlist .createwl .input-createwl{
	visibility: hidden;
	width: 0;
	height: 0;
}
#wishlist .adminlist{
	padding-top: 20px;
	margin-top: 20px;
}
#wishlist .adminlist .title{
	text-transform: uppercase;
	font-size: 14px;
	font-family:  "droidsansregular", Helvetica, Arial, sans-serif;
	color: #000;
	font-weight: normal;
}
#wishlist .adminlist tbody{
	text-transform: uppercase;
	font-size: 14px;
	font-family:  "droidsansregular", Helvetica, Arial, sans-serif;
	color: #555;
}
.contentpane .wishls-addbtn{
	color: #fff;
	font-size: 14px;
	font-family:  "droidsansregular", Helvetica, Arial, sans-serif;
	background-color: #86547b;
	width: 170px;
	height: 30px;
	padding: 0;
	margin: 0;
	font-weight: normal;
}
#newwishlist label{
	font-size: 14px;
	font-family:  "droidsansregular", Helvetica, Arial, sans-serif;
	color: #555;
	margin: 0;
	padding-right: 10px;
	font-weight: normal;
}
</style>
