<?php
/**
 * @package     Wright
 * @subpackage  Modules
 *
 * @copyright   Copyright (C) 2005 - 2014 Joomlashack.  Meritage Assets.  All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.module.helper');

/**
 * Determines the autospan column width for a module position
 * @param string $position - desired position to check
 * @return number - column width for the generated spans
 */
function getPositionAutospanWidth($position) {
    $robModules = JModuleHelper::getModules($position);
    $maxColumns = 12;
    $availableColumns = $maxColumns;
    $autospanModules = count($robModules);
    if ($robModules) {
        foreach ( $robModules as $robModule ) {
            $modParams = new JRegistry($robModule->params);
            // module width has been fixed?

            $matches = Array();
            if (preg_match('/col-sm-([0-9]{1,2})/', $modParams->get('moduleclass_sfx'), $matches)) {
                $modColumns = (int)$matches[1];
                $availableColumns -= $modColumns;
                $autospanModules--;
            }
        }
    }

    // calculate the span width ( columns / modules)
    if ($autospanModules <= 0 ) $autospanModules = 1;
    $spanWidth = $availableColumns / $autospanModules;
    return (int)$spanWidth;
}

/**
 * Wright Flex Grid
 * (i.e. <w:module type="{row/row-fluid}" name="position" chrome="wrightflexgrid" extradivs="{optional}" extraclass="{optional}" />
 */
function modChrome_wrightflexgrid($module, &$params, &$attribs) {
    $app = JFactory::getApplication();
    $templatename = $app->getTemplate();

    $document = JFactory::getDocument();
    static $modulenumbera = Array();
    if (!isset($modulenumbera[$attribs['name']]))
        $modulenumbera[$attribs['name']] = 1;

    $spanWidth = getPositionAutospanWidth($attribs['name']);
    $robModules = JModuleHelper::getModules($attribs['name']);

    $extradivs = explode(',',$attribs['extradivs']);
    $extraclass = ($attribs['extraclass'] != '' ? ' ' . $attribs['extraclass'] : '');

    $class = $params->get('moduleclass_sfx');
    static $modulenumber = 1;
    $matches = Array();
    if (preg_match('/col-sm-([0-9]{1,2})/', $class, $matches)) {
        // user assigned span width in module parameters
        $params->set('moduleclass_sfx',preg_replace('/col-sm-([0-9]{1,2})/', '', $class));
        $class = $params->get('moduleclass_sfx');
        $spanWidth = (int)$matches[1];
        $module->content = preg_replace('/<([^>]+)class="([^""]*)col-sm-' . $spanWidth . '([^""]*)"([^>]*)>/sU', '<$1class="$2 $3"$4>', $module->content);
    }


    $featured = false;
    $featuredLinkImg = (preg_match("/featured-link-img/", $class)) ? true : false ;
    $featuredImg = '';
    $featuredSubtitle = '';
    $moduleTitle = '';
    if (preg_match("/featured/", $class)) {
        $featured = true;
        $linkTitle = '';

        $classold = $class;
        $class = preg_replace("/featured/", "", $class);
        $params->set('moduleclass_sfx',$class);
        if (preg_match('/<a([^>]*)href=\"([^\"]*)\"([^>]*)>Title<\/a>/i', $module->content, $matches)) {
            $module->content = preg_replace('/<a([^>]*)href=\"([^\"]*)\"([^>]*)>Title<\/a>/i', '', $module->content, 1);
            $linkTitle = $matches[2];
            $moduleTitle = '<h3><a href="' . $linkTitle . '">' . $module->title . '</a></h3>';
        }
        if (preg_match('/<img([^>]*)>/i', $module->content, $matches)) {
            $module->content = preg_replace('/<img([^>]*)>/i', '', $module->content, 1);
            if ($featuredLinkImg && $linkTitle != '')
                $featuredImg = '<div class="wrightmodule-imgfeatured">'.'<a href="' . $linkTitle . '">'.'<img' . $matches[1] . '>'.'</a>'.'</div>';
            else
                $featuredImg = '<div class="wrightmodule-imgfeatured">'.'<img' . $matches[1] . '>'.'</div>';
        }
        if (preg_match('/<h4([^>]*)>(.+?)<\/h4>/ims', $module->content, $matches)) {
            $module->content = preg_replace('/<h4([^>]*)>(.+?)<\/h4>/ims', '', $module->content, 1);
            $featuredSubtitle = '<h4' . $matches[1] . ' class="wrightmodule-subtitle">' . $matches[2] . '</h4>';
        }
    }

    if ($moduleTitle == '')
        $moduleTitle = '<h3>' . $module->title . '</h3>';


    $class .= ' mod_'.$modulenumbera[$attribs['name']];
    $modulenumber++;
    if( $modulenumbera[$attribs['name']] == 1 ) {
        $class .= ' first';
        // for 5 modules with span2 first and last modules will have 3 columns width
        if (count($robModules) == 5 && $spanWidth == 2) {
            $spanWidth = 3;
        }
    }
    if ( $modulenumbera[$attribs['name']] == $document->countModules( $attribs['name'] ) ) {
        $class .= ' last';
        $modulenumbera[$attribs['name']] = 0;
        // for 5 modules with span2 first and last modules will have 3 columns width
        if (count($robModules) == 5 && $spanWidth == 2) {
            $spanWidth = 3;
        }
    }
    $modulenumbera[$attribs['name']]++;
    ?>
    <div class="module<?php echo $class; ?><?php if (!$module->showtitle) : ?> no_title<?php endif; ?> col-sm-<?php echo $spanWidth . $extraclass ?>">
        <?php if (in_array('module',$extradivs)) : ?>
        <div class="module-inner">
            <?php
            endif;

            if ($featured)
                echo $featuredImg . '<div class="wrightmodule-content">' . $featuredSubtitle;

            if ($module->showtitle) : ?>
                <?php if (in_array('title',$extradivs)) : ?>	<div class="module_title"> <?php endif; ?>
                <?php echo $moduleTitle; ?>
                <?php if (in_array('in-title',$extradivs)) : ?> <div class="module_title_in"></div> <?php endif; ?>
                <?php if (in_array('title',$extradivs)) : ?>	</div> <?php endif; ?>
            <?php endif; ?>
            <?php
            echo $module->content;
            if ($featured)
                echo '</div>';
            ?>
            <?php if (in_array('module',$extradivs)) : ?>
        </div>
    <?php
    endif;
    ?>
    </div>
<?php
}

