CREATE DATABASE  IF NOT EXISTS `cms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci */;
USE `cms`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cms
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_address_book_customers_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (3,2,NULL,'CompanyB','FirstNameB','LastNameB','3','EstateB','BuildingB','RoomB','2020-03-26 08:42:08',NULL,'2020-03-26 08:42:08',NULL,'active','yes'),(5,1,3333,'b1',NULL,NULL,'1','1','33','22','2020-03-30 10:01:30',NULL,'2020-04-03 08:49:39',NULL,'active','no'),(14,1,33333333,'cccc',NULL,NULL,'6','ccc','ccc','cccc','2020-03-31 10:14:03',NULL,'2020-04-03 08:49:39',NULL,'active','yes');
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_type`
--

DROP TABLE IF EXISTS `admin_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin_type` (
  `admin_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`admin_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_type`
--

LOCK TABLES `admin_type` WRITE;
/*!40000 ALTER TABLE `admin_type` DISABLE KEYS */;
INSERT INTO `admin_type` VALUES (1,'boss','Shop Boss','2019-11-11 00:00:00',1,'2019-11-11 00:00:00','1','active'),(2,'manager','Shop Manager','2019-11-11 00:00:00',1,'2019-11-11 00:00:00','1','active'),(3,'admin','Shop Admin','2019-11-11 00:00:00',1,'2019-11-11 00:00:00','1','active'),(4,'staff','Shop Staff','2019-11-11 00:00:00',1,'2019-11-11 00:00:00','1','active');
/*!40000 ALTER TABLE `admin_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `administrators` (
  `myid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_str` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `adminType` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`myid`),
  UNIQUE KEY `administrators_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'Admin','','admin@gmail.com','$2y$10$oG7Hz/ikZqsvAjQM06hA9uci8IUPFr77Jo/g/.uWwT8yDEeCmDdLi','admin',1,'address','Nivada','12','31271','223','+92 314 6681998','resources/views/admin/images/admin_profile/1505132393.1486628854.fast.jpg',1,'F7AgwbA1Ub95yyD2sEPXN7FvVeo1jShTWvmpK7jsQaNIdjRSObfN9jM39VP4','0000-00-00 00:00:00','2017-12-11 20:58:51'),(4,'Admin','','acornjamie123@gmail.com','$2y$10$oG7Hz/ikZqsvAjQM06hA9uci8IUPFr77Jo/g/.uWwT8yDEeCmDdLi','admin',1,'address','Nivada','12','31271','223','+92 314 6681998','resources/views/admin/images/admin_profile/1505132393.1486628854.fast.jpg',1,'n1qqEd4mwEciYiLjXPDosdpmHDYTB91NOXEbu0vr1aXy5XfF8tVUfl4tQwAB',NULL,NULL),(5,'Vector','Coder','vectorcoder@gmail.com','$2y$10$TKJBNrT7bkFqz49XazJL7.mTa49DI9CeCcZipjuFer1h.OeZWsaHC','',1,'228 Park Ave S','New York','1','10003','223','+1 656 458 787 87','resources/views/admin/images/admin_profile/1505132393.1486628854.fast.jpg',1,'AEuL3ix3r4xQpW1yvYYWsyojhRXnFobPWrWdYVLNI7BzQjUTGVyFjHt16nxY',NULL,'2018-02-07 07:54:49'),(6,'Admin','','demo@ecommerce.com','$2y$10$vbQE1Lbu1kXCAILSvaH0uOZ3oA6oZdCf/0kjQB16iGnjc3eTaFBeu','',1,'address','Nivada','1','10003','223','+1 656 458 787 87','resources/views/admin/images/admin_profile/1505132393.1486628854.fast.jpg',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_settings`
--

DROP TABLE IF EXISTS `alert_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alert_settings` (
  `alert_id` int(100) NOT NULL AUTO_INCREMENT,
  `create_customer_email` tinyint(1) NOT NULL DEFAULT '0',
  `create_customer_notification` tinyint(1) NOT NULL DEFAULT '0',
  `order_status_email` tinyint(1) NOT NULL DEFAULT '0',
  `order_status_notification` tinyint(1) NOT NULL DEFAULT '0',
  `new_product_email` tinyint(1) NOT NULL DEFAULT '0',
  `new_product_notification` tinyint(1) NOT NULL DEFAULT '0',
  `forgot_email` tinyint(1) NOT NULL DEFAULT '0',
  `forgot_notification` tinyint(1) NOT NULL DEFAULT '0',
  `news_email` tinyint(1) NOT NULL DEFAULT '0',
  `news_notification` tinyint(1) NOT NULL DEFAULT '0',
  `contact_us_email` tinyint(1) NOT NULL DEFAULT '0',
  `contact_us_notification` tinyint(1) NOT NULL DEFAULT '0',
  `order_email` tinyint(1) NOT NULL DEFAULT '0',
  `order_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`alert_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_settings`
--

LOCK TABLES `alert_settings` WRITE;
/*!40000 ALTER TABLE `alert_settings` DISABLE KEYS */;
INSERT INTO `alert_settings` VALUES (1,0,1,0,1,0,1,0,1,0,1,0,0,0,0);
/*!40000 ALTER TABLE `alert_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_calls_list`
--

DROP TABLE IF EXISTS `api_calls_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_calls_list` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nonce` text NOT NULL,
  `url` varchar(64) NOT NULL,
  `device_id` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_calls_list`
--

LOCK TABLES `api_calls_list` WRITE;
/*!40000 ALTER TABLE `api_calls_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_calls_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,10,'中西區','Central and Western',1,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(2,10,'灣仔','Wan Chai',1,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(3,10,'東區','Eastern',1,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(4,10,'南區','Southern',1,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(5,10,'油尖旺','Yau Tsim Mong',1,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(6,10,'深水埗','Sham Shui Po',2,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(7,10,'九龍城','Kowloon City',2,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(8,10,'黃大仙','Wong Tai Sin',2,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(9,10,'觀塘','Kwun Tong',2,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(10,10,'葵青','Kwai Tsing',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(11,10,'荃灣','Tsuen Wan',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(12,10,'屯門','Tuen Mun',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(13,10,'元朗','Yuen Long',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(14,10,'北區','North',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(15,10,'大埔','Tai Po',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(16,10,'沙田','Sha Tin',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(17,10,'西貢','Sai Kung',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active'),(18,10,'離島','Islands',3,'2020-03-12 02:27:15',NULL,'2020-03-12 02:27:15',NULL,'active');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `banners_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banners_image` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `banners_group` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `banners_html_text` mediumtext COLLATE utf8_unicode_ci,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `banners_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'banner-1','7','resources/assets/images/banner_images/1504099866.banner_1.jpg','',NULL,0,'2030-01-01 00:00:00',NULL,'2017-08-30 13:31:06','2017-08-30 13:31:06',1,'category',''),(2,'Banner-2','12','resources/assets/images/banner_images/1502370343.banner_2.jpg','',NULL,0,'2020-01-01 00:00:00',NULL,'2017-08-10 13:05:43',NULL,1,'category',''),(3,'Banner-3','23','resources/assets/images/banner_images/1502370366.banner_3.jpg','',NULL,0,'2030-01-01 00:00:00',NULL,'2017-08-10 13:06:06',NULL,1,'category',''),(4,'Banner-4','17','resources/assets/images/banner_images/1502370387.banner_4.jpg','',NULL,0,'2030-01-01 00:00:00',NULL,'2017-08-10 13:06:27',NULL,1,'category',''),(5,'Banner-5','19','resources/assets/images/banner_images/1502370406.banner_5.jpg','',NULL,0,'2030-01-01 00:00:00',NULL,'2017-08-10 13:06:46',NULL,1,'category','');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `image` mediumtext COLLATE utf8_unicode_ci,
  `icon` mediumtext COLLATE utf8_unicode_ci,
  `sort_order` int(3) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,10,NULL,'1',NULL,NULL,'2020-02-28 06:08:26',NULL,'2020-02-28 06:08:26',NULL,'active');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_description`
--

DROP TABLE IF EXISTS `category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category_description` (
  `category_description_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_description_id`),
  KEY `idx_categories_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_description`
--

LOCK TABLES `category_description` WRITE;
/*!40000 ALTER TABLE `category_description` DISABLE KEYS */;
INSERT INTO `category_description` VALUES (1,'Category',11,1,'2020-02-28 06:08:26',NULL,'2020-02-28 06:08:26',NULL,'active');
/*!40000 ALTER TABLE `category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `countries_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,10,'港島','HONG KONG',1,'2020-03-12 03:05:42',NULL,'2020-03-12 03:05:42',NULL,'active'),(2,10,'九龍','KOWLOON',1,'2020-03-12 03:05:42',NULL,'2020-03-12 03:05:42',NULL,'active'),(3,10,'新界','NEW ERRITORIES',1,'2020-03-12 03:05:42',NULL,'2020-03-12 03:05:42',NULL,'active');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `party_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `is_main_company` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `image` text COLLATE utf8_general_mysql500_ci,
  `phone` int(11) DEFAULT NULL,
  `district_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `estate` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `building` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `room` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `address_ch` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `address_en` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (10,'10.TL','yes','companyA@gmail.com',NULL,22222222,NULL,NULL,NULL,NULL,NULL,NULL,'2020-02-28 06:03:16',NULL,'2020-02-28 06:03:16',NULL,'active');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_description`
--

DROP TABLE IF EXISTS `company_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_description` (
  `company_description_id` int(100) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8_general_mysql500_ci NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`company_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_description`
--

LOCK TABLES `company_description` WRITE;
/*!40000 ALTER TABLE `company_description` DISABLE KEYS */;
INSERT INTO `company_description` VALUES (1,10,'companyA',1,'2020-02-28 06:03:16',NULL,'2020-02-28 06:03:16',NULL,'active');
/*!40000 ALTER TABLE `company_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_image`
--

DROP TABLE IF EXISTS `company_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_image` (
  `company_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `image` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`company_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_image`
--

LOCK TABLES `company_image` WRITE;
/*!40000 ALTER TABLE `company_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code_1` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_code_2` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_format_id` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_COUNTRIES_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,10,'香港','HongKong',NULL,NULL,'2020-03-12 02:25:46',NULL,'2020-03-12 02:26:31',NULL,'active');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coupons` (
  `coupans_id` int(100) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Options: fixed_cart, percent, fixed_product and percent_product. Default: fixed_cart.',
  `amount` int(11) NOT NULL,
  `expiry_date` datetime NOT NULL,
  `usage_count` int(100) NOT NULL,
  `individual_use` tinyint(1) NOT NULL DEFAULT '0',
  `product_ids` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exclude_product_ids` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `usage_limit` int(100) NOT NULL,
  `usage_limit_per_user` int(100) NOT NULL,
  `limit_usage_to_x_items` int(100) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `product_categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excluded_product_categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exclude_sale_items` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `email_restrictions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `used_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`coupans_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `symbol_left` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol_right` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decimal_point` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thousands_point` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decimal_places` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'U.S. Dollar','USD','$',NULL,'.','.','2',NULL,'2017-02-09 00:00:00'),(2,'Euro','EUR',NULL,'€','.','.','2',NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `default_language_id` int(11) NOT NULL,
  `picture` text COLLATE utf8_general_mysql500_ci,
  `gender` char(1) COLLATE utf8_general_mysql500_ci DEFAULT '0',
  `firstname` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `default_address_id` int(11) DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_general_mysql500_ci NOT NULL,
  `password_str` varchar(60) COLLATE utf8_general_mysql500_ci NOT NULL,
  `fb_id` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,10,11,'storage/company/10/customer/images/1582870442.14.png','M','customer','A','2020-02-01','customerA@gmail.com',NULL,NULL,'2222222',NULL,'$2y$10$K.5RHH4z9.oDc.8bWu8AhOrsq2NLWwuQeCszXa9ErFMKyn8Xw9mFK','123123',NULL,NULL,'2020-02-28 06:14:02',NULL,'2020-02-28 06:14:02',NULL,'active'),(2,10,11,'storage/company/10/customer/images/1582870475.1024_icon.png','F','Customer','B','2020-02-01','customerb@gmail.com',NULL,NULL,'33333333',NULL,'$2y$10$CftVsPkzmh0/CdoQygVbR.bODE8Dy/QXdzn2L150zXs091QsPN7u6','123123',NULL,NULL,'2020-02-28 06:14:35',NULL,'2020-02-28 06:14:35',NULL,'active');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_token`
--

DROP TABLE IF EXISTS `customer_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `customer_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `parent_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `token` longtext COLLATE utf8_general_mysql500_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2947 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_token`
--

LOCK TABLES `customer_token` WRITE;
/*!40000 ALTER TABLE `customer_token` DISABLE KEYS */;
INSERT INTO `customer_token` VALUES (2790,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL2xvZ2luIiwiaWF0IjoxNTg2NDA2NTI3LCJleHAiOjE1ODY0MTAxMjcsIm5iZiI6MTU4NjQwNjUyNywianRpIjoibG1pQjE5WjBYZVhBRThaQyIsInN1YiI6MSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.HW-bMbeqWETVtllwq7M6bFuoiF3vPJQ1a69MbSbrX0M','2020-04-09 04:28:47','2020-04-09 04:28:47','2020-04-09 04:28:47','cancel'),(2791,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1MjcsImV4cCI6MTU4NjQxMDEyNywibmJmIjoxNTg2NDA2NTI3LCJqdGkiOiJqbUxjd2FaUE1ScHZwSGxCIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.9DZMT4CUb_WeXSccddxYJk9_TSYLIvHngn0t9SCxL1s','2020-04-09 04:28:47','2020-04-09 04:28:47','2020-04-09 04:28:49','cancel'),(2792,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1MjcsImV4cCI6MTU4NjQxMDEyOSwibmJmIjoxNTg2NDA2NTI5LCJqdGkiOiJ3d0w5Z25WZHJ2Q2NaMFZ1Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.JX0pCjP_jfH1EMyx2LpXEZPGD8u5qs-5_R30UlJNe6k','2020-04-09 04:28:49','2020-04-09 04:28:57','2020-04-09 04:28:57','cancel'),(2793,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL2xvZ2luIiwiaWF0IjoxNTg2NDA2NTM5LCJleHAiOjE1ODY0MTAxMzksIm5iZiI6MTU4NjQwNjUzOSwianRpIjoiRDcxNk5WVGFVZlQwVldUViIsInN1YiI6MSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.twOoZQ4d_tJLi8c-j_ZYHKoLFWoVnxsjlxwn5URgBkI','2020-04-09 04:28:59','2020-04-09 04:28:59','2020-04-09 04:28:59','cancel'),(2794,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1MzksImV4cCI6MTU4NjQxMDEzOSwibmJmIjoxNTg2NDA2NTM5LCJqdGkiOiJuNmhocjVteFNpekthY3llIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.DgICH916M02D6ZdmUjeEsOeDqczXZfpYL28wJ-2MZL0','2020-04-09 04:28:59','2020-04-09 04:28:59','2020-04-09 04:29:13','cancel'),(2795,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1MzksImV4cCI6MTU4NjQxMDE1MywibmJmIjoxNTg2NDA2NTUzLCJqdGkiOiJOeDhkb0huOEtVNVRVTUVFIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.CADtd1uYnYOqppacBPAY5CQpZSu3zkUXV4NY78Cn3CA','2020-04-09 04:29:13','2020-04-09 04:29:13','2020-04-09 04:29:15','cancel'),(2796,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1MzksImV4cCI6MTU4NjQxMDE1NSwibmJmIjoxNTg2NDA2NTU1LCJqdGkiOiJ1RndvWXc1U2R5ZjlkWGVzIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.RbFw53gmLinypjxKqaz7DsI-La4auo9xXJPT7EW8upY','2020-04-09 04:29:15','2020-04-09 04:29:16','2020-04-09 04:29:16','cancel'),(2797,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL2xvZ2luIiwiaWF0IjoxNTg2NDA2NTU4LCJleHAiOjE1ODY0MTAxNTgsIm5iZiI6MTU4NjQwNjU1OCwianRpIjoibDB2elRBT1BnMnR4SHVOZyIsInN1YiI6MSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.K5Oa7m0b_ybwBWGSSBxBcFHAm8KD7Mc5Hh8HiXX8gV0','2020-04-09 04:29:18','2020-04-09 04:29:18','2020-04-09 04:29:19','cancel'),(2798,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1NTgsImV4cCI6MTU4NjQxMDE1OSwibmJmIjoxNTg2NDA2NTU5LCJqdGkiOiJBZXNEOXJhUjVLN1BMODQyIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.ErVV_FNQZp59v0yLNuDWONIzFgK5B4eqlN2XhcJrfxM','2020-04-09 04:29:19','2020-04-09 04:29:19','2020-04-09 04:29:22','cancel'),(2799,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1NTgsImV4cCI6MTU4NjQxMDE2MiwibmJmIjoxNTg2NDA2NTYyLCJqdGkiOiJpWVYwc2ZyTWtiSnlBVHB0Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.72TJi2xhZVrnXI24Knh0XzKFj_SWR5Ko1rMhvGVeYWk','2020-04-09 04:29:22','2020-04-09 04:29:22','2020-04-09 04:29:33','cancel'),(2800,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1NTgsImV4cCI6MTU4NjQxMDE3MywibmJmIjoxNTg2NDA2NTczLCJqdGkiOiI2T0J0TVZmUnNLRkdaUnFHIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.G7Rx3iKgJw3wIl2qOBaOhC9Q3GSjV9qtcpMPgY_z4Ok','2020-04-09 04:29:33','2020-04-09 04:29:33','2020-04-09 04:29:50','cancel'),(2801,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY1NTgsImV4cCI6MTU4NjQxMDE5MCwibmJmIjoxNTg2NDA2NTkwLCJqdGkiOiJEYTl3MG90Z2g1Mkxmd2JyIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.1FolEVo5WG5PyxGEk2GjeJ9X1ii7pip3rA8x-oyP6kM','2020-04-09 04:29:50','2020-04-09 04:29:58','2020-04-09 04:29:58','cancel'),(2802,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL2xvZ2luIiwiaWF0IjoxNTg2NDA2NjMwLCJleHAiOjE1ODY0MTAyMzAsIm5iZiI6MTU4NjQwNjYzMCwianRpIjoib3lwbGxtZGs4elpSNE8xaSIsInN1YiI6MSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.DrncuPUY2w2l2oijFpz6YR0yVYtou4egammpB96fLaU','2020-04-09 04:30:30','2020-04-09 04:30:30','2020-04-09 04:30:30','cancel'),(2803,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY2MzAsImV4cCI6MTU4NjQxMDIzMCwibmJmIjoxNTg2NDA2NjMwLCJqdGkiOiJRQWJkWjVJWFRhVlNrZ2NwIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.VqS_-VfT7GdHOEg6-Iw9OvcUMOfE2rdo-Kvcam1R2_0','2020-04-09 04:30:30','2020-04-09 04:30:30','2020-04-09 04:46:00','cancel'),(2804,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDY2MzAsImV4cCI6MTU4NjQxMTE2MCwibmJmIjoxNTg2NDA3NTYwLCJqdGkiOiI0SVhhcjJCYXVYcXB0MndNIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0._wPy-0UogASM6WmI6qhqb3KxFBWEpNUC5XLL3SEPjJA','2020-04-09 04:46:00','2020-04-09 04:46:01','2020-04-09 04:46:01','cancel'),(2805,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL2xvZ2luIiwiaWF0IjoxNTg2NDA3NTYzLCJleHAiOjE1ODY0MTExNjMsIm5iZiI6MTU4NjQwNzU2MywianRpIjoiMFB1RmV5Q2QwNmNla1JxUyIsInN1YiI6MSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.HH_Nom8IFrY8B9-iqZsSs9e6OM7JsO1V_xGGOdt3mhY','2020-04-09 04:46:03','2020-04-09 04:46:03','2020-04-09 04:46:03','cancel'),(2806,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDc1NjMsImV4cCI6MTU4NjQxMTE2MywibmJmIjoxNTg2NDA3NTYzLCJqdGkiOiI4SnN1U1hZOUxRU1B5TGxLIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.wWobdP_4Cut0NzmzgvPpLkbRnMnHefaQVdygHuZpstI','2020-04-09 04:46:03','2020-04-09 04:46:03','2020-04-09 04:48:07','cancel'),(2807,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDc1NjMsImV4cCI6MTU4NjQxMTI4NywibmJmIjoxNTg2NDA3Njg3LCJqdGkiOiJYVVF3Um5UekFzc3pMamhBIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.2fK5FLeJsXgHZHqXQ2LYmKfUk6zOXfD7TSfaI-rK9KY','2020-04-09 04:48:07','2020-04-09 04:48:07','2020-04-09 04:53:17','cancel'),(2808,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL2xvZ2luIiwiaWF0IjoxNTg2NDA3OTk3LCJleHAiOjE1ODY0MTE1OTcsIm5iZiI6MTU4NjQwNzk5NywianRpIjoiTnM3cXB0WEE0Q3I5ZmtVZCIsInN1YiI6MSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.rzAzrUAEaRy-iy4YcF83lalAhDiclZBQExhkRV-9YGQ','2020-04-09 04:53:17','2020-04-09 04:53:17','2020-04-09 04:53:18','cancel'),(2809,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MDc5OTcsImV4cCI6MTU4NjQxMTU5OCwibmJmIjoxNTg2NDA3OTk4LCJqdGkiOiJKdjZQOVZxM0JQT2lQVXMyIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.HlBbyIeOJanQE_us-gG3Kr7FW17aOX-TO_5RwkziguI','2020-04-09 04:53:18','2020-04-09 04:53:18','2020-04-09 09:22:10','cancel'),(2810,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL2xvZ2luIiwiaWF0IjoxNTg2NDI0MTMwLCJleHAiOjE1ODY0Mjc3MzAsIm5iZiI6MTU4NjQyNDEzMCwianRpIjoibE9na01XUktFeUhMOWRBZyIsInN1YiI6MSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.yUuDD-HzFUP8gLKB_i2pNMJgp0JUcQgl7nTNRZTDK0g','2020-04-09 09:22:10','2020-04-09 09:22:10','2020-04-09 09:22:11','cancel'),(2811,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMTE2XC9hZG1pblwvYXBpXC9hcHBcL3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE1ODY0MjQxMzAsImV4cCI6MTU4NjQyNzczMSwibmJmIjoxNTg2NDI0MTMxLCJqdGkiOiJiYlhrUXRjbE1HMHRTV0p5Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.z-lyB544gh44T3OSvSrgHrXHusKHTi-8Wm2nPZStbEE','2020-04-09 09:22:11','2020-04-09 09:22:11','2020-04-19 14:14:08','cancel'),(2812,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMDU2NDgsImV4cCI6MTU4NzMwOTI0OCwibmJmIjoxNTg3MzA1NjQ4LCJqdGkiOiJ3SGhOMXRJRk42Q0s4RzhVIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.0axKdqTJgrG1dmKLphjAfw3Kw3Pf5kpNDek65wLGUwU','2020-04-19 14:14:08','2020-04-19 14:14:08','2020-04-19 14:14:09','cancel'),(2813,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzA5MjQ5LCJuYmYiOjE1ODczMDU2NDksImp0aSI6IkIwSDdFRUZ3S0FGeWNNeFYiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.fsMDtzfdXEm2dzRSLvSznY4WbcRHCx1iw-mN24p09p8','2020-04-19 14:14:09','2020-04-19 14:14:09','2020-04-19 14:14:20','cancel'),(2814,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzA5MjYwLCJuYmYiOjE1ODczMDU2NjAsImp0aSI6InVhYjZSUUMyb2hmMTVwODUiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.pYTbyU503nr_RqgcAn4GZObYeguzorpMfq0-ltZ2nUQ','2020-04-19 14:14:20','2020-04-19 14:14:20','2020-04-19 14:22:08','cancel'),(2815,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMDYxMjgsImV4cCI6MTU4NzMwOTcyOCwibmJmIjoxNTg3MzA2MTI4LCJqdGkiOiJHTndpbkxWZDBsZTJ6SmZtIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.2O-rW_qpQEP6v_4c5wJhkREFH5rHN-UFG0nZSdCPNcg','2020-04-19 14:22:08','2020-04-19 14:22:08','2020-04-19 14:28:22','cancel'),(2816,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwMTAyLCJuYmYiOjE1ODczMDY1MDIsImp0aSI6IlZzT0Q2SmpZYmJlOVlRMFgiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.HhbBIOr4k--w_n_nhfR4GboZrsMe25lhqixI8N21OhQ','2020-04-19 14:28:22','2020-04-19 14:28:22','2020-04-19 14:29:18','cancel'),(2817,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwMTU4LCJuYmYiOjE1ODczMDY1NTgsImp0aSI6IlRqd2k2TXpCbm5IRGJIaXUiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.OG12KPa0lCZs_pBcNw7XTWPo-9CH-6dMxinhTOt6WD4','2020-04-19 14:29:18','2020-04-19 14:29:18','2020-04-19 14:30:44','cancel'),(2818,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwMjQ0LCJuYmYiOjE1ODczMDY2NDQsImp0aSI6ImNqU0NHb0RpQ3ZrQ0lTUDEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.PhMeVpM6r3wyqUNzeD5UPSHZqmAm6G-KDPktpjtA4i4','2020-04-19 14:30:44','2020-04-19 14:30:44','2020-04-19 14:31:52','cancel'),(2819,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwMzEyLCJuYmYiOjE1ODczMDY3MTIsImp0aSI6ImpHVjI2THZZdFZZZGg3SU8iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.KVpn_0iFKZd9pJCNKZPKrWUrJWc0sHYF2QFBxeKuVR4','2020-04-19 14:31:52','2020-04-19 14:31:52','2020-04-19 14:31:58','cancel'),(2820,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwMzE4LCJuYmYiOjE1ODczMDY3MTgsImp0aSI6Im1waVZSUEE1WWpXUTVHdHEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.ecm51kkS0je1GVwhHdHkZkl72bFy0cmyBGJiMe2zS7E','2020-04-19 14:31:58','2020-04-19 14:31:58','2020-04-19 14:32:24','cancel'),(2821,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwMzQ0LCJuYmYiOjE1ODczMDY3NDQsImp0aSI6InlVRkhUSTZzNGw1RHhvODAiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.0r9s1CO6ZUcP71Qw4W8ON1Ep0-UyEDArT_XWFrGVjv0','2020-04-19 14:32:24','2020-04-19 14:32:24','2020-04-19 14:32:30','cancel'),(2822,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwMzUwLCJuYmYiOjE1ODczMDY3NTAsImp0aSI6IkZ3VlF6eFQzZmFzWnVDb1UiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.knhxx-qm0tLJ6VQPGVXWadrslfuW-BAuAkWbcsooAGE','2020-04-19 14:32:30','2020-04-19 14:32:30','2020-04-19 14:34:01','cancel'),(2823,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwNDQxLCJuYmYiOjE1ODczMDY4NDEsImp0aSI6Imo4YTh3VElrcDlwSjN4U3MiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.JALmDPyDSPuDitadLYHoRj6l4OKxKW32c1R7ErSut14','2020-04-19 14:34:01','2020-04-19 14:34:01','2020-04-19 14:34:05','cancel'),(2824,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMwNTY0OCwiZXhwIjoxNTg3MzEwNDQ1LCJuYmYiOjE1ODczMDY4NDUsImp0aSI6IllrVDNHeUg2M1BneHFZTkEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.1IsSMVyJFeq2lGNB2IRqYqki5ZBrAkjgz_4RwgpsHN0','2020-04-19 14:34:05','2020-04-19 14:34:05','2020-04-19 17:24:15','cancel'),(2825,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMTcwNTUsImV4cCI6MTU4NzMyMDY1NSwibmJmIjoxNTg3MzE3MDU1LCJqdGkiOiJOdDVXRlAyeW1KVUdmc1c4Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.0YZPp_VKeN8hNx-W4QtH0NzU4typUeFjlmLUtUFUUdU','2020-04-19 17:24:15','2020-04-19 17:24:15','2020-04-19 17:24:15','cancel'),(2826,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMxNzA1NSwiZXhwIjoxNTg3MzIwNjU1LCJuYmYiOjE1ODczMTcwNTUsImp0aSI6InV6cE1IWEoyNlc2YnZ5SHAiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.cKoP9jczQ09OFf1ysJw9uWnzXqziCUFOhhmXatBlkfA','2020-04-19 17:24:15','2020-04-19 17:24:15','2020-04-19 17:25:59','cancel'),(2827,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMTcxNTksImV4cCI6MTU4NzMyMDc1OSwibmJmIjoxNTg3MzE3MTU5LCJqdGkiOiJPUjQ5SGV4TjdVVGU4TFZzIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.vyszDVU_fADRvYjnfaC-xN0clOFHNBuCd65PbP9XEQ4','2020-04-19 17:25:59','2020-04-19 17:25:59','2020-04-19 17:45:54','cancel'),(2828,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMxNzA1NSwiZXhwIjoxNTg3MzIxOTU0LCJuYmYiOjE1ODczMTgzNTQsImp0aSI6IjI4NUpQWDI2WjB4WE1Xd04iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.GJv8JbUhwUu9CwCTWWWAnRGR09uciUM445jbiOEcxMI','2020-04-19 17:45:54','2020-04-19 17:45:54','2020-04-19 18:26:02','cancel'),(2829,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMxNzA1NSwiZXhwIjoxNTg3MzI0MzYyLCJuYmYiOjE1ODczMjA3NjIsImp0aSI6Im1RTTAyUlZIYmRBWDNHb3UiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.FoG60iq2sN5zp9PeR1Nyxtm7l_1xvbgXC5b1KJ_bEtg','2020-04-19 18:26:02','2020-04-19 18:26:02','2020-04-19 18:26:04','cancel'),(2830,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMxNzA1NSwiZXhwIjoxNTg3MzI0MzY0LCJuYmYiOjE1ODczMjA3NjQsImp0aSI6Ild5RExmdVFCaU51NGNpeDIiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.HXFnglDth6yk-UeiISCeNmJSJyRkL4wiMumUxUk6uDM','2020-04-19 18:26:04','2020-04-19 18:26:04','2020-04-19 18:26:04','cancel'),(2831,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMjA3NjYsImV4cCI6MTU4NzMyNDM2NiwibmJmIjoxNTg3MzIwNzY2LCJqdGkiOiJWaWh6NEhWVk9TU0o5RHNaIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.MPsnq-dh8clOkxzblmGdu2lGWQNezR7lu-lA9cvuIq8','2020-04-19 18:26:06','2020-04-19 18:26:06','2020-04-19 18:26:06','cancel'),(2832,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc2NiwiZXhwIjoxNTg3MzI0MzY2LCJuYmYiOjE1ODczMjA3NjYsImp0aSI6Ik5OdE1IaWd5UThvRTdqekIiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.hvFPGI4w-sAUd2bsRT54q39XJgrTpFf1VlUxIrJVKn0','2020-04-19 18:26:06','2020-04-19 18:26:06','2020-04-19 18:26:11','cancel'),(2833,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc2NiwiZXhwIjoxNTg3MzI0MzcxLCJuYmYiOjE1ODczMjA3NzEsImp0aSI6IldpUVJyQ0NPTnBjSmZ3b1oiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.WlD-LilInOG3cjT9lDab_POyjbJdrb-rf0uNKBgXrUU','2020-04-19 18:26:11','2020-04-19 18:26:11','2020-04-19 18:26:12','cancel'),(2834,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc2NiwiZXhwIjoxNTg3MzI0MzcyLCJuYmYiOjE1ODczMjA3NzIsImp0aSI6IlBOcW1oaVJ0YmtITEtGQmsiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.rGL-oQ-v1SNgmh4aIrRQ0amdDlh8WcT4aoXAZmma2eE','2020-04-19 18:26:12','2020-04-19 18:26:12','2020-04-19 18:26:17','cancel'),(2835,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMjA3NzcsImV4cCI6MTU4NzMyNDM3NywibmJmIjoxNTg3MzIwNzc3LCJqdGkiOiJnTkFNMmVLajhjN1JMOHc4Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.UUIwnyhHdwRQRV3gV33FN9UwZQQBGsb2uAGZW5c_f4k','2020-04-19 18:26:17','2020-04-19 18:26:17','2020-04-19 18:26:17','cancel'),(2836,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc3NywiZXhwIjoxNTg3MzI0Mzc3LCJuYmYiOjE1ODczMjA3NzcsImp0aSI6ImR2NmxyVjVSTzR5V0tVemIiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.emyS6BsYwyCRoT4dCAaj8uM37R4PTapsnksXnts-kWI','2020-04-19 18:26:17','2020-04-19 18:26:17','2020-04-19 18:26:22','cancel'),(2837,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc3NywiZXhwIjoxNTg3MzI0MzgyLCJuYmYiOjE1ODczMjA3ODIsImp0aSI6IjA2ZjNWNldoaUYwZVd3TjgiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.oUJEFNRsL8edLMk6tBxZ3OA4EoUPPGZiRUuWHLpzTLE','2020-04-19 18:26:22','2020-04-19 18:26:22','2020-04-19 18:26:29','cancel'),(2838,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc3NywiZXhwIjoxNTg3MzI0Mzg5LCJuYmYiOjE1ODczMjA3ODksImp0aSI6InNmdWdJeTdZWTdmVkZnRDMiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.TgdX2UiPwqrKK9OlLkkI6Kym3zdQjhdJ2VV7KD1xFAU','2020-04-19 18:26:29','2020-04-19 18:26:29','2020-04-19 18:26:31','cancel'),(2839,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc3NywiZXhwIjoxNTg3MzI0MzkxLCJuYmYiOjE1ODczMjA3OTEsImp0aSI6InpuSE9YMFJZSGtYRGQ5N2IiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.pEO7bn-Un35WBXHpcTtN9yXqGFoWb0-GRWxVibeXJ6g','2020-04-19 18:26:31','2020-04-19 18:26:31','2020-04-19 18:26:31','cancel'),(2840,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMjA3OTMsImV4cCI6MTU4NzMyNDM5MywibmJmIjoxNTg3MzIwNzkzLCJqdGkiOiJ6MUNZbTVubnh2ZXpCdEM0Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.cmMy8tTVr57pHyU4Dwc-n7KeAeqDc6xfRLhcyS298nM','2020-04-19 18:26:33','2020-04-19 18:26:33','2020-04-19 18:26:33','cancel'),(2841,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0MzkzLCJuYmYiOjE1ODczMjA3OTMsImp0aSI6Im51WjFlWmliaDBiVEdnR24iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Mq_pze9xi3px4OxPJEMON9im8zJtMr6AQFrvT_jFgIg','2020-04-19 18:26:33','2020-04-19 18:26:33','2020-04-19 18:26:45','cancel'),(2842,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NDA1LCJuYmYiOjE1ODczMjA4MDUsImp0aSI6ImRyMGhjR0FhMUt2MGttM2EiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.cNMl4Ywfz81ozT8p7aHgie7qoPS7Kf-3PCSdxEWBJTo','2020-04-19 18:26:45','2020-04-19 18:26:45','2020-04-19 18:26:46','cancel'),(2843,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NDA2LCJuYmYiOjE1ODczMjA4MDYsImp0aSI6Im1yekN2V2JoQk9mMFpGV28iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.GVrlWo_73eXBSiHoQYQHvS0khYIZyfaZoxM_gOQ0RUA','2020-04-19 18:26:46','2020-04-19 18:26:46','2020-04-19 18:26:48','cancel'),(2844,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NDA4LCJuYmYiOjE1ODczMjA4MDgsImp0aSI6IjU3bXlTbkEwMTRxcXJtZlAiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.1Ox05e2XhRnS4Bv07p3HntQq85b_uJi1Ikx8IO6ai5c','2020-04-19 18:26:48','2020-04-19 18:26:48','2020-04-19 18:26:50','cancel'),(2845,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NDEwLCJuYmYiOjE1ODczMjA4MTAsImp0aSI6IjRVN2twQUIwVzJ3MzU2QW8iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.FQpp8c-5bY0G8APxDO96ldM_FYMqEYvEfBO4e2vSu-s','2020-04-19 18:26:50','2020-04-19 18:26:50','2020-04-19 18:26:55','cancel'),(2846,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NDE1LCJuYmYiOjE1ODczMjA4MTUsImp0aSI6Ilh0cUE2cUszTjJZWlZrOUkiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.QCa-W0YBCnEADEfFadrR2cHiZhktCIRWKm61o4iZsDc','2020-04-19 18:26:55','2020-04-19 18:26:55','2020-04-19 18:27:55','cancel'),(2847,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NDc1LCJuYmYiOjE1ODczMjA4NzUsImp0aSI6IlJ0aU5Yc2JIZXhvN0psVzEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.iJZ7UZrCCxcjRKieCm--K_oINVKaCyXJXH0fQyWsP_M','2020-04-19 18:27:55','2020-04-19 18:27:55','2020-04-19 18:28:38','cancel'),(2848,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NTE4LCJuYmYiOjE1ODczMjA5MTgsImp0aSI6Ild6WFd3Nmc0bUlvU3JwSnUiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.jlEzP9aP7KnByhzdXPbKh7V56n0S_JPefQppzr15P8Y','2020-04-19 18:28:38','2020-04-19 18:28:38','2020-04-19 18:28:40','cancel'),(2849,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NTIwLCJuYmYiOjE1ODczMjA5MjAsImp0aSI6ImJ5Y1BuTEkxMEtyN09WR08iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.PzL1M7ATZe18ndfx1sNq3Wsurgu76A8O_bcjnkfupaM','2020-04-19 18:28:40','2020-04-19 18:28:40','2020-04-19 18:31:33','cancel'),(2850,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NjkzLCJuYmYiOjE1ODczMjEwOTMsImp0aSI6IlowUXRhWWJIN2dNajlJOW4iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.fR5IgmLNe0XXkEk5AVei1IH1G1DEUFzAbc9VgywxEnc','2020-04-19 18:31:33','2020-04-19 18:31:33','2020-04-19 18:31:35','cancel'),(2851,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0Njk1LCJuYmYiOjE1ODczMjEwOTUsImp0aSI6Ijg0SXlZb0RQckRva1laN0ciLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.0N8GF700IX3ZGLs0FvgEjaoxR2KrL3kW4bodAISt9qI','2020-04-19 18:31:35','2020-04-19 18:31:35','2020-04-19 18:31:45','cancel'),(2852,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NzA1LCJuYmYiOjE1ODczMjExMDUsImp0aSI6ImhscWZJU3VuVXg5WDk4SGUiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.ycCWAyhYcAaC7QHA77tnEOrOxMVkv_XS4F_aK3FpUkw','2020-04-19 18:31:45','2020-04-19 18:31:45','2020-04-19 18:31:50','cancel'),(2853,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMDc5MywiZXhwIjoxNTg3MzI0NzEwLCJuYmYiOjE1ODczMjExMTAsImp0aSI6InY2MUVvQmFkSDlPc0hWMkYiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.dPCZmRjI_hy_69Vq-_2qx_uNZxXfRPPoo5fCT1J4tQ8','2020-04-19 18:31:50','2020-04-19 18:31:51','2020-04-19 18:31:51','cancel'),(2854,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMjExMTIsImV4cCI6MTU4NzMyNDcxMiwibmJmIjoxNTg3MzIxMTEyLCJqdGkiOiI0TWFjTmhXUkNqUURENlpFIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.AFS68mwBoy-J2ABL99yiC3S01Fy9Eeg90gr-igKqtO0','2020-04-19 18:31:52','2020-04-19 18:31:52','2020-04-19 18:31:53','cancel'),(2855,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMTExMiwiZXhwIjoxNTg3MzI0NzEzLCJuYmYiOjE1ODczMjExMTMsImp0aSI6ImtydTNjQWtwREgxdHNCUHoiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.F7skimAf9YHWbU8SFo3VcK8INEcBD7GhswadthSXowM','2020-04-19 18:31:53','2020-04-19 18:31:53','2020-04-19 18:35:38','cancel'),(2856,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMTExMiwiZXhwIjoxNTg3MzI0OTM4LCJuYmYiOjE1ODczMjEzMzgsImp0aSI6ImtqRW9GSU5SWjBwVG5Ed2siLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.qlpxtkub9UCjfKdZgCWT2wWuUQiwh05w9VWJ8GRZycY','2020-04-19 18:35:38','2020-04-19 18:35:38','2020-04-19 18:46:03','cancel'),(2857,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMjE5NjMsImV4cCI6MTU4NzMyNTU2MywibmJmIjoxNTg3MzIxOTYzLCJqdGkiOiJSdHI5eGEwc3pCUkJBbE92Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.FiGmBo-7lg8wchO26gh_QLt3dLQd95nUQWlxJg4ONBU','2020-04-19 18:46:03','2020-04-19 18:46:03','2020-04-19 18:46:04','cancel'),(2858,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMTk2MywiZXhwIjoxNTg3MzI1NTY0LCJuYmYiOjE1ODczMjE5NjQsImp0aSI6IldYcVIwSDRyQXRjc0J3dW0iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Fi0DtB15VzvmegUzdRue8yBk667wzOY0b-layQ49ieY','2020-04-19 18:46:04','2020-04-19 18:46:04','2020-04-19 18:46:48','cancel'),(2859,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMjIwMDgsImV4cCI6MTU4NzMyNTYwOCwibmJmIjoxNTg3MzIyMDA4LCJqdGkiOiJJTVdoNkQ3N2tzU2ZoUXpTIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.usEzKwOvCpq_XXcH-3FG0fqWtyY4F5ZkKjihYogvbIY','2020-04-19 18:46:48','2020-04-19 18:46:48','2020-04-19 18:46:48','cancel'),(2860,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMjAwOCwiZXhwIjoxNTg3MzI1NjA4LCJuYmYiOjE1ODczMjIwMDgsImp0aSI6IjVmS2I0ZVJrYXM0NjNiaXkiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.XtmqXQLpeyvT3nsRB0cpgq1mgtguzs6oYn2gjDfbhDM','2020-04-19 18:46:48','2020-04-19 18:46:48','2020-04-19 18:46:55','cancel'),(2861,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMjAwOCwiZXhwIjoxNTg3MzI1NjE1LCJuYmYiOjE1ODczMjIwMTUsImp0aSI6Im14d09BVVJMZjhzVmU3Tk4iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.C74l2-PbnYH6XxySRBxWdI6pFabb_lZCd6YI4fYtCwE','2020-04-19 18:46:55','2020-04-19 18:46:55','2020-04-19 18:47:01','cancel'),(2862,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczMjIwMjEsImV4cCI6MTU4NzMyNTYyMSwibmJmIjoxNTg3MzIyMDIxLCJqdGkiOiJFUG1yZ0Jaald1MzE3MExYIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.9HY0SmdlpPkFCdgKdmJs3bGBiBkVxsoy8YUDvSzydok','2020-04-19 18:47:01','2020-04-19 18:47:01','2020-04-19 18:47:01','cancel'),(2863,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMjAyMSwiZXhwIjoxNTg3MzI1NjIxLCJuYmYiOjE1ODczMjIwMjEsImp0aSI6ImF1OFZ3U1FvQm1xcWpGdEYiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.zZygbBsEUxk5B1HXTMc5PDkuTfMkk2m7saPvdDVZ7_U','2020-04-19 18:47:01','2020-04-19 18:47:01','2020-04-19 18:47:04','cancel'),(2864,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMjAyMSwiZXhwIjoxNTg3MzI1NjI0LCJuYmYiOjE1ODczMjIwMjQsImp0aSI6ImVuT3FZdFN5NU1qVnlPREkiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.FOOLsMoUtZgBMpdexOoV9nJ2IaEtLZrCJh2tu00KTN0','2020-04-19 18:47:04','2020-04-19 18:47:04','2020-04-19 18:47:15','cancel'),(2865,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMjAyMSwiZXhwIjoxNTg3MzI1NjM1LCJuYmYiOjE1ODczMjIwMzUsImp0aSI6IkV6cmZHSnZyb21iZTh2N0QiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.DQUXYbbLhGpnNYswEaA849OwAGaYQasrJPvaK8faFak','2020-04-19 18:47:15','2020-04-19 18:47:15','2020-04-19 18:47:20','cancel'),(2866,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMjAyMSwiZXhwIjoxNTg3MzI1NjQwLCJuYmYiOjE1ODczMjIwNDAsImp0aSI6Im1ybW9xc0MwWVVTMUhub1EiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.6cvi1swlHg7jCA4aaZHRmQIFdbyvwG62MsZ9giCverA','2020-04-19 18:47:20','2020-04-19 18:47:20','2020-04-19 18:47:27','cancel'),(2867,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzMyMjAyMSwiZXhwIjoxNTg3MzI1NjQ3LCJuYmYiOjE1ODczMjIwNDcsImp0aSI6Ijg3Z3NDQkU2cjdLTUVSUjAiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.KGR7JR9c8FpuVvxGxdVY2iK0NhzluVa1_CqCh9XcWck','2020-04-19 18:47:27','2020-04-19 18:47:27','2020-04-20 03:36:19','cancel'),(2868,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNTM3NzksImV4cCI6MTU4NzM1NzM3OSwibmJmIjoxNTg3MzUzNzc5LCJqdGkiOiI4RExhcjRBZmtDYjRkTHQ4Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.w-HYD1ihffDA7ZmxCnB0-Z0eHw147LVxZ8sbDN_fx24','2020-04-20 03:36:19','2020-04-20 03:36:19','2020-04-20 03:36:36','cancel'),(2869,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM1Mzc3OSwiZXhwIjoxNTg3MzU3Mzk2LCJuYmYiOjE1ODczNTM3OTYsImp0aSI6ImJPNEtTVWM0eFlYMnNHWm8iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Y4d1KHVp0tEYbSxJrY3AKsv3Doy_cyEz3JV4caFT1EA','2020-04-20 03:36:36','2020-04-20 03:36:36','2020-04-20 03:36:55','cancel'),(2870,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM1Mzc3OSwiZXhwIjoxNTg3MzU3NDE1LCJuYmYiOjE1ODczNTM4MTUsImp0aSI6Ik1XM29lQjRZNm8walNWaUYiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.xsdrRZl56I1O4a2ocvGbPm6JsmidSdzF6-Pp_PBGpjQ','2020-04-20 03:36:55','2020-04-20 03:36:55','2020-04-20 03:58:09','cancel'),(2871,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNTUwODksImV4cCI6MTU4NzM1ODY4OSwibmJmIjoxNTg3MzU1MDg5LCJqdGkiOiI4RUh3OHp0T09sTWZkdnRaIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.d0yKUqAoJv-dZxLnpaToZBtQgS4yajuG_iCI5Gy-LgA','2020-04-20 03:58:09','2020-04-20 03:58:09','2020-04-20 03:58:11','cancel'),(2872,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM1NTA4OSwiZXhwIjoxNTg3MzU4NjkxLCJuYmYiOjE1ODczNTUwOTEsImp0aSI6InFKQkJjalpQZm93VFNmNlEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.5ieAMcW6F33fZgBt-Ctsfg78oeS9cM4-89OZbzMmtQk','2020-04-20 03:58:11','2020-04-20 03:58:11','2020-04-20 03:58:22','cancel'),(2873,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM1NTA4OSwiZXhwIjoxNTg3MzU4NzAyLCJuYmYiOjE1ODczNTUxMDIsImp0aSI6IlpqeE9WcTVhbHhTYnpTRlUiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.VnMaqHh_CoY1jXKtf2Br-VXTa8mAEnlaahsP6FSf-sc','2020-04-20 03:58:22','2020-04-20 03:58:22','2020-04-20 03:58:29','cancel'),(2874,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM1NTA4OSwiZXhwIjoxNTg3MzU4NzA5LCJuYmYiOjE1ODczNTUxMDksImp0aSI6IkpabkdDM1hUcUVWcGdTMGQiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.qQNs4guJGxfG6HCwsw35s62l1jUsQcwfx4l_64fXQRo','2020-04-20 03:58:29','2020-04-20 03:58:29','2020-04-20 04:19:48','cancel'),(2875,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM1NTA4OSwiZXhwIjoxNTg3MzU5OTg4LCJuYmYiOjE1ODczNTYzODgsImp0aSI6Im5icTJueVlFNHBVMWZna20iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.oHcjWMca9Td8BSdoF_zOQtcTr65JfysDLA5MPJbA9r0','2020-04-20 04:19:48','2020-04-20 04:19:48','2020-04-20 04:39:54','cancel'),(2876,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNTc1OTQsImV4cCI6MTU4NzM2MTE5NCwibmJmIjoxNTg3MzU3NTk0LCJqdGkiOiJXYjkwZUdqVms5OHFKNllwIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.85vyf3X2jZJykq6SddZfEyrgiWeCU7KhyC6lv7j-rCY','2020-04-20 04:39:54','2020-04-20 04:39:54','2020-04-20 05:57:46','cancel'),(2877,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNjIyNjYsImV4cCI6MTU4NzM2NTg2NiwibmJmIjoxNTg3MzYyMjY2LCJqdGkiOiI2TkJ2NkxNN292dDJHZ0tHIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.Yo_mUxmBvItJgbygbuJqwD6mjbclQVCSOnVRJ7fEwKA','2020-04-20 05:57:46','2020-04-20 05:57:46','2020-04-20 08:02:03','cancel'),(2878,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNjk3MjMsImV4cCI6MTU4NzM3MzMyMywibmJmIjoxNTg3MzY5NzIzLCJqdGkiOiI2MFBLMTJ1cjBUYUszbEY3Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.yDHdDJJfe6sOSSqm3tNL0UD35-NmteTaIu1rPUDf_LU','2020-04-20 08:02:03','2020-04-20 08:02:03','2020-04-20 08:32:52','cancel'),(2879,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzE1NzIsImV4cCI6MTU4NzM3NTE3MiwibmJmIjoxNTg3MzcxNTcyLCJqdGkiOiJyQmVJMXNtdFRvbnY4d3RhIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.Uk4D5RdeUNZWO9t3NrnN0t2-ysf_1XCU7dGuVOL3QDs','2020-04-20 08:32:52','2020-04-20 08:32:52','2020-04-20 08:32:53','cancel'),(2880,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTU3MiwiZXhwIjoxNTg3Mzc1MTczLCJuYmYiOjE1ODczNzE1NzMsImp0aSI6IjNkRlhWUjdmUFNBcU5ScGIiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.KFjxCWwdxpU135LTSyJe0z2oR8efCX9ezexuPM4USDU','2020-04-20 08:32:53','2020-04-20 08:32:53','2020-04-20 08:33:03','cancel'),(2881,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTU3MiwiZXhwIjoxNTg3Mzc1MTgzLCJuYmYiOjE1ODczNzE1ODMsImp0aSI6IkhScGpzRE8yYTQ4aWtMWkkiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.AQHClTlrqW4xwVrx2I2M2xzE_IwDDWTYHTKzBlVndXc','2020-04-20 08:33:03','2020-04-20 08:33:03','2020-04-20 08:33:13','cancel'),(2882,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzE1OTMsImV4cCI6MTU4NzM3NTE5MywibmJmIjoxNTg3MzcxNTkzLCJqdGkiOiJSR1NMaGlTWmg2MjJDMnRwIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.cUZZ1jzC4G3KAPW84DgiWLos6liD2Gz0qZizCJ2fkg8','2020-04-20 08:33:13','2020-04-20 08:33:13','2020-04-20 08:33:13','cancel'),(2883,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTU5MywiZXhwIjoxNTg3Mzc1MTkzLCJuYmYiOjE1ODczNzE1OTMsImp0aSI6InpjZllaaTNZazNTbVhJOGciLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.GM5XC0G5SI1iJQNWpVXHB_ftmJYOkHvzYp0iT5igOSo','2020-04-20 08:33:13','2020-04-20 08:33:13','2020-04-20 08:33:16','cancel'),(2884,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTU5MywiZXhwIjoxNTg3Mzc1MTk2LCJuYmYiOjE1ODczNzE1OTYsImp0aSI6InlyRG5PckRjemdiTkF1VGYiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.lTvinY-RmDZ2hRQh11tO00XTYfgZYsRDKkMYeEbtvGE','2020-04-20 08:33:16','2020-04-20 08:33:16','2020-04-20 08:33:41','cancel'),(2885,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzE2MjEsImV4cCI6MTU4NzM3NTIyMSwibmJmIjoxNTg3MzcxNjIxLCJqdGkiOiI0Y2NOYUFqMU1nU2g0eUdUIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.F1PxMwnUwRitcDwuoUNp63ybMHiQfHoh-YbxwjT041k','2020-04-20 08:33:41','2020-04-20 08:33:41','2020-04-20 08:33:42','cancel'),(2886,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTYyMSwiZXhwIjoxNTg3Mzc1MjIyLCJuYmYiOjE1ODczNzE2MjIsImp0aSI6IjN1ZUdlSU1DQWRXNkJIaEsiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Nc444Ld1rabOE6Siab8sGtOBRiuw2CoY6ByOX5YuZRs','2020-04-20 08:33:42','2020-04-20 08:33:42','2020-04-20 08:33:56','cancel'),(2887,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTYyMSwiZXhwIjoxNTg3Mzc1MjM2LCJuYmYiOjE1ODczNzE2MzYsImp0aSI6IlZSTjU0TmFUaXZGUUduM2MiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.AT8u-FRl5asw2ZgLANxPHEoibkCMQzFzFJl61U8moCs','2020-04-20 08:33:56','2020-04-20 08:33:56','2020-04-20 08:34:02','cancel'),(2888,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTYyMSwiZXhwIjoxNTg3Mzc1MjQyLCJuYmYiOjE1ODczNzE2NDIsImp0aSI6Iko3V1dwSW5DTnh0N1hJb20iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.ufPWTsxX4ZnjFtfwKRsiWGmdi7SdSztrqVHFTTmVCUE','2020-04-20 08:34:02','2020-04-20 08:34:02','2020-04-20 08:34:05','cancel'),(2889,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTYyMSwiZXhwIjoxNTg3Mzc1MjQ1LCJuYmYiOjE1ODczNzE2NDUsImp0aSI6IkVjZHZ2Q2lWTW5BZDl2UGEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.ye4XRC2Yobb0NzLQsqukZfeuw_h_IPHhJaGVxKYsb30','2020-04-20 08:34:05','2020-04-20 08:34:05','2020-04-20 08:36:31','cancel'),(2890,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzE3OTEsImV4cCI6MTU4NzM3NTM5MSwibmJmIjoxNTg3MzcxNzkxLCJqdGkiOiJGTHh0SVUxaThBR0J5azlCIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.ub9ksOAP6oxinq78w4_zVV7KseygHiDpJeRSV1TuhE0','2020-04-20 08:36:31','2020-04-20 08:36:31','2020-04-20 08:38:02','cancel'),(2891,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzE4ODIsImV4cCI6MTU4NzM3NTQ4MiwibmJmIjoxNTg3MzcxODgyLCJqdGkiOiJzVmxIRXY5Mmp4azdiZ2RCIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.6cp0O1wuzBQkot0x0ZsFOBpXen0Wm2tc3Mg5WAnjITA','2020-04-20 08:38:02','2020-04-20 08:38:02','2020-04-20 08:38:03','cancel'),(2892,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTg4MiwiZXhwIjoxNTg3Mzc1NDgzLCJuYmYiOjE1ODczNzE4ODMsImp0aSI6InYyM1ROOVpXdlpwYXRiaU4iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.KtUC_U4x_sfeFMjkcdMqZX80W9rUAYkdN65LKJVI7Vo','2020-04-20 08:38:03','2020-04-20 08:38:03','2020-04-20 16:42:23','cancel'),(2893,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTg4MiwiZXhwIjoxNTg3Mzc1NzQzLCJuYmYiOjE1ODczNzIxNDMsImp0aSI6IjNISDZvbW92TEw3N0FpdnoiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.wKh3IsbRRUqWQWoB3uk2R5evhKzhxY_AgtACxv7UPYs','2020-04-20 16:42:23','2020-04-20 16:42:23','2020-04-20 16:42:25','cancel'),(2894,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MTg4MiwiZXhwIjoxNTg3Mzc1NzQ1LCJuYmYiOjE1ODczNzIxNDUsImp0aSI6InFTMkJjZlNNRnFheGlRN3ciLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.xhsncYub6kGHLdX5sz4OBrw8_oxLVwdrl3oWwzXJemk','2020-04-20 16:42:25','2020-04-20 16:42:25','2020-04-20 16:42:36','cancel'),(2895,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzIxNTYsImV4cCI6MTU4NzM3NTc1NiwibmJmIjoxNTg3MzcyMTU2LCJqdGkiOiJWVjJITGhQampTNzZ0V0RkIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.U9zsuX4HEHj2WqD-Hyoo4SV0KRz7Nyv3rFvPfPEm2u0','2020-04-20 16:42:36','2020-04-20 16:42:36','2020-04-20 16:42:37','cancel'),(2896,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjE1NiwiZXhwIjoxNTg3Mzc1NzU3LCJuYmYiOjE1ODczNzIxNTcsImp0aSI6ImhvaDlBd255Y0hhSW1XOUUiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.aWmLbulf41p7oO38XiV9NtlMqJUwZd_IVcynbQ0NXxs','2020-04-20 16:42:37','2020-04-20 16:42:37','2020-04-20 16:44:37','cancel'),(2897,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjE1NiwiZXhwIjoxNTg3Mzc1ODc3LCJuYmYiOjE1ODczNzIyNzcsImp0aSI6ImdBazRNdmNWM2JuYzJZek4iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.9oM6joZ3z0iAZb3Y70yo3rh1xxOqwkOoPoqzeR0K_co','2020-04-20 16:44:37','2020-04-20 16:44:37','2020-04-20 16:44:44','cancel'),(2898,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjE1NiwiZXhwIjoxNTg3Mzc1ODg0LCJuYmYiOjE1ODczNzIyODQsImp0aSI6IklFZjh3N2JtZkp2ZFdKbTciLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.8UUUd8zHEV2Fn1UvvSHZQazrgftE4uRTFOVwFjFX5fg','2020-04-20 16:44:44','2020-04-20 16:44:44','2020-04-20 16:45:17','cancel'),(2899,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzIzMTcsImV4cCI6MTU4NzM3NTkxNywibmJmIjoxNTg3MzcyMzE3LCJqdGkiOiJ0ZEp2YnFSdDlVN1UzZkFXIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.u70QKUV2T2CjOVCdJ8cZvt27fUUNZ7CP2XKnHr9Rca0','2020-04-20 16:45:17','2020-04-20 16:45:17','2020-04-20 16:45:18','cancel'),(2900,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTE4LCJuYmYiOjE1ODczNzIzMTgsImp0aSI6IkJyVEt3cUk2SmNEZDdOcm4iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.oLRh4jKLcZJ2AZ-dCO4ElIfn6ha59LrGFI-9SMX6u5Q','2020-04-20 16:45:18','2020-04-20 16:45:18','2020-04-20 16:45:20','cancel'),(2901,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTIwLCJuYmYiOjE1ODczNzIzMjAsImp0aSI6InFyQnQ4ZFlIU0pKSjd1cFQiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.IK_Vgl7PCGYuGxEIKITkzU8WE9rQPiBJlxnvABUjSRM','2020-04-20 16:45:20','2020-04-20 16:45:20','2020-04-20 16:45:22','cancel'),(2902,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTIyLCJuYmYiOjE1ODczNzIzMjIsImp0aSI6IkVCSW13WHZHbTVJcXNHaGgiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.9QuDeYfgS14HgopL2MLNh4Z64OqE2TE7Jgw9lFpp31Y','2020-04-20 16:45:22','2020-04-20 16:45:22','2020-04-20 16:45:24','cancel'),(2903,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTI0LCJuYmYiOjE1ODczNzIzMjQsImp0aSI6IlVFdXU4WDRvaGxtbGdwUkoiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.lQ6jK9IDNFkmA2vnTSW1-CadZCfDQjIRjsMdul4W0kE','2020-04-20 16:45:24','2020-04-20 16:45:24','2020-04-20 16:45:26','cancel'),(2904,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTI2LCJuYmYiOjE1ODczNzIzMjYsImp0aSI6ImlyNTkwMGhqTzRPN0gySnEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.xkBOc263wGRQVpXouSAO9PuVlPWQeu7NxZ08yr4qfi4','2020-04-20 16:45:26','2020-04-20 16:45:26','2020-04-20 16:45:28','cancel'),(2905,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTI4LCJuYmYiOjE1ODczNzIzMjgsImp0aSI6IkhtbVpIRHM1dHhReE42OFEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.pOJ0SkCVwRt5AxcL1cprbRt2xn1ljf9yhhnISitsS4A','2020-04-20 16:45:28','2020-04-20 16:45:28','2020-04-20 16:45:29','cancel'),(2906,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTI5LCJuYmYiOjE1ODczNzIzMjksImp0aSI6InR0NjNYN3pobXhDa1pOOE8iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.IHktvnNJQu3TG9wzjQH2m14oN88NVpkglfo5WOIbiXY','2020-04-20 16:45:29','2020-04-20 16:45:29','2020-04-20 16:45:31','cancel'),(2907,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTMxLCJuYmYiOjE1ODczNzIzMzEsImp0aSI6Im9Jam1hVzZhejZRd2k2SVEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.DDwgYzjhyfKpydxTaSOqf4LmzMmZhchOh4Mdf3nGfeQ','2020-04-20 16:45:31','2020-04-20 16:45:31','2020-04-20 16:45:33','cancel'),(2908,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTMzLCJuYmYiOjE1ODczNzIzMzMsImp0aSI6IklpQWM4a3huR3lHRzY1UGkiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.uuv284-TRLrfSz4hpw-sLxJB7ONFzGT83xz0Kx1MYgM','2020-04-20 16:45:33','2020-04-20 16:45:33','2020-04-20 16:45:34','cancel'),(2909,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTM0LCJuYmYiOjE1ODczNzIzMzQsImp0aSI6IjZIY3lDV1hERzRDQ3dUT2kiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.57CLHoSmkFewZj2SYQv1OYpDDSIjnWtRkefJjCJptUk','2020-04-20 16:45:34','2020-04-20 16:45:34','2020-04-20 16:45:36','cancel'),(2910,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTM2LCJuYmYiOjE1ODczNzIzMzYsImp0aSI6ImFsM3pJNGx0U3I1dTNUNEwiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.5DARhqvZ_yqgVQh8k4KKZ1LoujhpiexA1ZWZeNwM8Is','2020-04-20 16:45:36','2020-04-20 16:45:36','2020-04-20 16:45:38','cancel'),(2911,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTM4LCJuYmYiOjE1ODczNzIzMzgsImp0aSI6IkJvYzEyQkx5dFFsQlM5MDIiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Egb3dzpKOMDDHip36_-vOoj_lPx7X5go0DHoKicvGL4','2020-04-20 16:45:38','2020-04-20 16:45:38','2020-04-20 16:45:46','cancel'),(2912,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTQ2LCJuYmYiOjE1ODczNzIzNDYsImp0aSI6InpQWE1yR3BydDBwQjhOaDAiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.LrbeK57M41V0V3NNO1qaR_MN-oyv5p39zj_ExFhDNNw','2020-04-20 16:45:46','2020-04-20 16:45:46','2020-04-20 16:45:48','cancel'),(2913,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTQ4LCJuYmYiOjE1ODczNzIzNDgsImp0aSI6IkFFZXV4TGI0cVNhSFQ2NVEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.X-RNNjzW3JeE96SCGYAr06NaMcEIhmq6SM6fZMGJ1_E','2020-04-20 16:45:48','2020-04-20 16:45:48','2020-04-20 16:45:52','cancel'),(2914,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc1OTUyLCJuYmYiOjE1ODczNzIzNTIsImp0aSI6IllrekRXU1pEV0dkeE9HSGoiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.iRojFuq-I5UFr_UaPgNmCWPWU6Iv7MgRO8n_lefqILc','2020-04-20 16:45:52','2020-04-20 16:45:52','2020-04-20 16:47:49','cancel'),(2915,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MDY5LCJuYmYiOjE1ODczNzI0NjksImp0aSI6IkhEZWlpQUgxQmd4MG5sTHciLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.5-jvnD681xe_7SUaqoOrGoQLLOGZL5a09Et3_FsqBwA','2020-04-20 16:47:49','2020-04-20 16:47:49','2020-04-20 16:47:51','cancel'),(2916,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MDcxLCJuYmYiOjE1ODczNzI0NzEsImp0aSI6InJrSGZza0xjU1I3Qm5SVDkiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.OSkeWRxLVS8NycRJhkhroUAENNRG3vO5OJyFAwlb2lM','2020-04-20 16:47:51','2020-04-20 16:47:51','2020-04-20 16:48:07','cancel'),(2917,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MDg3LCJuYmYiOjE1ODczNzI0ODcsImp0aSI6IlFUTERZS2J4ZmhZWEhlQTgiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.JQaLRvU-aDaNHqWe7-uWz0eRGYpAXWnWuW1jX7gNh64','2020-04-20 16:48:07','2020-04-20 16:48:07','2020-04-20 16:49:13','cancel'),(2918,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MTUzLCJuYmYiOjE1ODczNzI1NTMsImp0aSI6IlpvcmJkT0tDRmo2eWs2U0giLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.rpWgwv_SGbvIE6_nDXl6ZUhWrFIT8OrJkhqjTkMUx_c','2020-04-20 16:49:13','2020-04-20 16:49:13','2020-04-20 16:49:19','cancel'),(2919,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MTU5LCJuYmYiOjE1ODczNzI1NTksImp0aSI6IlJJQ0g1NHFrVElnTGdmajQiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Kw2GhA0-XEnr9sBM0w5OyQrJHE93Ap4_QIKSw7h7qFM','2020-04-20 16:49:19','2020-04-20 16:49:19','2020-04-20 16:49:25','cancel'),(2920,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MTY1LCJuYmYiOjE1ODczNzI1NjUsImp0aSI6Ikw5bWNmZzB3Rnk5Y1RJd2QiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Spq2O43A-V3X4zuFMV2NjAY4hPxKy3VTgui4TVn1qx4','2020-04-20 16:49:25','2020-04-20 16:49:25','2020-04-20 16:49:28','cancel'),(2921,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MTY4LCJuYmYiOjE1ODczNzI1NjgsImp0aSI6ImE2dWQ0Y21sdGd1V1FMb3YiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Hi0z_dVUoGS7JBS4_uRFvRDuE9l0E8tGYNmZwLxsJcM','2020-04-20 16:49:28','2020-04-20 16:49:28','2020-04-20 16:49:32','cancel'),(2922,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MTcyLCJuYmYiOjE1ODczNzI1NzIsImp0aSI6IkNGUXdiakY4dHhFMmk2T0ciLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.vGMwubH_tYxW4sJE5z42qAjFViyNyavrwrmCJgMUbV0','2020-04-20 16:49:32','2020-04-20 16:49:32','2020-04-20 16:49:34','cancel'),(2923,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MTc0LCJuYmYiOjE1ODczNzI1NzQsImp0aSI6InJWVUpnSnRHVWdSR1Y2dUYiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.EGW3aN_OkNPr8LEdMy2EWZ1DvDu0RHwYMCaaeJ-gOrA','2020-04-20 16:49:34','2020-04-20 16:49:34','2020-04-20 16:49:38','cancel'),(2924,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MTc4LCJuYmYiOjE1ODczNzI1NzgsImp0aSI6IndnYXdIZzV1bm42ZnVqb0YiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.fM-GjrJ6XBIabsR6NF3mJ1oNQXOjti-McxSYFdiibAo','2020-04-20 16:49:38','2020-04-20 16:49:38','2020-04-20 16:49:40','cancel'),(2925,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjMxNywiZXhwIjoxNTg3Mzc2MTgwLCJuYmYiOjE1ODczNzI1ODAsImp0aSI6ImtET2w5aGdpSFJFcFMyNTIiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.ZYlFoudPoprohEnfuAIpz6u1ScVpcUEa_5bSX5wehE4','2020-04-20 16:49:40','2020-04-20 16:49:41','2020-04-20 16:49:41','cancel'),(2926,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzI1ODMsImV4cCI6MTU4NzM3NjE4MywibmJmIjoxNTg3MzcyNTgzLCJqdGkiOiJsWUlzUEVkNE1LdFdkaEp4Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.d-jd5kt8xWaXe41_OxJrDods1uEwlhwJs47nNKQTrnc','2020-04-20 16:49:43','2020-04-20 16:49:43','2020-04-20 16:49:43','cancel'),(2927,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjU4MywiZXhwIjoxNTg3Mzc2MTgzLCJuYmYiOjE1ODczNzI1ODMsImp0aSI6IjNZMVZFZ2NUc1FNdGhqem4iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.T3bY131uR1BHhIOg6iT8k1TFdfX0YpojQU-awnRPHY8','2020-04-20 16:49:43','2020-04-20 16:49:43','2020-04-20 16:51:50','cancel'),(2928,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzI3MTAsImV4cCI6MTU4NzM3NjMxMCwibmJmIjoxNTg3MzcyNzEwLCJqdGkiOiJFQUdvd2huV0VGa21OSEdkIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.ehp7SglERrN7QCiVb2lPl2Ul-nCk5oq9nUaWGc0gN-4','2020-04-20 16:51:50','2020-04-20 16:51:50','2020-04-20 16:51:51','cancel'),(2929,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcxMCwiZXhwIjoxNTg3Mzc2MzExLCJuYmYiOjE1ODczNzI3MTEsImp0aSI6ImYxekZuOFJlTFI1MVY4c00iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.otRmgjDtfsyOXZIa5R1PlZMpWldvYJgXLMj06j8l7oY','2020-04-20 16:51:51','2020-04-20 16:51:51','2020-04-20 16:51:54','cancel'),(2930,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcxMCwiZXhwIjoxNTg3Mzc2MzE0LCJuYmYiOjE1ODczNzI3MTQsImp0aSI6InJ4V1cyaldPa2xHNU00TVciLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.NJ6Yi5JWG5Jmss80qVrDuaus3_us2P9Np00p3EHd8F0','2020-04-20 16:51:54','2020-04-20 16:51:54','2020-04-20 16:51:56','cancel'),(2931,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcxMCwiZXhwIjoxNTg3Mzc2MzE2LCJuYmYiOjE1ODczNzI3MTYsImp0aSI6IjI2dDkwR2NqOGNZd2lycXIiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.44Al6tosgqPRbRrZhkSiUjyllxN5Yn4I0cFdg16IoIw','2020-04-20 16:51:56','2020-04-20 16:51:56','2020-04-20 16:51:58','cancel'),(2932,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcxMCwiZXhwIjoxNTg3Mzc2MzE4LCJuYmYiOjE1ODczNzI3MTgsImp0aSI6ImtSWHlqVTAzenBrd3h4RTkiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.Fcv4k485xaoF97VH6kKz7BwJvhOFM6WcpdMiKk7zDP4','2020-04-20 16:51:58','2020-04-20 16:51:58','2020-04-20 16:51:59','cancel'),(2933,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcxMCwiZXhwIjoxNTg3Mzc2MzIwLCJuYmYiOjE1ODczNzI3MjAsImp0aSI6Ik5DMnlwckhPZ3d6UXRCUTAiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.d8Tsj-cXHfFsTxMfX_GMxbRspAQK-HdtMSj2Oa5QtWk','2020-04-20 16:52:00','2020-04-20 16:52:00','2020-04-20 16:52:01','cancel'),(2934,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcxMCwiZXhwIjoxNTg3Mzc2MzIxLCJuYmYiOjE1ODczNzI3MjEsImp0aSI6IjN4QTZ2YjBBVFczSjlhWkEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.JX10RsM6FC3HwgOl3r8IhJ8XgNMAAVlKUbeJtDYMW4w','2020-04-20 16:52:01','2020-04-20 16:52:01','2020-04-20 16:52:01','cancel'),(2935,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzI3MjMsImV4cCI6MTU4NzM3NjMyMywibmJmIjoxNTg3MzcyNzIzLCJqdGkiOiJLZmNlWWlUYXZYaWFySjI4Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.Pb9qIvv1319y5Ms3XpxKvIf5K4rvf4aAeVG5AYDKOxc','2020-04-20 16:52:03','2020-04-20 16:52:03','2020-04-20 16:52:03','cancel'),(2936,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcyMywiZXhwIjoxNTg3Mzc2MzIzLCJuYmYiOjE1ODczNzI3MjMsImp0aSI6InhRME1lUVRXNWZwZzk5N2siLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.wT8i2MRm9asTvSoYCcgf7eg1DI5PI7eo4Yg3FUAC-hk','2020-04-20 16:52:03','2020-04-20 16:52:03','2020-04-20 16:52:06','cancel'),(2937,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcyMywiZXhwIjoxNTg3Mzc2MzI2LCJuYmYiOjE1ODczNzI3MjYsImp0aSI6ImVQM1VwZ0pyeDZVMWtvU0wiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.BvtaVqHxuBMFWK-baUn9DRohm8axk3FJ5X9s4fSUY4g','2020-04-20 16:52:06','2020-04-20 16:52:06','2020-04-20 16:52:07','cancel'),(2938,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcyMywiZXhwIjoxNTg3Mzc2MzI3LCJuYmYiOjE1ODczNzI3MjcsImp0aSI6ImRoTDN1SURTMXdrYlRHeFEiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.5yTVy_cuSgKXosk1QY-T3jlhTJGft2C1QIBJ1dYhj5s','2020-04-20 16:52:07','2020-04-20 16:52:07','2020-04-20 16:52:17','cancel'),(2939,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjcyMywiZXhwIjoxNTg3Mzc2MzM3LCJuYmYiOjE1ODczNzI3MzcsImp0aSI6Im9sQ2xBNHBJdVIzNjltWHkiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.8xbSby2j85ZxLPwKe2HXwZnf7YIYcvUpUC60kHr8I7k','2020-04-20 16:52:17','2020-04-20 16:52:17','2020-04-20 16:52:19','cancel'),(2940,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzI3MzksImV4cCI6MTU4NzM3NjMzOSwibmJmIjoxNTg3MzcyNzM5LCJqdGkiOiJUZ3pzZUo3NWRLVTFzUnM5Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.7BqTmgxtLWlzEQH-thGAnC4FRyrGaNOeDKRseaGmNk0','2020-04-20 16:52:19','2020-04-20 16:52:19','2020-04-20 16:52:19','cancel'),(2941,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjczOSwiZXhwIjoxNTg3Mzc2MzM5LCJuYmYiOjE1ODczNzI3MzksImp0aSI6ImtJVWxmNDdXeVNBc0NtNDAiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.GNPGOia6PYBFKUSzUECYoEhrvjRmYQLluJsmKCly_ms','2020-04-20 16:52:19','2020-04-20 16:52:19','2020-04-20 16:52:22','cancel'),(2942,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjczOSwiZXhwIjoxNTg3Mzc2MzQyLCJuYmYiOjE1ODczNzI3NDIsImp0aSI6Iml3R0dyNlUzdVlkb1Rsd28iLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.dn5cGoPvXrQfcqdE6w14iEbnhyXyp2B_tYQsDxI2PWk','2020-04-20 16:52:22','2020-04-20 16:52:22','2020-04-20 16:52:30','cancel'),(2943,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3MjczOSwiZXhwIjoxNTg3Mzc2MzUwLCJuYmYiOjE1ODczNzI3NTAsImp0aSI6InlSN21Sb3UxWEQxc3VGOXAiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.F6uHg_ogi_YU1iOEgr08FcVQzwJrri4ipcS-uRPLcd0','2020-04-20 16:52:30','2020-04-20 16:52:30','2020-04-20 17:02:54','cancel'),(2944,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzMzNzQsImV4cCI6MTU4NzM3Njk3NCwibmJmIjoxNTg3MzczMzc0LCJqdGkiOiIzODZBWHRjd1IwcHdBdGI3Iiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.UEydaz2EB2gcJzU14RbwBppDh97HyenKBEpHmYLIGng','2020-04-20 17:02:54','2020-04-20 17:02:54','2020-04-20 17:56:01','cancel'),(2945,'login','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvbG9naW4iLCJpYXQiOjE1ODczNzY1NjEsImV4cCI6MTU4NzM4MDE2MSwibmJmIjoxNTg3Mzc2NTYxLCJqdGkiOiJEQkhyM0k3WjlVb0d0RmtHIiwic3ViIjoxLCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.AFBhr4RD8XgmL-1l83NK5SS7hZB94QgZ78drrQJ3NHM','2020-04-20 17:56:01','2020-04-20 17:56:01','2020-04-20 17:56:02','cancel'),(2946,'refresh','1',NULL,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjFcL2FkbWluXC9hcGlcL2FwcFwvcmVmcmVzaF90b2tlbiIsImlhdCI6MTU4NzM3NjU2MSwiZXhwIjoxNTg3MzgwMTYyLCJuYmYiOjE1ODczNzY1NjIsImp0aSI6InFjdDNZNGw2YjR4OFc3V0IiLCJzdWIiOjEsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.cy-5vsKneYb1fdyA5OTkU-RuYoX_pdTuSrOGB9_8TBw','2020-04-20 17:56:02','2020-04-20 17:56:02',NULL,'active');
/*!40000 ALTER TABLE `customer_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `customers_gender` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `customers_firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customers_dob` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customers_default_address_id` int(11) DEFAULT NULL,
  `customers_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `customers_newsletter` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fb_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customers_picture` mediumtext COLLATE utf8_unicode_ci,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `idx_customers_email_address` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `device_id` text COLLATE utf8_unicode_ci NOT NULL,
  `customers_id` int(100) NOT NULL DEFAULT '0',
  `device_type` text COLLATE utf8_unicode_ci NOT NULL,
  `register_date` int(100) NOT NULL DEFAULT '0',
  `update_date` int(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isDesktop` tinyint(1) NOT NULL DEFAULT '0',
  `onesignal` tinyint(1) NOT NULL DEFAULT '0',
  `isEnableMobile` tinyint(1) NOT NULL DEFAULT '1',
  `isEnableDesktop` tinyint(1) NOT NULL DEFAULT '1',
  `ram` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processor` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_os` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_notify` tinyint(1) NOT NULL DEFAULT '1',
  `fcm` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `area_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,10,'堅尼地城','Kennedy Town',1,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(2,10,'石塘咀',' Shek Tong Tsui',1,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(3,10,'西營盤','Sai Ying Pun',1,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(4,10,'上環','Sheung Wan',1,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(5,10,'中環','Central',1,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(6,10,'金鐘','Admiralty',1,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(7,10,'半山區','Mid-levels',1,'2020-03-12 02:27:40',NULL,'2020-03-1 02:27:40',NULL,'active'),(8,10,'山頂','Peak',1,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(9,10,'灣仔','Wan Chai',2,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(10,10,'銅鑼灣','Causeway Bay',2,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(11,10,'跑馬地','Happy Valley',2,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(12,10,'大坑','Tai Hang',2,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(13,10,'掃桿埔','So Kon Po',2,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(14,10,'渣甸山','Jardine Lookout',2,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(15,10,'天后','Tin Hau',3,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(16,10,'寶馬山','Braemar Hill',3,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(17,10,'北角','North Point',3,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(18,10,'鰂魚涌','Quarry Bay',3,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(19,10,'西灣河','Sai Wan Ho',3,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(20,10,'筲箕灣','Shau Kei Wan',3,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(21,10,'柴灣','Chai Wan',3,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(22,10,'小西灣','Siu Sai Wan',3,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(23,10,'薄扶林','Pok Fu Lam',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(24,10,'香港仔','Aberdeen',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(25,10,'鴨脷洲','Ap Lei Chau',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(26,10,'黃竹坑','Wong Chuk Hang',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(27,10,'壽臣山','Shouson Hill',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(28,10,'淺水灣','Repulse Bay',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(29,10,'舂磡角','Chung Hom Kok',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(30,10,'赤柱','Stanley',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(31,10,'大潭','Tai Tam',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(32,10,'石澳',' Shek O',4,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(33,10,'尖沙咀',' Tsim Sha Tsui',5,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(34,10,'油麻地',' Yau Ma Tei,',5,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(35,10,'西九龍填海區','West Kowloon Reclamation',5,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(36,10,'京士柏',' Kings Park',5,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(37,10,'旺角','Mong Kok',5,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(38,10,'大角咀','Tai Kok Tsui',5,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(39,10,'美孚','Mei Foo',6,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(41,10,'荔枝角','Lai Chi Kok',6,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(42,10,'長沙灣','Cheung Sha Wan',6,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(43,10,'深水埗','Sham Shui Po',6,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(44,10,'石硤尾','Shek Kip Mei',6,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(45,10,'又一村','Yau Yat Tsuen',6,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(46,10,'大窩坪','Tai Wo Ping',6,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(47,10,'昂船洲','Stonecutters Island',6,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(48,10,'紅磡','Hung Hom',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(49,10,'土瓜灣','To Kwa Wan',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(50,10,'馬頭角','Ma Tau Kok',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(51,10,'馬頭圍','Ma Tau Wai',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(52,10,'啟德','Kai Tak',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(53,10,'九龍城','Kowloon City',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(54,10,'何文田','Ho Man Tin',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(55,10,'九龍塘','Kowloon Tong',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(56,10,'筆架山','Beacon Hill',7,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(57,10,'新蒲崗','San Po Kong',8,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(58,10,'黃大仙','Wong Tai Sin',8,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(59,10,'東頭','Tung Tau',8,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(60,10,'橫頭磡','Wang Tau Hom',8,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(61,10,'樂富','Lok Fu',8,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(62,10,'鑽石山','Diamond Hill',8,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(63,10,'慈雲山','Tsz Wan Shan',8,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(64,10,'牛池灣','Ngau Chi Wan',8,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(65,10,'坪石','Ping Shek',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(66,10,'九龍灣','Kowloon Bay',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(67,10,'牛頭角','Ngau Tau Kok',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(68,10,'佐敦谷','Jordan Valley',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(69,10,'觀塘','Kwun Tong',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(70,10,'秀茂坪','Sau Mau Ping',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(71,10,'藍田','Lam Tin',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(72,10,'油塘','Yau Tong',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(73,10,'鯉魚門','Lei Yue Mun',9,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(74,10,'葵涌','Kwai Chung',10,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(75,10,'青衣','Tsing Yi',10,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(76,10,'荃灣','Tsuen Wan',11,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(77,10,'梨木樹','Lei Muk Shue',11,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(78,10,'汀九','Ting Kau',11,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(79,10,'深井','Sham Tseng',11,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(80,10,'青龍頭','Tsing Lung Tau',11,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(81,10,'馬灣','Ma Wan',11,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(82,10,'欣澳','Sunny Bay',11,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(83,10,'大欖涌','Tai Lam Chung',12,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(84,10,'掃管笏','So Kwun Wat',12,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(85,10,'屯門','Tuen Mun',12,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(86,10,'藍地','Lam Tei',12,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(87,10,'洪水橋','Hung Shui Kiu',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(88,10,'廈村','Ha Tsuen',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(89,10,'流浮山','Lau Fau Shan',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(90,10,'天水圍','Tin Shui Wai',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(91,10,'元朗','Yuen Long',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(92,10,'新田','San Tin',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(93,10,'落馬洲','Lok Ma Chau',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(94,10,'錦田','Kam Tin',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(95,10,'石崗','Shek Kong',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(96,10,'八鄉','Pat Heung',13,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(97,10,'粉嶺','Fanling',14,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(98,10,'聯和墟','Luen Wo Hui',14,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(99,10,'上水','Sheung Shui',14,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(100,10,'石湖墟','Shek Wu Hui',14,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(101,10,'沙頭角','Sha Tau Kok',14,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(102,10,'鹿頸','Luk Keng',14,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(103,10,'烏蛟騰','Wu Kau Tang',14,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(104,10,'大埔墟','Tai Po Market',15,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(105,10,'大埔','Tai Po',15,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(106,10,'大埔滘','Tai Po Kau',15,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(107,10,'大尾篤','Tai Mei Tuk',15,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(108,10,'船灣','Shuen Wan',15,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(109,10,'樟木頭','Cheung Muk Tau',15,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(110,10,'企嶺下','Kei Ling Ha',15,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(111,10,'大圍','Tai Wai',16,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(112,10,'沙田','Sha Tin',16,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(113,10,'火炭','Fo Tan',16,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(114,10,'馬料水','Ma Liu Shui',16,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(115,10,'烏溪沙','Wu Kai Sha',16,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(116,10,'馬鞍山','Ma On Shan',16,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(117,10,'長洲','Cheung Chau',17,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(118,10,'坪洲','Peng Chau',17,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(119,10,'大嶼山（包括東涌）','Lantau Island(including Tung Chung)',17,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active'),(120,10,'南丫島','Lamma Island',17,'2020-03-12 02:27:40',NULL,'2020-03-12 02:27:40',NULL,'active');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label_value`
--

DROP TABLE IF EXISTS `label_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `label_value` (
  `label_value_id` int(100) NOT NULL AUTO_INCREMENT,
  `label_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_id` int(100) DEFAULT NULL,
  `label_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`label_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label_value`
--

LOCK TABLES `label_value` WRITE;
/*!40000 ALTER TABLE `label_value` DISABLE KEYS */;
INSERT INTO `label_value` VALUES (1372,'Most Liked',1,956),(1371,'Special',1,957),(1370,'Top Seller',1,958),(1369,'Newest ',1,959),(1368,'Likes',1,960),(1366,'Mobile',1,962),(1367,'My Account',1,961),(1365,'Date of Birth',1,963),(1364,'Update',1,964),(1355,'Orders ID',1,970),(1356,'Product Price',1,971),(1357,'No. of Products',1,972),(1358,'Date',1,973),(1359,'Customer Address',1,974),(1360,'Customer Orders',1,968),(1361,'Change Password',1,967),(1362,'New Password',1,966),(1363,'Current Password',1,965),(1354,'Order Status',1,969),(1353,'Please add your new shipping address for the futher processing of the your order',1,975),(1352,'Add new Address',1,976),(1351,'Create an Account',1,977),(1350,'First Name',1,978),(1349,'Last Name',1,979),(1348,'Already Memeber?',1,980),(1341,'Billing Address',1,987),(1342,'Order',1,986),(1343,'Next',1,985),(1344,'Same as Shipping Address',1,984),(1345,'Billing Info',1,981),(1346,'Address',1,982),(1347,'Phone',1,983),(1339,'Products',1,989),(1340,'Shipping Method',1,988),(1334,'Order Notes',1,994),(1335,'Shipping Cost',1,993),(1336,'Tax',1,992),(1337,'Products Price',1,991),(1338,'SubTotal',1,990),(1333,'Payment',1,995),(1332,'Card Number',1,996),(1331,'Expiration Date',1,997),(1330,'Expiration',1,998),(1329,'Error: invalid card number!',1,999),(1328,'Error: invalid expiry date!',1,1000),(1327,'Error: invalid cvc number!',1,1001),(1326,'Continue',1,1002),(1325,'My Cart',1,1003),(1324,'Your cart is empty',1,1004),(1323,'continue shopping',1,1005),(1322,'Price',1,1006),(1318,'Remove',1,1010),(1319,'by',1,1008),(1320,'View',1,1009),(1321,'Quantity',1,1007),(1317,'Proceed',1,1011),(1315,'Country',1,1013),(1316,'Shipping Address',1,1012),(1313,'Zone',1,1015),(1314,'other',1,1014),(1311,'Post code',1,1017),(1312,'City',1,1016),(1309,'State',1,1018),(1310,'Update Address',1,1019),(1307,'login & Register',1,1021),(1308,'Save Address',1,1020),(1306,'Please login or create an account for free',1,1022),(1305,'Log Out',1,1023),(1304,'My Wish List',1,1024),(1303,'Filters',1,1025),(1302,'Price Range',1,1026),(1301,'Close',1,1027),(1299,'Clear',1,1029),(1300,'Apply',1,1028),(1298,'Menu',1,1030),(1297,'Home',1,1031),(1373,'Cancel',1,955),(1374,'Sort Products',1,954),(1375,'Special Products',1,953),(1376,'Price : low - high',1,952),(1377,'Price : high - low',1,951),(1378,'Z - A',1,950),(1379,'A - Z',1,949),(1380,'All',1,948),(1381,'Explore More',1,947),(1382,'Note to the buyer',1,946),(1383,'Coupon',1,945),(1384,'coupon code',1,944),(1385,'Coupon Amount',1,943),(1386,'Coupon Code',1,942),(1387,'Food Categories',1,941),(1388,'Recipe of Day',1,940),(1389,'Top Dishes',1,939),(1390,'Skip',1,938),(1391,'Term and Services',1,937),(1392,'Privacy Policy',1,936),(1393,'Refund Policy',1,935),(1394,'Newest',1,934),(1395,'OUT OF STOCK',1,933),(1396,'Select Language',1,932),(1397,'Reset',1,931),(1398,'Shop',1,930),(1399,'Settings',1,929),(1400,'Enter keyword',1,928),(1401,'News',1,927),(1402,'Top Sellers',1,926),(1403,'Go Back',1,925),(1404,'Word Press Post Detail',1,924),(1405,'Explore',1,923),(1406,'Continue Adding',1,922),(1407,'Your wish List is empty',1,921),(1408,'Favourite',1,920),(1409,'Continue Shopping',1,919),(1410,'My Orders',1,918),(1411,'Thank you for shopping with us.',1,917),(1412,'Thank You',1,916),(1413,'Shipping method',1,915),(1414,'Sub Categories',1,914),(1415,'Main Categories',1,913),(1416,'Search',1,912),(1417,'Reset Filters',1,911),(1418,'No Products Found',1,910),(1419,'OFF',1,909),(1420,'Techincal details',1,908),(1421,'Product Description',1,907),(1422,'ADD TO CART',1,906),(1423,'Add to Cart',1,905),(1424,'In Stock',1,904),(1425,'Out of Stock',1,903),(1426,'New',1,902),(1427,'Product Details',1,901),(1428,'Shipping',1,900),(1429,'Sub Total',1,899),(1430,'Total',1,898),(1431,'Price Detail',1,897),(1432,'Order Detail',1,896),(1433,'Got It!',1,895),(1434,'Skip Intro',1,894),(1435,'Intro',1,893),(1436,'REMOVE',1,892),(1437,'Deals',1,891),(1438,'All Categories',1,890),(1439,'Most Liked',1,889),(1440,'Special Deals',1,888),(1441,'Top Seller',1,887),(1442,'Products are available.',1,886),(1443,'Recently Viewed',1,885),(1444,'Please connect to the internet',1,884),(1445,'Contact Us',1,881),(1446,'Name',1,882),(1447,'Your Message',1,883),(1448,'Categories',1,880),(1449,'About Us',1,879),(1450,'Send',1,878),(1451,'Forgot Password',1,877),(1452,'Register',1,876),(1453,'Password',1,875),(1454,'Email',1,874),(1455,'or',1,873),(1456,'Login with',1,872),(1457,'Creating an account means you\'re okay with shopify\'s Terms of Service, Privacy Policy',1,2),(1458,'I\'ve forgotten my password?',1,1),(1459,NULL,1,NULL),(1462,'Creating an account means you’re okay with our',1,1033),(1465,'Login',1,1034),(1468,'Turn on/off Local Notifications',1,1035),(1471,'Turn on/off Notifications',1,1036),(1474,'Change Language',1,1037),(1477,'Official Website',1,1038),(1480,'Rate Us',1,1039),(1483,'Share',1,1040),(1486,'Edit Profile',1,1041),(1489,'A percentage discount for the entire cart',1,1042),(1492,'A fixed total discount for the entire cart',1,1043),(1495,'A fixed total discount for selected products only',1,1044),(1498,'A percentage discount for selected products only',1,1045);
/*!40000 ALTER TABLE `label_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `labels` (
  `label_id` int(100) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`label_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1046 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` VALUES (2,'Creating an account means you’re okay with shopify\'s Terms of Service, Privacy Policy'),(1031,'Home'),(1,'I\'ve forgotten my password?'),(1030,'Menu'),(1029,'Clear'),(1028,'Apply'),(1027,'Close'),(1026,'Price Range'),(1025,'Filters'),(1024,'My Wish List'),(1023,'Log Out'),(1022,'Please login or create an account for free'),(1021,'Login & Register'),(1020,'Save Address'),(1018,'State'),(1019,'Update Address'),(1017,'Post code'),(1016,'City'),(1015,'Zone'),(1014,'other'),(1013,'Country'),(1012,'Shipping Address'),(1011,'Proceed'),(1010,'Remove'),(1008,'by'),(1009,'View'),(1007,'Quantity'),(1006,'Price'),(1005,'continue shopping'),(1004,'Your cart is empty'),(1003,'My Cart'),(1002,'Continue'),(1001,'Error: invalid cvc number!'),(1000,'Error: invalid expiry date!'),(999,'Error: invalid card number!'),(998,'Expiration'),(997,'Expiration Date'),(996,'Card Number'),(995,'Payment'),(994,'Order Notes'),(993,'Shipping Cost'),(992,'Tax'),(991,'Products Price'),(990,'SubTotal'),(989,'Products'),(988,'Shipping Method'),(987,'Billing Address'),(986,'Order'),(985,'Next'),(984,'Same as Shipping Address'),(981,'Billing Info'),(982,'Address'),(983,'Phone'),(980,'Already Memeber?'),(979,'Last Name'),(978,'First Name'),(977,'Create an Account'),(976,'Add new Address'),(975,'Please add your new shipping address for the futher processing of the your order'),(969,'Order Status'),(970,'Orders ID'),(971,'Product Price'),(972,'No. of Products'),(973,'Date'),(974,'Customer Address'),(968,'Customer Orders'),(967,'Change Password'),(966,'New Password'),(965,'Current Password'),(964,'Update'),(963,'Date of Birth'),(962,'Mobile'),(961,'My Account'),(960,'Likes'),(959,'newest'),(958,'top seller'),(957,'special'),(956,'most liked'),(955,'Cancel'),(954,'Sort Products'),(953,'Special Products'),(952,'Price : low - high'),(951,'Price : high - low'),(950,'Z - A'),(949,'A - Z'),(948,'All'),(947,'Explore More'),(946,'Note to the buyer'),(945,'Coupon'),(944,'coupon code'),(943,'Coupon Amount'),(942,'Coupon Code'),(941,'Food Categories'),(940,'Recipe of Day'),(939,'Top Dishes'),(938,'Skip'),(937,'Term and Services'),(936,'Privacy Policy'),(935,'Refund Policy'),(934,'Newest'),(933,'OUT OF STOCK'),(932,'Select Language'),(931,'Reset'),(930,'Shop'),(929,'Settings'),(928,'Enter keyword'),(927,'News'),(926,'Top Sellers'),(925,'Go Back'),(924,'Word Press Post Detail'),(923,'Explore'),(922,'Continue Adding'),(921,'Your wish List is empty'),(920,'Favourite'),(919,'Continue Shopping'),(918,'My Orders'),(917,'Thank you for shopping with us.'),(916,'Thank You'),(915,'Shipping method'),(914,'Sub Categories'),(913,'Main Categories'),(912,'Search'),(911,'Reset Filters'),(910,'No Products Found'),(909,'OFF'),(908,'Techincal details'),(907,'Product Description'),(906,'ADD TO CART'),(905,'Add to Cart'),(904,'In Stock'),(903,'Out of Stock'),(902,'New'),(901,'Product Details'),(900,'Shipping'),(899,'Sub Total'),(898,'Total'),(897,'Price Detail'),(896,'Order Detail'),(895,'Got It!'),(894,'Skip Intro'),(893,'Intro'),(892,'REMOVE'),(891,'Deals'),(890,'All Categories'),(889,'Most Liked'),(888,'Special Deals'),(887,'Top Seller'),(886,'Products are available.'),(885,'Recently Viewed'),(884,'Please connect to the internet'),(881,'Contact Us'),(882,'Name'),(883,'Your Messsage'),(880,'Categories'),(879,'About Us'),(878,'Send'),(877,'Forgot Password'),(876,'Register'),(875,'Password'),(874,'Email'),(873,'or'),(872,'Login with'),(1033,'Creating an account means you’re okay with our'),(1034,'Login'),(1035,'Turn on/off Local Notifications'),(1036,'Turn on/off Notifications'),(1037,'Change Language'),(1038,'Official Website'),(1039,'Rate Us'),(1040,'Share'),(1041,'Edit Profile'),(1042,'A percentage discount for the entire cart'),(1043,'A fixed total discount for the entire cart'),(1044,'A fixed total discount for selected products only'),(1045,'A percentage discount for selected products only');
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_general_mysql500_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_general_mysql500_ci NOT NULL,
  `image` mediumtext COLLATE utf8_general_mysql500_ci,
  `directory` varchar(32) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `direction` varchar(100) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `is_default` varchar(3) COLLATE utf8_general_mysql500_ci DEFAULT 'no',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,0,'HongKong','hk','storage\\image\\hk.png',NULL,NULL,NULL,'yes','2020-01-20 15:00:00',NULL,'2020-01-20 15:00:00',NULL,'active'),(11,10,'HongKong','hk','storage/company/language/1583483764.hk.png',NULL,NULL,NULL,'yes','2020-02-28 06:03:16',NULL,'2020-03-06 08:36:04',NULL,'active'),(12,10,'English','ENG',NULL,NULL,NULL,NULL,'no','2020-03-18 04:03:43',NULL,'2020-03-18 04:03:43',NULL,'active');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `url` text COLLATE utf8_general_mysql500_ci,
  `image` mediumtext COLLATE utf8_general_mysql500_ci,
  `slug` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (2,10,'url',NULL,NULL,'2020-02-28 06:06:16',NULL,'2020-02-28 06:08:14',NULL,'active');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer_description`
--

DROP TABLE IF EXISTS `manufacturer_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manufacturer_description` (
  `manufacturer_description_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_general_mysql500_ci NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`manufacturer_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_description`
--

LOCK TABLES `manufacturer_description` WRITE;
/*!40000 ALTER TABLE `manufacturer_description` DISABLE KEYS */;
INSERT INTO `manufacturer_description` VALUES (1,'AddManufacturer s',11,2,'2020-02-28 06:06:16',NULL,'2020-02-28 06:08:14',NULL,'active');
/*!40000 ALTER TABLE `manufacturer_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_image` mediumtext COLLATE utf8_unicode_ci,
  `news_date_added` datetime NOT NULL,
  `news_last_modified` datetime DEFAULT NULL,
  `news_status` tinyint(1) NOT NULL,
  `is_feature` tinyint(1) NOT NULL DEFAULT '0',
  `news_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `idx_products_date_added` (`news_date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (5,'resources/assets/images/news_images/1502109905.h.png','2017-08-07 12:45:05',NULL,1,0,''),(6,'resources/assets/images/news_images/1503929511.banner-3.png','2017-08-22 06:36:32','2017-08-28 02:11:51',1,1,''),(7,'resources/assets/images/news_images/1503929570.banner-4.png','2017-08-22 07:00:29','2017-08-28 02:12:50',1,1,''),(8,'resources/assets/images/news_images/1504092360.about.svg','2017-08-22 07:03:16','2017-08-30 11:26:00',1,0,''),(9,'resources/assets/images/news_images/1504092640.laravel2.svg','2017-08-22 07:57:33','2017-08-30 11:30:40',1,0,''),(10,'resources/assets/images/news_images/1504092240.ionic.svg','2017-08-22 07:59:33','2017-08-30 11:24:00',1,0,''),(11,'resources/assets/images/news_images/1504091780.restaurant.svg','2017-08-22 08:04:29','2017-08-30 11:16:20',1,0,''),(12,'resources/assets/images/news_images/1504091963.fashion.svg','2017-08-22 08:06:23','2017-08-30 11:19:23',1,0,''),(13,'resources/assets/images/news_images/1504092054.electronics.svg','2017-08-22 08:07:23','2017-08-30 11:20:54',1,0,''),(14,'resources/assets/images/news_images/1504091642.language.svg','2017-08-22 08:10:39','2017-08-30 11:14:02',1,0,''),(15,'resources/assets/images/news_images/1504091465.payment.svg','2017-08-22 08:15:16','2017-08-30 11:11:05',1,0,''),(16,'resources/assets/images/news_images/1504091072.push_notifications.svg','2017-08-22 08:17:28','2017-08-30 11:04:32',1,0,''),(17,'resources/assets/images/news_images/1504091049.local_notifications.svg','2017-08-22 08:18:08','2017-08-30 11:04:09',1,0,''),(18,'resources/assets/images/news_images/1504091024.products.svg','2017-08-22 08:18:51','2017-08-30 11:03:44',1,0,''),(19,'resources/assets/images/news_images/1504091001.social.svg','2017-08-22 08:19:35','2017-08-30 11:03:21',1,0,''),(20,'resources/assets/images/news_images/1504090986.shipping_method.svg','2017-08-22 08:22:33','2017-08-30 11:03:06',1,0,''),(21,'resources/assets/images/news_images/1504090941.theme.svg','2017-08-22 08:23:22','2017-08-30 11:02:21',1,0,''),(22,'resources/assets/images/news_images/1504090926.coupon_support.svg','2017-08-22 10:52:53','2017-08-30 11:02:06',1,0,''),(23,'resources/assets/images/news_images/1504090906.profile_pic.svg','2017-08-22 10:53:45','2017-08-30 11:01:46',1,0,''),(24,'resources/assets/images/news_images/1504090888.social_share.svg','2017-08-22 10:54:24','2017-08-30 11:01:28',1,0,''),(25,'resources/assets/images/news_images/1504090868.wishlist.svg','2017-08-22 10:55:13','2017-08-30 11:01:08',1,0,''),(26,'resources/assets/images/news_images/1504088925.wordpress.svg','2017-08-22 10:56:15','2017-08-30 10:28:45',1,0,''),(27,'resources/assets/images/news_images/1504088895.app_tutorial.svg','2017-08-22 10:56:55','2017-08-30 10:28:15',1,0,''),(28,'resources/assets/images/news_images/1504088865.price_filter.svg','2017-08-22 10:59:38','2017-08-30 10:27:45',1,0,''),(29,'resources/assets/images/news_images/1504088836.sorting.svg','2017-08-22 11:03:06','2017-08-30 10:27:16',1,0,''),(30,'resources/assets/images/news_images/1504088735.product_searching.svg','2017-08-22 11:03:53','2017-08-30 10:25:35',1,0,''),(31,'resources/assets/images/news_images/1504088705.fully_customizable.svg','2017-08-22 11:04:34','2017-08-30 10:25:05',1,0,''),(32,'resources/assets/images/news_images/1504087261.horizontal_Slider.svg','2017-08-22 11:09:25','2017-08-30 10:01:01',1,0,''),(33,'resources/assets/images/news_images/1504087219.customization.svg','2017-08-22 11:13:38','2017-08-30 10:00:19',1,0,''),(34,'resources/assets/images/news_images/1504087179.grid_list.svg','2017-08-22 11:14:16','2017-08-30 09:59:39',1,0,''),(35,'resources/assets/images/news_images/1504083663.home_page_styles.svg','2017-08-22 11:15:19','2017-08-30 09:01:03',1,0,''),(36,'resources/assets/images/news_images/1504015398.shop_page.svg','2017-08-22 11:16:24','2017-08-29 02:03:18',1,0,''),(37,'resources/assets/images/news_images/1504015381.my_orders.svg','2017-08-22 11:17:04','2017-08-29 02:03:01',1,0,''),(38,'resources/assets/images/news_images/1504015363.about_contact_pages.svg','2017-08-22 11:17:49','2017-08-29 02:02:43',1,0,''),(39,'resources/assets/images/news_images/1504083589.Asset 2.svg','2017-08-22 11:18:14','2017-08-30 08:59:49',1,0,''),(40,'resources/assets/images/news_images/1504015347.info_pages.svg','2017-08-22 11:18:53','2017-08-29 02:02:27',1,0,''),(41,'resources/assets/images/news_images/1504015330.app_settings.svg','2017-08-22 11:19:57','2017-08-29 02:02:10',1,0,''),(42,'resources/assets/images/news_images/1504015307.recently_item.svg','2017-08-22 11:24:05','2017-08-29 02:01:47',1,0,''),(43,'resources/assets/images/news_images/1504015288.move_to_top.svg','2017-08-22 11:24:47','2017-08-29 02:01:28',1,0,''),(44,'resources/assets/images/news_images/1504015272.product_price_discount.svg','2017-08-22 11:25:49','2017-08-29 02:01:12',1,0,''),(45,'resources/assets/images/news_images/1504015246.inventory_management.svg','2017-08-22 11:26:24','2017-08-29 02:00:46',1,0,''),(46,'resources/assets/images/news_images/1504013177.horizontal_Slider.svg','2017-08-22 11:26:59','2017-08-29 01:26:17',1,0,''),(47,'resources/assets/images/news_images/1504013161.on_scroll_product_loading.svg','2017-08-22 11:33:04','2017-08-29 01:26:01',1,0,''),(48,'resources/assets/images/news_images/1504013140.product_additional_attributes.svg','2017-08-22 11:36:02','2017-08-29 01:25:40',1,0,''),(49,'resources/assets/images/news_images/1504012761.multi_product_images.svg','2017-08-22 11:36:36','2017-08-29 01:19:21',1,0,''),(50,'resources/assets/images/news_images/1503928378.cart_page.svg','2017-08-22 11:37:11','2017-08-28 01:52:58',1,0,''),(51,'resources/assets/images/news_images/1503928065.shipping_managment.svg','2017-08-22 11:37:48','2017-08-28 01:47:45',1,0,''),(52,'resources/assets/images/news_images/1504083328.Asset 1.svg','2017-08-22 11:38:21','2017-08-30 08:55:28',1,0,''),(53,'resources/assets/images/news_images/1503927733.animtions.svg','2017-08-22 11:38:58','2017-08-28 01:42:38',1,0,'');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_categories`
--

DROP TABLE IF EXISTS `news_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` mediumtext COLLATE utf8_unicode_ci,
  `categories_icon` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `news_categories_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_categories`
--

LOCK TABLES `news_categories` WRITE;
/*!40000 ALTER TABLE `news_categories` DISABLE KEYS */;
INSERT INTO `news_categories` VALUES (6,'resources/assets/images/news_categories_images/1504092793.app_features.svg','',0,NULL,'2017-08-22 06:20:50','2017-08-30 11:33:13',''),(7,'resources/assets/images/news_categories_images/1504092906.introduction.svg','',0,NULL,'2017-08-22 06:22:50','2017-08-30 11:35:06',''),(8,'resources/assets/images/news_categories_images/1504092995.platform.svg','',0,NULL,'2017-08-22 06:30:31','2017-08-30 11:36:35',''),(9,'resources/assets/images/news_categories_images/1504093080.screenshots.svg','',0,NULL,'2017-08-22 06:31:50','2017-08-30 11:38:00','');
/*!40000 ALTER TABLE `news_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_categories_description`
--

DROP TABLE IF EXISTS `news_categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news_categories_description` (
  `categories_description_id` int(100) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`categories_description_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_categories_description`
--

LOCK TABLES `news_categories_description` WRITE;
/*!40000 ALTER TABLE `news_categories_description` DISABLE KEYS */;
INSERT INTO `news_categories_description` VALUES (16,6,1,'App Features'),(17,6,2,'App Functies'),(18,6,4,'ميزات التطبيق'),(19,7,1,'Introduction'),(20,7,2,'Invoering'),(21,7,4,'المقدمة'),(22,8,1,'Platforms'),(23,8,2,'Platforms'),(24,8,4,'منصات'),(25,9,1,'Screen Shots'),(26,9,2,'Schermafbeeldingen'),(27,9,4,'لقطات الشاشة');
/*!40000 ALTER TABLE `news_categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_description`
--

DROP TABLE IF EXISTS `news_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news_description` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `news_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `news_description` text COLLATE utf8_unicode_ci,
  `news_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`news_id`,`language_id`),
  KEY `products_name` (`news_name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_description`
--

LOCK TABLES `news_description` WRITE;
/*!40000 ALTER TABLE `news_description` DISABLE KEYS */;
INSERT INTO `news_description` VALUES (5,1,'Test Post','<p>Test PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest PostTest Post</p>\r\n',NULL,0),(5,2,'German Test Post','<p>German Test PostGerman Test PostGerman Test PostGerman Test PostGerman Test PostGerman Test PostGerman Test Post</p>\r\n',NULL,0),(5,4,'Arabic Test Post','<p>Arabic Test PostArabic Test PostArabic Test PostArabic Test PostArabic Test PostArabic Test PostArabic Test Post</p>\r\n',NULL,0),(6,1,'Why To choose this App for your Project?','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(6,2,'Waarom deze applicatie?','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(6,4,'لماذا هذا التطبيق؟','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(7,1,'Tools and Technology','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(7,2,'Gereedschap en technologie','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(7,4,'الأدوات والتكنولوجيا','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(8,1,'About Us','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(8,2,'Over ons','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(8,4,'معلومات عنا','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(9,1,'Laravel','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(9,2,'Laravel','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(9,4,'Laravel','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(10,1,'Ionic Framework','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(10,2,'Ionic Framework','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(10,4,'الإطار الأيوني','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(11,1,'Resturant','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(11,2,'Resturant','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(11,4,'المطعم','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(12,1,'Fashion','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(12,2,'Mode','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(12,4,'موضه','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(13,1,'Electronics','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(13,2,'Elektronica','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(13,4,'إلكترونيات','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(14,1,'Multi Language','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(14,2,'Multi Language','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(14,4,'متعدد اللغات','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(15,1,'Multiple Payment Gateways','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(15,2,'Meerdere betalingsgateways','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(15,4,'بوابات الدفع المتعددة','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(16,1,'Push Notifications','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(16,2,'Push Notifications','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(16,4,'دفع الإخطارات','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(17,1,'Local Notifications','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(17,2,'Lokale meldingen','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(17,4,'الإشعارات المحلية','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(18,1,'All Types of Products Friendly','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(18,2,'Alle soorten producten vriendelijk','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(18,4,'جميع أنواع المنتجات ودية','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(19,1,'Log-in via Social Accounts','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(19,2,'Inloggen via sociale accounts','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(19,4,'تسجيل الدخول عبر الحسابات الاجتماعية','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(20,1,'Multiple Shipping Methods','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(20,2,'Meerdere verzendmethoden','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(20,4,'طرق الشحن متعددة','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(21,1,'Interactive Theme & Easy Customization with SaSS','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(21,2,'Interactief thema en gemakkelijke aanpassing met SaSS','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(21,4,'موضوع التفاعلية وسهولة التخصيص مع ساس','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(22,1,'Coupon Support','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(22,2,'Coupon Ondersteuning','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(22,4,'دعم القسيمة','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(23,1,'Profile Picture','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(23,2,'Profielfoto','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(23,4,'الصوره الشخصيه','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(24,1,'Social Share','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(24,2,'Sociaal aandeel','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(24,4,'حصة الاجتماعي','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(25,1,'Wish List','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(25,2,'Wenslijst','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(25,4,'الأماني','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(26,1,'WordPress Blog','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(26,2,'WordPress Blog','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(26,4,'مدونة وورد','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(27,1,'App Tutorial / Intro Screens','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(27,2,'App Tutorial / Intro Screens','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(27,4,'التطبيق التعليمي / شاشات مقدمة','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(28,1,'Price & Keyword Filters','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(28,2,'Prijs- en sleutelwoordfilters','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(28,4,'السعر والكلمات الرئيسية الفلاتر','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(29,1,'Product Sorting','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(29,2,'Product sorteren','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(29,4,'فرز المنتجات','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(30,1,'Product Searching','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(30,2,'Product zoeken','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(30,4,'البحث عن المنتج','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(31,1,'Fully Customizable','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(31,2,'Volledig klantgericht','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(31,4,'تماما للتخصيص','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(32,1,'Horizontal Product Slider','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(32,2,'Horizontale Product Slider','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(32,4,'أفقي المنتج المنزلق','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(33,1,'Customizable Features & Functionalities','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(33,2,'Aanpasbare eigenschappen en functionaliteit','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(33,4,'الميزات والتخصيص وظائف','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(34,1,'Product Grid & List View','<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(34,2,'Product Grid & Lijstweergave','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(34,4,'شبكة المنتج وعرض القائمة','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق \\\"ليتراسيت\\\" (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل \\\"ألدوس بايج مايكر\\\" (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق \\\"ليتراسيت\\\" (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل \\\"ألدوس بايج مايكر\\\" (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق \\\"ليتراسيت\\\" (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل \\\"ألدوس بايج مايكر\\\" (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(35,1,'5 Home Page Styles','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(35,2,'5 Home Page Styles','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(35,4,'5 الصفحة الرئيسية أنماط','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(36,1,'Beautiful Single Shop Page For Complete Catalog','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(36,2,'Mooie single shop pagina voor complete catalogus','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(36,4,'جميلة صفحة واحدة متجر للكتالوج الكامل','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(37,1,'My Orders','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(37,2,'mijn bestellingen','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(37,4,'طلباتي','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(38,1,'About & Contact Pages','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(38,2,'Over & Contactpagina\'s','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(38,4,'حول الصفحات والاتصال','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(39,1,'Laravel Blog Pages','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(39,2,'Laravel blog pagina\'s','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(39,4,'صفحات لارافيل المدونة','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(40,1,'Info Pages','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(40,2,'Info pagina\'s','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(40,4,'صفحات المعلومات','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(41,1,'App Settings Page','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(41,2,'App Settings Page','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(41,4,'صفحة إعدادات التطبيق','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(42,1,'Recently Item Viewed Block on Home Page','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(42,2,'Onlangs Item bekeken Blok op Startpagina','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(42,4,'تم مؤخرا عرض العنصر بلوك أون هوم بادج','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(43,1,'Move to Top Slider Button','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(43,2,'Ga naar de bovenste schuifknop','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(43,4,'الانتقال إلى أعلى زر المنزلق','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(44,1,'Product Price Discount','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(44,2,'Productprijs korting','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(44,4,'خصم سعر المنتج','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(45,1,'Inventory Management','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(45,2,'ادارة المخزون','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(45,4,'Voorraadbeheer','<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(46,1,'Horizontal Slider on Home Page','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(46,2,'Horizontale schuifregelaar op de startpagina','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(46,4,'أفقي المنزلق على الصفحة الرئيسية','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(47,1,'On-scroll Product Loading','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(47,2,'On-scroll Product Loading','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(47,4,'أون-سكرول برودوكت لوادينغ','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(48,1,'Product Additional Attributes / Commerce Pricing Attributes','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(48,2,'Product Aanvullende Attributen / Handelsprijzen Attributen','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(48,4,'سمات المنتج الإضافية / سمات التسعير التجاري','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(49,1,'Multiple Product Images','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(49,2,'Meerdere productafbeeldingen','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(49,4,'صور المنتج متعددة','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(50,1,'Beautiful Cart Page','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(50,2,'Mooie winkelwagen pagina','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(50,4,'صفحة العربة الجميلة','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(51,1,'Shipping Address Management','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(51,2,'Verzendadresbeheer','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(51,4,'إدارة عنوان الشحن','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(52,1,'Woocommerce Api','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(52,2,'Woocommerce Api','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(52,4,'ووكومرس أبي','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(53,1,'Animations','<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(53,2,'animaties','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0),(53,4,'الرسوم المتحركة','<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ionic\\\" src=\\\"https://ionicframework.com/img/ionic-meta.jpg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.<br />\r\n<img alt=\\\"Image result for angularjs\\\" src=\\\"http://paislee.io/content/images/2014/Aug/angular_js.svg\\\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, persecuti neglegentur ei sit, assum accusata atomorum duo ne, timeam philosophia ex sea. Pri malorum blandit splendide id, est ea autem docendi interesset. Et vivendo lobortis has, te ius summo epicurei atomorum, an usu novum officiis intellegebat. Ne ridens dicunt eos, vel ad atqui mazim oratio. At vix nisl dolore similique, vidit dicat elitr eum te. Id eum mentitum nominavi, velit oporteat referrentur mei ei, et sea legimus suscipit. Quis augue altera mei et.</p>\r\n\r\n<p><img alt=\\\"Image result for ngcordova\\\" src=\\\"http://ngcordova.com/img/cta-image.png\\\" /></p>\r\n',NULL,0);
/*!40000 ALTER TABLE `news_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_to_news_categories`
--

DROP TABLE IF EXISTS `news_to_news_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news_to_news_categories` (
  `news_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_to_news_categories`
--

LOCK TABLES `news_to_news_categories` WRITE;
/*!40000 ALTER TABLE `news_to_news_categories` DISABLE KEYS */;
INSERT INTO `news_to_news_categories` VALUES (5,5),(6,7),(7,7),(8,7),(9,8),(10,8),(11,9),(12,9),(13,9),(14,6),(15,6),(16,6),(17,6),(18,6),(19,6),(20,6),(21,6),(22,6),(23,6),(24,6),(25,6),(26,6),(27,6),(28,6),(29,6),(30,6),(31,6),(32,6),(33,6),(34,6),(35,6),(36,6),(37,6),(38,6),(39,6),(40,6),(41,6),(42,6),(43,6),(44,6),(45,6),(46,6),(47,6),(48,6),(49,6),(50,6),(51,6),(52,6),(53,6);
/*!40000 ALTER TABLE `news_to_news_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comment`
--

DROP TABLE IF EXISTS `order_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_comment` (
  `order_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `comment` mediumtext COLLATE utf8_general_mysql500_ci,
  `customer_notified` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `permission` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `comment_date` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`order_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comment`
--

LOCK TABLES `order_comment` WRITE;
/*!40000 ALTER TABLE `order_comment` DISABLE KEYS */;
INSERT INTO `order_comment` VALUES (1,1,'remark','yes','customer','2020-04-20 18:25:02','2020-04-20 18:02:25',NULL,'2020-04-20 18:02:25',NULL,'active');
/*!40000 ALTER TABLE `order_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_attribute_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `product_price` decimal(15,2) NOT NULL,
  `product_quantity` int(2) NOT NULL,
  `final_price` decimal(15,2) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,1,1,NULL,80.00,1,80.00,'2020-04-20 18:02:25',NULL,'2020-04-20 18:02:25',NULL,'active'),(2,1,3,NULL,400.00,2,800.00,'2020-04-20 18:02:25',NULL,'2020-04-20 18:02:25',NULL,'active');
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_description`
--

DROP TABLE IF EXISTS `order_product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_product_description` (
  `order_product_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `product_id` int(11) NOT NULL,
  `product_attribute_id` int(11) NOT NULL,
  `image` text COLLATE utf8_general_mysql500_ci,
  `product_name` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `product_attribute_name` varchar(64) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `product_description` text COLLATE utf8_general_mysql500_ci,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`order_product_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_description`
--

LOCK TABLES `order_product_description` WRITE;
/*!40000 ALTER TABLE `order_product_description` DISABLE KEYS */;
INSERT INTO `order_product_description` VALUES (1,1,1,11,1,1,'storage/company/10/product/images/1583397245.13.png','ProductA','ProductAttributeName','<p>labels.Description (HongKong)</p>','2020-04-20 18:02:25',NULL,'2020-04-20 18:02:25',NULL,'active'),(2,1,1,12,1,1,'storage/company/10/product/images/1583397245.13.png','ProductA ENG','ProductAttributeName ENG','<p>labels.Description (English)</p>','2020-04-20 18:02:25',NULL,'2020-04-20 18:02:25',NULL,'active'),(3,1,2,11,11,3,'storage/company/10/product/images/1583397245.13.png','productd','productd','<p>productd</p>','2020-04-20 18:02:25',NULL,'2020-04-20 18:02:25',NULL,'active'),(4,1,2,12,11,3,'storage/company/10/product/images/1583397245.13.png','productd eng','productd eng','<p>productd eng</p>','2020-04-20 18:02:25',NULL,'2020-04-20 18:02:25',NULL,'active');
/*!40000 ALTER TABLE `order_product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_price` decimal(10,2) DEFAULT NULL,
  `payment_method_id` int(11) NOT NULL,
  `payment_method_name` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_company` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `customer_address_id` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_street_address` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `customer_country` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_city` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_area` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_district` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_estate` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_building` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_room` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `customer_telephone` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `shipping_cost` decimal(10,2) DEFAULT NULL,
  `shipping_method` varchar(100) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `order_date_finished` datetime DEFAULT NULL,
  `order_information` mediumtext COLLATE utf8_general_mysql500_ci,
  `order_remark` tinytext COLLATE utf8_general_mysql500_ci,
  `customer_remark` tinytext COLLATE utf8_general_mysql500_ci,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `order_status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,880.00,1,'Cash on Delivery','2020-04-20 18:25:02',10,1,NULL,'cccc','14','香港 港島 中西區 金鐘 ccc ccc cccc室','香港','港島','中西區','金鐘','ccc','ccc','cccc','33333333','customerA@gmail.com',NULL,NULL,NULL,NULL,NULL,'remark','2020-04-20 18:02:25',NULL,'2020-04-20 18:02:25',NULL,'active','pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pages` (
  `page_id` int(100) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'privacy-policy',0,1),(2,'term-services',0,1),(3,'refund-policy',0,1),(4,'about-us',0,1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_description`
--

DROP TABLE IF EXISTS `pages_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pages_description` (
  `page_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(100) NOT NULL,
  `page_id` int(100) NOT NULL,
  PRIMARY KEY (`page_description_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_description`
--

LOCK TABLES `pages_description` WRITE;
/*!40000 ALTER TABLE `pages_description` DISABLE KEYS */;
INSERT INTO `pages_description` VALUES (1,'Privacy Policy','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy</p>\r\n\r\n<p>text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen</p>\r\n\r\n<p>book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially</p>\r\n\r\n<p>unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,</p>\r\n\r\n<p>and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem</p>\r\n\r\n<p>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard</p>\r\n\r\n<p>dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type</p>\r\n\r\n<p>specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining</p>\r\n\r\n<p>essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum</p>\r\n\r\n<p>passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem</p>\r\n\r\n<p>Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s</p>\r\n\r\n<p>standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make</p>\r\n\r\n<p>a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>\r\n\r\n<p>the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</p>\r\n\r\n<p>it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>\r\n\r\n<p>the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</p>\r\n\r\n<p>it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum.</p>\r\n',1,1),(4,'Term & Services','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy</p>\r\n\r\n<p>text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen</p>\r\n\r\n<p>book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially</p>\r\n\r\n<p>unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,</p>\r\n\r\n<p>and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem</p>\r\n\r\n<p>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard</p>\r\n\r\n<p>dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type</p>\r\n\r\n<p>specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining</p>\r\n\r\n<p>essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum</p>\r\n\r\n<p>passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem</p>\r\n\r\n<p>Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s</p>\r\n\r\n<p>standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make</p>\r\n\r\n<p>a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>\r\n\r\n<p>the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</p>\r\n\r\n<p>it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>\r\n\r\n<p>the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</p>\r\n\r\n<p>it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum.</p>\r\n',1,2),(7,'Refund Policy','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy</p>\r\n\r\n<p>text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen</p>\r\n\r\n<p>book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially</p>\r\n\r\n<p>unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,</p>\r\n\r\n<p>and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem</p>\r\n\r\n<p>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard</p>\r\n\r\n<p>dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type</p>\r\n\r\n<p>specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining</p>\r\n\r\n<p>essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum</p>\r\n\r\n<p>passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem</p>\r\n\r\n<p>Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s</p>\r\n\r\n<p>standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make</p>\r\n\r\n<p>a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>\r\n\r\n<p>the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</p>\r\n\r\n<p>it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>\r\n\r\n<p>the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</p>\r\n\r\n<p>it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum.</p>\r\n',1,3),(10,'About Us','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy</p>\r\n\r\n<p>text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen</p>\r\n\r\n<p>book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially</p>\r\n\r\n<p>unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,</p>\r\n\r\n<p>and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem</p>\r\n\r\n<p>Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard</p>\r\n\r\n<p>dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type</p>\r\n\r\n<p>specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining</p>\r\n\r\n<p>essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum</p>\r\n\r\n<p>passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem</p>\r\n\r\n<p>Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s</p>\r\n\r\n<p>standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make</p>\r\n\r\n<p>a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>\r\n\r\n<p>the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</p>\r\n\r\n<p>it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>\r\n\r\n<p>the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled</p>\r\n\r\n<p>it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n\r\n<p>remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing</p>\r\n\r\n<p>Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions</p>\r\n\r\n<p>of Lorem Ipsum.</p>\r\n',1,4);
/*!40000 ALTER TABLE `pages_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_description`
--

DROP TABLE IF EXISTS `payment_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `payment_name` varchar(32) NOT NULL,
  `sub_name_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sub_name_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_description`
--

LOCK TABLES `payment_description` WRITE;
/*!40000 ALTER TABLE `payment_description` DISABLE KEYS */;
INSERT INTO `payment_description` VALUES (1,'Braintree',1,'Braintree','Credit Card','Paypal'),(4,'',1,'Stripe','',''),(5,'',1,'Paypal','',''),(6,'Cash on Delivery',1,'Cash On Delivery','','');
/*!40000 ALTER TABLE `payment_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `image` mediumtext COLLATE utf8_general_mysql500_ci,
  `default_image` mediumtext COLLATE utf8_general_mysql500_ci,
  `company_id` int(11) NOT NULL,
  `description` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `is_default` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'Cash on Delivery',NULL,'storage/default_images/payment_method.png',10,'Cash on Delivery','2020-03-12 04:19:05',NULL,'2020-03-12 04:19:05','active','yes'),(2,'Visa','storage/company/10/payment_method/images/1586332945.cash_on_delivery.png',NULL,10,'Visa','2020-03-12 04:19:05',NULL,'2020-04-08 08:02:25','active','no'),(27,'a','storage/company/10/payment_method/images/1586333009.cash_on_delivery.png',NULL,10,'aDescription','2020-04-08 05:58:32',NULL,'2020-04-08 08:03:37','active','no'),(28,'b',NULL,'storage/default_images/payment_method.png',10,'b','2020-04-09 04:42:36',NULL,'2020-04-09 04:42:36','active',NULL);
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_setting`
--

DROP TABLE IF EXISTS `payments_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payments_setting` (
  `payments_id` int(100) NOT NULL AUTO_INCREMENT,
  `braintree_enviroment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `braintree_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `braintree_merchant_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `braintree_public_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `braintree_private_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brantree_active` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_enviroment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `secret_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publishable_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_active` tinyint(1) NOT NULL DEFAULT '0',
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `cod_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `paypal_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `paypal_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paypal_status` tinyint(1) NOT NULL DEFAULT '0',
  `paypal_enviroment` tinyint(1) DEFAULT '0',
  `payment_currency` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payments_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_setting`
--

LOCK TABLES `payments_setting` WRITE;
/*!40000 ALTER TABLE `payments_setting` DISABLE KEYS */;
INSERT INTO `payments_setting` VALUES (1,'0','Braintree','','','',0,'0','Stripe','','',0,1,'Cash On Delivery','Paypal','',0,0,'USD');
/*!40000 ALTER TABLE `payments_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `is_public` tinyint(4) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'root','All Permission',0,'2019-11-11 00:00:00',1,'2019-11-11 00:00:00','1','active'),(2,'user','Client',1,'2019-11-11 00:00:00',1,'2019-11-11 00:00:00','1','active');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `image` mediumtext COLLATE utf8_unicode_ci,
  `currency_id` int(11) DEFAULT NULL,
  `original_price` decimal(15,2) NOT NULL,
  `special_status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_price` decimal(15,2) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `liked` int(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_class_id` int(11) DEFAULT NULL,
  `is_feature` tinyint(1) DEFAULT '0',
  `ordered` int(11) NOT NULL DEFAULT '0',
  `model` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `idx_products_model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,10,'storage/company/10/product/images/1583397245.13.png',NULL,100.00,'cancel',NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2020-03-05 08:30:55',NULL,'2020-03-18 04:04:08',NULL,'active',NULL,NULL,0,0,NULL),(2,10,'storage/company/10/product/images/1583397093.14.png',NULL,200.00,'cancel',0.00,NULL,NULL,NULL,NULL,NULL,1,2,'2020-03-05 08:31:33',NULL,'2020-03-05 08:31:33',NULL,'active',NULL,NULL,0,0,NULL),(3,10,'storage/company/10/product/images/1583397276.1024_icon.png',NULL,300.00,'cancel',NULL,NULL,NULL,NULL,NULL,NULL,2,2,'2020-03-05 08:34:29',NULL,'2020-03-05 08:34:36',NULL,'active',NULL,NULL,0,0,NULL),(4,10,'storage/company/10/product/images/1583397303.flow_1.jpeg',NULL,400.00,'cancel',0.00,NULL,NULL,NULL,NULL,NULL,2,2,'2020-03-05 08:35:03',NULL,'2020-03-05 08:35:03',NULL,'active',NULL,NULL,0,0,NULL),(11,10,NULL,NULL,200.00,NULL,0.00,NULL,NULL,NULL,NULL,NULL,1,2,'2020-03-18 08:59:21',NULL,'2020-03-18 08:59:21',NULL,'active',NULL,NULL,0,0,NULL),(12,10,NULL,NULL,300.00,NULL,0.00,NULL,NULL,NULL,NULL,NULL,1,2,'2020-03-18 09:09:15',NULL,'2020-03-18 09:09:15',NULL,'active',NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_attribute` (
  `product_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` text COLLATE utf8_general_mysql500_ci,
  `qty` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `low_limit` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `price_prefix` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`product_attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute`
--

LOCK TABLES `product_attribute` WRITE;
/*!40000 ALTER TABLE `product_attribute` DISABLE KEYS */;
INSERT INTO `product_attribute` VALUES (1,1,'storage/company/10/product/images/1583397245.13.png','10','20',20.00,'substract',0,'2020-03-12 04:18:52',NULL,'2020-03-18 04:04:51',NULL,'active'),(2,1,'storage/company/10/product/images/1583397245.13.png','20','1',222.00,'add',0,'2020-03-13 16:33:51',NULL,'2020-03-13 16:33:51',NULL,'active'),(3,11,'storage/company/10/product/images/1583397245.13.png','100','1',200.00,'add',0,'2020-03-18 08:59:21',NULL,'2020-03-18 08:59:21',NULL,'active'),(4,12,'storage/company/10/product/images/1583397245.13.png','100','1',0.00,'add',0,'2020-03-18 09:09:15',NULL,'2020-03-18 09:09:15',NULL,'active');
/*!40000 ALTER TABLE `product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_description`
--

DROP TABLE IF EXISTS `product_attribute_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_attribute_description` (
  `product_attribute_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `product_attribute_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`product_attribute_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_description`
--

LOCK TABLES `product_attribute_description` WRITE;
/*!40000 ALTER TABLE `product_attribute_description` DISABLE KEYS */;
INSERT INTO `product_attribute_description` VALUES (1,11,1,'ProductAttributeName','2020-03-12 04:18:52',NULL,'2020-03-18 04:04:51',NULL,'active'),(2,11,2,'A-2','2020-03-13 16:33:51',NULL,'2020-03-13 16:33:51',NULL,'active'),(3,12,1,'ProductAttributeName ENG','2020-03-18 04:04:52',NULL,'2020-03-18 04:04:52',NULL,'active'),(4,11,3,'productd','2020-03-18 08:59:21',NULL,'2020-03-18 08:59:21',NULL,'active'),(5,12,3,'productd eng','2020-03-18 08:59:21',NULL,'2020-03-18 08:59:21',NULL,'active'),(6,11,4,'product e','2020-03-18 09:09:15',NULL,'2020-03-18 09:09:15',NULL,'active'),(7,12,4,'product e','2020-03-18 09:09:15',NULL,'2020-03-18 09:09:15',NULL,'active');
/*!40000 ALTER TABLE `product_attribute_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_description` (
  `product_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `product_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewed` int(5) DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`product_description_id`,`language_id`),
  KEY `products_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (1,11,1,'ProductA','<p>labels.Description (HongKong)</p>',NULL,0,'2020-03-05 08:30:55',NULL,'2020-03-18 04:04:08',NULL,'active'),(2,11,2,'ProductB','<p>ProductBProductB</p>',NULL,0,'2020-03-05 08:31:33',NULL,'2020-03-05 08:31:33',NULL,'active'),(3,11,3,'ProductC','<p><em>ProductCProductCProductC</em></p>',NULL,0,'2020-03-05 08:34:29',NULL,'2020-03-05 08:34:36',NULL,'active'),(4,11,4,'ProductD','<p>ProductDProductDProductD</p>',NULL,0,'2020-03-05 08:35:03',NULL,'2020-03-05 08:35:03',NULL,'active'),(5,12,1,'ProductA ENG','<p>labels.Description (English)</p>',NULL,0,'2020-03-18 04:04:08',NULL,'2020-03-18 04:04:08',NULL,'active'),(6,11,11,'productd','<p>productd</p>',NULL,0,'2020-03-18 08:59:21',NULL,'2020-03-18 08:59:21',NULL,'active'),(7,12,11,'productd eng','<p>productd eng</p>',NULL,0,'2020-03-18 08:59:21',NULL,'2020-03-18 08:59:21',NULL,'active'),(8,11,12,'product e','<p>product e hk</p>',NULL,0,'2020-03-18 09:09:15',NULL,'2020-03-18 09:09:15',NULL,'active'),(9,12,12,'product e','<p>product e eng</p>',NULL,0,'2020-03-18 09:09:15',NULL,'2020-03-18 09:09:15',NULL,'active');
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` mediumtext COLLATE utf8_general_mysql500_ci,
  `description` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`product_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,1,'storage/company/10/product_attribute/images/1584118034.icon.png',NULL,NULL,'2020-03-19 03:17:53',NULL,'2020-03-19 03:17:53',NULL,'active');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_description`
--

DROP TABLE IF EXISTS `product_option_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_option_description` (
  `product_option_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `product_option_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`product_option_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_description`
--

LOCK TABLES `product_option_description` WRITE;
/*!40000 ALTER TABLE `product_option_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_value`
--

DROP TABLE IF EXISTS `product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_value`
--

LOCK TABLES `product_option_value` WRITE;
/*!40000 ALTER TABLE `product_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_value_description`
--

DROP TABLE IF EXISTS `product_option_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_option_value_description` (
  `product_option_value_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `product_option_value_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`product_option_value_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_value_description`
--

LOCK TABLES `product_option_value_description` WRITE;
/*!40000 ALTER TABLE `product_option_value_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_status` tinyint(1) NOT NULL DEFAULT '0',
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_description`
--

LOCK TABLES `reviews_description` WRITE;
/*!40000 ALTER TABLE `reviews_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sessions` (
  `sesskey` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'facebook_app_id','907608576060481','2018-04-26 19:00:00','2018-07-03 01:50:42'),(2,'facebook_secret_id','158109115c6019beb4a4193ed5d620b9','2018-04-26 19:00:00','2018-07-03 01:50:42'),(3,'facebook_login','1','2018-04-26 19:00:00','2018-07-03 01:50:42'),(4,'contact_us_email','vectorcoder@gmail.com','2018-04-26 19:00:00','2018-07-03 02:17:08'),(5,'address','D-ground','2018-04-26 19:00:00','2018-07-03 02:17:08'),(6,'city','Faisalabad','2018-04-26 19:00:00','2018-07-03 02:17:08'),(7,'state','Punjab','2018-04-26 19:00:00','2018-07-03 02:17:08'),(8,'zip','38000','2018-04-26 19:00:00','2018-07-03 02:17:08'),(9,'country','Pakistan','2018-04-26 19:00:00','2018-07-03 02:17:08'),(10,'latitude','31.4063632','2018-04-26 19:00:00','2018-07-03 02:17:08'),(11,'longitude','73.10692979999999','2018-04-26 19:00:00','2018-07-03 02:17:08'),(12,'phone_no','+92 3457765876','2018-04-26 19:00:00','2018-07-03 02:17:08'),(13,'fcm_android','','2018-04-26 19:00:00','2018-05-22 10:59:51'),(14,'fcm_ios',NULL,'2018-04-26 19:00:00',NULL),(15,'fcm_desktop',NULL,'2018-04-26 19:00:00',NULL),(16,'website_logo','resources/assets/images/site_images/1525072842.logo-blue-v1.png','2018-04-26 19:00:00',NULL),(17,'fcm_android_sender_id',NULL,'2018-04-26 19:00:00',NULL),(18,'fcm_ios_sender_id','','2018-04-26 19:00:00','2018-05-22 10:59:51'),(19,'app_name','Ionic Shop','2018-04-26 19:00:00','2018-07-03 02:17:08'),(20,'currency_symbol','$','2018-04-26 19:00:00','2018-07-03 02:17:08'),(21,'new_product_duration','20','2018-04-26 19:00:00','2018-07-03 02:17:08'),(22,'notification_title','Ionic Ecommerce','2018-04-26 19:00:00','2018-07-03 02:10:38'),(23,'notification_text','A bundle of products waiting for you!','2018-04-26 19:00:00',NULL),(24,'lazzy_loading_effect','Detail','2018-04-26 19:00:00','2018-07-03 02:10:38'),(25,'footer_button','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(26,'cart_button','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(27,'featured_category',NULL,'2018-04-26 19:00:00',NULL),(28,'notification_duration','day','2018-04-26 19:00:00','2018-07-03 02:10:38'),(29,'home_style','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(30,'wish_list_page','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(31,'edit_profile_page','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(32,'shipping_address_page','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(33,'my_orders_page','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(34,'contact_us_page','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(35,'about_us_page','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(36,'news_page','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(37,'intro_page','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(38,'setting_page','1','2018-04-26 19:00:00',NULL),(39,'share_app','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(40,'rate_app','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(41,'site_url','http://ionicecommerce.com/','2018-04-26 19:00:00','2018-07-03 02:17:08'),(42,'admob','0','2018-04-26 19:00:00','2018-07-04 02:08:18'),(43,'admob_id','ca-app-pub-5138652967372552~1074356914','2018-04-26 19:00:00','2018-07-04 02:08:18'),(44,'ad_unit_id_banner','ca-app-pub-5138652967372552/7596367384','2018-04-26 19:00:00','2018-07-04 02:08:18'),(45,'ad_unit_id_interstitial','ca-app-pub-5138652967372552/9602920919','2018-04-26 19:00:00','2018-07-04 02:08:18'),(46,'category_style','1','2018-04-26 19:00:00','2018-07-03 02:10:38'),(47,'package_name','https://itunes.apple.com/us/app/ionic-shop/id1342112345?mt=8','2018-04-26 19:00:00','2018-07-03 02:10:38'),(48,'google_analytic_id','test','2018-04-26 19:00:00','2018-07-03 02:10:38'),(49,'themes','themeone','2018-04-26 19:00:00',NULL),(50,'company_name','VC','2018-04-26 19:00:00',NULL),(51,'facebook_url','#','2018-04-26 19:00:00',NULL),(52,'google_url','#','2018-04-26 19:00:00',NULL),(53,'twitter_url','#','2018-04-26 19:00:00',NULL),(54,'linked_in','#','2018-04-26 19:00:00',NULL),(55,'default_notification','onesignal','2018-04-26 19:00:00','2018-05-22 10:59:51'),(56,'onesignal_app_id','6053d948-b8f6-472a-87e4-379fa89f78d8','2018-04-26 19:00:00','2018-05-22 10:59:51'),(57,'onesignal_sender_id','50877237723','2018-04-26 19:00:00','2018-05-22 10:59:51'),(58,'ios_admob','0','2018-04-26 19:00:00','2018-07-04 02:08:18'),(59,'ios_admob_id','AdMob ID','2018-04-26 19:00:00','2018-07-04 02:08:18'),(60,'ios_ad_unit_id_banner','ca-app-pub-5138652967372552/2060782633','2018-04-26 19:00:00','2018-07-04 02:08:18'),(61,'ios_ad_unit_id_interstitial','ca-app-pub-5138652967372552/3318023987','2018-04-26 19:00:00','2018-07-04 02:08:18'),(62,'google_login','1',NULL,NULL),(63,'google_app_id',NULL,NULL,NULL),(64,'google_secret_id',NULL,NULL,NULL),(65,'google_callback_url',NULL,NULL,NULL),(66,'facebook_callback_url',NULL,NULL,NULL),(67,'is_app_purchased','1',NULL,'2018-05-03 22:24:44'),(68,'is_desktop_purchased','0',NULL,'2018-05-03 22:24:44'),(69,'consumer_key','ada691a715307861907d65d36d',NULL,'2018-07-05 05:23:10'),(70,'consumer_secret','a75e40ec1530786190b62316d1',NULL,'2018-07-05 05:23:10'),(71,'order_email','vectorcoder@gmail.com',NULL,'2018-07-03 02:17:08'),(72,'website_themes','1',NULL,NULL),(73,'seo_title',NULL,NULL,NULL),(74,'seo_metatag',NULL,NULL,NULL),(75,'seo_keyword',NULL,NULL,NULL),(76,'seo_description',NULL,NULL,NULL),(77,'before_head_tag',NULL,NULL,NULL),(78,'end_body_tag',NULL,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_description`
--

DROP TABLE IF EXISTS `shipping_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_description` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sub_labels` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_description`
--

LOCK TABLES `shipping_description` WRITE;
/*!40000 ALTER TABLE `shipping_description` DISABLE KEYS */;
INSERT INTO `shipping_description` VALUES (1,'Free Shipping',1,'free_shipping',''),(4,'Local Pickup',1,'local_pickup',''),(7,'Flat Rate',1,'flate_rate',''),(10,'UPS Shipping',1,'ups_shipping','{\"nextDayAir\":\"Next Day Air\",\"secondDayAir\":\"2nd Day Air\",\"ground\":\"Ground\",\"threeDaySelect\":\"3 Day Select\",\"nextDayAirSaver\":\"Next Day AirSaver\",\"nextDayAirEarlyAM\":\"Next Day Air Early A.M.\",\"secondndDayAirAM\":\"2nd Day Air A.M.\"}');
/*!40000 ALTER TABLE `shipping_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_methods`
--

DROP TABLE IF EXISTS `shipping_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_methods` (
  `shipping_methods_id` int(100) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `methods_type_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`shipping_methods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_methods`
--

LOCK TABLES `shipping_methods` WRITE;
/*!40000 ALTER TABLE `shipping_methods` DISABLE KEYS */;
INSERT INTO `shipping_methods` VALUES (1,0,'upsShipping',0,0,'ups_shipping'),(2,0,'freeShipping',1,1,'free_shipping'),(3,0,'localPickup',0,1,'local_pickup'),(4,0,'flateRate',0,1,'flate_rate');
/*!40000 ALTER TABLE `shipping_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders_images`
--

DROP TABLE IF EXISTS `sliders_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sliders_images` (
  `sliders_id` int(11) NOT NULL AUTO_INCREMENT,
  `sliders_title` varchar(64) NOT NULL,
  `sliders_url` varchar(255) NOT NULL,
  `sliders_image` varchar(255) NOT NULL,
  `sliders_group` varchar(64) NOT NULL,
  `sliders_html_text` mediumtext NOT NULL,
  `expires_date` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` varchar(64) NOT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `languages_id` int(100) NOT NULL,
  PRIMARY KEY (`sliders_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders_images`
--

LOCK TABLES `sliders_images` WRITE;
/*!40000 ALTER TABLE `sliders_images` DISABLE KEYS */;
INSERT INTO `sliders_images` VALUES (1,'Slider-1','81','resources/assets/images/slider_images/1520516873.192c136def2a09558ea0dfd85e0d5ed2.jpg','','','2029-01-03 00:00:00','2018-03-30 10:48:07',1,'product','2018-03-30 10:48:07',0),(2,'Slider-2','76','resources/assets/images/slider_images/1520516894.1502370343.banner_2.jpg','','','2019-01-31 00:00:00','2018-03-30 10:50:48',1,'product','2018-03-30 10:50:48',0),(3,'Slider-3','','resources/assets/images/slider_images/1520517279.1502370387.banner_4.jpg','','','2029-01-01 00:00:00','2018-03-30 10:54:22',1,'top seller','2018-03-30 10:54:22',0);
/*!40000 ALTER TABLE `sliders_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sub_category` (
  `sub_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `image` mediumtext COLLATE utf8_general_mysql500_ci,
  `icon` mediumtext COLLATE utf8_general_mysql500_ci,
  `sort_order` int(3) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `category_id` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,10,'storage/company/10/sub_category/images/1583381408.1024_icon.png','storage/company/10/sub_category/icons/1583381415.1024_icon.png',NULL,NULL,'2020-02-28 06:08:36',NULL,'2020-03-05 04:10:15',NULL,'active','1'),(2,10,'storage/company/10/sub_category/images/1583383160.logo.png','storage/company/10/sub_category/icons/1583383246.logo.png',NULL,NULL,'2020-03-05 04:39:20',NULL,'2020-03-05 04:40:46',NULL,'active','1');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category_description`
--

DROP TABLE IF EXISTS `sub_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sub_category_description` (
  `sub_category_description_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_general_mysql500_ci NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `sub_category_id` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`sub_category_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category_description`
--

LOCK TABLES `sub_category_description` WRITE;
/*!40000 ALTER TABLE `sub_category_description` DISABLE KEYS */;
INSERT INTO `sub_category_description` VALUES (1,'SubA',11,1,'2020-02-28 06:08:36',NULL,'2020-03-05 04:10:15',NULL,'active'),(2,'SubB',11,2,'2020-03-05 04:39:20',NULL,'2020-03-05 04:40:46',NULL,'active');
/*!40000 ALTER TABLE `sub_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `unit` (
  `unit_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `language_id` int(100) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'Gram',1,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL,''),(2,'Kilogram',1,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL,'');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `party_id` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `default_language_id` int(11) NOT NULL,
  `default_company_id` int(11) NOT NULL,
  `identity` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `image` text COLLATE utf8_general_mysql500_ci,
  `remember_token` varchar(100) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `phone_2` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `password_str` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin.TL',1,1,'boss','resources/views/admin/images/admin_profile/1505132393.1486628854.fast.jpg','FRwwIOU5JxHpYfk4emlW6FEN37nUbwUE7t9pKTbrHGgei7TlCgmOVgbYfhO1','a','lam','F','2019-11-20','534038482',NULL,'acornjamie123@gmail.com','','$2y$10$oG7Hz/ikZqsvAjQM06hA9uci8IUPFr77Jo/g/.uWwT8yDEeCmDdLi','admin','2019-11-13 00:58:30',NULL,'2020-01-17 10:22:31',NULL,'active'),(8,'10.TL',11,10,'boss',NULL,NULL,'boss@gmail.com','a','M','2020-02-01','1111111',NULL,'boss@gmail.com',NULL,'$2y$10$H7eVnKQ/tJ8r09Toxqmon.M98HYxFFjhd5LiKYBHeuiQ9Kn.zdA9C','123123','2020-02-28 06:03:16',NULL,'2020-02-28 06:03:16',NULL,'active');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_company`
--

DROP TABLE IF EXISTS `user_to_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_to_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `is_main_company` varchar(45) COLLATE utf8_general_mysql500_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_company`
--

LOCK TABLES `user_to_company` WRITE;
/*!40000 ALTER TABLE `user_to_company` DISABLE KEYS */;
INSERT INTO `user_to_company` VALUES (1,8,10,'yes','2020-02-28 06:03:16',NULL,'2020-02-28 06:03:16',NULL);
/*!40000 ALTER TABLE `user_to_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_address_book`
--

DROP TABLE IF EXISTS `view_address_book`;
/*!50001 DROP VIEW IF EXISTS `view_address_book`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_address_book` AS SELECT 
 1 AS `id`,
 1 AS `customer_id`,
 1 AS `phone`,
 1 AS `company`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `district_id`,
 1 AS `country_name`,
 1 AS `city_name`,
 1 AS `area_name`,
 1 AS `district_name`,
 1 AS `estate`,
 1 AS `building`,
 1 AS `room`,
 1 AS `address_ch`,
 1 AS `address_en`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`,
 1 AS `is_default`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_category`
--

DROP TABLE IF EXISTS `view_category`;
/*!50001 DROP VIEW IF EXISTS `view_category`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_category` AS SELECT 
 1 AS `category_id`,
 1 AS `company_id`,
 1 AS `name`,
 1 AS `image`,
 1 AS `icon`,
 1 AS `slug`,
 1 AS `sort_order`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`,
 1 AS `language_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_company`
--

DROP TABLE IF EXISTS `view_company`;
/*!50001 DROP VIEW IF EXISTS `view_company`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_company` AS SELECT 
 1 AS `company_id`,
 1 AS `party_id`,
 1 AS `is_main_company`,
 1 AS `language_id`,
 1 AS `name`,
 1 AS `email`,
 1 AS `image`,
 1 AS `phone`,
 1 AS `district_id`,
 1 AS `estate`,
 1 AS `building`,
 1 AS `room`,
 1 AS `address_ch`,
 1 AS `address_en`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_country_city`
--

DROP TABLE IF EXISTS `view_country_city`;
/*!50001 DROP VIEW IF EXISTS `view_country_city`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_country_city` AS SELECT 
 1 AS `countries_id`,
 1 AS `company_id`,
 1 AS `countries_name`,
 1 AS `cities_id`,
 1 AS `cities_name`,
 1 AS `cities_code`,
 1 AS `cities_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_country_city_area`
--

DROP TABLE IF EXISTS `view_country_city_area`;
/*!50001 DROP VIEW IF EXISTS `view_country_city_area`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_country_city_area` AS SELECT 
 1 AS `countries_id`,
 1 AS `countries_name`,
 1 AS `cities_id`,
 1 AS `company_id`,
 1 AS `cities_name`,
 1 AS `cities_code`,
 1 AS `area_id`,
 1 AS `area_name`,
 1 AS `area_code`,
 1 AS `area_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_country_city_area_district`
--

DROP TABLE IF EXISTS `view_country_city_area_district`;
/*!50001 DROP VIEW IF EXISTS `view_country_city_area_district`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_country_city_area_district` AS SELECT 
 1 AS `countries_id`,
 1 AS `countries_name`,
 1 AS `cities_id`,
 1 AS `cities_name`,
 1 AS `cities_code`,
 1 AS `area_id`,
 1 AS `area_name`,
 1 AS `area_code`,
 1 AS `district_id`,
 1 AS `company_id`,
 1 AS `district_name`,
 1 AS `district_code`,
 1 AS `header_address`,
 1 AS `district_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_country_city_area_district_zone`
--

DROP TABLE IF EXISTS `view_country_city_area_district_zone`;
/*!50001 DROP VIEW IF EXISTS `view_country_city_area_district_zone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_country_city_area_district_zone` AS SELECT 
 1 AS `countries_id`,
 1 AS `countries_name`,
 1 AS `cities_id`,
 1 AS `cities_name`,
 1 AS `cities_code`,
 1 AS `area_id`,
 1 AS `area_name`,
 1 AS `area_code`,
 1 AS `district_id`,
 1 AS `district_name`,
 1 AS `district_code`,
 1 AS `district_status`,
 1 AS `zone_id`,
 1 AS `company_id`,
 1 AS `zone_name`,
 1 AS `zone_code`,
 1 AS `zone_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_customer`
--

DROP TABLE IF EXISTS `view_customer`;
/*!50001 DROP VIEW IF EXISTS `view_customer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_customer` AS SELECT 
 1 AS `id`,
 1 AS `company_id`,
 1 AS `language_id`,
 1 AS `language_name`,
 1 AS `language_image`,
 1 AS `picture`,
 1 AS `gender`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `dob`,
 1 AS `email`,
 1 AS `user_name`,
 1 AS `default_address_id`,
 1 AS `telephone`,
 1 AS `fax`,
 1 AS `password`,
 1 AS `fb_id`,
 1 AS `google_id`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`,
 1 AS `company_name`,
 1 AS `company_email`,
 1 AS `company_phone`,
 1 AS `company_image`,
 1 AS `entry_company`,
 1 AS `entry_firstname`,
 1 AS `entry_lastname`,
 1 AS `district_id`,
 1 AS `entry_create_date`,
 1 AS `entry_create_by_id`,
 1 AS `entry_edit_date`,
 1 AS `entry_edit_by_id`,
 1 AS `entry_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_manufacturer`
--

DROP TABLE IF EXISTS `view_manufacturer`;
/*!50001 DROP VIEW IF EXISTS `view_manufacturer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_manufacturer` AS SELECT 
 1 AS `manufacturer_id`,
 1 AS `company_id`,
 1 AS `name`,
 1 AS `url`,
 1 AS `image`,
 1 AS `slug`,
 1 AS `language_id`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_order`
--

DROP TABLE IF EXISTS `view_order`;
/*!50001 DROP VIEW IF EXISTS `view_order`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_order` AS SELECT 
 1 AS `order_id`,
 1 AS `order_price`,
 1 AS `payment_method_id`,
 1 AS `payment_method_name`,
 1 AS `date_purchased`,
 1 AS `company_id`,
 1 AS `customer_id`,
 1 AS `customer_name`,
 1 AS `customer_company`,
 1 AS `customer_address_id`,
 1 AS `customer_street_address`,
 1 AS `customer_country`,
 1 AS `customer_city`,
 1 AS `customer_area`,
 1 AS `customer_district`,
 1 AS `customer_estate`,
 1 AS `customer_building`,
 1 AS `customer_room`,
 1 AS `customer_telephone`,
 1 AS `email`,
 1 AS `shipping_cost`,
 1 AS `shipping_method`,
 1 AS `order_date_finished`,
 1 AS `order_information`,
 1 AS `order_remark`,
 1 AS `customer_remark`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`,
 1 AS `order_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_order_product`
--

DROP TABLE IF EXISTS `view_order_product`;
/*!50001 DROP VIEW IF EXISTS `view_order_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_order_product` AS SELECT 
 1 AS `order_product_id`,
 1 AS `order_id`,
 1 AS `product_attribute_id`,
 1 AS `currency_id`,
 1 AS `product_price`,
 1 AS `product_quantity`,
 1 AS `final_price`,
 1 AS `language_id`,
 1 AS `order_product_description_id`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_attribute_name`,
 1 AS `image`,
 1 AS `full_product_name`,
 1 AS `product_description`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_product`
--

DROP TABLE IF EXISTS `view_product`;
/*!50001 DROP VIEW IF EXISTS `view_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_product` AS SELECT 
 1 AS `product_id`,
 1 AS `company_id`,
 1 AS `category_id`,
 1 AS `sub_category_id`,
 1 AS `language_id`,
 1 AS `sub_category_language_id`,
 1 AS `category_name`,
 1 AS `sub_category_name`,
 1 AS `sub_category_image`,
 1 AS `sub_category_icon`,
 1 AS `product_description_id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `url`,
 1 AS `viewed`,
 1 AS `model`,
 1 AS `image`,
 1 AS `original_price`,
 1 AS `special_status`,
 1 AS `special_price`,
 1 AS `expiry_date`,
 1 AS `weight`,
 1 AS `weight_unit`,
 1 AS `ordered`,
 1 AS `tax_class_id`,
 1 AS `manufacturer_id`,
 1 AS `liked`,
 1 AS `is_feature`,
 1 AS `slug`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_product_attribute`
--

DROP TABLE IF EXISTS `view_product_attribute`;
/*!50001 DROP VIEW IF EXISTS `view_product_attribute`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_product_attribute` AS SELECT 
 1 AS `product_attribute_id`,
 1 AS `language_id`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_attribute_name`,
 1 AS `full_product_name`,
 1 AS `product_description`,
 1 AS `company_id`,
 1 AS `image`,
 1 AS `qty`,
 1 AS `low_limit`,
 1 AS `original_price`,
 1 AS `price_prefix`,
 1 AS `price`,
 1 AS `final_price`,
 1 AS `sorting`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_product_option`
--

DROP TABLE IF EXISTS `view_product_option`;
/*!50001 DROP VIEW IF EXISTS `view_product_option`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_product_option` AS SELECT 
 1 AS `product_option_id`,
 1 AS `name`,
 1 AS `language_id`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_product_option_value`
--

DROP TABLE IF EXISTS `view_product_option_value`;
/*!50001 DROP VIEW IF EXISTS `view_product_option_value`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_product_option_value` AS SELECT 
 1 AS `product_option_value_id`,
 1 AS `product_option_id`,
 1 AS `loption_anguage_id`,
 1 AS `option_name`,
 1 AS `value_name`,
 1 AS `language_id`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_sub_category`
--

DROP TABLE IF EXISTS `view_sub_category`;
/*!50001 DROP VIEW IF EXISTS `view_sub_category`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_sub_category` AS SELECT 
 1 AS `category_language_id`,
 1 AS `company_id`,
 1 AS `language_id`,
 1 AS `sub_category_language_id`,
 1 AS `sub_category_id`,
 1 AS `category_name`,
 1 AS `category_id`,
 1 AS `sub_category_name`,
 1 AS `image`,
 1 AS `icon`,
 1 AS `slug`,
 1 AS `sort_order`,
 1 AS `create_date`,
 1 AS `create_by_id`,
 1 AS `edit_date`,
 1 AS `edit_by_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `whos_online` (
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `time_entry` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `time_last_click` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `last_page_url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whos_online`
--

LOCK TABLES `whos_online` WRITE;
/*!40000 ALTER TABLE `whos_online` DISABLE KEYS */;
INSERT INTO `whos_online` VALUES (1,'muzammil younas','','','2017-08-30 13:','',''),(2,'Rabia Saqib','','','2017-08-25 20:','',''),(3,'Test Ionicecommerce','','','2017-09-08 10:','',''),(4,'Jamie Lam','','','2018-11-07 17:','',''),(5,'Tester Lee','','','2018-11-17 08:','','');
/*!40000 ALTER TABLE `whos_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `edit_date` datetime NOT NULL,
  `edit_by_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zones_country_id` (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `view_address_book`
--

/*!50001 DROP VIEW IF EXISTS `view_address_book`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_address_book` AS select `address_book`.`id` AS `id`,`address_book`.`customer_id` AS `customer_id`,`address_book`.`phone` AS `phone`,`address_book`.`company` AS `company`,`address_book`.`firstname` AS `firstname`,`address_book`.`lastname` AS `lastname`,`address_book`.`district_id` AS `district_id`,`view_country_city_area_district`.`countries_name` AS `country_name`,`view_country_city_area_district`.`cities_name` AS `city_name`,`view_country_city_area_district`.`area_name` AS `area_name`,`view_country_city_area_district`.`district_name` AS `district_name`,`address_book`.`estate` AS `estate`,`address_book`.`building` AS `building`,`address_book`.`room` AS `room`,concat(`view_country_city_area_district`.`countries_name`,' ',`view_country_city_area_district`.`cities_name`,' ',`view_country_city_area_district`.`area_name`,' ',`view_country_city_area_district`.`district_name`,' ',`address_book`.`estate`,' ',`address_book`.`building`,' ',`address_book`.`room`,'室') AS `address_ch`,concat('Room',`address_book`.`room`,', ',`address_book`.`building`,', ',`address_book`.`estate`,', ',`view_country_city_area_district`.`district_name`,', ',`view_country_city_area_district`.`area_name`,', ',`view_country_city_area_district`.`cities_name`,', ',`view_country_city_area_district`.`countries_name`) AS `address_en`,`address_book`.`create_date` AS `create_date`,`address_book`.`create_by_id` AS `create_by_id`,`address_book`.`edit_date` AS `edit_date`,`address_book`.`edit_by_id` AS `edit_by_id`,`address_book`.`status` AS `status`,`address_book`.`is_default` AS `is_default` from (`address_book` left join `view_country_city_area_district` on((`address_book`.`district_id` = `view_country_city_area_district`.`district_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_category`
--

/*!50001 DROP VIEW IF EXISTS `view_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_category` AS select `category`.`category_id` AS `category_id`,`category`.`company_id` AS `company_id`,`category_description`.`name` AS `name`,`category`.`image` AS `image`,`category`.`icon` AS `icon`,`category`.`slug` AS `slug`,`category`.`sort_order` AS `sort_order`,`category`.`create_date` AS `create_date`,`category`.`create_by_id` AS `create_by_id`,`category`.`edit_date` AS `edit_date`,`category`.`edit_by_id` AS `edit_by_id`,`category`.`status` AS `status`,`category_description`.`language_id` AS `language_id` from (`category` left join `category_description` on((`category_description`.`category_id` = `category`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_company`
--

/*!50001 DROP VIEW IF EXISTS `view_company`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_company` AS select `company`.`company_id` AS `company_id`,`company`.`party_id` AS `party_id`,`company`.`is_main_company` AS `is_main_company`,`company_description`.`language_id` AS `language_id`,`company_description`.`name` AS `name`,`company`.`email` AS `email`,`company`.`image` AS `image`,`company`.`phone` AS `phone`,`company`.`district_id` AS `district_id`,`company`.`estate` AS `estate`,`company`.`building` AS `building`,`company`.`room` AS `room`,`company`.`address_ch` AS `address_ch`,`company`.`address_en` AS `address_en`,`company`.`create_date` AS `create_date`,`company`.`create_by_id` AS `create_by_id`,`company`.`edit_date` AS `edit_date`,`company`.`edit_by_id` AS `edit_by_id`,`company`.`status` AS `status` from (`company` left join `company_description` on((`company_description`.`company_id` = `company`.`company_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_country_city`
--

/*!50001 DROP VIEW IF EXISTS `view_country_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_country_city` AS select `countries`.`id` AS `countries_id`,`countries`.`company_id` AS `company_id`,`countries`.`name` AS `countries_name`,`cities`.`id` AS `cities_id`,`cities`.`name` AS `cities_name`,`cities`.`code` AS `cities_code`,`cities`.`status` AS `cities_status` from (`cities` left join `countries` on((`cities`.`countries_id` = `countries`.`id`))) where (`countries`.`id` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_country_city_area`
--

/*!50001 DROP VIEW IF EXISTS `view_country_city_area`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_country_city_area` AS select `countries`.`id` AS `countries_id`,`countries`.`name` AS `countries_name`,`cities`.`id` AS `cities_id`,`cities`.`company_id` AS `company_id`,`cities`.`name` AS `cities_name`,`cities`.`code` AS `cities_code`,`area`.`id` AS `area_id`,`area`.`name` AS `area_name`,`area`.`code` AS `area_code`,`area`.`status` AS `area_status` from ((`area` left join `cities` on((`area`.`city_id` = `cities`.`id`))) left join `countries` on((`cities`.`countries_id` = `countries`.`id`))) where ((`cities`.`id` is not null) and (`countries`.`id` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_country_city_area_district`
--

/*!50001 DROP VIEW IF EXISTS `view_country_city_area_district`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_country_city_area_district` AS select `countries`.`id` AS `countries_id`,`countries`.`name` AS `countries_name`,`cities`.`id` AS `cities_id`,`cities`.`name` AS `cities_name`,`cities`.`code` AS `cities_code`,`area`.`id` AS `area_id`,`area`.`name` AS `area_name`,`area`.`code` AS `area_code`,`district`.`id` AS `district_id`,`district`.`company_id` AS `company_id`,`district`.`name` AS `district_name`,`district`.`code` AS `district_code`,concat(`countries`.`name`,' ',`cities`.`name`,' ',`area`.`name`,' ',`district`.`name`) AS `header_address`,`district`.`status` AS `district_status` from (((`district` left join `area` on((`district`.`area_id` = `area`.`id`))) left join `cities` on((`area`.`city_id` = `cities`.`id`))) left join `countries` on((`cities`.`countries_id` = `countries`.`id`))) where ((`countries`.`id` is not null) and (`cities`.`id` is not null) and (`area`.`id` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_country_city_area_district_zone`
--

/*!50001 DROP VIEW IF EXISTS `view_country_city_area_district_zone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_country_city_area_district_zone` AS select `countries`.`id` AS `countries_id`,`countries`.`name` AS `countries_name`,`cities`.`id` AS `cities_id`,`cities`.`name` AS `cities_name`,`cities`.`code` AS `cities_code`,`area`.`id` AS `area_id`,`area`.`name` AS `area_name`,`area`.`code` AS `area_code`,`district`.`id` AS `district_id`,`district`.`name` AS `district_name`,`district`.`code` AS `district_code`,`district`.`status` AS `district_status`,`zones`.`id` AS `zone_id`,`zones`.`company_id` AS `company_id`,`zones`.`name` AS `zone_name`,`zones`.`code` AS `zone_code`,`zones`.`status` AS `zone_status` from ((((`zones` left join `district` on((`zones`.`district_id` = `district`.`id`))) left join `area` on((`district`.`area_id` = `area`.`id`))) left join `cities` on((`area`.`city_id` = `cities`.`id`))) left join `countries` on((`cities`.`countries_id` = `countries`.`id`))) where ((`countries`.`id` is not null) and (`cities`.`id` is not null) and (`area`.`id` is not null) and (`district`.`id` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_customer`
--

/*!50001 DROP VIEW IF EXISTS `view_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_customer` AS select `customer`.`id` AS `id`,`customer`.`company_id` AS `company_id`,`language`.`language_id` AS `language_id`,`language`.`name` AS `language_name`,`language`.`image` AS `language_image`,`customer`.`picture` AS `picture`,`customer`.`gender` AS `gender`,`customer`.`firstname` AS `firstname`,`customer`.`lastname` AS `lastname`,`customer`.`dob` AS `dob`,`customer`.`email` AS `email`,`customer`.`user_name` AS `user_name`,`customer`.`default_address_id` AS `default_address_id`,`customer`.`telephone` AS `telephone`,`customer`.`fax` AS `fax`,`customer`.`password` AS `password`,`customer`.`fb_id` AS `fb_id`,`customer`.`google_id` AS `google_id`,`customer`.`create_date` AS `create_date`,`customer`.`create_by_id` AS `create_by_id`,`customer`.`edit_date` AS `edit_date`,`customer`.`edit_by_id` AS `edit_by_id`,`customer`.`status` AS `status`,`view_company`.`name` AS `company_name`,`view_company`.`email` AS `company_email`,`view_company`.`phone` AS `company_phone`,`view_company`.`image` AS `company_image`,`address_book`.`company` AS `entry_company`,`address_book`.`firstname` AS `entry_firstname`,`address_book`.`lastname` AS `entry_lastname`,`address_book`.`district_id` AS `district_id`,`address_book`.`create_date` AS `entry_create_date`,`address_book`.`create_by_id` AS `entry_create_by_id`,`address_book`.`edit_date` AS `entry_edit_date`,`address_book`.`edit_by_id` AS `entry_edit_by_id`,`address_book`.`status` AS `entry_status` from (((`customer` left join `address_book` on((`address_book`.`id` = `customer`.`default_address_id`))) left join `view_company` on((`view_company`.`company_id` = `customer`.`company_id`))) left join `language` on((`language`.`language_id` = `customer`.`default_language_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_manufacturer`
--

/*!50001 DROP VIEW IF EXISTS `view_manufacturer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_manufacturer` AS select `manufacturer`.`manufacturer_id` AS `manufacturer_id`,`manufacturer`.`company_id` AS `company_id`,`manufacturer_description`.`name` AS `name`,`manufacturer`.`url` AS `url`,`manufacturer`.`image` AS `image`,`manufacturer`.`slug` AS `slug`,`manufacturer_description`.`language_id` AS `language_id`,`manufacturer`.`create_date` AS `create_date`,`manufacturer`.`create_by_id` AS `create_by_id`,`manufacturer`.`edit_date` AS `edit_date`,`manufacturer`.`edit_by_id` AS `edit_by_id`,`manufacturer`.`status` AS `status` from (`manufacturer` left join `manufacturer_description` on((`manufacturer`.`manufacturer_id` = `manufacturer_description`.`manufacturer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_order`
--

/*!50001 DROP VIEW IF EXISTS `view_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_order` AS select `orders`.`order_id` AS `order_id`,`orders`.`order_price` AS `order_price`,`orders`.`payment_method_id` AS `payment_method_id`,`orders`.`payment_method_name` AS `payment_method_name`,`orders`.`date_purchased` AS `date_purchased`,`orders`.`company_id` AS `company_id`,`orders`.`customer_id` AS `customer_id`,`orders`.`customer_name` AS `customer_name`,`orders`.`customer_company` AS `customer_company`,`orders`.`customer_address_id` AS `customer_address_id`,`orders`.`customer_street_address` AS `customer_street_address`,`orders`.`customer_country` AS `customer_country`,`orders`.`customer_city` AS `customer_city`,`orders`.`customer_area` AS `customer_area`,`orders`.`customer_district` AS `customer_district`,`orders`.`customer_estate` AS `customer_estate`,`orders`.`customer_building` AS `customer_building`,`orders`.`customer_room` AS `customer_room`,`orders`.`customer_telephone` AS `customer_telephone`,`orders`.`email` AS `email`,`orders`.`shipping_cost` AS `shipping_cost`,`orders`.`shipping_method` AS `shipping_method`,`orders`.`order_date_finished` AS `order_date_finished`,`orders`.`order_information` AS `order_information`,`orders`.`order_remark` AS `order_remark`,`orders`.`customer_remark` AS `customer_remark`,`orders`.`create_date` AS `create_date`,`orders`.`create_by_id` AS `create_by_id`,`orders`.`edit_date` AS `edit_date`,`orders`.`edit_by_id` AS `edit_by_id`,`orders`.`status` AS `status`,`orders`.`order_status` AS `order_status` from `orders` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_order_product`
--

/*!50001 DROP VIEW IF EXISTS `view_order_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_order_product` AS select `order_product`.`order_product_id` AS `order_product_id`,`order_product`.`order_id` AS `order_id`,`order_product`.`product_attribute_id` AS `product_attribute_id`,`order_product`.`currency_id` AS `currency_id`,`order_product`.`product_price` AS `product_price`,`order_product`.`product_quantity` AS `product_quantity`,`order_product`.`final_price` AS `final_price`,`order_product_description`.`language_id` AS `language_id`,`order_product_description`.`order_product_description_id` AS `order_product_description_id`,`order_product_description`.`product_id` AS `product_id`,`order_product_description`.`product_name` AS `product_name`,`order_product_description`.`product_attribute_name` AS `product_attribute_name`,`order_product_description`.`image` AS `image`,concat(`order_product_description`.`product_name`,' - ',`order_product_description`.`product_attribute_name`) AS `full_product_name`,`order_product_description`.`product_description` AS `product_description`,`order_product`.`create_date` AS `create_date`,`order_product`.`create_by_id` AS `create_by_id`,`order_product`.`edit_date` AS `edit_date`,`order_product`.`edit_by_id` AS `edit_by_id`,`order_product`.`status` AS `status` from (`order_product` left join `order_product_description` on((`order_product_description`.`order_product_id` = `order_product`.`order_product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_product`
--

/*!50001 DROP VIEW IF EXISTS `view_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_product` AS select `product`.`product_id` AS `product_id`,`product`.`company_id` AS `company_id`,`view_sub_category`.`category_id` AS `category_id`,`product`.`sub_category_id` AS `sub_category_id`,`product_description`.`language_id` AS `language_id`,`view_sub_category`.`sub_category_language_id` AS `sub_category_language_id`,`view_sub_category`.`category_name` AS `category_name`,`view_sub_category`.`sub_category_name` AS `sub_category_name`,`view_sub_category`.`image` AS `sub_category_image`,`view_sub_category`.`icon` AS `sub_category_icon`,`product_description`.`product_description_id` AS `product_description_id`,`product_description`.`name` AS `name`,`product_description`.`description` AS `description`,`product_description`.`url` AS `url`,`product_description`.`viewed` AS `viewed`,`product`.`model` AS `model`,`product`.`image` AS `image`,`product`.`original_price` AS `original_price`,`product`.`special_status` AS `special_status`,`product`.`special_price` AS `special_price`,`product`.`expiry_date` AS `expiry_date`,`product`.`weight` AS `weight`,`product`.`weight_unit` AS `weight_unit`,`product`.`ordered` AS `ordered`,`product`.`tax_class_id` AS `tax_class_id`,`product`.`manufacturer_id` AS `manufacturer_id`,`product`.`liked` AS `liked`,`product`.`is_feature` AS `is_feature`,`product`.`slug` AS `slug`,`product`.`create_date` AS `create_date`,`product`.`create_by_id` AS `create_by_id`,`product`.`edit_date` AS `edit_date`,`product`.`edit_by_id` AS `edit_by_id`,`product`.`status` AS `status` from ((`product` left join `product_description` on((`product`.`product_id` = `product_description`.`product_id`))) left join `view_sub_category` on((`view_sub_category`.`sub_category_id` = `product`.`sub_category_id`))) where (`product_description`.`language_id` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_product_attribute`
--

/*!50001 DROP VIEW IF EXISTS `view_product_attribute`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_product_attribute` AS select `product_attribute`.`product_attribute_id` AS `product_attribute_id`,`product_attribute_description`.`language_id` AS `language_id`,`product_attribute`.`product_id` AS `product_id`,`view_product`.`name` AS `product_name`,`product_attribute_description`.`name` AS `product_attribute_name`,concat(`view_product`.`name`,' - ',`product_attribute_description`.`name`) AS `full_product_name`,`view_product`.`description` AS `product_description`,`view_product`.`company_id` AS `company_id`,`product_attribute`.`image` AS `image`,`product_attribute`.`qty` AS `qty`,`product_attribute`.`low_limit` AS `low_limit`,`view_product`.`original_price` AS `original_price`,`product_attribute`.`price_prefix` AS `price_prefix`,`product_attribute`.`price` AS `price`,if((`product_attribute`.`price_prefix` = 'add'),(`view_product`.`original_price` + `product_attribute`.`price`),(`view_product`.`original_price` - `product_attribute`.`price`)) AS `final_price`,`product_attribute`.`sorting` AS `sorting`,`product_attribute`.`create_date` AS `create_date`,`product_attribute`.`create_by_id` AS `create_by_id`,`product_attribute`.`edit_date` AS `edit_date`,`product_attribute`.`edit_by_id` AS `edit_by_id`,`product_attribute`.`status` AS `status` from ((`product_attribute` left join `product_attribute_description` on((`product_attribute`.`product_attribute_id` = `product_attribute_description`.`product_attribute_id`))) left join `view_product` on((`view_product`.`product_id` = `product_attribute`.`product_id`))) where ((`product_attribute_description`.`language_id` is not null) and (`product_attribute_description`.`language_id` = `view_product`.`language_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_product_option`
--

/*!50001 DROP VIEW IF EXISTS `view_product_option`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_product_option` AS select `product_option`.`product_option_id` AS `product_option_id`,`product_option_description`.`name` AS `name`,`product_option_description`.`language_id` AS `language_id`,`product_option`.`create_date` AS `create_date`,`product_option`.`create_by_id` AS `create_by_id`,`product_option`.`edit_date` AS `edit_date`,`product_option`.`edit_by_id` AS `edit_by_id`,`product_option`.`status` AS `status` from (`product_option` left join `product_option_description` on((`product_option_description`.`product_option_id` = `product_option`.`product_option_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_product_option_value`
--

/*!50001 DROP VIEW IF EXISTS `view_product_option_value`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_product_option_value` AS select `product_option_value`.`product_option_value_id` AS `product_option_value_id`,`product_option_description`.`product_option_id` AS `product_option_id`,`product_option_description`.`language_id` AS `loption_anguage_id`,`product_option_description`.`name` AS `option_name`,`product_option_value_description`.`name` AS `value_name`,`product_option_value_description`.`language_id` AS `language_id`,`product_option_value`.`create_date` AS `create_date`,`product_option_value`.`create_by_id` AS `create_by_id`,`product_option_value`.`edit_date` AS `edit_date`,`product_option_value`.`edit_by_id` AS `edit_by_id`,`product_option_value`.`status` AS `status` from ((`product_option_value` left join `product_option_value_description` on((`product_option_value`.`product_option_value_id` = `product_option_value_description`.`product_option_value_id`))) left join `product_option_description` on((`product_option_description`.`product_option_id` = `product_option_value`.`product_option_id`))) where ((`product_option_description`.`language_id` = `product_option_value_description`.`language_id`) and (`product_option_value_description`.`language_id` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_sub_category`
--

/*!50001 DROP VIEW IF EXISTS `view_sub_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_sub_category` AS select `category_description`.`language_id` AS `category_language_id`,`sub_category`.`company_id` AS `company_id`,`sub_category_description`.`language_id` AS `language_id`,`sub_category_description`.`language_id` AS `sub_category_language_id`,`sub_category`.`sub_category_id` AS `sub_category_id`,`category_description`.`name` AS `category_name`,`sub_category`.`category_id` AS `category_id`,`sub_category_description`.`name` AS `sub_category_name`,`sub_category`.`image` AS `image`,`sub_category`.`icon` AS `icon`,`sub_category`.`slug` AS `slug`,`sub_category`.`sort_order` AS `sort_order`,`sub_category`.`create_date` AS `create_date`,`sub_category`.`create_by_id` AS `create_by_id`,`sub_category`.`edit_date` AS `edit_date`,`sub_category`.`edit_by_id` AS `edit_by_id`,`sub_category`.`status` AS `status` from ((`sub_category` left join `category_description` on((`category_description`.`category_id` = `sub_category`.`category_id`))) left join `sub_category_description` on((`sub_category_description`.`sub_category_id` = `sub_category`.`sub_category_id`))) where (`category_description`.`language_id` = `sub_category_description`.`language_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-20 18:03:55
