-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: salacious
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `e42xo_action_log_config`
--

DROP TABLE IF EXISTS `e42xo_action_log_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_action_log_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_action_logs`
--

DROP TABLE IF EXISTS `e42xo_action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_action_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_action_logs_extensions`
--

DROP TABLE IF EXISTS `e42xo_action_logs_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_action_logs_extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_action_logs_users`
--

DROP TABLE IF EXISTS `e42xo_action_logs_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_action_logs_users` (
  `user_id` int(11) unsigned NOT NULL,
  `notify` tinyint(1) unsigned NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_action`
--

DROP TABLE IF EXISTS `e42xo_acymailing_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_action` (
  `action_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `frequency` int(10) unsigned NOT NULL,
  `nextdate` int(10) unsigned NOT NULL,
  `description` text,
  `server` varchar(255) NOT NULL,
  `port` varchar(50) NOT NULL,
  `connection_method` varchar(10) NOT NULL DEFAULT '0',
  `secure_method` varchar(10) NOT NULL DEFAULT '0',
  `self_signed` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `conditions` text,
  `actions` text,
  `report` text,
  `delete_wrong_emails` tinyint(4) NOT NULL DEFAULT '0',
  `senderfrom` tinyint(4) NOT NULL DEFAULT '0',
  `senderto` tinyint(4) NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_config`
--

DROP TABLE IF EXISTS `e42xo_acymailing_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_config` (
  `namekey` varchar(200) NOT NULL,
  `value` text,
  PRIMARY KEY (`namekey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_fields`
--

DROP TABLE IF EXISTS `e42xo_acymailing_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_fields` (
  `fieldid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(250) NOT NULL,
  `namekey` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `value` text NOT NULL,
  `published` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ordering` smallint(5) unsigned DEFAULT '99',
  `options` text,
  `core` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `backend` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `frontcomp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frontform` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `default` varchar(250) DEFAULT NULL,
  `listing` tinyint(3) unsigned DEFAULT NULL,
  `frontlisting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frontjoomlaprofile` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frontjoomlaregistration` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `joomlaprofile` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `access` varchar(250) NOT NULL DEFAULT 'all',
  `fieldcat` int(11) NOT NULL DEFAULT '0',
  `listingfilter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frontlistingfilter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  UNIQUE KEY `namekey` (`namekey`),
  KEY `orderingindex` (`published`,`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_filter`
--

DROP TABLE IF EXISTS `e42xo_acymailing_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_filter` (
  `filid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `published` tinyint(3) unsigned DEFAULT NULL,
  `lasttime` int(10) unsigned DEFAULT NULL,
  `trigger` text,
  `report` text,
  `action` text,
  `filter` text,
  PRIMARY KEY (`filid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_forward`
--

DROP TABLE IF EXISTS `e42xo_acymailing_forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_forward` (
  `subid` int(10) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `nbforwarded` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_geolocation`
--

DROP TABLE IF EXISTS `e42xo_acymailing_geolocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_geolocation` (
  `geolocation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `geolocation_subid` int(10) unsigned NOT NULL DEFAULT '0',
  `geolocation_type` varchar(255) NOT NULL DEFAULT 'subscription',
  `geolocation_ip` varchar(255) NOT NULL DEFAULT '',
  `geolocation_created` int(10) unsigned NOT NULL DEFAULT '0',
  `geolocation_latitude` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `geolocation_longitude` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `geolocation_postal_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_country` varchar(255) NOT NULL DEFAULT '',
  `geolocation_country_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_state` varchar(255) NOT NULL DEFAULT '',
  `geolocation_state_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_city` varchar(255) NOT NULL DEFAULT '',
  `geolocation_continent` varchar(255) NOT NULL DEFAULT '',
  `geolocation_timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`geolocation_id`),
  KEY `geolocation_type` (`geolocation_subid`,`geolocation_type`),
  KEY `geolocation_ip_created` (`geolocation_ip`,`geolocation_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_history`
--

DROP TABLE IF EXISTS `e42xo_acymailing_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_history` (
  `subid` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `action` varchar(50) NOT NULL COMMENT 'different actions: created,modified,confirmed',
  `data` text,
  `source` text,
  `mailid` mediumint(8) unsigned DEFAULT NULL,
  KEY `subid` (`subid`,`date`),
  KEY `dateindex` (`date`),
  KEY `actionindex` (`action`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_list`
--

DROP TABLE IF EXISTS `e42xo_acymailing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_list` (
  `name` varchar(250) NOT NULL,
  `description` text,
  `ordering` smallint(5) unsigned DEFAULT '0',
  `listid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `published` tinyint(4) DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `alias` varchar(250) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `welmailid` mediumint(9) DEFAULT NULL,
  `unsubmailid` mediumint(9) DEFAULT NULL,
  `type` enum('list','campaign') NOT NULL DEFAULT 'list',
  `access_sub` varchar(250) NOT NULL DEFAULT 'all',
  `access_manage` varchar(250) NOT NULL DEFAULT 'none',
  `languages` varchar(250) NOT NULL DEFAULT 'all',
  `startrule` varchar(50) NOT NULL DEFAULT '0',
  `category` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`listid`),
  KEY `typeorderingindex` (`type`,`ordering`),
  KEY `useridindex` (`userid`),
  KEY `typeuseridindex` (`type`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_listcampaign`
--

DROP TABLE IF EXISTS `e42xo_acymailing_listcampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_listcampaign` (
  `campaignid` smallint(5) unsigned NOT NULL,
  `listid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`campaignid`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_listmail`
--

DROP TABLE IF EXISTS `e42xo_acymailing_listmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_listmail` (
  `listid` smallint(5) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`listid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_listsub`
--

DROP TABLE IF EXISTS `e42xo_acymailing_listsub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_listsub` (
  `listid` smallint(5) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `subdate` int(10) unsigned DEFAULT NULL,
  `unsubdate` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`listid`,`subid`),
  KEY `subidindex` (`subid`),
  KEY `listidstatusindex` (`listid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_mail`
--

DROP TABLE IF EXISTS `e42xo_acymailing_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_mail` (
  `mailid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` text,
  `body` longtext NOT NULL,
  `altbody` longtext NOT NULL,
  `published` tinyint(4) DEFAULT '1',
  `senddate` int(10) unsigned DEFAULT NULL,
  `created` int(10) unsigned DEFAULT NULL,
  `fromname` varchar(250) DEFAULT NULL,
  `fromemail` varchar(250) DEFAULT NULL,
  `replyname` varchar(250) DEFAULT NULL,
  `replyemail` varchar(250) DEFAULT NULL,
  `bccaddresses` varchar(250) DEFAULT NULL,
  `type` enum('news','autonews','followup','unsub','welcome','notification','joomlanotification','action') NOT NULL DEFAULT 'news',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `userid` int(10) unsigned DEFAULT NULL,
  `alias` varchar(250) DEFAULT NULL,
  `attach` text,
  `favicon` text,
  `html` tinyint(4) NOT NULL DEFAULT '1',
  `tempid` smallint(6) NOT NULL DEFAULT '0',
  `key` varchar(200) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `params` text,
  `sentby` int(10) unsigned DEFAULT NULL,
  `metakey` text,
  `metadesc` text,
  `filter` text,
  `language` varchar(50) NOT NULL DEFAULT '',
  `abtesting` varchar(250) DEFAULT NULL,
  `thumb` varchar(250) DEFAULT NULL,
  `summary` text NOT NULL,
  PRIMARY KEY (`mailid`),
  KEY `senddate` (`senddate`),
  KEY `typemailidindex` (`type`,`mailid`),
  KEY `useridindex` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_queue`
--

DROP TABLE IF EXISTS `e42xo_acymailing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_queue` (
  `senddate` int(10) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  `priority` tinyint(3) unsigned DEFAULT '3',
  `try` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paramqueue` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`subid`,`mailid`),
  KEY `listingindex` (`senddate`,`subid`),
  KEY `mailidindex` (`mailid`),
  KEY `orderingindex` (`priority`,`senddate`,`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_rules`
--

DROP TABLE IF EXISTS `e42xo_acymailing_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_rules` (
  `ruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `ordering` smallint(6) DEFAULT NULL,
  `regex` text NOT NULL,
  `executed_on` text NOT NULL,
  `action_message` text NOT NULL,
  `action_user` text NOT NULL,
  `published` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ruleid`),
  KEY `ordering` (`published`,`ordering`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_stats`
--

DROP TABLE IF EXISTS `e42xo_acymailing_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_stats` (
  `mailid` mediumint(8) unsigned NOT NULL,
  `senthtml` int(10) unsigned NOT NULL DEFAULT '0',
  `senttext` int(10) unsigned NOT NULL DEFAULT '0',
  `senddate` int(10) unsigned NOT NULL,
  `openunique` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `opentotal` int(10) unsigned NOT NULL DEFAULT '0',
  `bounceunique` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fail` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicktotal` int(10) unsigned NOT NULL DEFAULT '0',
  `clickunique` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `unsub` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forward` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bouncedetails` text,
  PRIMARY KEY (`mailid`),
  KEY `senddateindex` (`senddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_subscriber`
--

DROP TABLE IF EXISTS `e42xo_acymailing_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_subscriber` (
  `subid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL DEFAULT '',
  `created` int(10) unsigned DEFAULT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `accept` tinyint(4) NOT NULL DEFAULT '1',
  `ip` varchar(100) DEFAULT NULL,
  `html` tinyint(4) NOT NULL DEFAULT '1',
  `key` varchar(250) DEFAULT NULL,
  `confirmed_date` int(10) unsigned NOT NULL DEFAULT '0',
  `confirmed_ip` varchar(100) DEFAULT NULL,
  `lastopen_date` int(10) unsigned NOT NULL DEFAULT '0',
  `lastopen_ip` varchar(100) DEFAULT NULL,
  `lastclick_date` int(10) unsigned NOT NULL DEFAULT '0',
  `lastsent_date` int(10) unsigned NOT NULL DEFAULT '0',
  `source` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`subid`),
  UNIQUE KEY `email` (`email`),
  KEY `userid` (`userid`),
  KEY `queueindex` (`enabled`,`accept`,`confirmed`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_tag`
--

DROP TABLE IF EXISTS `e42xo_acymailing_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_tag` (
  `tagid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`tagid`),
  KEY `useridindex` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_tagmail`
--

DROP TABLE IF EXISTS `e42xo_acymailing_tagmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_tagmail` (
  `tagid` smallint(5) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`tagid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_template`
--

DROP TABLE IF EXISTS `e42xo_acymailing_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_template` (
  `tempid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `body` longtext,
  `altbody` longtext,
  `created` int(10) unsigned DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  `premium` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` smallint(5) unsigned DEFAULT '0',
  `namekey` varchar(50) NOT NULL,
  `styles` text,
  `subject` varchar(250) DEFAULT NULL,
  `stylesheet` text,
  `fromname` varchar(250) DEFAULT NULL,
  `fromemail` varchar(250) DEFAULT NULL,
  `replyname` varchar(250) DEFAULT NULL,
  `replyemail` varchar(250) DEFAULT NULL,
  `thumb` varchar(250) DEFAULT NULL,
  `readmore` varchar(250) DEFAULT NULL,
  `access` varchar(250) NOT NULL DEFAULT 'all',
  `category` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`tempid`),
  UNIQUE KEY `namekey` (`namekey`),
  KEY `orderingindex` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_url`
--

DROP TABLE IF EXISTS `e42xo_acymailing_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_url` (
  `urlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`urlid`),
  KEY `url` (`url`(250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_urlclick`
--

DROP TABLE IF EXISTS `e42xo_acymailing_urlclick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_urlclick` (
  `urlid` int(10) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  `click` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subid` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`urlid`,`mailid`,`subid`),
  KEY `dateindex` (`date`),
  KEY `mailidindex` (`mailid`),
  KEY `subidindex` (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_acymailing_userstats`
--

DROP TABLE IF EXISTS `e42xo_acymailing_userstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_acymailing_userstats` (
  `mailid` mediumint(8) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `html` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sent` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `senddate` int(10) unsigned NOT NULL,
  `open` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `opendate` int(11) NOT NULL,
  `bounce` tinyint(4) NOT NULL DEFAULT '0',
  `fail` tinyint(4) NOT NULL DEFAULT '0',
  `ip` varchar(100) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `browser_version` tinyint(3) unsigned DEFAULT NULL,
  `is_mobile` tinyint(3) unsigned DEFAULT NULL,
  `mobile_os` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `bouncerule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mailid`,`subid`),
  KEY `senddateindex` (`senddate`),
  KEY `subidindex` (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_ak_profiles`
--

DROP TABLE IF EXISTS `e42xo_ak_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_ak_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci,
  `filters` longtext COLLATE utf8mb4_unicode_ci,
  `quickicon` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_ak_stats`
--

DROP TABLE IF EXISTS `e42xo_ak_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_ak_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'run',
  `origin` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'full',
  `profile_id` bigint(20) NOT NULL DEFAULT '1',
  `archivename` longtext COLLATE utf8mb4_unicode_ci,
  `absolute_path` longtext COLLATE utf8mb4_unicode_ci,
  `multipart` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backupid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesexist` tinyint(3) NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_size` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fullstatus` (`filesexist`,`status`),
  KEY `idx_stale` (`status`,`origin`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_ak_storage`
--

DROP TABLE IF EXISTS `e42xo_ak_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_ak_storage` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`tag`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_akeeba_common`
--

DROP TABLE IF EXISTS `e42xo_akeeba_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_akeeba_common` (
  `key` varchar(190) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_assets`
--

DROP TABLE IF EXISTS `e42xo_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_associations`
--

DROP TABLE IF EXISTS `e42xo_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_banner_clients`
--

DROP TABLE IF EXISTS `e42xo_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_banner_clients_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_banner_clients_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_banner_clients_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `extrainfo` mediumtext,
  `state` tinyint(3) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `1d1b91b8a8591eef5d951add951512aa` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `d5f871880cbf2de8c8b8a945c01f2e56` (`id`),
  CONSTRAINT `d5f871880cbf2de8c8b8a945c01f2e56` FOREIGN KEY (`id`) REFERENCES `e42xo_banner_clients` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_banner_tracks`
--

DROP TABLE IF EXISTS `e42xo_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_banners`
--

DROP TABLE IF EXISTS `e42xo_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_banners_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_banners_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_banners_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `clickurl` varchar(200) DEFAULT NULL,
  `custombannercode` varchar(2048) DEFAULT NULL,
  `state` tinyint(3) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `32630fd13c41b827067dbe3262481cfc` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `ef452f671eef13803e541d0383fbb08d` (`id`),
  CONSTRAINT `ef452f671eef13803e541d0383fbb08d` FOREIGN KEY (`id`) REFERENCES `e42xo_banners` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_categories`
--

DROP TABLE IF EXISTS `e42xo_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_categories_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_categories_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_categories_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(400) DEFAULT NULL,
  `description` longtext,
  `published` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `8cc548afadc9c00a0de03f842bcc261c` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `e73711c01d1111144ad4e4937c2542d7` (`id`),
  CONSTRAINT `e73711c01d1111144ad4e4937c2542d7` FOREIGN KEY (`id`) REFERENCES `e42xo_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_contact_details`
--

DROP TABLE IF EXISTS `e42xo_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_contact_details_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_contact_details_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_contact_details_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(400) DEFAULT NULL,
  `con_position` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `address` mediumtext,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` longtext,
  `params` mediumtext,
  `published` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `43f8bb1d4be5a1d4132d28395ebe397d` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `e47b20a222b419abae309150242a86d2` (`id`),
  CONSTRAINT `e47b20a222b419abae309150242a86d2` FOREIGN KEY (`id`) REFERENCES `e42xo_contact_details` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_content`
--

DROP TABLE IF EXISTS `e42xo_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_content_frontpage`
--

DROP TABLE IF EXISTS `e42xo_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_content_rating`
--

DROP TABLE IF EXISTS `e42xo_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_content_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_content_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_content_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `introtext` longtext,
  `fulltext` longtext,
  `metakey` mediumtext,
  `metadesc` mediumtext,
  `state` tinyint(3) DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `attribs` varchar(5120) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `8a398786a076fd68d4ffa61375320fae` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `429164c1b039d18880ed64f04f0450ce` (`id`),
  CONSTRAINT `429164c1b039d18880ed64f04f0450ce` FOREIGN KEY (`id`) REFERENCES `e42xo_content` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_content_types`
--

DROP TABLE IF EXISTS `e42xo_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_contentitem_tag_map`
--

DROP TABLE IF EXISTS `e42xo_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_core_log_searches`
--

DROP TABLE IF EXISTS `e42xo_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_extensions`
--

DROP TABLE IF EXISTS `e42xo_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_extensions_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_extensions_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_extensions_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `extension_id` int(11) DEFAULT NULL,
  `params` mediumtext,
  `enabled` tinyint(3) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `affcdda8d9100e39bf0d7633b3219a6d` (`rctranslations_language`,`rctranslations_state`,`extension_id`),
  KEY `8929473690726fea65dd7a37f7e4c34c` (`extension_id`),
  CONSTRAINT `8929473690726fea65dd7a37f7e4c34c` FOREIGN KEY (`extension_id`) REFERENCES `e42xo_extensions` (`extension_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_fields`
--

DROP TABLE IF EXISTS `e42xo_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_fields_categories`
--

DROP TABLE IF EXISTS `e42xo_fields_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_fields_groups`
--

DROP TABLE IF EXISTS `e42xo_fields_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_fields_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_fields_values`
--

DROP TABLE IF EXISTS `e42xo_fields_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_fields_values` (
  `field_id` int(10) unsigned NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_filters`
--

DROP TABLE IF EXISTS `e42xo_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  `params` longtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links`
--

DROP TABLE IF EXISTS `e42xo_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`),
  KEY `idx_title` (`title`(100))
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms0`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms1`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms2`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms3`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms4`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms5`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms6`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms7`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms8`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_terms9`
--

DROP TABLE IF EXISTS `e42xo_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_termsa`
--

DROP TABLE IF EXISTS `e42xo_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_termsb`
--

DROP TABLE IF EXISTS `e42xo_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_termsc`
--

DROP TABLE IF EXISTS `e42xo_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_termsd`
--

DROP TABLE IF EXISTS `e42xo_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_termse`
--

DROP TABLE IF EXISTS `e42xo_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_links_termsf`
--

DROP TABLE IF EXISTS `e42xo_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_taxonomy`
--

DROP TABLE IF EXISTS `e42xo_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `e42xo_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_terms`
--

DROP TABLE IF EXISTS `e42xo_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB AUTO_INCREMENT=7520 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_terms_common`
--

DROP TABLE IF EXISTS `e42xo_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_tokens`
--

DROP TABLE IF EXISTS `e42xo_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `e42xo_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_finder_types`
--

DROP TABLE IF EXISTS `e42xo_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_languages`
--

DROP TABLE IF EXISTS `e42xo_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_languages_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_languages_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_languages_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `lang_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `148983a9c74308b30cb527e06c33753d` (`rctranslations_language`,`rctranslations_state`,`lang_id`),
  KEY `bd4599ff5626495934313cd2dd2f193f` (`lang_id`),
  CONSTRAINT `bd4599ff5626495934313cd2dd2f193f` FOREIGN KEY (`lang_id`) REFERENCES `e42xo_languages` (`lang_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_menu`
--

DROP TABLE IF EXISTS `e42xo_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100))
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_menu_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_menu_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_menu_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(400) DEFAULT NULL,
  `link` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `home` tinyint(3) unsigned DEFAULT NULL,
  `params` mediumtext,
  `published` tinyint(4) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `b02100e875443b34367a81dc9d95f4af` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `a83ab8d777bccef0536202809d0e9dda` (`id`),
  CONSTRAINT `a83ab8d777bccef0536202809d0e9dda` FOREIGN KEY (`id`) REFERENCES `e42xo_menu` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_menu_types`
--

DROP TABLE IF EXISTS `e42xo_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_messages`
--

DROP TABLE IF EXISTS `e42xo_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_messages_cfg`
--

DROP TABLE IF EXISTS `e42xo_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_modules`
--

DROP TABLE IF EXISTS `e42xo_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_modules_menu`
--

DROP TABLE IF EXISTS `e42xo_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_modules_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_modules_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_modules_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` mediumtext,
  `params` mediumtext,
  `published` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `55f570cb6475cab7d6fa375cf222bf39` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `b834c3b68c433ca31fe28b3f92b450f7` (`id`),
  CONSTRAINT `b834c3b68c433ca31fe28b3f92b450f7` FOREIGN KEY (`id`) REFERENCES `e42xo_modules` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_newsfeeds`
--

DROP TABLE IF EXISTS `e42xo_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_newsfeeds_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_newsfeeds_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_newsfeeds_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `alias` varchar(400) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `55333a66f3ca59319a07a56ade72e34d` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `74e4bceb50a66d8b78ec2ce8dd0d91dc` (`id`),
  CONSTRAINT `74e4bceb50a66d8b78ec2ce8dd0d91dc` FOREIGN KEY (`id`) REFERENCES `e42xo_newsfeeds` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_overrider`
--

DROP TABLE IF EXISTS `e42xo_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_postinstall_messages`
--

DROP TABLE IF EXISTS `e42xo_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_privacy_consents`
--

DROP TABLE IF EXISTS `e42xo_privacy_consents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_privacy_consents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `state` int(10) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_privacy_requests`
--

DROP TABLE IF EXISTS `e42xo_privacy_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_privacy_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_country`
--

DROP TABLE IF EXISTS `e42xo_redcore_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_country` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alpha2` char(2) NOT NULL,
  `alpha3` char(3) NOT NULL,
  `numeric` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`),
  UNIQUE KEY `idx_alpha2` (`alpha2`),
  UNIQUE KEY `idx_alpha3` (`alpha3`),
  UNIQUE KEY `idx_numeric` (`numeric`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_country_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_redcore_country_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_country_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `e6ca02485e9f3164c85382960b76ffab` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `e7cd1db7c7470719ba0c03c3229e368c` (`id`),
  CONSTRAINT `e7cd1db7c7470719ba0c03c3229e368c` FOREIGN KEY (`id`) REFERENCES `e42xo_redcore_country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_currency`
--

DROP TABLE IF EXISTS `e42xo_redcore_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_currency` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alpha3` char(3) NOT NULL,
  `numeric` smallint(3) unsigned NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `symbol_position` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'display currency symbol before (0) or after (1) price',
  `decimals` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'number of decimals to show in prices',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'disabled(0) / enabled(1)',
  `blank_space` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'display a blank space between the currency symbol and the price',
  `decimal_separator` varchar(1) NOT NULL DEFAULT ',',
  `thousands_separator` varchar(1) NOT NULL DEFAULT '.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_alpha3` (`alpha3`),
  UNIQUE KEY `idx_numeric` (`numeric`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_currency_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_redcore_currency_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_currency_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `8d83880f68ae28e032d42794831ab45c` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `ffcfde4bda4991e67f20ddf67ff0ece7` (`id`),
  CONSTRAINT `ffcfde4bda4991e67f20ddf67ff0ece7` FOREIGN KEY (`id`) REFERENCES `e42xo_redcore_currency` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_access_tokens`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL DEFAULT '',
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` text,
  PRIMARY KEY (`access_token`),
  KEY `idx_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_authorization_codes`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_authorization_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL DEFAULT '',
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` text,
  PRIMARY KEY (`authorization_code`),
  KEY `idx_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_clients`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `client_secret` varchar(80) NOT NULL DEFAULT '',
  `redirect_uri` varchar(2000) NOT NULL DEFAULT '',
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` text,
  `user_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_jti`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_jti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_jti` (
  `issuer` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `audiance` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jti` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_jwt`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_jwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_jwt` (
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_public_keys`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_public_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_public_keys` (
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `public_key` varchar(2000) DEFAULT NULL,
  `private_key` varchar(2000) DEFAULT NULL,
  `encryption_algorithm` varchar(100) DEFAULT 'RS256',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL DEFAULT '',
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` text,
  PRIMARY KEY (`refresh_token`),
  KEY `idx_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_scopes`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_oauth_users`
--

DROP TABLE IF EXISTS `e42xo_redcore_oauth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_oauth_users` (
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_payment_configuration`
--

DROP TABLE IF EXISTS `e42xo_redcore_payment_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_payment_configuration` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_name` varchar(255) NOT NULL DEFAULT '',
  `owner_name` varchar(255) NOT NULL DEFAULT '',
  `payment_name` varchar(50) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_extension_config` (`extension_name`,`owner_name`,`payment_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_payment_log`
--

DROP TABLE IF EXISTS `e42xo_redcore_payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_payment_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(100) NOT NULL DEFAULT '',
  `referrer` varchar(2000) NOT NULL DEFAULT '',
  `message_uri` varchar(2000) NOT NULL DEFAULT '',
  `message_post` text NOT NULL,
  `message_text` text NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT '',
  `transaction_id` varchar(255) NOT NULL DEFAULT '',
  `customer_note` varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_payment_id` (`payment_id`),
  KEY `idx_transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_payments`
--

DROP TABLE IF EXISTS `e42xo_redcore_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_name` varchar(255) NOT NULL DEFAULT '',
  `owner_name` varchar(255) NOT NULL DEFAULT '',
  `payment_name` varchar(50) NOT NULL DEFAULT '',
  `sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `order_name` varchar(255) NOT NULL DEFAULT '',
  `order_id` varchar(255) NOT NULL DEFAULT '',
  `url_cancel` varchar(2000) NOT NULL DEFAULT '',
  `url_accept` varchar(2000) NOT NULL DEFAULT '',
  `client_email` varchar(255) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `confirmed_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transaction_id` varchar(255) NOT NULL DEFAULT '',
  `amount_original` decimal(10,2) NOT NULL,
  `amount_order_tax` decimal(10,2) NOT NULL,
  `order_tax_details` varchar(2000) NOT NULL DEFAULT '',
  `amount_shipping` decimal(10,2) NOT NULL,
  `shipping_details` varchar(2000) NOT NULL DEFAULT '',
  `amount_payment_fee` decimal(10,2) NOT NULL,
  `amount_total` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `currency` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(255) NOT NULL DEFAULT '',
  `customer_note` varchar(2000) NOT NULL DEFAULT '',
  `status` varchar(32) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `retry_counter` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_extension_order_id` (`extension_name`,`order_id`),
  KEY `idx_extension_payment` (`extension_name`,`owner_name`,`payment_name`),
  KEY `idx_payment_confirmed` (`confirmed_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_schemas`
--

DROP TABLE IF EXISTS `e42xo_redcore_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_schemas` (
  `asset_id` varchar(255) NOT NULL,
  `fields` text NOT NULL,
  `cached_on` datetime NOT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_translation_columns`
--

DROP TABLE IF EXISTS `e42xo_redcore_translation_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_translation_columns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `translation_table_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `column_type` varchar(45) NOT NULL DEFAULT 'translate',
  `value_type` varchar(45) NOT NULL DEFAULT 'text',
  `fallback` tinyint(1) NOT NULL DEFAULT '0',
  `filter` varchar(50) NOT NULL DEFAULT 'RAW',
  `description` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_translation_columns_keys` (`translation_table_id`,`name`),
  KEY `idx_translation_columns_keys` (`translation_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_translation_tables`
--

DROP TABLE IF EXISTS `e42xo_redcore_translation_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_translation_tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `extension_name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '1.0.0',
  `primary_columns` varchar(100) NOT NULL DEFAULT 'id',
  `translate_columns` varchar(500) NOT NULL DEFAULT '',
  `fallback_columns` varchar(500) NOT NULL DEFAULT '',
  `form_links` text,
  `xml_path` varchar(500) NOT NULL DEFAULT '',
  `xml_hashed` varchar(32) NOT NULL DEFAULT '',
  `filter_query` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_translations_keys` (`name`,`extension_name`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redcore_webservices`
--

DROP TABLE IF EXISTS `e42xo_redcore_webservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redcore_webservices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(5) NOT NULL DEFAULT '1.0.0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `xmlFile` varchar(255) NOT NULL DEFAULT '',
  `xmlHashed` varchar(32) NOT NULL DEFAULT '',
  `operations` text,
  `scopes` text,
  `client` varchar(15) NOT NULL DEFAULT 'site',
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_webservice_keys` (`client`,`name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redgit_callback`
--

DROP TABLE IF EXISTS `e42xo_redgit_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redgit_callback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `remote_ip` varchar(255) NOT NULL,
  `data` text,
  `state` tinyint(2) unsigned DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '		',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redirect_links`
--

DROP TABLE IF EXISTS `e42xo_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_link_modifed` (`modified_date`),
  KEY `idx_old_url` (`old_url`(100))
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redproductfinder_association_tag`
--

DROP TABLE IF EXISTS `e42xo_redproductfinder_association_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redproductfinder_association_tag` (
  `association_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `quality_score` int(10) unsigned NOT NULL,
  UNIQUE KEY `association_tag` (`association_id`,`tag_id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redPRODUCTFINDER Association Tag Cross Reference';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redproductfinder_associations`
--

DROP TABLE IF EXISTS `e42xo_redproductfinder_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redproductfinder_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `aliases` varchar(255) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='redPRODUCTFINDER Associatons';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redproductfinder_dependent_tag`
--

DROP TABLE IF EXISTS `e42xo_redproductfinder_dependent_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redproductfinder_dependent_tag` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `dependent_tags` text NOT NULL,
  UNIQUE KEY `product_id` (`product_id`,`tag_id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redPRODUCTFINDER dependent tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redproductfinder_filters`
--

DROP TABLE IF EXISTS `e42xo_redproductfinder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redproductfinder_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(4) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  `filter_name` varchar(255) NOT NULL,
  `type_select` varchar(50) NOT NULL,
  `tag_id` text NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `select_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redPRODUCTFINDER Filters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redproductfinder_forms`
--

DROP TABLE IF EXISTS `e42xo_redproductfinder_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redproductfinder_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formname` varchar(100) NOT NULL DEFAULT 'NoName',
  `published` int(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `showname` int(1) NOT NULL DEFAULT '0',
  `classname` varchar(45) DEFAULT NULL,
  `formexpires` tinyint(1) NOT NULL DEFAULT '1',
  `dependency` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redPRODUCTFINDER Forms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redproductfinder_tag_type`
--

DROP TABLE IF EXISTS `e42xo_redproductfinder_tag_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redproductfinder_tag_type` (
  `tag_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `tag_type` (`tag_id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redPRODUCTFINDER Tag Type Cross Reference';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redproductfinder_tags`
--

DROP TABLE IF EXISTS `e42xo_redproductfinder_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redproductfinder_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `aliases` varchar(255) NOT NULL,
  `publish_up` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redPRODUCTFINDER Tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redproductfinder_types`
--

DROP TABLE IF EXISTS `e42xo_redproductfinder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redproductfinder_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `type_select` varchar(45) NOT NULL DEFAULT 'generic',
  `tooltip` varchar(255) DEFAULT NULL,
  `form_id` int(11) NOT NULL,
  `picker` tinyint(11) NOT NULL,
  `extrafield` int(11) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redPRODUCTFINDER Tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_alerts`
--

DROP TABLE IF EXISTS `e42xo_redshop_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `sent_date` datetime NOT NULL,
  `read` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Notification Alert';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_attribute_set`
--

DROP TABLE IF EXISTS `e42xo_redshop_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_attribute_set` (
  `attribute_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_set_name` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`attribute_set_id`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Attribute set detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_cart`
--

DROP TABLE IF EXISTS `e42xo_redshop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_cart` (
  `session_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `section` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `time` double NOT NULL,
  PRIMARY KEY (`session_id`,`product_id`,`section`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_section` (`section`),
  KEY `idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Cart';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_catalog`
--

DROP TABLE IF EXISTS `e42xo_redshop_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_catalog` (
  `catalog_id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_name` varchar(250) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`catalog_id`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Catalog';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_catalog_colour`
--

DROP TABLE IF EXISTS `e42xo_redshop_catalog_colour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_catalog_colour` (
  `colour_id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_id` int(11) NOT NULL,
  `code_image` varchar(250) NOT NULL,
  `is_image` tinyint(4) NOT NULL,
  PRIMARY KEY (`colour_id`),
  KEY `idx_sample_id` (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Catalog Colour';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_catalog_request`
--

DROP TABLE IF EXISTS `e42xo_redshop_catalog_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_catalog_request` (
  `catalog_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `registerDate` int(11) NOT NULL,
  `block` tinyint(4) NOT NULL,
  `reminder_1` tinyint(4) NOT NULL,
  `reminder_2` tinyint(4) NOT NULL,
  `reminder_3` tinyint(4) NOT NULL,
  PRIMARY KEY (`catalog_user_id`),
  KEY `idx_block` (`block`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Catalog Request';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_catalog_sample`
--

DROP TABLE IF EXISTS `e42xo_redshop_catalog_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_catalog_sample` (
  `sample_id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_name` varchar(100) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`sample_id`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Catalog Sample';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_category`
--

DROP TABLE IF EXISTS `e42xo_redshop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `template` int(11) NOT NULL DEFAULT '0',
  `more_template` varchar(255) NOT NULL DEFAULT '',
  `products_per_page` int(11) NOT NULL,
  `category_thumb_image` varchar(250) NOT NULL,
  `category_full_image` varchar(250) NOT NULL,
  `metakey` varchar(250) NOT NULL,
  `metadesc` longtext NOT NULL,
  `metalanguage_setting` text NOT NULL,
  `metarobot_info` text NOT NULL,
  `pagetitle` text NOT NULL,
  `pageheading` longtext NOT NULL,
  `sef_url` text NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `category_pdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL,
  `canonical_url` text NOT NULL,
  `category_back_full_image` varchar(250) NOT NULL,
  `compare_template_id` varchar(255) NOT NULL,
  `append_to_global_seo` enum('append','prepend','replace') NOT NULL DEFAULT 'append',
  `alias` varchar(400) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `asset_id` int(11) DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(11) DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_filter_params` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_published` (`published`),
  KEY `e42xo_rs_idx_category_published` (`published`),
  KEY `e42xo_rs_idx_left_right` (`lft`,`rgt`),
  KEY `e42xo_rs_idx_alias` (`alias`(255)),
  KEY `e42xo_rs_idx_path` (`path`),
  KEY `e42xo_rs_idx_category_parent` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='redSHOP Category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_country`
--

DROP TABLE IF EXISTS `e42xo_redshop_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(64) NOT NULL DEFAULT '',
  `country_3_code` char(3) NOT NULL,
  `country_2_code` char(2) NOT NULL,
  `country_jtext` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e42xo_rs_idx_country_3_code` (`country_3_code`),
  UNIQUE KEY `e42xo_rs_idx_country_2_code` (`country_2_code`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COMMENT='Country records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_coupons`
--

DROP TABLE IF EXISTS `e42xo_redshop_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `value` decimal(12,2) NOT NULL DEFAULT '0.00',
  `start_date_old` double NOT NULL DEFAULT '0',
  `end_date_old` double NOT NULL DEFAULT '0',
  `effect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Global, 1 - User Specific',
  `userid` int(11) NOT NULL,
  `amount_left` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0',
  `subtotal` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `e42xo_rs_coupon_code` (`code`),
  KEY `e42xo_rs_coupon_type` (`type`),
  KEY `e42xo_rs_coupon_start_date` (`start_date`),
  KEY `e42xo_rs_coupon_end_date` (`end_date`),
  KEY `e42xo_rs_coupon_effect` (`effect`),
  KEY `e42xo_rs_coupon_user_id` (`userid`),
  KEY `e42xo_rs_coupon_left` (`amount_left`),
  KEY `e42xo_rs_coupon_published` (`published`),
  KEY `e42xo_rs_coupon_subtotal` (`subtotal`),
  KEY `e42xo_rs_coupon_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Coupons';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_coupons_transaction`
--

DROP TABLE IF EXISTS `e42xo_redshop_coupons_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_coupons_transaction` (
  `transaction_coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_value` decimal(10,3) NOT NULL,
  `userid` int(11) NOT NULL,
  `trancation_date` int(11) NOT NULL,
  `published` int(11) NOT NULL,
  PRIMARY KEY (`transaction_coupon_id`),
  KEY `idx_coupon_id` (`coupon_id`),
  KEY `idx_coupon_code` (`coupon_code`),
  KEY `idx_coupon_value` (`coupon_value`),
  KEY `idx_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Coupons Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_cron`
--

DROP TABLE IF EXISTS `e42xo_redshop_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_date` (`date`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Cron Job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_currency`
--

DROP TABLE IF EXISTS `e42xo_redshop_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` char(3) DEFAULT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `e42xo_rs_cur_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT='redSHOP Currency Detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_customer_question`
--

DROP TABLE IF EXISTS `e42xo_redshop_customer_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_customer_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `question_date` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `e42xo_rs_idx_published` (`published`),
  KEY `e42xo_rs_idx_product_id` (`product_id`),
  KEY `e42xo_rs_idx_parent_id` (`parent_id`),
  CONSTRAINT `e42xo_rs_customer_question_fk1` FOREIGN KEY (`product_id`) REFERENCES `e42xo_redshop_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='redSHOP Customer Question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_discount`
--

DROP TABLE IF EXISTS `e42xo_redshop_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_discount` (
  `discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `condition` tinyint(1) NOT NULL DEFAULT '1',
  `discount_amount` decimal(10,4) NOT NULL,
  `discount_type` tinyint(4) NOT NULL,
  `start_date` double NOT NULL,
  `end_date` double NOT NULL,
  `published` tinyint(4) NOT NULL,
  `name` varchar(250) NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`discount_id`),
  KEY `idx_start_date` (`start_date`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_published` (`published`),
  KEY `idx_discount_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Discount';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_discount_product`
--

DROP TABLE IF EXISTS `e42xo_redshop_discount_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_discount_product` (
  `discount_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `condition` tinyint(1) NOT NULL DEFAULT '1',
  `discount_amount` decimal(10,2) NOT NULL,
  `discount_type` tinyint(4) NOT NULL,
  `start_date` double NOT NULL,
  `end_date` double NOT NULL,
  `published` tinyint(4) NOT NULL,
  `category_ids` text NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`discount_product_id`),
  KEY `idx_published` (`published`),
  KEY `idx_start_date` (`start_date`),
  KEY `idx_end_date` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_discount_product_shoppers`
--

DROP TABLE IF EXISTS `e42xo_redshop_discount_product_shoppers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_discount_product_shoppers` (
  `discount_product_id` int(11) NOT NULL,
  `shopper_group_id` int(11) NOT NULL,
  KEY `idx_discount_product_id` (`discount_product_id`),
  KEY `idx_shopper_group_id` (`shopper_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_discount_shoppers`
--

DROP TABLE IF EXISTS `e42xo_redshop_discount_shoppers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_discount_shoppers` (
  `discount_id` int(11) NOT NULL,
  `shopper_group_id` int(11) NOT NULL,
  KEY `idx_discount_id` (`discount_id`),
  KEY `idx_shopper_group_id` (`shopper_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_economic_accountgroup`
--

DROP TABLE IF EXISTS `e42xo_redshop_economic_accountgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_economic_accountgroup` (
  `accountgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `accountgroup_name` varchar(255) NOT NULL,
  `economic_vat_account` varchar(255) NOT NULL,
  `economic_nonvat_account` varchar(255) NOT NULL,
  `economic_discount_nonvat_account` varchar(255) NOT NULL,
  `economic_shipping_vat_account` varchar(255) NOT NULL,
  `economic_shipping_nonvat_account` varchar(255) NOT NULL,
  `economic_discount_product_number` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `economic_service_nonvat_account` varchar(255) NOT NULL,
  `economic_discount_vat_account` varchar(255) NOT NULL,
  PRIMARY KEY (`accountgroup_id`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Economic Account Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_fields`
--

DROP TABLE IF EXISTS `e42xo_redshop_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` varchar(20) NOT NULL,
  `desc` longtext NOT NULL,
  `class` varchar(20) NOT NULL,
  `section` varchar(20) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `maxlength` int(11) NOT NULL,
  `cols` int(11) NOT NULL,
  `rows` int(11) NOT NULL,
  `size` tinyint(4) NOT NULL,
  `show_in_front` tinyint(4) NOT NULL,
  `required` tinyint(4) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL,
  `display_in_product` tinyint(4) NOT NULL,
  `is_searchable` tinyint(4) NOT NULL DEFAULT '0',
  `display_in_checkout` tinyint(4) NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `e42xo_rs_idx_field_published` (`published`),
  KEY `e42xo_rs_idx_field_section` (`section`),
  KEY `e42xo_rs_idx_field_type` (`type`),
  KEY `e42xo_rs_idx_field_required` (`required`),
  KEY `e42xo_rs_idx_field_name` (`name`),
  KEY `e42xo_rs_idx_field_show_in_front` (`show_in_front`),
  KEY `e42xo_rs_idx_field_display_in_product` (`display_in_product`),
  KEY `e42xo_rs_idx_field_common` (`id`,`name`,`published`,`section`),
  KEY `e42xo_rs_field_fk1` (`groupId`),
  CONSTRAINT `e42xo_rs_field_fk1` FOREIGN KEY (`groupId`) REFERENCES `e42xo_redshop_fields_group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='redSHOP Fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_fields_data`
--

DROP TABLE IF EXISTS `e42xo_redshop_fields_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_fields_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldid` int(11) DEFAULT NULL,
  `data_txt` longtext,
  `itemid` int(11) DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL,
  `alt_text` varchar(255) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  PRIMARY KEY (`data_id`),
  KEY `idx_fieldid` (`fieldid`),
  KEY `idx_itemid` (`itemid`),
  KEY `idx_section` (`section`),
  KEY `e42xo_field_data_common` (`itemid`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='redSHOP Fields Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_fields_group`
--

DROP TABLE IF EXISTS `e42xo_redshop_fields_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_fields_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `description` varchar(1024) NOT NULL DEFAULT '',
  `section` varchar(20) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `e42xo_rs_feld_group_idx1` (`section`),
  KEY `e42xo_rs_feld_group_idx2` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Custom fields groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_fields_value`
--

DROP TABLE IF EXISTS `e42xo_redshop_fields_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_fields_value` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `field_value` varchar(250) NOT NULL,
  `field_name` varchar(250) NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `idx_field_id` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='redSHOP Fields Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_giftcard`
--

DROP TABLE IF EXISTS `e42xo_redshop_giftcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_giftcard` (
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_name` varchar(255) NOT NULL,
  `giftcard_price` decimal(10,3) NOT NULL,
  `giftcard_value` decimal(10,3) NOT NULL,
  `giftcard_validity` int(11) NOT NULL,
  `giftcard_date` int(11) NOT NULL,
  `giftcard_bgimage` varchar(255) NOT NULL,
  `giftcard_image` varchar(255) NOT NULL,
  `published` int(11) NOT NULL,
  `giftcard_desc` longtext NOT NULL,
  `customer_amount` int(11) NOT NULL,
  `accountgroup_id` int(11) NOT NULL,
  `free_shipping` tinyint(4) NOT NULL,
  PRIMARY KEY (`giftcard_id`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='redSHOP Giftcard';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_mail`
--

DROP TABLE IF EXISTS `e42xo_redshop_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_section` varchar(255) NOT NULL,
  `mail_order_status` varchar(11) NOT NULL,
  `mail_body` longtext NOT NULL,
  `published` tinyint(4) NOT NULL,
  `mail_bcc` varchar(255) NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`mail_id`),
  KEY `idx_mail_section` (`mail_section`),
  KEY `idx_mail_order_status` (`mail_order_status`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='redSHOP Mail Center';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_manufacturer`
--

DROP TABLE IF EXISTS `e42xo_redshop_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `product_per_page` int(11) NOT NULL DEFAULT '0',
  `template_id` int(11) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metalanguage_setting` text NOT NULL,
  `metarobot_info` text NOT NULL,
  `pagetitle` text NOT NULL,
  `pageheading` text NOT NULL,
  `sef_url` text NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `manufacturer_url` varchar(255) NOT NULL DEFAULT '',
  `excluding_category_list` text NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `e42xo_manufacturer_published` (`published`),
  KEY `e42xo_manufacturer_common_idx` (`id`,`name`,`published`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='redSHOP Manufacturer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_mass_discount`
--

DROP TABLE IF EXISTS `e42xo_redshop_mass_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_mass_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_product` longtext NOT NULL,
  `category_id` longtext NOT NULL,
  `manufacturer_id` longtext NOT NULL,
  `type` tinyint(4) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Page Viewer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_media`
--

DROP TABLE IF EXISTS `e42xo_redshop_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(250) NOT NULL,
  `media_alternate_text` varchar(255) NOT NULL,
  `media_section` varchar(20) NOT NULL,
  `section_id` int(11) NOT NULL,
  `media_type` varchar(250) NOT NULL,
  `media_mimetype` varchar(20) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  `scope` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`media_id`),
  KEY `idx_section_id` (`section_id`),
  KEY `idx_media_section` (`media_section`),
  KEY `idx_media_type` (`media_type`),
  KEY `idx_media_name` (`media_name`),
  KEY `idx_published` (`published`),
  KEY `e42xo_rs_idx_media_common` (`section_id`,`media_section`,`media_type`,`published`,`ordering`),
  KEY `e42xo_rs_idx_media_scope` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='redSHOP Media';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_media_download`
--

DROP TABLE IF EXISTS `e42xo_redshop_media_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_media_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Media Additional Downloadable Files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_newsletter`
--

DROP TABLE IF EXISTS `e42xo_redshop_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_newsletter` (
  `newsletter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `template_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`newsletter_id`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Newsletter';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_newsletter_subscription`
--

DROP TABLE IF EXISTS `e42xo_redshop_newsletter_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_newsletter_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `newsletter_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `checkout` tinyint(4) NOT NULL,
  `published` int(11) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_newsletter_id` (`newsletter_id`),
  KEY `idx_email` (`email`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='redSHOP Newsletter subscribers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_newsletter_tracker`
--

DROP TABLE IF EXISTS `e42xo_redshop_newsletter_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_newsletter_tracker` (
  `tracker_id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletter_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `subscriber_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read` tinyint(4) NOT NULL,
  `date` double NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `idx_newsletter_id` (`newsletter_id`),
  KEY `idx_read` (`read`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COMMENT='redSHOP Newsletter Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_notifystock_users`
--

DROP TABLE IF EXISTS `e42xo_redshop_notifystock_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_notifystock_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `subproperty_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_status` int(11) NOT NULL DEFAULT '0',
  `email_not_login` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_common` (`product_id`,`property_id`,`subproperty_id`,`notification_status`,`user_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_order_acc_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_order_acc_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_order_acc_item` (
  `order_item_acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_acc_item_sku` varchar(255) NOT NULL,
  `order_acc_item_name` varchar(255) NOT NULL,
  `order_acc_price` decimal(15,4) NOT NULL,
  `order_acc_vat` decimal(15,4) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_acc_item_price` decimal(15,4) NOT NULL,
  `product_acc_final_price` decimal(15,4) NOT NULL,
  `product_attribute` text NOT NULL,
  PRIMARY KEY (`order_item_acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Order Accessory Item Detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_order_attribute_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_order_attribute_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_order_attribute_item` (
  `order_att_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `section` varchar(250) NOT NULL,
  `parent_section_id` int(11) NOT NULL,
  `section_name` varchar(250) NOT NULL,
  `section_price` decimal(15,4) NOT NULL,
  `section_vat` decimal(15,4) NOT NULL,
  `section_oprand` char(1) NOT NULL,
  `is_accessory_att` tinyint(4) NOT NULL,
  `stockroom_id` varchar(255) NOT NULL,
  `stockroom_quantity` varchar(255) NOT NULL,
  PRIMARY KEY (`order_att_item_id`),
  KEY `idx_order_item_id` (`order_item_id`),
  KEY `idx_section` (`section`),
  KEY `idx_parent_section_id` (`parent_section_id`),
  KEY `idx_is_accessory_att` (`is_accessory_att`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='redSHOP order Attribute item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_order_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_info_id` varchar(32) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_item_sku` varchar(64) NOT NULL DEFAULT '',
  `order_item_name` varchar(255) NOT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_item_price` decimal(15,4) DEFAULT NULL,
  `product_item_price_excl_vat` decimal(15,4) DEFAULT NULL,
  `product_final_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_item_currency` varchar(16) DEFAULT NULL,
  `order_status` varchar(250) DEFAULT NULL,
  `customer_note` text NOT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `product_attribute` text,
  `product_accessory` text NOT NULL,
  `delivery_time` int(11) NOT NULL,
  `stockroom_id` varchar(255) NOT NULL,
  `stockroom_quantity` varchar(255) NOT NULL,
  `is_split` tinyint(1) NOT NULL,
  `attribute_image` text NOT NULL,
  `wrapper_id` int(11) NOT NULL,
  `wrapper_price` decimal(10,2) NOT NULL,
  `is_giftcard` tinyint(4) NOT NULL,
  `giftcard_user_name` varchar(255) NOT NULL,
  `giftcard_user_email` varchar(255) NOT NULL,
  `product_item_old_price` decimal(10,4) NOT NULL,
  `product_purchase_price` decimal(10,4) NOT NULL,
  `discount_calc_data` text NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_user_info_id` (`user_info_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_order_status` (`order_status`),
  KEY `idx_cdate` (`cdate`),
  KEY `idx_is_giftcard` (`is_giftcard`),
  KEY `idx_product_quantity` (`product_id`,`product_quantity`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='redSHOP Order Item Detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_order_payment`
--

DROP TABLE IF EXISTS `e42xo_redshop_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_order_payment` (
  `payment_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `payment_method_id` int(11) DEFAULT NULL,
  `order_payment_code` varchar(30) NOT NULL DEFAULT '',
  `order_payment_cardname` blob NOT NULL,
  `order_payment_number` blob,
  `order_payment_ccv` blob NOT NULL,
  `order_payment_amount` double(10,2) NOT NULL,
  `order_payment_expire` int(11) DEFAULT NULL,
  `order_payment_name` varchar(255) DEFAULT NULL,
  `payment_method_class` varchar(256) DEFAULT NULL,
  `order_payment_trans_id` text NOT NULL,
  `authorize_status` varchar(255) DEFAULT NULL,
  `order_transfee` double(10,2) NOT NULL,
  PRIMARY KEY (`payment_order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `idx_payment_method_id` (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='redSHOP Order Payment Detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_order_status`
--

DROP TABLE IF EXISTS `e42xo_redshop_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_code` varchar(64) NOT NULL,
  `order_status_name` varchar(64) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_status_id`),
  UNIQUE KEY `e42xo_rs_idx_order_status_code` (`order_status_code`),
  KEY `e42xo_rs_idx_order_status_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='redSHOP Orders Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_order_status_log`
--

DROP TABLE IF EXISTS `e42xo_redshop_order_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_order_status_log` (
  `order_status_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status` varchar(5) NOT NULL,
  `order_payment_status` varchar(25) NOT NULL,
  `date_changed` int(11) NOT NULL,
  `customer_note` text NOT NULL,
  PRIMARY KEY (`order_status_log_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_order_status` (`order_status`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='redSHOP Orders Status history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_order_users_info`
--

DROP TABLE IF EXISTS `e42xo_redshop_order_users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_order_users_info` (
  `order_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_info_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `address_type` varchar(255) NOT NULL,
  `vat_number` varchar(250) NOT NULL,
  `tax_exempt` tinyint(4) NOT NULL,
  `shopper_group_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country_code` varchar(11) NOT NULL,
  `state_code` varchar(11) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `tax_exempt_approved` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `is_company` tinyint(4) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `ean_number` varchar(250) NOT NULL,
  `requesting_tax_exempt` tinyint(4) NOT NULL,
  `thirdparty_email` varchar(255) NOT NULL,
  PRIMARY KEY (`order_info_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_address_type` (`address_type`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='redSHOP Order User Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_orderbarcode_log`
--

DROP TABLE IF EXISTS `e42xo_redshop_orderbarcode_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_orderbarcode_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `search_date` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_ordernumber_track`
--

DROP TABLE IF EXISTS `e42xo_redshop_ordernumber_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_ordernumber_track` (
  `trackdatetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Order number track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_orders`
--

DROP TABLE IF EXISTS `e42xo_redshop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_number` varchar(32) DEFAULT NULL,
  `invoice_number_chrono` int(11) NOT NULL COMMENT 'Order invoice number in chronological order',
  `invoice_number` varchar(255) NOT NULL COMMENT 'Formatted Order Invoice for final use',
  `barcode` varchar(13) NOT NULL,
  `user_info_id` varchar(32) DEFAULT NULL,
  `order_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `order_subtotal` decimal(15,5) DEFAULT NULL,
  `order_tax` decimal(10,2) DEFAULT NULL,
  `order_tax_details` text NOT NULL,
  `order_shipping` decimal(10,2) DEFAULT NULL,
  `order_shipping_tax` decimal(10,2) DEFAULT NULL,
  `coupon_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `order_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `special_discount_amount` decimal(12,2) NOT NULL,
  `payment_dicount` decimal(12,2) NOT NULL,
  `order_status` varchar(5) DEFAULT NULL,
  `order_payment_status` varchar(25) NOT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `ship_method_id` varchar(255) DEFAULT NULL,
  `customer_note` text NOT NULL,
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `encr_key` varchar(255) NOT NULL,
  `split_payment` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `mail1_status` tinyint(1) NOT NULL,
  `mail2_status` tinyint(1) NOT NULL,
  `mail3_status` tinyint(1) NOT NULL,
  `special_discount` decimal(10,2) NOT NULL,
  `payment_discount` decimal(10,2) NOT NULL,
  `is_booked` tinyint(1) NOT NULL,
  `order_label_create` tinyint(1) NOT NULL,
  `vm_order_number` varchar(32) NOT NULL,
  `requisition_number` varchar(255) NOT NULL,
  `bookinvoice_number` int(11) NOT NULL,
  `bookinvoice_date` int(11) NOT NULL,
  `referral_code` varchar(50) NOT NULL,
  `customer_message` varchar(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `order_discount_vat` decimal(10,3) NOT NULL,
  `track_no` varchar(250) NOT NULL,
  `payment_oprand` varchar(50) NOT NULL,
  `discount_type` varchar(255) NOT NULL,
  `analytics_status` int(1) NOT NULL,
  `tax_after_discount` decimal(10,3) NOT NULL,
  `recuuring_subcription_id` varchar(500) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `idx_orders_user_id` (`user_id`),
  KEY `idx_orders_order_number` (`order_number`),
  KEY `idx_orders_user_info_id` (`user_info_id`),
  KEY `idx_orders_ship_method_id` (`ship_method_id`),
  KEY `vm_order_number` (`vm_order_number`),
  KEY `idx_orders_invoice_number` (`invoice_number`),
  KEY `idx_orders_invoice_number_chrono` (`invoice_number_chrono`),
  KEY `idx_barcode` (`barcode`),
  KEY `idx_order_payment_status` (`order_payment_status`),
  KEY `idx_order_status` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='redSHOP Order Detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_pageviewer`
--

DROP TABLE IF EXISTS `e42xo_redshop_pageviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_pageviewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(250) NOT NULL,
  `section` varchar(250) NOT NULL,
  `section_id` int(11) NOT NULL,
  `hit` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_section` (`section`),
  KEY `idx_section_id` (`section_id`),
  KEY `idx_created_date` (`created_date`)
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=utf8 COMMENT='redSHOP Page Viewer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product`
--

DROP TABLE IF EXISTS `e42xo_redshop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_parent_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_on_sale` tinyint(4) NOT NULL,
  `product_special` tinyint(4) NOT NULL,
  `product_download` tinyint(4) NOT NULL,
  `product_template` int(11) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `product_price` double NOT NULL,
  `discount_price` double NOT NULL,
  `discount_stratdate` int(11) NOT NULL,
  `discount_enddate` int(11) NOT NULL,
  `product_number` varchar(250) NOT NULL,
  `product_type` varchar(20) NOT NULL,
  `product_s_desc` longtext NOT NULL,
  `product_desc` longtext NOT NULL,
  `product_volume` double NOT NULL,
  `product_tax_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `product_thumb_image` varchar(250) NOT NULL,
  `product_full_image` varchar(250) NOT NULL,
  `publish_date` datetime NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `visited` int(11) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metalanguage_setting` text NOT NULL,
  `metarobot_info` text NOT NULL,
  `pagetitle` text NOT NULL,
  `pageheading` text NOT NULL,
  `sef_url` text NOT NULL,
  `cat_in_sefurl` int(11) NOT NULL,
  `weight` float(10,3) NOT NULL,
  `expired` tinyint(4) NOT NULL,
  `not_for_sale` tinyint(4) NOT NULL,
  `use_discount_calc` tinyint(4) NOT NULL,
  `discount_calc_method` varchar(255) NOT NULL,
  `min_order_product_quantity` int(11) NOT NULL,
  `attribute_set_id` int(11) NOT NULL,
  `product_length` decimal(10,2) NOT NULL,
  `product_height` decimal(10,2) NOT NULL,
  `product_width` decimal(10,2) NOT NULL,
  `product_diameter` decimal(10,2) NOT NULL,
  `product_availability_date` int(11) NOT NULL,
  `use_range` tinyint(4) NOT NULL,
  `product_tax_group_id` int(11) NOT NULL,
  `product_download_days` int(11) NOT NULL,
  `product_download_limit` int(11) NOT NULL,
  `product_download_clock` int(11) NOT NULL,
  `product_download_clock_min` int(11) NOT NULL,
  `accountgroup_id` int(11) NOT NULL,
  `canonical_url` text NOT NULL,
  `minimum_per_product_total` int(11) NOT NULL,
  `quantity_selectbox_value` varchar(255) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `max_order_product_quantity` int(11) NOT NULL,
  `product_download_infinite` tinyint(4) NOT NULL,
  `product_back_full_image` varchar(250) NOT NULL,
  `product_back_thumb_image` varchar(250) NOT NULL,
  `product_preview_image` varchar(250) NOT NULL,
  `product_preview_back_image` varchar(250) NOT NULL,
  `preorder` varchar(255) NOT NULL,
  `append_to_global_seo` enum('append','prepend','replace') NOT NULL DEFAULT 'append',
  `allow_decimal_piece` int(4) NOT NULL,
  `use_individual_payment_method` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `idx_product_number` (`product_number`),
  KEY `idx_manufacturer_id` (`manufacturer_id`),
  KEY `idx_product_on_sale` (`product_on_sale`),
  KEY `idx_product_special` (`product_special`),
  KEY `idx_product_parent_id` (`product_parent_id`),
  KEY `idx_common` (`published`,`expired`,`product_parent_id`),
  KEY `e42xo_rs_product_supplier_fk1` (`supplier_id`),
  KEY `e42xo_rs_prod_publish_parent` (`product_parent_id`,`published`),
  KEY `e42xo_rs_prod_publish_parent_special` (`product_parent_id`,`published`,`product_special`),
  KEY `e42xo_prod_pub_exp_parent` (`product_parent_id`,`published`,`expired`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='redSHOP Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_accessory`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_accessory` (
  `accessory_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `child_product_id` int(11) NOT NULL,
  `accessory_price` double NOT NULL,
  `oprand` char(1) NOT NULL,
  `setdefault_selected` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`accessory_id`),
  KEY `idx_common` (`product_id`,`child_product_id`),
  KEY `idx_child_product_id` (`child_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Products Accessory';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_attribute`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(250) NOT NULL,
  `attribute_description` varchar(255) NOT NULL DEFAULT '',
  `attribute_required` tinyint(4) NOT NULL,
  `allow_multiple_selection` tinyint(1) NOT NULL,
  `hide_attribute_price` tinyint(1) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `attribute_set_id` int(11) NOT NULL,
  `display_type` varchar(255) NOT NULL,
  `attribute_published` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_attribute_name` (`attribute_name`),
  KEY `idx_attribute_set_id` (`attribute_set_id`),
  KEY `idx_attribute_published` (`attribute_published`),
  KEY `idx_attribute_required` (`attribute_required`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='redSHOP Products Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_attribute_price`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_attribute_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_attribute_price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  `product_currency` varchar(10) NOT NULL,
  `cdate` int(11) NOT NULL,
  `shopper_group_id` int(11) NOT NULL,
  `price_quantity_start` int(11) NOT NULL,
  `price_quantity_end` bigint(20) NOT NULL,
  `discount_price` double NOT NULL,
  `discount_start_date` int(11) NOT NULL,
  `discount_end_date` int(11) NOT NULL,
  PRIMARY KEY (`price_id`),
  KEY `idx_shopper_group_id` (`shopper_group_id`),
  KEY `idx_common` (`section_id`,`section`,`price_quantity_start`,`price_quantity_end`,`shopper_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Attribute Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_attribute_property`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_attribute_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_attribute_property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `property_price` double NOT NULL,
  `oprand` char(1) NOT NULL DEFAULT '+',
  `property_image` varchar(255) NOT NULL,
  `property_main_image` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `setdefault_selected` tinyint(4) NOT NULL,
  `setrequire_selected` tinyint(3) NOT NULL,
  `setmulti_selected` tinyint(4) NOT NULL,
  `setdisplay_type` varchar(255) NOT NULL,
  `extra_field` varchar(250) NOT NULL,
  `property_published` int(11) NOT NULL DEFAULT '1',
  `property_number` varchar(255) NOT NULL,
  PRIMARY KEY (`property_id`),
  KEY `idx_attribute_id` (`attribute_id`),
  KEY `idx_setrequire_selected` (`setrequire_selected`),
  KEY `idx_property_published` (`property_published`),
  KEY `idx_property_number` (`property_number`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COMMENT='redSHOP Products Attribute Property';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_attribute_stockroom_xref`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_attribute_stockroom_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_attribute_stockroom_xref` (
  `section_id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL,
  `stockroom_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `preorder_stock` int(11) NOT NULL,
  `ordered_preorder` int(11) NOT NULL,
  KEY `idx_stockroom_id` (`stockroom_id`),
  KEY `idx_common` (`section_id`,`section`,`stockroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Attribute Stockroom relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_category_xref`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_category_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_category_xref` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  KEY `ref_category` (`product_id`),
  KEY `e42xo_prod_cat_idx1` (`category_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Category Relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_compare`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_compare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_compare` (
  `compare_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`compare_id`),
  KEY `idx_common` (`user_id`,`product_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Comparision';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_discount_calc`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_discount_calc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_discount_calc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `area_start` float(10,2) NOT NULL,
  `area_end` float(10,2) NOT NULL,
  `area_price` double NOT NULL,
  `discount_calc_unit` varchar(255) NOT NULL,
  `area_start_converted` float(20,8) NOT NULL,
  `area_end_converted` float(20,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Discount Calculator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_discount_calc_extra`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_discount_calc_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_discount_calc_extra` (
  `pdcextra_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `oprand` char(1) NOT NULL,
  `price` float(10,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`pdcextra_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Discount Calculator Extra Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_download`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_download` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `end_date` int(11) NOT NULL DEFAULT '0',
  `download_max` int(11) NOT NULL DEFAULT '0',
  `download_id` varchar(255) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `product_serial_number` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`download_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Downloadable Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_download_log`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_download_log` (
  `user_id` int(11) NOT NULL,
  `download_id` varchar(32) NOT NULL,
  `download_time` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  KEY `idx_download_id` (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='redSHOP Downloadable Products Logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_payment_xref`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_payment_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_payment_xref` (
  `payment_id` varchar(255) NOT NULL DEFAULT '',
  `product_id` tinyint(11) NOT NULL,
  PRIMARY KEY (`product_id`,`payment_id`),
  KEY `e42xo_rs_pro_pay_ref_fk1` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='redSHOP Product Individual payment reference.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_price`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_price` decimal(12,4) NOT NULL,
  `product_currency` varchar(10) CHARACTER SET latin1 NOT NULL,
  `cdate` date NOT NULL,
  `shopper_group_id` int(11) NOT NULL,
  `price_quantity_start` int(11) NOT NULL,
  `price_quantity_end` bigint(20) NOT NULL,
  `discount_price` decimal(12,4) NOT NULL,
  `discount_start_date` int(11) NOT NULL,
  `discount_end_date` int(11) NOT NULL,
  PRIMARY KEY (`price_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_shopper_group_id` (`shopper_group_id`),
  KEY `idx_price_quantity_start` (`price_quantity_start`),
  KEY `idx_price_quantity_end` (`price_quantity_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_rating`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `user_rating` tinyint(1) NOT NULL DEFAULT '0',
  `favoured` tinyint(4) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `product_id` (`product_id`,`userid`,`email`),
  KEY `idx_published` (`published`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_related`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_related` (
  `related_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Related Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_serial_number`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_serial_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_serial_number` (
  `serial_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serial_id`),
  KEY `idx_common` (`product_id`,`is_used`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP downloadable product serial numbers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_stockroom_xref`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_stockroom_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_stockroom_xref` (
  `product_id` int(11) NOT NULL,
  `stockroom_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `preorder_stock` int(11) NOT NULL,
  `ordered_preorder` int(11) NOT NULL,
  KEY `idx_stockroom_id` (`stockroom_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_quantity` (`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Products Stockroom Relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_subattribute_color`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_subattribute_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_subattribute_color` (
  `subattribute_color_id` int(11) NOT NULL AUTO_INCREMENT,
  `subattribute_color_name` varchar(255) NOT NULL,
  `subattribute_color_price` double NOT NULL,
  `oprand` char(1) NOT NULL,
  `subattribute_color_image` varchar(255) NOT NULL,
  `subattribute_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `setdefault_selected` tinyint(4) NOT NULL,
  `extra_field` varchar(250) NOT NULL,
  `subattribute_published` int(11) NOT NULL DEFAULT '1',
  `subattribute_color_number` varchar(255) NOT NULL,
  `subattribute_color_title` varchar(255) NOT NULL,
  `subattribute_color_main_image` varchar(255) NOT NULL,
  PRIMARY KEY (`subattribute_color_id`),
  KEY `idx_subattribute_id` (`subattribute_id`),
  KEY `idx_subattribute_published` (`subattribute_published`),
  KEY `e42xo_rs_sub_prop_common` (`subattribute_id`,`subattribute_published`,`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8 COMMENT='Product Subattribute Color';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_subscribe_detail`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_subscribe_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_subscribe_detail` (
  `product_subscribe_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `renewal_reminder` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_subscribe_id`),
  KEY `idx_common` (`product_id`,`end_date`),
  KEY `idx_order_item_id` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP User product Subscribe detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_subscription`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `subscription_period` int(11) NOT NULL,
  `period_type` varchar(10) NOT NULL,
  `subscription_price` double NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Subscription';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_tags`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_tags` (
  `tags_id` int(11) NOT NULL AUTO_INCREMENT,
  `tags_name` varchar(255) NOT NULL,
  `tags_counter` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`tags_id`),
  KEY `idx_published` (`published`),
  KEY `idx_tags_name` (`tags_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_tags_xref`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_tags_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_tags_xref` (
  `tags_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  KEY `idx_product_id` (`product_id`),
  KEY `idx_users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Tags Relation With product and user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_voucher`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_code` varchar(255) NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `voucher_type` varchar(250) CHARACTER SET latin1 NOT NULL,
  `start_date` double NOT NULL,
  `end_date` double NOT NULL,
  `free_shipping` tinyint(4) NOT NULL,
  `voucher_left` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`voucher_id`),
  KEY `idx_common` (`voucher_code`,`published`,`start_date`,`end_date`),
  KEY `idx_voucher_left` (`voucher_left`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Voucher';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_voucher_transaction`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_voucher_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_voucher_transaction` (
  `transaction_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `voucher_code` varchar(255) NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `trancation_date` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  PRIMARY KEY (`transaction_voucher_id`),
  KEY `idx_voucher_id` (`voucher_id`),
  KEY `idx_voucher_code` (`voucher_code`),
  KEY `idx_amount` (`amount`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Product Voucher Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_product_voucher_xref`
--

DROP TABLE IF EXISTS `e42xo_redshop_product_voucher_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_product_voucher_xref` (
  `voucher_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  KEY `idx_common` (`voucher_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Products Voucher Relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_quotation`
--

DROP TABLE IF EXISTS `e42xo_redshop_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_quotation` (
  `quotation_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_number` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_info_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quotation_total` decimal(15,2) NOT NULL,
  `quotation_subtotal` decimal(15,2) NOT NULL,
  `quotation_tax` decimal(15,2) NOT NULL,
  `quotation_discount` decimal(15,4) NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `quotation_cdate` int(11) NOT NULL,
  `quotation_mdate` int(11) NOT NULL,
  `quotation_note` text NOT NULL,
  `quotation_customer_note` text NOT NULL,
  `quotation_ipaddress` varchar(20) NOT NULL,
  `quotation_encrkey` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `quotation_special_discount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`quotation_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_quotation_status` (`quotation_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Quotation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_quotation_accessory_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_quotation_accessory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_quotation_accessory_item` (
  `quotation_item_acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_item_id` int(11) NOT NULL,
  `accessory_id` int(11) NOT NULL,
  `accessory_item_sku` varchar(255) NOT NULL,
  `accessory_item_name` varchar(255) NOT NULL,
  `accessory_price` decimal(15,4) NOT NULL,
  `accessory_vat` decimal(15,4) NOT NULL,
  `accessory_quantity` int(11) NOT NULL,
  `accessory_item_price` decimal(15,2) NOT NULL,
  `accessory_final_price` decimal(15,2) NOT NULL,
  `accessory_attribute` text NOT NULL,
  PRIMARY KEY (`quotation_item_acc_id`),
  KEY `idx_quotation_item_id` (`quotation_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Quotation Accessory item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_quotation_attribute_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_quotation_attribute_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_quotation_attribute_item` (
  `quotation_att_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_item_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `section` varchar(250) NOT NULL,
  `parent_section_id` int(11) NOT NULL,
  `section_name` varchar(250) NOT NULL,
  `section_price` decimal(15,4) NOT NULL,
  `section_vat` decimal(15,4) NOT NULL,
  `section_oprand` char(1) NOT NULL,
  `is_accessory_att` tinyint(4) NOT NULL,
  PRIMARY KEY (`quotation_att_item_id`),
  KEY `idx_quotation_item_id` (`quotation_item_id`),
  KEY `idx_section` (`section`),
  KEY `idx_parent_section_id` (`parent_section_id`),
  KEY `idx_is_accessory_att` (`is_accessory_att`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Quotation Attribute item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_quotation_fields_data`
--

DROP TABLE IF EXISTS `e42xo_redshop_quotation_fields_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_quotation_fields_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldid` int(11) DEFAULT NULL,
  `data_txt` longtext,
  `quotation_item_id` int(11) DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`data_id`),
  KEY `quotation_item_id` (`quotation_item_id`),
  KEY `idx_fieldid` (`fieldid`),
  KEY `idx_quotation_item_id` (`quotation_item_id`),
  KEY `idx_section` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Quotation USer field';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_quotation_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_quotation_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_quotation_item` (
  `quotation_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,4) NOT NULL,
  `product_excl_price` decimal(15,4) NOT NULL,
  `product_final_price` decimal(15,4) NOT NULL,
  `actualitem_price` decimal(15,4) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_attribute` text NOT NULL,
  `product_accessory` text NOT NULL,
  `mycart_accessory` text NOT NULL,
  `product_wrapperid` int(11) NOT NULL,
  `wrapper_price` decimal(15,2) NOT NULL,
  `is_giftcard` tinyint(4) NOT NULL,
  PRIMARY KEY (`quotation_item_id`),
  KEY `quotation_id` (`quotation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Quotation Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_sample_request`
--

DROP TABLE IF EXISTS `e42xo_redshop_sample_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_sample_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `colour_id` varchar(250) NOT NULL,
  `block` tinyint(4) NOT NULL,
  `reminder_1` tinyint(1) NOT NULL,
  `reminder_2` tinyint(1) NOT NULL,
  `reminder_3` tinyint(1) NOT NULL,
  `reminder_coupon` tinyint(1) NOT NULL,
  `registerdate` int(11) NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `idx_block` (`block`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Sample Request';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_shipping_boxes`
--

DROP TABLE IF EXISTS `e42xo_redshop_shipping_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_shipping_boxes` (
  `shipping_box_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_box_name` varchar(255) NOT NULL,
  `shipping_box_length` decimal(10,2) NOT NULL,
  `shipping_box_width` decimal(10,2) NOT NULL,
  `shipping_box_height` decimal(10,2) NOT NULL,
  `shipping_box_priority` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`shipping_box_id`),
  KEY `idx_published` (`published`),
  KEY `idx_common` (`shipping_box_length`,`shipping_box_width`,`shipping_box_height`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Shipping Boxes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_shipping_rate`
--

DROP TABLE IF EXISTS `e42xo_redshop_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_shipping_rate` (
  `shipping_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_rate_name` varchar(255) NOT NULL DEFAULT '',
  `shipping_class` varchar(255) NOT NULL DEFAULT '',
  `shipping_rate_country` longtext NOT NULL,
  `shipping_rate_zip_start` varchar(20) NOT NULL,
  `shipping_rate_zip_end` varchar(20) NOT NULL,
  `shipping_rate_weight_start` decimal(10,2) NOT NULL,
  `company_only` tinyint(4) NOT NULL,
  `apply_vat` tinyint(4) NOT NULL,
  `shipping_rate_weight_end` decimal(10,2) NOT NULL,
  `shipping_rate_volume_start` decimal(10,2) NOT NULL,
  `shipping_rate_volume_end` decimal(10,2) NOT NULL,
  `shipping_rate_ordertotal_start` decimal(10,3) NOT NULL DEFAULT '0.000',
  `shipping_rate_ordertotal_end` decimal(10,3) NOT NULL,
  `shipping_rate_priority` tinyint(4) NOT NULL DEFAULT '0',
  `shipping_rate_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_rate_package_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_location_info` longtext NOT NULL,
  `shipping_rate_length_start` decimal(10,2) NOT NULL,
  `shipping_rate_length_end` decimal(10,2) NOT NULL,
  `shipping_rate_width_start` decimal(10,2) NOT NULL,
  `shipping_rate_width_end` decimal(10,2) NOT NULL,
  `shipping_rate_height_start` decimal(10,2) NOT NULL,
  `shipping_rate_height_end` decimal(10,2) NOT NULL,
  `shipping_rate_on_shopper_group` longtext NOT NULL,
  `consignor_carrier_code` varchar(255) NOT NULL,
  `deliver_type` int(11) NOT NULL,
  `economic_displaynumber` varchar(255) NOT NULL,
  `shipping_rate_on_product` longtext NOT NULL,
  `shipping_rate_on_category` longtext NOT NULL,
  `shipping_tax_group_id` int(11) NOT NULL,
  `shipping_rate_state` longtext NOT NULL,
  PRIMARY KEY (`shipping_rate_id`),
  KEY `shipping_rate_name` (`shipping_rate_name`),
  KEY `shipping_class` (`shipping_class`),
  KEY `shipping_rate_zip_start` (`shipping_rate_zip_start`),
  KEY `shipping_rate_zip_end` (`shipping_rate_zip_end`),
  KEY `company_only` (`company_only`),
  KEY `shipping_rate_value` (`shipping_rate_value`),
  KEY `shipping_tax_group_id` (`shipping_tax_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='redSHOP Shipping Rates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_shopper_group`
--

DROP TABLE IF EXISTS `e42xo_redshop_shopper_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_shopper_group` (
  `shopper_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `shopper_group_name` varchar(32) DEFAULT NULL,
  `shopper_group_customer_type` tinyint(4) NOT NULL,
  `shopper_group_portal` tinyint(4) NOT NULL,
  `shopper_group_categories` longtext NOT NULL,
  `shopper_group_url` varchar(255) NOT NULL,
  `shopper_group_logo` varchar(255) NOT NULL,
  `shopper_group_introtext` longtext NOT NULL,
  `shopper_group_desc` text,
  `parent_id` int(11) NOT NULL,
  `default_shipping` tinyint(4) NOT NULL,
  `default_shipping_rate` float(10,2) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `shopper_group_cart_checkout_itemid` int(11) NOT NULL,
  `shopper_group_cart_itemid` int(11) NOT NULL,
  `shopper_group_quotation_mode` tinyint(4) NOT NULL,
  `show_price_without_vat` tinyint(4) NOT NULL,
  `tax_group_id` int(11) NOT NULL,
  `apply_product_price_vat` int(11) NOT NULL,
  `show_price` varchar(255) NOT NULL DEFAULT 'global',
  `use_as_catalog` varchar(255) NOT NULL DEFAULT 'global',
  `shopper_group_manufactures` text NOT NULL,
  PRIMARY KEY (`shopper_group_id`),
  KEY `idx_shopper_group_name` (`shopper_group_name`),
  KEY `idx_published` (`published`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Shopper Groups that users can be assigned to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_siteviewer`
--

DROP TABLE IF EXISTS `e42xo_redshop_siteviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_siteviewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(250) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_created_date` (`created_date`)
) ENGINE=InnoDB AUTO_INCREMENT=965 DEFAULT CHARSET=utf8 COMMENT='redSHOP Site Viewer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_state`
--

DROP TABLE IF EXISTS `e42xo_redshop_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `state_name` varchar(64) DEFAULT NULL,
  `state_3_code` char(3) DEFAULT NULL,
  `state_2_code` char(2) DEFAULT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `show_state` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `e42xo_rs_idx_state_3_code` (`country_id`,`state_3_code`),
  UNIQUE KEY `e42xo_rs_idx_state_2_code` (`country_id`,`state_2_code`),
  KEY `idx_country_id` (`country_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `e42xo_rs_state_country_fk1` FOREIGN KEY (`country_id`) REFERENCES `e42xo_redshop_country` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8 COMMENT='States that are assigned to a country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_stockroom`
--

DROP TABLE IF EXISTS `e42xo_redshop_stockroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_stockroom` (
  `stockroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `stockroom_name` varchar(250) NOT NULL,
  `min_stock_amount` int(11) NOT NULL,
  `stockroom_desc` longtext CHARACTER SET latin1 NOT NULL,
  `creation_date` double NOT NULL,
  `min_del_time` int(11) NOT NULL,
  `max_del_time` int(11) NOT NULL,
  `show_in_front` tinyint(1) NOT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`stockroom_id`),
  KEY `idx_published` (`published`),
  KEY `idx_min_del_time` (`min_del_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Stockroom';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_stockroom_amount_image`
--

DROP TABLE IF EXISTS `e42xo_redshop_stockroom_amount_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_stockroom_amount_image` (
  `stock_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `stockroom_id` int(11) NOT NULL,
  `stock_option` tinyint(4) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `stock_amount_image` varchar(255) NOT NULL,
  `stock_amount_image_tooltip` text NOT NULL,
  PRIMARY KEY (`stock_amount_id`),
  KEY `idx_stockroom_id` (`stockroom_id`),
  KEY `idx_stock_option` (`stock_option`),
  KEY `idx_stock_quantity` (`stock_quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP stockroom amount image';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_subscription_renewal`
--

DROP TABLE IF EXISTS `e42xo_redshop_subscription_renewal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_subscription_renewal` (
  `renewal_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `before_no_days` int(11) NOT NULL,
  PRIMARY KEY (`renewal_id`),
  KEY `idx_common` (`product_id`,`before_no_days`)
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=utf8 COMMENT='redSHOP Subscription Renewal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_supplier`
--

DROP TABLE IF EXISTS `e42xo_redshop_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `e42xo_rs_idx_supplier_published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Supplier';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_tax_group`
--

DROP TABLE IF EXISTS `e42xo_redshop_tax_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_tax_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='redSHOP Tax Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_tax_rate`
--

DROP TABLE IF EXISTS `e42xo_redshop_tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_tax_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `tax_state` varchar(64) DEFAULT NULL,
  `tax_country` varchar(64) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `tax_rate` decimal(10,4) DEFAULT NULL,
  `tax_group_id` int(11) NOT NULL,
  `is_eu_country` tinyint(4) NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_tax_group_id` (`tax_group_id`),
  KEY `idx_tax_country` (`tax_country`),
  KEY `idx_tax_state` (`tax_state`),
  KEY `idx_is_eu_country` (`is_eu_country`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='redSHOP Tax Rates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_template`
--

DROP TABLE IF EXISTS `e42xo_redshop_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `section` varchar(250) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `order_status` varchar(250) NOT NULL,
  `payment_methods` varchar(250) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `shipping_methods` varchar(255) NOT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `e42xo_rs_tmpl_section` (`section`),
  KEY `e42xo_rs_tmpl_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8 COMMENT='redSHOP Templates Detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_textlibrary`
--

DROP TABLE IF EXISTS `e42xo_redshop_textlibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_textlibrary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `section` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `e42xo_rs_text_tag_section` (`section`),
  KEY `e42xo_rs_text_tag_published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP TextLibrary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_usercart`
--

DROP TABLE IF EXISTS `e42xo_redshop_usercart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_usercart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cdate` int(11) NOT NULL,
  `mdate` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COMMENT='redSHOP User Cart Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_usercart_accessory_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_usercart_accessory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_usercart_accessory_item` (
  `cart_acc_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_item_id` int(11) NOT NULL,
  `accessory_id` int(11) NOT NULL,
  `accessory_quantity` int(11) NOT NULL,
  PRIMARY KEY (`cart_acc_item_id`),
  KEY `idx_cart_item_id` (`cart_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP User Cart Accessory Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_usercart_attribute_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_usercart_attribute_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_usercart_attribute_item` (
  `cart_att_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_item_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `section` varchar(25) NOT NULL,
  `parent_section_id` int(11) NOT NULL,
  `is_accessory_att` tinyint(4) NOT NULL,
  PRIMARY KEY (`cart_att_item_id`),
  KEY `idx_common` (`is_accessory_att`,`section`,`parent_section_id`,`cart_item_id`),
  KEY `idx_cart_item_id` (`cart_item_id`),
  KEY `idx_parent_section_id` (`parent_section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3809 DEFAULT CHARSET=utf8 COMMENT='redSHOP User cart Attribute Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_usercart_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_usercart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_usercart_item` (
  `cart_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_idx` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_wrapper_id` int(11) NOT NULL,
  `product_subscription_id` int(11) NOT NULL,
  `giftcard_id` int(11) NOT NULL,
  `attribs` varchar(5120) NOT NULL COMMENT 'Specified user attributes related with current item',
  PRIMARY KEY (`cart_item_id`),
  KEY `idx_cart_id` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2710 DEFAULT CHARSET=utf8 COMMENT='redSHOP User Cart Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_users_info`
--

DROP TABLE IF EXISTS `e42xo_redshop_users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_users_info` (
  `users_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `address_type` varchar(11) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `vat_number` varchar(250) NOT NULL,
  `tax_exempt` tinyint(4) NOT NULL,
  `shopper_group_id` int(11) NOT NULL,
  `country_code` varchar(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state_code` varchar(11) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `tax_exempt_approved` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `is_company` tinyint(4) NOT NULL,
  `ean_number` varchar(250) NOT NULL,
  `braintree_vault_number` varchar(255) NOT NULL,
  `veis_vat_number` varchar(255) NOT NULL,
  `veis_status` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `requesting_tax_exempt` tinyint(4) NOT NULL,
  `accept_terms_conditions` tinyint(4) NOT NULL,
  PRIMARY KEY (`users_info_id`),
  KEY `user_id` (`user_id`),
  KEY `idx_common` (`address_type`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='redSHOP Users Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_voucher`
--

DROP TABLE IF EXISTS `e42xo_redshop_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `type` varchar(250) NOT NULL,
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `free_ship` tinyint(4) NOT NULL,
  `voucher_left` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `e42xo_rs_voucher_code` (`code`),
  KEY `e42xo_rs_voucher_common` (`code`,`published`,`start_date`,`end_date`),
  KEY `e42xo_rs_voucher_left` (`voucher_left`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_wishlist`
--

DROP TABLE IF EXISTS `e42xo_redshop_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_wishlist` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `wishlist_name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` mediumtext NOT NULL,
  `cdate` double NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='redSHOP wishlist';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_wishlist_product`
--

DROP TABLE IF EXISTS `e42xo_redshop_wishlist_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_wishlist_product` (
  `wishlist_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cdate` int(11) NOT NULL,
  PRIMARY KEY (`wishlist_product_id`),
  KEY `idx_wishlist_id` (`wishlist_id`),
  KEY `idx_common` (`product_id`,`wishlist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='redSHOP Wishlist Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_wishlist_product_item`
--

DROP TABLE IF EXISTS `e42xo_redshop_wishlist_product_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_wishlist_product_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `ref_id` int(11) NOT NULL COMMENT 'Wishlist Reference ID',
  `attribute_id` int(11) DEFAULT NULL COMMENT 'Product Attribute ID',
  `property_id` int(11) DEFAULT NULL COMMENT 'Product Attribute Property ID',
  `subattribute_id` int(11) DEFAULT NULL COMMENT 'Product Sub-Attribute ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `e42xo_idx_wishlist_prod_item_unique` (`ref_id`,`attribute_id`,`property_id`,`subattribute_id`),
  KEY `e42xo_wishlist_prod_item_fk2` (`attribute_id`),
  KEY `e42xo_wishlist_prod_item_fk3` (`property_id`),
  KEY `e42xo_wishlist_prod_item_fk4` (`subattribute_id`),
  KEY `e42xo_wishlist_prod_item_fk1` (`ref_id`),
  CONSTRAINT `e42xo_wishlist_prod_item_fk1` FOREIGN KEY (`ref_id`) REFERENCES `e42xo_redshop_wishlist_product` (`wishlist_product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `e42xo_wishlist_prod_item_fk2` FOREIGN KEY (`attribute_id`) REFERENCES `e42xo_redshop_product_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `e42xo_wishlist_prod_item_fk3` FOREIGN KEY (`property_id`) REFERENCES `e42xo_redshop_product_attribute_property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `e42xo_wishlist_prod_item_fk4` FOREIGN KEY (`subattribute_id`) REFERENCES `e42xo_redshop_product_subattribute_color` (`subattribute_color_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist product item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_wishlist_userfielddata`
--

DROP TABLE IF EXISTS `e42xo_redshop_wishlist_userfielddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_wishlist_userfielddata` (
  `fieldid` int(11) NOT NULL AUTO_INCREMENT,
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `userfielddata` text NOT NULL,
  PRIMARY KEY (`fieldid`),
  KEY `idx_common` (`wishlist_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Wishlist Product userfielddata';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_wrapper`
--

DROP TABLE IF EXISTS `e42xo_redshop_wrapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_wrapper` (
  `wrapper_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) NOT NULL,
  `category_id` varchar(250) NOT NULL,
  `wrapper_name` varchar(255) NOT NULL,
  `wrapper_price` double NOT NULL,
  `wrapper_image` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL,
  `wrapper_use_to_all` tinyint(4) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`wrapper_id`),
  KEY `idx_wrapper_use_to_all` (`wrapper_use_to_all`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP Wrapper';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_xml_export`
--

DROP TABLE IF EXISTS `e42xo_redshop_xml_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_xml_export` (
  `xmlexport_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `display_filename` varchar(255) NOT NULL,
  `parent_name` varchar(255) NOT NULL,
  `section_type` varchar(255) NOT NULL,
  `auto_sync` tinyint(4) NOT NULL,
  `sync_on_request` tinyint(4) NOT NULL,
  `auto_sync_interval` int(11) NOT NULL,
  `xmlexport_date` int(11) NOT NULL,
  `xmlexport_filetag` text NOT NULL,
  `element_name` varchar(255) DEFAULT NULL,
  `published` tinyint(4) NOT NULL,
  `use_to_all_users` tinyint(4) NOT NULL,
  `xmlexport_billingtag` text NOT NULL,
  `billing_element_name` varchar(255) NOT NULL,
  `xmlexport_shippingtag` text NOT NULL,
  `shipping_element_name` varchar(255) NOT NULL,
  `xmlexport_orderitemtag` text NOT NULL,
  `orderitem_element_name` varchar(255) NOT NULL,
  `xmlexport_stocktag` text NOT NULL,
  `stock_element_name` varchar(255) NOT NULL,
  `xmlexport_prdextrafieldtag` text NOT NULL,
  `prdextrafield_element_name` varchar(255) NOT NULL,
  `xmlexport_on_category` text NOT NULL,
  PRIMARY KEY (`xmlexport_id`),
  KEY `idx_filename` (`filename`),
  KEY `idx_auto_sync` (`auto_sync`),
  KEY `idx_sync_on_request` (`sync_on_request`),
  KEY `idx_auto_sync_interval` (`auto_sync_interval`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP XML Export';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_xml_export_ipaddress`
--

DROP TABLE IF EXISTS `e42xo_redshop_xml_export_ipaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_xml_export_ipaddress` (
  `xmlexport_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `xmlexport_id` int(11) NOT NULL,
  `access_ipaddress` varchar(255) NOT NULL,
  PRIMARY KEY (`xmlexport_ip_id`),
  KEY `idx_xmlexport_id` (`xmlexport_id`),
  KEY `idx_access_ipaddress` (`access_ipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP XML Export Ip Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_xml_export_log`
--

DROP TABLE IF EXISTS `e42xo_redshop_xml_export_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_xml_export_log` (
  `xmlexport_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `xmlexport_id` int(11) NOT NULL,
  `xmlexport_filename` varchar(255) NOT NULL,
  `xmlexport_date` int(11) NOT NULL,
  PRIMARY KEY (`xmlexport_log_id`),
  KEY `idx_xmlexport_id` (`xmlexport_id`),
  KEY `idx_xmlexport_filename` (`xmlexport_filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='redSHOP XML Export log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_xml_import`
--

DROP TABLE IF EXISTS `e42xo_redshop_xml_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_xml_import` (
  `xmlimport_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `display_filename` varchar(255) NOT NULL,
  `xmlimport_url` varchar(255) NOT NULL,
  `section_type` varchar(255) NOT NULL,
  `auto_sync` tinyint(4) NOT NULL,
  `sync_on_request` tinyint(4) NOT NULL,
  `auto_sync_interval` int(11) NOT NULL,
  `override_existing` tinyint(4) NOT NULL,
  `add_prefix_for_existing` varchar(50) NOT NULL,
  `xmlimport_date` int(11) NOT NULL,
  `xmlimport_filetag` text NOT NULL,
  `xmlimport_billingtag` text NOT NULL,
  `xmlimport_shippingtag` text NOT NULL,
  `xmlimport_orderitemtag` text NOT NULL,
  `xmlimport_stocktag` text NOT NULL,
  `xmlimport_prdextrafieldtag` text NOT NULL,
  `published` tinyint(4) NOT NULL,
  `element_name` varchar(255) NOT NULL,
  `billing_element_name` varchar(255) NOT NULL,
  `shipping_element_name` varchar(255) NOT NULL,
  `orderitem_element_name` varchar(255) NOT NULL,
  `stock_element_name` varchar(255) NOT NULL,
  `prdextrafield_element_name` varchar(255) NOT NULL,
  `xmlexport_billingtag` text NOT NULL,
  `xmlexport_shippingtag` text NOT NULL,
  `xmlexport_orderitemtag` text NOT NULL,
  PRIMARY KEY (`xmlimport_id`),
  KEY `idx_auto_sync` (`auto_sync`),
  KEY `idx_sync_on_request` (`sync_on_request`),
  KEY `idx_auto_sync_interval` (`auto_sync_interval`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='redSHOP XML Import';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_xml_import_log`
--

DROP TABLE IF EXISTS `e42xo_redshop_xml_import_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_xml_import_log` (
  `xmlimport_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `xmlimport_id` int(11) NOT NULL,
  `xmlimport_filename` varchar(255) NOT NULL,
  `xmlimport_date` int(11) NOT NULL,
  PRIMARY KEY (`xmlimport_log_id`),
  KEY `idx_xmlimport_id` (`xmlimport_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='redSHOP XML Import log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redshop_zipcode`
--

DROP TABLE IF EXISTS `e42xo_redshop_zipcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redshop_zipcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(10) NOT NULL DEFAULT '',
  `state_code` varchar(10) NOT NULL DEFAULT '',
  `city_name` varchar(64) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `zipcodeto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zipcode` (`zipcode`),
  KEY `idx_country_code` (`country_code`),
  KEY `idx_state_code` (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redslider_galleries`
--

DROP TABLE IF EXISTS `e42xo_redslider_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redslider_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_user_id` int(10) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `modified_user_id` int(10) DEFAULT NULL,
  `modified_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redslider_slides`
--

DROP TABLE IF EXISTS `e42xo_redslider_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redslider_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `params` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_redslider_templates`
--

DROP TABLE IF EXISTS `e42xo_redslider_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_redslider_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `content` longtext,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_billinginfo`
--

DROP TABLE IF EXISTS `e42xo_rwf_billinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_billinginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `uniqueid` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(150) NOT NULL DEFAULT '',
  `company` varchar(150) NOT NULL DEFAULT '',
  `iscompany` tinyint(1) NOT NULL DEFAULT '0',
  `vatnumber` varchar(150) NOT NULL DEFAULT '',
  `address` text NOT NULL,
  `city` varchar(150) NOT NULL DEFAULT '',
  `zipcode` varchar(150) NOT NULL DEFAULT '',
  `phone` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `country` varchar(3) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='billing info for cart';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_cart`
--

DROP TABLE IF EXISTS `e42xo_rwf_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vat` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(3) NOT NULL DEFAULT '',
  `paid` tinyint(2) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `invoice_id` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='payment cart';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_cart_item`
--

DROP TABLE IF EXISTS `e42xo_rwf_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `payment_request_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `payment_request_id` (`payment_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='payment cart item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_fields`
--

DROP TABLE IF EXISTS `e42xo_rwf_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `field_header` varchar(255) NOT NULL DEFAULT '',
  `fieldtype` varchar(30) NOT NULL DEFAULT 'textfield',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redmember_field` varchar(20) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `tooltip` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Fields for redFORM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_form_field`
--

DROP TABLE IF EXISTS `e42xo_rwf_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_form_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `validate` tinyint(1) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `field_id` (`field_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='form field relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_forms`
--

DROP TABLE IF EXISTS `e42xo_rwf_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formname` varchar(100) NOT NULL DEFAULT 'NoName',
  `startdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` int(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `submissionsubject` varchar(255) NOT NULL DEFAULT '',
  `submissionbody` text NOT NULL,
  `showname` int(1) NOT NULL DEFAULT '0',
  `classname` varchar(45) NOT NULL DEFAULT '',
  `contactpersoninform` tinyint(1) NOT NULL DEFAULT '0',
  `contactpersonemail` varchar(255) NOT NULL DEFAULT '',
  `contactpersonemailsubject` varchar(255) NOT NULL DEFAULT '',
  `contactpersonfullpost` int(11) NOT NULL DEFAULT '0',
  `submitterinform` tinyint(1) NOT NULL DEFAULT '0',
  `submitnotification` tinyint(1) NOT NULL DEFAULT '0',
  `enable_confirmation` tinyint(1) NOT NULL DEFAULT '0',
  `enable_confirmation_notification` tinyint(1) NOT NULL DEFAULT '0',
  `confirmation_notification_recipients` text NOT NULL,
  `confirmation_contactperson_subject` varchar(255) NOT NULL DEFAULT '',
  `confirmation_contactperson_body` text NOT NULL,
  `redirect` varchar(300) NOT NULL DEFAULT '',
  `notificationtext` text NOT NULL,
  `formexpires` tinyint(1) NOT NULL DEFAULT '1',
  `captchaactive` tinyint(1) NOT NULL DEFAULT '0',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `activatepayment` tinyint(2) NOT NULL DEFAULT '0',
  `show_js_price` tinyint(2) NOT NULL DEFAULT '1',
  `currency` varchar(3) NOT NULL DEFAULT '',
  `paymentprocessing` text NOT NULL,
  `paymentaccepted` text NOT NULL,
  `contactpaymentnotificationsubject` text NOT NULL,
  `contactpaymentnotificationbody` text NOT NULL,
  `submitterpaymentnotificationsubject` text NOT NULL,
  `submitterpaymentnotificationbody` text NOT NULL,
  `cond_recipients` text NOT NULL,
  `requirebilling` tinyint(2) NOT NULL DEFAULT '0',
  `admin_notification_email_mode` tinyint(2) NOT NULL DEFAULT '0',
  `admin_notification_email_subject` varchar(255) NOT NULL DEFAULT '',
  `admin_notification_email_body` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Forms for redFORM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_forms_1`
--

DROP TABLE IF EXISTS `e42xo_rwf_forms_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_forms_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_1` text,
  `field_2` text,
  `field_3` text,
  `field_4` text,
  `field_5` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='redFORMS Form 1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_payment`
--

DROP TABLE IF EXISTS `e42xo_rwf_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submit_key` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gateway` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `paid` tinyint(2) NOT NULL DEFAULT '0',
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submit_key` (`submit_key`),
  KEY `cart_id` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='logging gateway notifications';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_payment_request`
--

DROP TABLE IF EXISTS `e42xo_rwf_payment_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_payment_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vat` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(3) NOT NULL DEFAULT '',
  `paid` tinyint(2) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='payment requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_payment_request_item`
--

DROP TABLE IF EXISTS `e42xo_rwf_payment_request_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_payment_request_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_request_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vat` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `payment_request_id` (`payment_request_id`),
  KEY `sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='payment request items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_section`
--

DROP TABLE IF EXISTS `e42xo_rwf_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `class` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='form sections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_submission_price_item`
--

DROP TABLE IF EXISTS `e42xo_rwf_submission_price_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_submission_price_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vat` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `submission_id` (`submission_id`),
  KEY `sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='submissions price items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_submitters`
--

DROP TABLE IF EXISTS `e42xo_rwf_submitters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_submitters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `submission_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `submission_ip` varchar(50) NOT NULL DEFAULT '',
  `confirmed_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `confirmed_ip` varchar(50) NOT NULL DEFAULT '',
  `confirmed_type` varchar(50) NOT NULL DEFAULT 'email',
  `integration` varchar(30) NOT NULL DEFAULT '',
  `answer_id` int(11) NOT NULL DEFAULT '0',
  `submitternewsletter` int(11) NOT NULL DEFAULT '0',
  `rawformdata` text NOT NULL,
  `submit_key` varchar(45) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(3) NOT NULL DEFAULT '',
  `vat` decimal(10,2) NOT NULL DEFAULT '0.00',
  `language` char(7) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `answer_id` (`answer_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Submitters for redFORM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_rwf_values`
--

DROP TABLE IF EXISTS `e42xo_rwf_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_rwf_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `field_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sku` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores fields options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_schemas`
--

DROP TABLE IF EXISTS `e42xo_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_session`
--

DROP TABLE IF EXISTS `e42xo_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint(3) unsigned DEFAULT NULL,
  `guest` tinyint(3) unsigned DEFAULT '1',
  `time` int(11) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`),
  KEY `client_id_guest` (`client_id`,`guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_aliases`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newurl` varchar(2048) DEFAULT NULL,
  `alias` varchar(2048) DEFAULT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `target_type` tinyint(3) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `state` (`state`),
  KEY `newurl` (`newurl`(190)),
  KEY `alias` (`alias`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_hits_404s`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_hits_404s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_hits_404s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(2048) DEFAULT NULL,
  `target` varchar(2048) DEFAULT NULL,
  `target_domain` varchar(191) NOT NULL DEFAULT '',
  `referrer` varchar(2048) DEFAULT NULL,
  `referrer_domain` varchar(191) NOT NULL DEFAULT '',
  `user_agent` varchar(191) NOT NULL DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_agent` (`user_agent`),
  KEY `ip_address` (`ip_address`),
  KEY `type` (`type`),
  KEY `url` (`url`(190)),
  KEY `referrer` (`referrer`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_hits_aliases`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_hits_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_hits_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(2048) DEFAULT NULL,
  `target` varchar(2048) DEFAULT NULL,
  `target_domain` varchar(191) NOT NULL DEFAULT '',
  `referrer` varchar(2048) DEFAULT NULL,
  `referrer_domain` varchar(191) NOT NULL DEFAULT '',
  `user_agent` varchar(191) NOT NULL DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_agent` (`user_agent`),
  KEY `ip_address` (`ip_address`),
  KEY `type` (`type`),
  KEY `url` (`url`(190)),
  KEY `referrer` (`referrer`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_hits_shurls`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_hits_shurls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_hits_shurls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(2048) DEFAULT NULL,
  `target` varchar(2048) DEFAULT NULL,
  `target_domain` varchar(191) NOT NULL DEFAULT '',
  `referrer` varchar(2048) DEFAULT NULL,
  `referrer_domain` varchar(191) NOT NULL DEFAULT '',
  `user_agent` varchar(191) NOT NULL DEFAULT '',
  `ip_address` varchar(50) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_agent` (`user_agent`),
  KEY `ip_address` (`ip_address`),
  KEY `type` (`type`),
  KEY `url` (`url`(190)),
  KEY `referrer` (`referrer`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_keystore`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_keystore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_keystore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(50) NOT NULL DEFAULT 'default',
  `key` varchar(191) NOT NULL DEFAULT '',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `format` tinyint(3) NOT NULL DEFAULT '1',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `main` (`scope`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_metas`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_metas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newurl` varchar(2048) DEFAULT NULL,
  `metadesc` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metakey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `metatitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `metalang` varchar(30) DEFAULT '',
  `metarobots` varchar(30) DEFAULT '',
  `canonical` varchar(2048) DEFAULT '',
  `og_enable` tinyint(3) NOT NULL DEFAULT '2',
  `og_type` varchar(30) DEFAULT '',
  `og_image` varchar(255) DEFAULT '',
  `og_enable_description` tinyint(3) NOT NULL DEFAULT '2',
  `og_enable_site_name` tinyint(3) NOT NULL DEFAULT '2',
  `og_site_name` varchar(255) DEFAULT '',
  `fb_admin_ids` varchar(255) DEFAULT '',
  `og_enable_location` tinyint(3) NOT NULL DEFAULT '2',
  `og_latitude` varchar(30) DEFAULT '',
  `og_longitude` varchar(30) DEFAULT '',
  `og_street_address` varchar(255) DEFAULT '',
  `og_locality` varchar(255) DEFAULT '',
  `og_postal_code` varchar(30) DEFAULT '',
  `og_region` varchar(255) DEFAULT '',
  `og_country_name` varchar(255) DEFAULT '',
  `og_enable_contact` tinyint(3) NOT NULL DEFAULT '2',
  `og_email` varchar(255) DEFAULT '',
  `og_phone_number` varchar(255) DEFAULT '',
  `og_fax_number` varchar(255) DEFAULT '',
  `og_enable_fb_admin_ids` tinyint(3) NOT NULL DEFAULT '2',
  `og_custom_description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raw_content_head_top` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `raw_content_head_bottom` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `raw_content_body_top` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `raw_content_body_bottom` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twittercards_enable` tinyint(3) NOT NULL DEFAULT '2',
  `twittercards_site_account` varchar(100) DEFAULT '',
  `twittercards_creator_account` varchar(100) DEFAULT '',
  `google_authorship_enable` tinyint(3) NOT NULL DEFAULT '2',
  `google_authorship_author_profile` varchar(255) DEFAULT '',
  `google_authorship_author_name` varchar(255) DEFAULT '',
  `google_publisher_enable` tinyint(3) NOT NULL DEFAULT '2',
  `google_publisher_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `newurl` (`newurl`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_pageids`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_pageids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_pageids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newurl` varchar(2048) DEFAULT NULL,
  `pageid` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `alias` (`pageid`(190)),
  KEY `type` (`type`),
  KEY `newurl` (`newurl`(190))
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_urls`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpt` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `oldurl` varchar(2048) DEFAULT NULL,
  `newurl` varchar(2048) DEFAULT NULL,
  `option` varchar(255) NOT NULL DEFAULT '',
  `referrer_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Used for 404, 0 = not set, 1 = external, 2 = internal',
  `dateadd` date NOT NULL DEFAULT '0000-00-00',
  `last_hit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `rank` (`rank`),
  KEY `last_hit` (`last_hit`),
  KEY `oldurl` (`oldurl`(190)),
  KEY `newurl` (`newurl`(190))
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_sh404sef_urls_src`
--

DROP TABLE IF EXISTS `e42xo_sh404sef_urls_src`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_sh404sef_urls_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(2048) DEFAULT NULL,
  `routed_url` varchar(2048) DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `source_url` varchar(2048) DEFAULT NULL,
  `source_routed_url` varchar(2048) DEFAULT NULL,
  `trace` varchar(7000) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `rank` (`rank`),
  KEY `url` (`url`(190)),
  KEY `routed_url` (`routed_url`(190)),
  KEY `source_url` (`source_url`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_shlib_consumers`
--

DROP TABLE IF EXISTS `e42xo_shlib_consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_shlib_consumers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL DEFAULT '',
  `context` varchar(50) NOT NULL DEFAULT '',
  `min_version` varchar(20) NOT NULL DEFAULT '0',
  `max_version` varchar(20) NOT NULL DEFAULT '0',
  `refuse_versions` varchar(255) NOT NULL DEFAULT '',
  `accept_versions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_context` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_shlib_resources`
--

DROP TABLE IF EXISTS `e42xo_shlib_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_shlib_resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL DEFAULT '',
  `current_version` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_resource` (`resource`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_tags`
--

DROP TABLE IF EXISTS `e42xo_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_template_styles`
--

DROP TABLE IF EXISTS `e42xo_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_client_id_home` (`client_id`,`home`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_ucm_base`
--

DROP TABLE IF EXISTS `e42xo_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_ucm_content`
--

DROP TABLE IF EXISTS `e42xo_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_language` (`core_language`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_content_type` (`core_type_alias`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_ucm_history`
--

DROP TABLE IF EXISTS `e42xo_ucm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_update_sites`
--

DROP TABLE IF EXISTS `e42xo_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_update_sites_extensions`
--

DROP TABLE IF EXISTS `e42xo_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_updates`
--

DROP TABLE IF EXISTS `e42xo_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_user_keys`
--

DROP TABLE IF EXISTS `e42xo_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_user_notes`
--

DROP TABLE IF EXISTS `e42xo_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_user_profiles`
--

DROP TABLE IF EXISTS `e42xo_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_user_usergroup_map`
--

DROP TABLE IF EXISTS `e42xo_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_usergroups`
--

DROP TABLE IF EXISTS `e42xo_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_users`
--

DROP TABLE IF EXISTS `e42xo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `idx_name` (`name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_users_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_users_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_users_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(11) DEFAULT NULL,
  `name` varchar(400) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `588ebf12470928d6fcbfa2ec372b23da` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `c037c3e8946eccca627ca71d8a56e4b1` (`id`),
  CONSTRAINT `c037c3e8946eccca627ca71d8a56e4b1` FOREIGN KEY (`id`) REFERENCES `e42xo_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_utf8_conversion`
--

DROP TABLE IF EXISTS `e42xo_utf8_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_viewlevels`
--

DROP TABLE IF EXISTS `e42xo_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_wblib_keystore`
--

DROP TABLE IF EXISTS `e42xo_wblib_keystore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_wblib_keystore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(50) NOT NULL DEFAULT 'default',
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `format` tinyint(3) NOT NULL DEFAULT '1',
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `main` (`scope`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_wblib_messages`
--

DROP TABLE IF EXISTS `e42xo_wblib_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_wblib_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `sub_type` varchar(150) NOT NULL DEFAULT '',
  `display_type` tinyint(3) NOT NULL DEFAULT '0',
  `uid` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(512) DEFAULT NULL,
  `body` varchar(2048) NOT NULL DEFAULT '',
  `action` tinyint(3) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hide_after` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hide_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `scope` (`scope`),
  KEY `type_index` (`type`,`sub_type`),
  KEY `acked_on` (`acked_on`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_weblinks`
--

DROP TABLE IF EXISTS `e42xo_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `images` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e42xo_weblinks_rctranslations`
--

DROP TABLE IF EXISTS `e42xo_weblinks_rctranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e42xo_weblinks_rctranslations` (
  `rctranslations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rctranslations_language` char(7) NOT NULL DEFAULT '',
  `rctranslations_originals` text NOT NULL,
  `rctranslations_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rctranslations_state` tinyint(3) NOT NULL DEFAULT '1',
  `id` int(10) unsigned DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` text,
  `url` varchar(250) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `rctranslations_modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`rctranslations_id`),
  KEY `language_idx` (`rctranslations_language`,`rctranslations_state`),
  KEY `8677fe42c39f2636180d4d9ab777d29c` (`rctranslations_language`,`rctranslations_state`,`id`),
  KEY `7c9dfdb96da98a5d2443d131676d83cc` (`id`),
  CONSTRAINT `7c9dfdb96da98a5d2443d131676d83cc` FOREIGN KEY (`id`) REFERENCES `e42xo_weblinks` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'salacious'
--

-- insufficient privileges to SHOW CREATE PROCEDURE `redSHOP_Column_Remove`
-- does thammyvienthaomy have permissions on mysql.proc?

