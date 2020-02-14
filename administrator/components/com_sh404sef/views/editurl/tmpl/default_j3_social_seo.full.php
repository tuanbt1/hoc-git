<?php
/**
 * sh404SEF - SEO extension for Joomla!
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier - Weeblr llc - 2020
 * @package     sh404SEF
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     4.18.2.3981
 * @date		2019-12-23
 */

// Security check to ensure this file is being included by a parent file.
if (!defined('_JEXEC'))
	die('Direct Access to this location is not allowed.');

?>
<div class="container-fluid">
<?php

// ogData
$data = new stdClass();
$data->name = 'og_enable';
$data->label = JText::_('COM_SH404SEF_OG_DATA_ENABLED_BY_URL');
$data->input = $this->ogData['og_enable'];
$data->tip = JText::_('COM_SH404SEF_TT_OG_DATA_ENABLED_BY_URL');
echo $this->layoutRenderer['custom']->render($data);

$data = new stdClass();
$data->label = '<legend>' . JText::_('COM_SH404SEF_OG_REQUIRED_TITLE') . '</legend>';
echo $this->layoutRenderer['shlegend']->render($data);

// og_type
$data = new stdClass();
$data->name = 'og_type';
$data->label = JText::_('COM_SH404SEF_OG_TYPE_SELECT');
$data->input = $this->ogData['og_type'];
$data->tip = JText::_('COM_SH404SEF_TT_OG_TYPE_SELECT');
echo $this->layoutRenderer['custom']->render($data);

// og_image
$data = new stdClass();
$data->name = 'og_image';
$data->label = JText::_('COM_SH404SEF_OG_IMAGE_PATH');
$data->input = '<input type="text" name="og_image" id="og_image" size="90" value="' . $this->ogData['og_image'] . '" />';
$data->tip = JText::_('COM_SH404SEF_TT_OG_IMAGE_PATH');
echo $this->layoutRenderer['custom']->render($data);

$data = new stdClass();
$data->label = '<legend>' . JText::_('COM_SH404SEF_OG_OPTIONAL_TITLE') . '</legend>';
echo $this->layoutRenderer['shlegend']->render($data);

// og_enable_description
$data = new stdClass();
$data->name = 'og_enable_description';
$data->label = JText::_('COM_SH404SEF_OG_INSERT_DESCRIPTION');
$data->input = $this->ogData['og_enable_description'];
$data->tip = JText::_('COM_SH404SEF_TT_OG_INSERT_DESCRIPTION');
echo $this->layoutRenderer['custom']->render($data);

// custom OGP description
$data = new stdClass();
$data->name = 'og_custom_description';
$data->label = JText::_('COM_SH404SEF_OG_CUSTOM_DESCRIPTION');
$data->input = '<textarea name="og_custom_description" id="og_custom_description" cols="60" rows="5">' . $this->ogData['og_custom_description'] . '</textarea>';
$data->tip = JText::_('COM_SH404SEF_TT_OG_CUSTOM_DESCRIPTION');
echo $this->layoutRenderer['custom']->render($data);

// og_enable_site_name
$data = new stdClass();
$data->name = 'og_enable_site_name';
$data->label = JText::_('COM_SH404SEF_OG_INSERT_SITE_NAME');
$data->input = $this->ogData['og_enable_site_name'];
$data->tip = JText::_('COM_SH404SEF_TT_OG_INSERT_SITE_NAME');
echo $this->layoutRenderer['custom']->render($data);

// og_site_name
$data = new stdClass();
$data->name = 'og_site_name';
$data->label = JText::_('COM_SH404SEF_OG_SITE_NAME');
$data->input = '<input type="text" name="og_site_name" id="og_site_name" size="90" value="' . $this->ogData['og_site_name'] . '" />';
$data->tip = JText::_('COM_SH404SEF_TT_OG_SITE_NAME');
echo $this->layoutRenderer['custom']->render($data);

// og_enable_fb_admin_ids
$data = new stdClass();
$data->name = 'og_enable_fb_admin_ids';
$data->label = JText::_('COM_SH404SEF_OG_ENABLE_FB_ADMIN_IDS');
$data->input = $this->ogData['og_enable_fb_admin_ids'];
$data->tip = JText::_('COM_SH404SEF_TT_OG_ENABLE_FB_ADMIN_IDS');
echo $this->layoutRenderer['custom']->render($data);

// og_site_name
$data = new stdClass();
$data->name = 'fb_admin_ids';
$data->label = JText::_('COM_SH404SEF_FB_ADMIN_IDS');
$data->input = '<input type="text" name="fb_admin_ids" id="fb_admin_ids" size="50" value="' . $this->ogData['fb_admin_ids'] . '" />';
$data->tip = JText::_('COM_SH404SEF_TT_FB_ADMIN_IDS');
echo $this->layoutRenderer['custom']->render($data);

// twitter Cards
$data = new stdClass();
$data->label = '<legend>' . JText::_('COM_SH404SEF_TWITTER_CARDS_TITLE') . '</legend>';
echo $this->layoutRenderer['shlegend']->render($data);

echo '</p>' . JText::_('COM_SH404SEF_SOCIAL_TWITTER_CARDS_USE_OG_IMAGE') . '</p>';

// Enable Twitter Cards
$data = new stdClass();
$data->name = 'twittercards_enable';
$data->label = JText::_('COM_SH404SEF_SOCIAL_ENABLE_TWITTER_CARDS');
$data->input = $this->twCardsData['twittercards_enable'];
$data->tip = JText::_('COM_SH404SEF_SOCIAL_ENABLE_TWITTER_CARDS_DESC_PER_URL');
echo $this->layoutRenderer['custom']->render($data);

// twitter cards site account
$data = new stdClass();
$data->name = 'twittercards_site_account';
$data->label = JText::_('COM_SH404SEF_SOCIAL_TWITTER_CARDS_SITE_ACCOUNT');
$data->input = '<input type="text" name="twittercards_site_account" id="twittercards_site_account" size="50" value="' . $this->twCardsData['twittercards_site_account'] . '" />';
$data->tip = JText::_('COM_SH404SEF_SOCIAL_TWITTER_CARDS_SITE_ACCOUNT_DESC');
echo $this->layoutRenderer['custom']->render($data);

// twitter cards site account
$data = new stdClass();
$data->name = 'twittercards_creator_account';
$data->label = JText::_('COM_SH404SEF_SOCIAL_TWITTER_CARDS_CREATOR_ACCOUNT');
$data->input = '<input type="text" name="twittercards_creator_account" id="twittercards_creator_account" size="50" value="' . $this->twCardsData['twittercards_creator_account'] . '" />';
$data->tip = JText::_('COM_SH404SEF_SOCIAL_TWITTER_CARDS_CREATOR_ACCOUNT_DESC');
echo $this->layoutRenderer['custom']->render($data);

?>
</div>