/**
 * Wright Featured Module
 * (i.e. <w:module name="position" chrome="wrightfeatured" extraclass="{optional}" />
 */
function modChrome_wrightfeatured($module, &$params, &$attribs) {
    $class = $params->get('moduleclass_sfx');
    $extradivs = explode(',',$attribs['extradivs']);
    $extraclass = ($attribs['extraclass'] != '' ? ' ' . $attribs['extraclass'] : '');
    ?>
    <?php
    $img = '';
    $h4 = '';
    $linkTitle = '';
    $featuredLinkImg = (preg_match("/featured-link-img/", $class)) ? true : false ;

    if (preg_match("/featured/", $class)) {
        $classold = $class;
        $class = preg_replace("/featured/", "", $class);
        $params->set('moduleclass_sfx',$class);
        if (preg_match('/<a([^>]*)href=\"([^\"]*)\"([^>]*)>Title<\/a>/i', $module->content, $matches)) {
            $module->content = preg_replace('/<a([^>]*)href=\"([^\"]*)\"([^>]*)>Title<\/a>/i', '', $module->content, 1);
            $linkTitle = $matches[2];
        }
        if (preg_match('/<img([^>]*)>/i', $module->content, $matches)) {
            $module->content = preg_replace('/<img([^>]*)>/i', '', $module->content, 1);
            if($featuredLinkImg && $linkTitle != '')
                $img = '<div class="wrightmodule-imgfeatured">'.'<a href="'.$linkTitle.'">'.'<img' . $matches[1] . '>'.'</a>'.'</div>';
            else
                $img = '<div class="wrightmodule-imgfeatured">'.'<img' . $matches[1] . '>'.'</div>';
        }
        if (preg_match('/<h4([^>]*)>(.+?)<\/h4>/ims', $module->content, $matches)) {
            $module->content = preg_replace('/<h4([^>]*)>(.+?)<\/h4>/ims', '', $module->content, 1);
            $h4 = '<h4' . $matches[1] . ' class="wrightmodule-subtitle">' . $matches[2] . '</h4>';
        }
    }
    ?>
    <div class="moduletable<?php echo $class; ?><?php if (!$module->showtitle) : ?> no_title<?php endif; ?><?php echo $extraclass ?>">
        <?php
        echo $img;
        echo "<div class=\"wrightmodule-content\">";
        echo $h4;
        if ($module->showtitle) {
            if (in_array('title',$extradivs)) : ?> <div class="module_title"> <?php endif;
            echo "<h3>" . ($linkTitle != "" ? "<a href='$linkTitle'>" : "") . $module->title . ($linkTitle != "" ? "</a>" : "") . "</h3>";
            if (in_array('in-title',$extradivs)) : ?> <div class="module_title_in"></div> <?php endif;
            if (in_array('title',$extradivs)) : ?> </div> <?php endif;
        }
        echo $module->content;
        echo "</div>";
        ?>
    </div>
<?php
}
