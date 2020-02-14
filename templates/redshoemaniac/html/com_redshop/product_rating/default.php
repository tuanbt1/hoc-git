<?php
/**
 * @package     RedSHOP.Frontend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

$url = JURI::base();

$Itemid = JRequest::getInt('Itemid');
$app =& JFactory::getApplication();
$template = $app->getTemplate();
?>
<script type="text/javascript" language="javascript">
	function validate() {
		var form = document.adminForm;
		var flag = 0;

		var selection = document.adminForm.user_rating;

		for (i = 0; i < selection.length; i++) {
			if (selection[i].checked == true) {
				flag = 1;
			}
		}

		if (flag == 0) {
			alert('<?php echo JText::_('COM_REDSHOP_PLEASE_RATE_THE_PRODUCT'); ?>');
			return false;
		}
		else if (form.comment.value == "") {
			alert('<?php echo JText::_('COM_REDSHOP_PLEASE_COMMENT_ON_PRODUCT'); ?>');
			return false;
		}
		else
		{
			return true;
		}

	}
	jQuery(document).ready(function($){
		$('.click-star').each(function(){
			$(this).find('input').before('<span class="star">&nbsp</span>');
			$(this).find('.star').click(function(){
				$(this).parent().parent().find('.active').removeClass('active');
				$(this).addClass('active');
				$(this).next().trigger('click');
			});
		});
	});
</script>
<style>
/* customer review popup*/
html{
	overflow: hidden;
}
body, .contentpane{
	padding: 0;
	margin: 0;
}
#adminForm h4{
	font-size: 22px;
	margin-top: 0;
	color: #000;
	font-family: "benchnineregular", Helvetica, Arial, sans-serif;
	font-weight: normal;
	margin-bottom: 25px;
}
#adminForm .tablebox .ratinginput input{
	margin: 0;
}
#adminForm label{
	font-weight: normal;
	color: #555;
	font-family: "benchnineregular", Helvetica, Arial, sans-serif;
	font-size:18px;
}
#adminForm .inputbox, #adminForm .text_area{
	border: 1px solid #999;
	background-color: #fff;
	width: 100%;
	padding-left: 5px;
}
#adminForm .submitbtn{
	color: #fff;
	font-size: 18px;
	font-family: "benchnineregular", Helvetica, Arial, sans-serif;
	background-color: #000;
	width: 110px;
	height: 40px;
	padding: 0;
	margin: 0;
	font-weight: normal;
	border: none;
}
#adminForm .text_area{
	height: 120px;
	margin-bottom: 5px;
}
#closewindow{
	width : 100%;
	display: block;
}
#closewindow input{
	display: none;
	color: #fff;
	font-size: 18px;
	font-family: "benchnineregular", Helvetica, Arial, sans-serif;
	background-color: #000;
	width: 110px;
	height: 40px;
	padding: 0;
	margin: 15px 0 0 0;
	font-weight: normal;
	border: none;
}
.click-star >input{
	display: none;
}
.click-star >span{
	font-size: 18px;
	color: #000;
	font-family: "benchnineregular", Helvetica, Arial, sans-serif;
}
.click-star .star{
	width: 20px;
	height: 19px;
	background: url('templates/<?php echo $template;?>/images/star_rating/star-none.png') no-repeat center center;
	display: inline-block;
	cursor: pointer;
}
.click-star .star.active{
	background: url('templates/<?php echo $template;?>/images/star_rating/star-active.png') no-repeat center center;
}
</style>
<?php
if ($this->params->get('show_page_heading', 1))
{
	?>
	<div class="componentheading<?php echo $this->params->get('pageclass_sfx') ?>">
		<?php echo $this->escape($this->productinfo->product_name); ?>
	</div>
<?php
}
?>
<form action="<?php echo JRoute::_('index.php?option=com_redshop') ?>" method="post" name="adminForm" id="adminForm">
	<table class='tablebox' cellpadding="3" cellspacing="3" border="0" width="100%">
		<tr>
			<td colspan='2'><h4>CUSTOMER REVIEW</h4></td>
		</tr>
		<tr>
			<td valign="top" align="left">
				<label for="username">
					<?php echo JText::_('COM_REDSHOP_USER_FULLNAME'); ?>:
				</label>
			</td>
			<?php

			if ($this->userinfo->firstname != "")
			{
				$fullname = $this->userinfo->firstname . " " . $this->userinfo->lastname;
			}
			?>
		   <td colspan="2" align="left">
		   		<input type="text" class="inputbox" name="username" id="username" value="<?php echo $fullname ?>" readonly="readonly">
		   </td>
		</tr>
		<tr>
			<td valign="top" align="left">
				<label for="rating_title">
					<?php echo JText::_('COM_REDSHOP_RATING_TITLE'); ?>:
				</label>
			</td>
			<td colspan="8" align='left'>
				<input type="text" class="inputbox" name="title" id="title" value="" size="48">
			</td>
		</tr>
		<tr>
			<td>&nbsp</td>
			<td colspan="8">
				<div class='click-star'>
				<span><?php echo JText::_('COM_REDSHOP_GOOD'); ?></span>
				<input type="radio" name="user_rating" id="user_rating0" value="0">
				<input type="radio" name="user_rating" id="user_rating1" value="1">
				<input type="radio" name="user_rating" id="user_rating2" value="2">
				<input type="radio" name="user_rating" id="user_rating3" value="3">
				<input type="radio" name="user_rating" id="user_rating4" value="4">
				<input type="radio" name="user_rating" id="user_rating5" value="5">
				<span><?php echo JText::_('COM_REDSHOP_EXCELLENT'); ?></span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan='8' valign="top" align="left">
				<label for="comment">
					<?php echo JText::_('COM_REDSHOP_COMMENT'); ?>:
				</label>
			</td>
		</tr>
		<tr>
			<td class='cltext' colspan="8" align='left'>
				<textarea class="text_area" name="comment" id="comment" cols="60" rows="7"/></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="8" align='left'><input class='submitbtn' type="submit" name="submit"
			                       value="SEND"
			                       onclick="return validate();"></td>
		</tr>
	</table>
	<input type="hidden" name="view" value="product_rating"/>
	<input type="hidden" name="task" value="save"/>
	<input type="hidden" name="product_id" value="<?php echo $this->product_id ?>"/>
	<input type="hidden" name="category_id" value="<?php echo $this->category_id ?>"/>
	<input type="hidden" name="userid" value="<?php echo $this->user->id ?>"/>
	<input type="hidden" name="published" value="0"/>
	<input type="hidden" name="rate" value="<?php echo $this->rate ?>"/>
	<input type="hidden" name="time" value="<?php echo time() ?>"/>
	<input type="hidden" name="option" value="com_redshop"/>
	<input type="hidden" name="Itemid" value="<?php echo $Itemid ?>"/>
</form>
