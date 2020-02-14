<?php
/**
 * @package     RedSHOP.Frontend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2005 - 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

?>
<div id="productlist">
<?php
	$keyword = JRequest::getString('keyword', isset($standardkeyword)?$standardkeyword:'');
?>
<div class='title-keyword'>
	<h3><?php echo 'SEARCH FOR "'. $keyword .'"';?></h3>
</div>
<div class='search-result'>
<?php $this->onRSProductSearch(); ?>
</div>
</div>