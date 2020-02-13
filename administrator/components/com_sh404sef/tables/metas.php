<?php
/**
 * sh404SEF - SEO extension for Joomla!
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier - Weeblr llc - 2020
 * @package     sh404SEF
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     4.18.2.3981
 * @date        2019-12-23
 */

// Security check to ensure this file is being included by a parent file.
if (!defined('_JEXEC'))
{
	die('Direct Access to this location is not allowed.');
}

jimport('joomla.database.table');

class Sh404sefTableMetas extends JTable
{

	/**
	 * Current row id
	 *
	 * @var   integer
	 * @access  public
	 */
	public $id = 0;

	/**
	 * Non-sef url associated with the meta data
	 *
	 * @var   string
	 * @access  public
	 */
	public $newurl = '';

	/**
	 * Description meta
	 *
	 * @var   string
	 * @access  public
	 */
	public $metadesc = '';

	/**
	 * Keywords meta
	 *
	 * @var   string
	 * @access  public
	 */
	public $metakey = '';

	/**
	 * Title page meta
	 *
	 * @var   string
	 * @access  public
	 */
	public $metatitle = '';

	/**
	 * Language meta
	 *
	 * @var   string
	 * @access  public
	 */
	public $metalang = '';

	/**
	 * Robots meta
	 *
	 * @var   string
	 * @access  public
	 */
	public $metarobots = '';

	/**
	 * Canonical url for the page
	 *
	 * @var   string
	 * @access  public
	 */
	public $canonical = '';

	//Open graph data
	public $og_enable              = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $og_type                = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $og_image               = '';
	public $og_enable_description  = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $og_enable_site_name    = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $og_site_name           = '';
	public $fb_admin_ids           = '';
	public $og_enable_location     = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $og_latitude            = '';
	public $og_longitude           = '';
	public $og_street_address      = '';
	public $og_locality            = '';
	public $og_postal_code         = '';
	public $og_region              = '';
	public $og_country_name        = '';
	public $og_enable_contact      = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $og_email               = '';
	public $og_phone_number        = '';
	public $og_fax_number          = '';
	public $og_enable_fb_admin_ids = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $og_custom_description  = '';

	// twitter cards
	public $twittercards_enable          = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $twittercards_site_account    = '';
	public $twittercards_creator_account = '';
	// google authorship
	public $google_authorship_enable         = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $google_authorship_author_profile = '';
	public $google_authorship_author_name    = '';
	// google publisher
	public $google_publisher_enable = SH404SEF_OPTION_VALUE_USE_DEFAULT;
	public $google_publisher_url    = '';

	// custom raw content
	public $raw_content_head_top    = '';
	public $raw_content_head_bottom = '';
	public $raw_content_body_top    = '';
	public $raw_content_body_bottom = '';

	/**
	 * Object constructor
	 *
	 * @access public
	 *
	 * @param object $db JDatabase object
	 */
	public function __construct(&$db)
	{
		parent::__construct('#__sh404sef_metas', 'id', $db);
	}

	public function check()
	{
		//initialize
		$this->newurl     = JString::trim($this->newurl);
		$this->metadesc   = JString::trim($this->metadesc);
		$this->metakey    = JString::trim($this->metakey);
		$this->metatitle  = JString::trim($this->metatitle);
		$this->metalang   = JString::trim($this->metalang);
		$this->metarobots = JString::trim($this->metarobots);
		$this->canonical  = JString::trim($this->canonical);

		// Open graph data
		$this->og_site_name          = JString::trim($this->og_site_name);
		$this->fb_admin_ids          = JString::trim($this->fb_admin_ids);
		$this->og_latitude           = JString::trim($this->og_latitude);
		$this->og_longitude          = JString::trim($this->og_longitude);
		$this->og_street_address     = JString::trim($this->og_street_address);
		$this->og_locality           = JString::trim($this->og_locality);
		$this->og_postal_code        = JString::trim($this->og_postal_code);
		$this->og_region             = JString::trim($this->og_region);
		$this->og_country_name       = JString::trim($this->og_country_name);
		$this->og_email              = JString::trim($this->og_email);
		$this->og_phone_number       = JString::trim($this->og_phone_number);
		$this->og_fax_number         = JString::trim($this->og_fax_number);
		$this->og_custom_description = JString::trim($this->og_custom_description);

		$this->twittercards_site_account        = JString::trim($this->twittercards_site_account);
		$this->twittercards_creator_account     = JString::trim($this->twittercards_creator_account);
		$this->google_authorship_author_profile = JString::trim($this->google_authorship_author_profile);
		$this->google_authorship_author_name    = JString::trim($this->google_authorship_author_name);
		$this->google_publisher_enable          = JString::trim($this->google_publisher_enable);
		$this->google_publisher_url             = JString::trim($this->google_publisher_url);

		$this->raw_content_head_top    = JString::trim($this->raw_content_head_top);
		$this->raw_content_head_bottom = JString::trim($this->raw_content_head_bottom);
		$this->raw_content_body_top    = JString::trim($this->raw_content_body_top);
		$this->raw_content_body_bottom = JString::trim($this->raw_content_body_bottom);

		if ($this->newurl == '/')
		{
			$this->newurl = sh404SEF_HOMEPAGE_CODE;
		}

		// check for valid URLs
		if ($this->newurl == '')
		{
			$this->setError(JText::_('COM_SH404SEF_EMPTYURL'));
			return false;
		}

		if (JString::substr($this->newurl, 0, 9) != 'index.php')
		{
			$this->setError(JText::_('COM_SH404SEF_BADURL'));
			return false;
		}

		// check for existing record, even if id is empty. This may happen
		// in some circumstances, when saving data from popup, ajaxified, dialog boxes
		if (empty($this->id))
		{
			try
			{
				$existingId = ShlDbHelper::selectResult($this->_tbl, 'id', array('newurl' => $this->newurl));
				if (!empty($existingId))
				{
					$this->id = $existingId;
				}
			}
			catch (Exception $e)
			{

			}
		}
		return true;
	}

	/**
	 * Inserts a new row if id is zero or updates an existing row in the database table
	 *
	 * Overloaded to check for empty metas data. We don't want to store totally
	 * empty values in the table. This may happen if user has cleared all fields
	 * to remove existing metas, or if the url only was customized for instance
	 *
	 * @access public
	 *
	 * @param boolean If false, null object variables are not updated
	 *
	 * @return null|string null if successful otherwise returns and error message
	 */
	function store($updateNulls = false)
	{

		// find if record is empty (other than id of record)
		$sum = '';
		foreach ($this->getProperties() as $k => $v)
		{
			if ($k != $this->_tbl_key && $k != 'newurl')
			{
				$sum .= $v;
			}
		}

		$k = $this->_tbl_key;
		// trying to save a new empty record, quit but return true so no error
		if (empty($sum) && empty($this->$k))
		{
			return true;
		}

		// trying to save an empty record, but record already exists.
		// we want to delete the record instead of overwriting it
		if (empty($sum))
		{
			$this->delete();
			$error = $this->getError();
			return empty($error);
		}

		return parent::store($updateNulls);
	}

}
