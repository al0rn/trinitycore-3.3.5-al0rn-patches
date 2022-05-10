-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: auth
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `salt` binary(32) NOT NULL,
  `verifier` binary(32) NOT NULL,
  `session_key_auth` binary(40) DEFAULT NULL,
  `session_key_bnet` varbinary(64) DEFAULT NULL,
  `totp_secret` varbinary(128) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_access`
--

DROP TABLE IF EXISTS `account_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_access` (
  `AccountID` int unsigned NOT NULL,
  `SecurityLevel` tinyint unsigned NOT NULL,
  `RealmID` int NOT NULL DEFAULT '-1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_access`
--

LOCK TABLES `account_access` WRITE;
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_banned`
--

DROP TABLE IF EXISTS `account_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_banned` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_banned`
--

LOCK TABLES `account_banned` WRITE;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_muted`
--

DROP TABLE IF EXISTS `account_muted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_muted` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int unsigned NOT NULL DEFAULT '0',
  `mutetime` int unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='mute List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_muted`
--

LOCK TABLES `account_muted` WRITE;
/*!40000 ALTER TABLE `account_muted` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_muted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autobroadcast`
--

DROP TABLE IF EXISTS `autobroadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autobroadcast` (
  `realmid` int NOT NULL DEFAULT '-1',
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autobroadcast`
--

LOCK TABLES `autobroadcast` WRITE;
/*!40000 ALTER TABLE `autobroadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobroadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_info`
--

DROP TABLE IF EXISTS `build_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `build_info` (
  `build` int NOT NULL,
  `majorVersion` int DEFAULT NULL,
  `minorVersion` int DEFAULT NULL,
  `bugfixVersion` int DEFAULT NULL,
  `hotfixVersion` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winAuthSeed` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `win64AuthSeed` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac64AuthSeed` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winChecksumSeed` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `macChecksumSeed` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_info`
--

LOCK TABLES `build_info` WRITE;
/*!40000 ALTER TABLE `build_info` DISABLE KEYS */;
INSERT INTO `build_info` VALUES
(5875,1,12,1,NULL,NULL,NULL,NULL,'95EDB27C7823B363CBDDAB56A392E7CB73FCCA20','8D173CC381961EEBABF336F5E6675B101BB513E5'),
(6005,1,12,2,NULL,NULL,NULL,NULL,NULL,NULL),
(6141,1,12,3,NULL,NULL,NULL,NULL,NULL,NULL),
(8606,2,4,3,NULL,NULL,NULL,NULL,'319AFAA3F2559682F9FF658BE01456255F456FB1','D8B0ECFE534BC1131E19BAD1D4C0E813EEE4994F'),
(9947,3,1,3,NULL,NULL,NULL,NULL,NULL,NULL),
(10505,3,2,2,'a',NULL,NULL,NULL,NULL,NULL),
(11159,3,3,0,'a',NULL,NULL,NULL,NULL,NULL),
(11403,3,3,2,NULL,NULL,NULL,NULL,NULL,NULL),
(11723,3,3,3,'a',NULL,NULL,NULL,NULL,NULL),
(12340,3,3,5,'a',NULL,NULL,NULL,'CDCBBD5188315E6B4D19449D492DBCFAF156A347','B706D13FF2F4018839729461E3F8A0E2B5FDC034'),
(13623,4,0,6,'a',NULL,NULL,NULL,NULL,NULL),
(13930,3,3,5,'a',NULL,NULL,NULL,NULL,NULL),
(14545,4,2,2,NULL,NULL,NULL,NULL,NULL,NULL),
(15595,4,3,4,NULL,NULL,NULL,NULL,NULL,NULL),
(19116,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(19243,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(19342,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(19702,6,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(19802,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),
(19831,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),
(19865,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),
(20182,6,2,0,'a',NULL,NULL,NULL,NULL,NULL),
(20201,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20216,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20253,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20338,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20444,6,2,2,NULL,NULL,NULL,NULL,NULL,NULL),
(20490,6,2,2,'a',NULL,NULL,NULL,NULL,NULL),
(20574,6,2,2,'a',NULL,NULL,NULL,NULL,NULL),
(20726,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),
(20779,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),
(20886,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),
(21355,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),
(21463,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),
(21742,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),
(22248,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22293,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22345,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22410,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22423,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22498,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22522,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22566,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22594,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22624,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22747,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22810,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22900,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22908,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22950,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22995,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22996,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23171,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23222,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23360,7,1,5,NULL,NULL,NULL,NULL,NULL,NULL),
(23420,7,1,5,NULL,NULL,NULL,NULL,NULL,NULL),
(23911,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23937,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(24015,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(24330,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24367,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24415,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24430,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24461,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24742,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(25549,7,3,2,NULL,'FE594FC35E7F9AFF86D99D8A364AB297','1252624ED8CBD6FAC7D33F5D67A535F3','66FC5E09B8706126795F140308C8C1D8',NULL,NULL),
(25996,7,3,5,NULL,'23C59C5963CBEF5B728D13A50878DFCB','C7FF932D6A2174A3D538CA7212136D2B','210B970149D6F56CAC9BADF2AAC91E8E',NULL,NULL),
(26124,7,3,5,NULL,'F8C05AE372DECA1D6C81DA7A8D1C5C39','46DF06D0147BA67BA49AF553435E093F','C9CA997AB8EDE1C65465CB2920869C4E',NULL,NULL),
(26365,7,3,5,NULL,'2AAC82C80E829E2CA902D70CFA1A833A','59A53F307288454B419B13E694DF503C','DBE7F860276D6B400AAA86B35D51A417',NULL,NULL),
(26654,7,3,5,NULL,'FAC2D693E702B9EC9F750F17245696D8','A752640E8B99FE5B57C1320BC492895A','9234C1BD5E9687ADBD19F764F2E0E811',NULL,NULL),
(26822,7,3,5,NULL,'283E8D77ECF7060BE6347BE4EB99C7C7','2B05F6D746C0C6CC7EF79450B309E595','91003668C245D14ECD8DF094E065E06B',NULL,NULL),
(26899,7,3,5,NULL,'F462CD2FE4EA3EADF875308FDBB18C99','3551EF0028B51E92170559BD25644B03','8368EFC2021329110A16339D298200D4',NULL,NULL),
(26972,7,3,5,NULL,'797ECC19662DCBD5090A4481173F1D26','6E212DEF6A0124A3D9AD07F5E322F7AE','341CFEFE3D72ACA9A4407DC535DED66A',NULL,NULL),
(28153,8,0,1,NULL,NULL,'DD626517CC6D31932B479934CCDC0ABF',NULL,NULL,NULL),
(30706,8,1,5,NULL,NULL,'BB6D9866FE4A19A568015198783003FC',NULL,NULL,NULL),
(30993,8,2,0,NULL,NULL,'2BAD61655ABC2FC3D04893B536403A91',NULL,NULL,NULL),
(31229,8,2,0,NULL,NULL,'8A46F23670309F2AAE85C9A47276382B',NULL,NULL,NULL),
(31429,8,2,0,NULL,NULL,'7795A507AF9DC3525EFF724FEE17E70C',NULL,NULL,NULL),
(31478,8,2,0,NULL,NULL,'7973A8D54BDB8B798D9297B096E771EF',NULL,NULL,NULL),
(32305,8,2,5,NULL,NULL,'21F5A6FC7AD89FBF411FDA8B8738186A',NULL,NULL,NULL),
(32494,8,2,5,NULL,NULL,'58984ACE04919401835C61309A848F8A',NULL,NULL,NULL),
(32580,8,2,5,NULL,NULL,'87C2FAA0D7931BF016299025C0DDCA14',NULL,NULL,NULL),
(32638,8,2,5,NULL,NULL,'5D07ECE7D4A867DDDE615DAD22B76D4E',NULL,NULL,NULL),
(32722,8,2,5,NULL,NULL,'1A09BE1D38A122586B4931BECCEAD4AA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `build_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int unsigned NOT NULL,
  `unbandate` int unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_banned`
--

LOCK TABLES `ip_banned` WRITE;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `time` int unsigned NOT NULL,
  `realm` int unsigned NOT NULL,
  `type` varchar(250) NOT NULL,
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1 COLLATE latin1_swedish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_ip_actions`
--

DROP TABLE IF EXISTS `logs_ip_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_ip_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` bigint unsigned NOT NULL COMMENT 'Character Guid',
  `realm_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Realm ID',
  `type` tinyint unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text COMMENT 'Notes inserted by system',
  `unixtime` int unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Used to log ips of individual actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_ip_actions`
--

LOCK TABLES `logs_ip_actions` WRITE;
/*!40000 ALTER TABLE `logs_ip_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_ip_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_account_permissions`
--

DROP TABLE IF EXISTS `rbac_account_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_account_permissions` (
  `accountId` int unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Account-Permission relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_account_permissions`
--

LOCK TABLES `rbac_account_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_account_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbac_account_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_default_permissions`
--

DROP TABLE IF EXISTS `rbac_default_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_default_permissions` (
  `secId` int unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int unsigned NOT NULL COMMENT 'permission id',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Default permission to assign to different account security levels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_default_permissions`
--

LOCK TABLES `rbac_default_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_default_permissions` DISABLE KEYS */;
INSERT INTO `rbac_default_permissions` VALUES
(3,192,-1),
(2,193,-1),
(1,194,-1),
(0,195,-1);
/*!40000 ALTER TABLE `rbac_default_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_linked_permissions`
--

DROP TABLE IF EXISTS `rbac_linked_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_linked_permissions` (
  `id` int unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Permission - Linked Permission relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_linked_permissions`
--

LOCK TABLES `rbac_linked_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_linked_permissions` DISABLE KEYS */;
INSERT INTO `rbac_linked_permissions` VALUES
(192,21),
(192,42),
(192,43),
(192,193),
(192,196),
(192,778),
(192,779),
(192,780),
(192,781),
(192,782),
(192,783),
(192,784),
(192,785),
(192,786),
(192,787),
(192,788),
(192,789),
(192,790),
(192,791),
(192,792),
(192,793),
(192,794),
(192,795),
(192,796),
(192,835),
(193,48),
(193,194),
(193,197),
(194,1),
(194,2),
(194,9),
(194,11),
(194,13),
(194,14),
(194,15),
(194,16),
(194,17),
(194,18),
(194,19),
(194,20),
(194,22),
(194,23),
(194,25),
(194,26),
(194,27),
(194,28),
(194,29),
(194,30),
(194,31),
(194,32),
(194,33),
(194,34),
(194,35),
(194,36),
(194,37),
(194,38),
(194,39),
(194,40),
(194,41),
(194,44),
(194,46),
(194,47),
(194,51),
(194,195),
(194,198),
(194,632),
(194,798),
(195,3),
(195,4),
(195,5),
(195,6),
(195,24),
(195,49),
(195,199),
(196,7),
(196,202),
(196,203),
(196,204),
(196,205),
(196,206),
(196,226),
(196,227),
(196,230),
(196,231),
(196,233),
(196,234),
(196,235),
(196,238),
(196,239),
(196,240),
(196,241),
(196,242),
(196,243),
(196,244),
(196,245),
(196,246),
(196,247),
(196,248),
(196,249),
(196,250),
(196,251),
(196,252),
(196,253),
(196,254),
(196,255),
(196,256),
(196,257),
(196,258),
(196,259),
(196,260),
(196,261),
(196,262),
(196,264),
(196,265),
(196,266),
(196,267),
(196,268),
(196,269),
(196,270),
(196,271),
(196,272),
(196,279),
(196,280),
(196,283),
(196,287),
(196,288),
(196,289),
(196,290),
(196,291),
(196,292),
(196,293),
(196,294),
(196,295),
(196,296),
(196,297),
(196,298),
(196,299),
(196,302),
(196,303),
(196,304),
(196,305),
(196,306),
(196,307),
(196,308),
(196,309),
(196,310),
(196,313),
(196,314),
(196,319),
(196,320),
(196,321),
(196,322),
(196,323),
(196,324),
(196,325),
(196,326),
(196,327),
(196,328),
(196,329),
(196,330),
(196,331),
(196,332),
(196,333),
(196,334),
(196,335),
(196,336),
(196,337),
(196,338),
(196,339),
(196,340),
(196,341),
(196,342),
(196,343),
(196,344),
(196,345),
(196,346),
(196,347),
(196,348),
(196,349),
(196,350),
(196,351),
(196,352),
(196,353),
(196,354),
(196,355),
(196,356),
(196,357),
(196,358),
(196,359),
(196,360),
(196,361),
(196,362),
(196,363),
(196,364),
(196,365),
(196,366),
(196,373),
(196,375),
(196,400),
(196,401),
(196,402),
(196,403),
(196,404),
(196,405),
(196,406),
(196,407),
(196,417),
(196,418),
(196,419),
(196,420),
(196,421),
(196,422),
(196,423),
(196,424),
(196,425),
(196,426),
(196,427),
(196,428),
(196,429),
(196,434),
(196,435),
(196,436),
(196,437),
(196,438),
(196,439),
(196,440),
(196,441),
(196,442),
(196,443),
(196,444),
(196,445),
(196,446),
(196,447),
(196,448),
(196,449),
(196,450),
(196,451),
(196,452),
(196,453),
(196,454),
(196,455),
(196,456),
(196,457),
(196,458),
(196,459),
(196,461),
(196,463),
(196,464),
(196,465),
(196,472),
(196,474),
(196,475),
(196,476),
(196,477),
(196,478),
(196,488),
(196,489),
(196,491),
(196,492),
(196,493),
(196,495),
(196,497),
(196,498),
(196,499),
(196,500),
(196,502),
(196,503),
(196,505),
(196,508),
(196,511),
(196,513),
(196,514),
(196,516),
(196,519),
(196,522),
(196,523),
(196,526),
(196,527),
(196,529),
(196,530),
(196,533),
(196,535),
(196,536),
(196,537),
(196,538),
(196,539),
(196,540),
(196,541),
(196,556),
(196,581),
(196,582),
(196,592),
(196,593),
(196,596),
(196,602),
(196,603),
(196,604),
(196,605),
(196,606),
(196,607),
(196,608),
(196,609),
(196,610),
(196,611),
(196,612),
(196,613),
(196,614),
(196,615),
(196,616),
(196,617),
(196,618),
(196,619),
(196,620),
(196,621),
(196,622),
(196,623),
(196,624),
(196,625),
(196,626),
(196,627),
(196,628),
(196,629),
(196,630),
(196,631),
(196,633),
(196,634),
(196,635),
(196,636),
(196,637),
(196,638),
(196,639),
(196,640),
(196,641),
(196,642),
(196,643),
(196,644),
(196,645),
(196,646),
(196,647),
(196,648),
(196,649),
(196,650),
(196,651),
(196,652),
(196,653),
(196,654),
(196,655),
(196,656),
(196,657),
(196,658),
(196,659),
(196,660),
(196,661),
(196,662),
(196,663),
(196,664),
(196,665),
(196,666),
(196,667),
(196,668),
(196,669),
(196,670),
(196,671),
(196,672),
(196,673),
(196,674),
(196,675),
(196,676),
(196,677),
(196,678),
(196,679),
(196,680),
(196,681),
(196,682),
(196,683),
(196,684),
(196,685),
(196,686),
(196,687),
(196,688),
(196,689),
(196,690),
(196,691),
(196,692),
(196,693),
(196,694),
(196,695),
(196,696),
(196,697),
(196,698),
(196,699),
(196,700),
(196,701),
(196,702),
(196,703),
(196,704),
(196,706),
(196,707),
(196,708),
(196,709),
(196,710),
(196,711),
(196,712),
(196,713),
(196,714),
(196,715),
(196,716),
(196,717),
(196,718),
(196,719),
(196,721),
(196,722),
(196,723),
(196,724),
(196,725),
(196,726),
(196,727),
(196,728),
(196,729),
(196,730),
(196,733),
(196,734),
(196,735),
(196,736),
(196,738),
(196,739),
(196,748),
(196,753),
(196,757),
(196,773),
(196,777),
(196,836),
(196,837),
(196,838),
(196,839),
(196,840),
(196,841),
(196,843),
(196,852),
(196,866),
(196,867),
(196,870),
(196,871),
(196,872),
(196,873),
(196,875),
(196,876),
(196,877),
(196,878),
(196,879),
(196,881),
(197,232),
(197,236),
(197,237),
(197,273),
(197,274),
(197,275),
(197,276),
(197,277),
(197,284),
(197,285),
(197,286),
(197,301),
(197,311),
(197,387),
(197,388),
(197,389),
(197,390),
(197,391),
(197,392),
(197,393),
(197,394),
(197,395),
(197,396),
(197,397),
(197,398),
(197,399),
(197,473),
(197,479),
(197,480),
(197,481),
(197,482),
(197,485),
(197,486),
(197,487),
(197,494),
(197,501),
(197,506),
(197,509),
(197,510),
(197,517),
(197,518),
(197,521),
(197,542),
(197,543),
(197,550),
(197,558),
(197,568),
(197,571),
(197,572),
(197,573),
(197,574),
(197,575),
(197,576),
(197,577),
(197,578),
(197,579),
(197,580),
(197,583),
(197,584),
(197,585),
(197,586),
(197,587),
(197,588),
(197,589),
(197,590),
(197,591),
(197,594),
(197,595),
(197,601),
(197,743),
(197,750),
(197,758),
(197,761),
(197,762),
(197,763),
(197,764),
(197,765),
(197,766),
(197,767),
(197,768),
(197,769),
(197,770),
(197,771),
(197,772),
(197,774),
(197,856),
(197,857),
(197,858),
(197,859),
(197,860),
(197,861),
(197,862),
(197,863),
(197,864),
(197,865),
(198,218),
(198,300),
(198,312),
(198,315),
(198,316),
(198,317),
(198,318),
(198,367),
(198,368),
(198,369),
(198,370),
(198,371),
(198,372),
(198,374),
(198,376),
(198,377),
(198,408),
(198,409),
(198,410),
(198,411),
(198,412),
(198,413),
(198,414),
(198,415),
(198,416),
(198,430),
(198,431),
(198,432),
(198,433),
(198,462),
(198,466),
(198,467),
(198,468),
(198,469),
(198,470),
(198,471),
(198,483),
(198,484),
(198,490),
(198,504),
(198,512),
(198,515),
(198,520),
(198,524),
(198,528),
(198,531),
(198,532),
(198,544),
(198,545),
(198,546),
(198,547),
(198,548),
(198,549),
(198,551),
(198,552),
(198,553),
(198,554),
(198,555),
(198,557),
(198,559),
(198,560),
(198,561),
(198,562),
(198,563),
(198,564),
(198,565),
(198,566),
(198,567),
(198,569),
(198,570),
(198,597),
(198,598),
(198,599),
(198,600),
(198,737),
(198,740),
(198,741),
(198,742),
(198,744),
(198,745),
(198,746),
(198,747),
(198,749),
(198,751),
(198,752),
(198,754),
(198,755),
(198,756),
(198,759),
(198,760),
(198,855),
(199,217),
(199,221),
(199,222),
(199,223),
(199,225),
(199,263),
(199,378),
(199,379),
(199,380),
(199,496),
(199,507),
(199,525),
(199,534),
(199,797);
/*!40000 ALTER TABLE `rbac_linked_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permissions`
--

DROP TABLE IF EXISTS `rbac_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_permissions` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Permission List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permissions`
--

LOCK TABLES `rbac_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_permissions` DISABLE KEYS */;
INSERT INTO `rbac_permissions` VALUES
(1,'Instant logout'),
(2,'Skip Queue'),
(3,'Join Normal Battleground'),
(4,'Join Random Battleground'),
(5,'Join Arenas'),
(6,'Join Dungeon Finder'),
(7,'Skip idle connection check'),
(8,'Cannot earn achievements'),
(9,'Cannot earn realm first achievements'),
(11,'Log GM trades'),
(13,'Skip Instance required bosses check'),
(14,'Skip character creation team mask check'),
(15,'Skip character creation class mask check'),
(16,'Skip character creation race mask check'),
(17,'Skip character creation reserved name check'),
(18,'Skip character creation death knight min level check'),
(19,'Skip needed requirements to use channel check'),
(20,'Skip disable map check'),
(21,'Skip reset talents when used more than allowed check'),
(22,'Skip spam chat check'),
(23,'Skip over-speed ping check'),
(24,'Two side faction characters on the same account'),
(25,'Allow say chat between factions'),
(26,'Allow channel chat between factions'),
(27,'Two side mail interaction'),
(28,'See two side who list'),
(29,'Add friends of other faction'),
(30,'Save character without delay with .save command'),
(31,'Use params with .unstuck command'),
(32,'Can be assigned tickets with .assign ticket command'),
(33,'Notify if a command was not found'),
(34,'Check if should appear in list using .gm ingame command'),
(35,'See all security levels with who command'),
(36,'Filter whispers'),
(37,'Use staff badge in chat'),
(38,'Resurrect with full Health Points'),
(39,'Restore saved gm setting states'),
(40,'Allows to add a gm to friend list'),
(41,'Use Config option START_GM_LEVEL to assign new character level'),
(42,'Allows to use CMSG_WORLD_TELEPORT opcode'),
(43,'Allows to use CMSG_WHOIS opcode'),
(44,'Receive global GM messages/texts'),
(45,'Join channels without announce'),
(46,'Change channel settings without being channel moderator'),
(47,'Enables lower security than target check'),
(48,'Enable IP, Last Login and EMail output in pinfo'),
(49,'Forces to enter the email for confirmation on password change'),
(50,'Allow user to check his own email with .account'),
(51,'Allow trading between factions'),
(192,'Role: Sec Level Administrator'),
(193,'Role: Sec Level Gamemaster'),
(194,'Role: Sec Level Moderator'),
(195,'Role: Sec Level Player'),
(196,'Role: Administrator Commands'),
(197,'Role: Gamemaster Commands'),
(198,'Role: Moderator Commands'),
(199,'Role: Player Commands'),
(200,'Command: rbac'),
(201,'Command: rbac account'),
(202,'Command: rbac account list'),
(203,'Command: rbac account grant'),
(204,'Command: rbac account deny'),
(205,'Command: rbac account revoke'),
(206,'Command: rbac list'),
(217,'Command: account'),
(218,'Command: account addon'),
(219,'Command: account create'),
(220,'Command: account delete'),
(221,'Command: account lock'),
(222,'Command: account lock country'),
(223,'Command: account lock ip'),
(224,'Command: account onlinelist'),
(225,'Command: account password'),
(226,'Command: account set'),
(227,'Command: account set addon'),
(228,'Command: account set gmlevel'),
(229,'Command: account set password'),
(230,'Command: achievement'),
(231,'Command: achievement add'),
(232,'Command: arena'),
(233,'Command: arena captain'),
(234,'Command: arena create'),
(235,'Command: arena disband'),
(236,'Command: arena info'),
(237,'Command: arena lookup'),
(238,'Command: arena rename'),
(239,'Command: ban'),
(240,'Command: ban account'),
(241,'Command: ban character'),
(242,'Command: ban ip'),
(243,'Command: ban playeraccount'),
(244,'Command: baninfo'),
(245,'Command: baninfo account'),
(246,'Command: baninfo character'),
(247,'Command: baninfo ip'),
(248,'Command: banlist'),
(249,'Command: banlist account'),
(250,'Command: banlist character'),
(251,'Command: banlist ip'),
(252,'Command: unban'),
(253,'Command: unban account'),
(254,'Command: unban character'),
(255,'Command: unban ip'),
(256,'Command: unban playeraccount'),
(257,'Command: bf'),
(258,'Command: bf start'),
(259,'Command: bf stop'),
(260,'Command: bf switch'),
(261,'Command: bf timer'),
(262,'Command: bf enable'),
(263,'Command: account email'),
(264,'Command: account set sec'),
(265,'Command: account set sec email'),
(266,'Command: account set sec regmail'),
(267,'Command: cast'),
(268,'Command: cast back'),
(269,'Command: cast dist'),
(270,'Command: cast self'),
(271,'Command: cast target'),
(272,'Command: cast dest'),
(273,'Command: character'),
(274,'Command: character customize'),
(275,'Command: character changefaction'),
(276,'Command: character changerace'),
(277,'Command: character deleted'),
(279,'Command: character deleted list'),
(280,'Command: character deleted restore'),
(283,'Command: character level'),
(284,'Command: character rename'),
(285,'Command: character reputation'),
(286,'Command: character titles'),
(287,'Command: levelup'),
(288,'Command: pdump'),
(289,'Command: pdump load'),
(290,'Command: pdump write'),
(291,'Command: cheat'),
(292,'Command: cheat casttime'),
(293,'Command: cheat cooldown'),
(294,'Command: cheat explore'),
(295,'Command: cheat god'),
(296,'Command: cheat power'),
(297,'Command: cheat status'),
(298,'Command: cheat taxi'),
(299,'Command: cheat waterwalk'),
(300,'Command: debug'),
(301,'Command: debug anim'),
(302,'Command: debug areatriggers'),
(303,'Command: debug arena'),
(304,'Command: debug bg'),
(305,'Command: debug entervehicle'),
(306,'Command: debug getitemstate'),
(307,'Command: debug getitemvalue'),
(308,'Command: debug getvalue'),
(309,'Command: debug combat'),
(310,'Command: debug itemexpire'),
(311,'Command: debug lootrecipient'),
(312,'Command: debug los'),
(313,'Command: debug mod32value'),
(314,'Command: debug moveflags'),
(315,'Command: debug play'),
(316,'Command: debug play cinematics'),
(317,'Command: debug play movie'),
(318,'Command: debug play sound'),
(319,'Command: debug send'),
(320,'Command: debug send buyerror'),
(321,'Command: debug send channelnotify'),
(322,'Command: debug send chatmessage'),
(323,'Command: debug send equiperror'),
(324,'Command: debug send largepacket'),
(325,'Command: debug send opcode'),
(326,'Command: debug send qinvalidmsg'),
(327,'Command: debug send qpartymsg'),
(328,'Command: debug send sellerror'),
(329,'Command: debug send setphaseshift'),
(330,'Command: debug send spellfail'),
(331,'Command: debug setaurastate'),
(332,'Command: debug setbit'),
(333,'Command: debug setitemvalue'),
(334,'Command: debug setvalue'),
(335,'Command: debug setvid'),
(336,'Command: debug spawnvehicle'),
(337,'Command: debug threat'),
(338,'Command: debug update'),
(339,'Command: debug worldstate'),
(340,'Command: wpgps'),
(341,'Command: deserter'),
(342,'Command: deserter bg'),
(343,'Command: deserter bg add'),
(344,'Command: deserter bg remove'),
(345,'Command: deserter instance'),
(346,'Command: deserter instance add'),
(347,'Command: deserter instance remove'),
(348,'Command: disable'),
(349,'Command: disable add'),
(350,'Command: disable add achievement_criteria'),
(351,'Command: disable add battleground'),
(352,'Command: disable add map'),
(353,'Command: disable add mmap'),
(354,'Command: disable add outdoorpvp'),
(355,'Command: disable add quest'),
(356,'Command: disable add spell'),
(357,'Command: disable add vmap'),
(358,'Command: disable remove'),
(359,'Command: disable remove achievement_criteria'),
(360,'Command: disable remove battleground'),
(361,'Command: disable remove map'),
(362,'Command: disable remove mmap'),
(363,'Command: disable remove outdoorpvp'),
(364,'Command: disable remove quest'),
(365,'Command: disable remove spell'),
(366,'Command: disable remove vmap'),
(367,'Command: event'),
(368,'Command: event activelist'),
(369,'Command: event start'),
(370,'Command: event stop'),
(371,'Command: gm'),
(372,'Command: gm chat'),
(373,'Command: gm fly'),
(374,'Command: gm ingame'),
(375,'Command: gm list'),
(376,'Command: gm visible'),
(377,'Command: go'),
(378,'Command: account 2fa'),
(379,'Command: account 2fa setup'),
(380,'Command: account 2fa remove'),
(381,'Command: account set 2fa'),
(387,'Command: gobject'),
(388,'Command: gobject activate'),
(389,'Command: gobject add'),
(390,'Command: gobject add temp'),
(391,'Command: gobject delete'),
(392,'Command: gobject info'),
(393,'Command: gobject move'),
(394,'Command: gobject near'),
(395,'Command: gobject set'),
(396,'Command: gobject set phase'),
(397,'Command: gobject set state'),
(398,'Command: gobject target'),
(399,'Command: gobject turn'),
(400,'Command: debug transport'),
(401,'Command: guild'),
(402,'Command: guild create'),
(403,'Command: guild delete'),
(404,'Command: guild invite'),
(405,'Command: guild uninvite'),
(406,'Command: guild rank'),
(407,'Command: guild rename'),
(408,'Command: honor'),
(409,'Command: honor add'),
(410,'Command: honor add kill'),
(411,'Command: honor update'),
(412,'Command: instance'),
(413,'Command: instance listbinds'),
(414,'Command: instance unbind'),
(415,'Command: instance stats'),
(416,'Command: instance savedata'),
(417,'Command: learn'),
(418,'Command: learn all'),
(419,'Command: learn all my'),
(420,'Command: learn all my class'),
(421,'Command: learn all my pettalents'),
(422,'Command: learn all my spells'),
(423,'Command: learn all my talents'),
(424,'Command: learn all gm'),
(425,'Command: learn all crafts'),
(426,'Command: learn all default'),
(427,'Command: learn all lang'),
(428,'Command: learn all recipes'),
(429,'Command: unlearn'),
(430,'Command: lfg'),
(431,'Command: lfg player'),
(432,'Command: lfg group'),
(433,'Command: lfg queue'),
(434,'Command: lfg clean'),
(435,'Command: lfg options'),
(436,'Command: list'),
(437,'Command: list creature'),
(438,'Command: list item'),
(439,'Command: list object'),
(440,'Command: list auras'),
(441,'Command: list mail'),
(442,'Command: lookup'),
(443,'Command: lookup area'),
(444,'Command: lookup creature'),
(445,'Command: lookup event'),
(446,'Command: lookup faction'),
(447,'Command: lookup item'),
(448,'Command: lookup itemset'),
(449,'Command: lookup object'),
(450,'Command: lookup quest'),
(451,'Command: lookup player'),
(452,'Command: lookup player ip'),
(453,'Command: lookup player account'),
(454,'Command: lookup player email'),
(455,'Command: lookup skill'),
(456,'Command: lookup spell'),
(457,'Command: lookup spell id'),
(458,'Command: lookup taxinode'),
(459,'Command: lookup tele'),
(460,'Command: lookup title'),
(461,'Command: lookup map'),
(462,'Command: announce'),
(463,'Command: channel'),
(464,'Command: channel set'),
(465,'Command: channel set ownership'),
(466,'Command: gmannounce'),
(467,'Command: gmnameannounce'),
(468,'Command: gmnotify'),
(469,'Command: nameannounce'),
(470,'Command: notify'),
(471,'Command: whispers'),
(472,'Command: group'),
(473,'Command: group leader'),
(474,'Command: group disband'),
(475,'Command: group remove'),
(476,'Command: group join'),
(477,'Command: group list'),
(478,'Command: group summon'),
(479,'Command: pet'),
(480,'Command: pet create'),
(481,'Command: pet learn'),
(482,'Command: pet unlearn'),
(483,'Command: send'),
(484,'Command: send items'),
(485,'Command: send mail'),
(486,'Command: send message'),
(487,'Command: send money'),
(488,'Command: additem'),
(489,'Command: additemset'),
(490,'Command: appear'),
(491,'Command: aura'),
(492,'Command: bank'),
(493,'Command: bindsight'),
(494,'Command: combatstop'),
(495,'Command: cometome'),
(496,'Command: commands'),
(497,'Command: cooldown'),
(498,'Command: damage'),
(499,'Command: dev'),
(500,'Command: die'),
(501,'Command: dismount'),
(502,'Command: distance'),
(503,'Command: flusharenapoints'),
(504,'Command: freeze'),
(505,'Command: gps'),
(506,'Command: guid'),
(507,'Command: help'),
(508,'Command: hidearea'),
(509,'Command: itemmove'),
(510,'Command: kick'),
(511,'Command: linkgrave'),
(512,'Command: listfreeze'),
(513,'Command: maxskill'),
(514,'Command: movegens'),
(515,'Command: mute'),
(516,'Command: neargrave'),
(517,'Command: pinfo'),
(518,'Command: playall'),
(519,'Command: possess'),
(520,'Command: recall'),
(521,'Command: repairitems'),
(522,'Command: respawn'),
(523,'Command: revive'),
(524,'Command: saveall'),
(525,'Command: save'),
(526,'Command: setskill'),
(527,'Command: showarea'),
(528,'Command: summon'),
(529,'Command: unaura'),
(530,'Command: unbindsight'),
(531,'Command: unfreeze'),
(532,'Command: unmute'),
(533,'Command: unpossess'),
(534,'Command: unstuck'),
(535,'Command: wchange'),
(536,'Command: mmap'),
(537,'Command: mmap loadedtiles'),
(538,'Command: mmap loc'),
(539,'Command: mmap path'),
(540,'Command: mmap stats'),
(541,'Command: mmap testarea'),
(542,'Command: morph'),
(543,'Command: demorph'),
(544,'Command: modify'),
(545,'Command: modify arenapoints'),
(546,'Command: modify bit'),
(547,'Command: modify drunk'),
(548,'Command: modify energy'),
(549,'Command: modify faction'),
(550,'Command: modify gender'),
(551,'Command: modify honor'),
(552,'Command: modify hp'),
(553,'Command: modify mana'),
(554,'Command: modify money'),
(555,'Command: modify mount'),
(556,'Command: modify phase'),
(557,'Command: modify rage'),
(558,'Command: modify reputation'),
(559,'Command: modify runicpower'),
(560,'Command: modify scale'),
(561,'Command: modify speed'),
(562,'Command: modify speed all'),
(563,'Command: modify speed backwalk'),
(564,'Command: modify speed fly'),
(565,'Command: modify speed walk'),
(566,'Command: modify speed swim'),
(567,'Command: modify spell'),
(568,'Command: modify standstate'),
(569,'Command: modify talentpoints'),
(570,'Command: npc'),
(571,'Command: npc add'),
(572,'Command: npc add formation'),
(573,'Command: npc add item'),
(574,'Command: npc add move'),
(575,'Command: npc add temp'),
(576,'Command: npc add delete'),
(577,'Command: npc add delete item'),
(578,'Command: npc add follow'),
(579,'Command: npc add follow stop'),
(580,'Command: npc set'),
(581,'Command: npc set allowmove'),
(582,'Command: npc set entry'),
(583,'Command: npc set factionid'),
(584,'Command: npc set flag'),
(585,'Command: npc set level'),
(586,'Command: npc set link'),
(587,'Command: npc set model'),
(588,'Command: npc set movetype'),
(589,'Command: npc set phase'),
(590,'Command: npc set spawndist'),
(591,'Command: npc set spawntime'),
(592,'Command: npc set data'),
(593,'Command: npc info'),
(594,'Command: npc near'),
(595,'Command: npc move'),
(596,'Command: npc playemote'),
(597,'Command: npc say'),
(598,'Command: npc textemote'),
(599,'Command: npc whisper'),
(600,'Command: npc yell'),
(601,'Command: npc tame'),
(602,'Command: quest'),
(603,'Command: quest add'),
(604,'Command: quest complete'),
(605,'Command: quest remove'),
(606,'Command: quest reward'),
(607,'Command: reload'),
(608,'Command: reload access_requirement'),
(609,'Command: reload achievement_criteria_data'),
(610,'Command: reload achievement_reward'),
(611,'Command: reload all'),
(612,'Command: reload all achievement'),
(613,'Command: reload all area'),
(614,'Command: broadcast_text'),
(615,'Command: reload all gossips'),
(616,'Command: reload all item'),
(617,'Command: reload all locales'),
(618,'Command: reload all loot'),
(619,'Command: reload all npc'),
(620,'Command: reload all quest'),
(621,'Command: reload all scripts'),
(622,'Command: reload all spell'),
(623,'Command: reload areatrigger_involvedrelation'),
(624,'Command: reload areatrigger_tavern'),
(625,'Command: reload areatrigger_teleport'),
(626,'Command: reload auctions'),
(627,'Command: reload autobroadcast'),
(628,'Command: reload command'),
(629,'Command: reload conditions'),
(630,'Command: reload config'),
(631,'Command: reload battleground_template'),
(632,'Command: .mutehistory'),
(633,'Command: reload creature_linked_respawn'),
(634,'Command: reload creature_loot_template'),
(635,'Command: reload creature_onkill_reputation'),
(636,'Command: reload creature_questender'),
(637,'Command: reload creature_queststarter'),
(638,'Command: reload creature_summon_groups'),
(639,'Command: reload creature_template'),
(640,'Command: reload creature_text'),
(641,'Command: reload disables'),
(642,'Command: reload disenchant_loot_template'),
(643,'Command: reload event_scripts'),
(644,'Command: reload fishing_loot_template'),
(645,'Command: reload game_graveyard_zone'),
(646,'Command: reload game_tele'),
(647,'Command: reload gameobject_questender'),
(648,'Command: reload gameobject_loot_template'),
(649,'Command: reload gameobject_queststarter'),
(650,'Command: reload gm_tickets'),
(651,'Command: reload gossip_menu'),
(652,'Command: reload gossip_menu_option'),
(653,'Command: reload item_enchantment_template'),
(654,'Command: reload item_loot_template'),
(655,'Command: reload item_set_names'),
(656,'Command: reload lfg_dungeon_rewards'),
(657,'Command: reload locales_achievement_reward'),
(658,'Command: reload locales_creature'),
(659,'Command: reload locales_creature_text'),
(660,'Command: reload locales_gameobject'),
(661,'Command: reload locales_gossip_menu_option'),
(662,'Command: reload locales_item'),
(663,'Command: reload locales_item_set_name'),
(664,'Command: reload locales_npc_text'),
(665,'Command: reload locales_page_text'),
(666,'Command: reload locales_points_of_interest'),
(667,'Command: reload locales_quest'),
(668,'Command: reload mail_level_reward'),
(669,'Command: reload mail_loot_template'),
(670,'Command: reload milling_loot_template'),
(671,'Command: reload npc_spellclick_spells'),
(672,'Command: reload trainer'),
(673,'Command: reload npc_vendor'),
(674,'Command: reload page_text'),
(675,'Command: reload pickpocketing_loot_template'),
(676,'Command: reload points_of_interest'),
(677,'Command: reload prospecting_loot_template'),
(678,'Command: reload quest_poi'),
(679,'Command: reload quest_template'),
(680,'Command: reload rbac'),
(681,'Command: reload reference_loot_template'),
(682,'Command: reload reserved_name'),
(683,'Command: reload reputation_reward_rate'),
(684,'Command: reload reputation_spillover_template'),
(685,'Command: reload skill_discovery_template'),
(686,'Command: reload skill_extra_item_template'),
(687,'Command: reload skill_fishing_base_level'),
(688,'Command: reload skinning_loot_template'),
(689,'Command: reload smart_scripts'),
(690,'Command: reload spell_required'),
(691,'Command: reload spell_area'),
(692,'Command: reload spell_bonus_data'),
(693,'Command: reload spell_group'),
(694,'Command: reload spell_learn_spell'),
(695,'Command: reload spell_loot_template'),
(696,'Command: reload spell_linked_spell'),
(697,'Command: reload spell_pet_auras'),
(698,'Command: character changeaccount'),
(699,'Command: reload spell_proc'),
(700,'Command: reload spell_scripts'),
(701,'Command: reload spell_target_position'),
(702,'Command: reload spell_threats'),
(703,'Command: reload spell_group_stack_rules'),
(704,'Command: reload trinity_string'),
(706,'Command: reload waypoint_scripts'),
(707,'Command: reload waypoint_data'),
(708,'Command: reload vehicle_accessory'),
(709,'Command: reload vehicle_template_accessory'),
(710,'Command: reset'),
(711,'Command: reset achievements'),
(712,'Command: reset honor'),
(713,'Command: reset level'),
(714,'Command: reset spells'),
(715,'Command: reset stats'),
(716,'Command: reset talents'),
(717,'Command: reset all'),
(718,'Command: server'),
(719,'Command: server corpses'),
(720,'Command: server exit'),
(721,'Command: server idlerestart'),
(722,'Command: server idlerestart cancel'),
(723,'Command: server idleshutdown'),
(724,'Command: server idleshutdown cancel'),
(725,'Command: server info'),
(726,'Command: server plimit'),
(727,'Command: server restart'),
(728,'Command: server restart cancel'),
(729,'Command: server set'),
(730,'Command: server set closed'),
(731,'Command: server set difftime'),
(732,'Command: server set loglevel'),
(733,'Command: server set motd'),
(734,'Command: server shutdown'),
(735,'Command: server shutdown cancel'),
(736,'Command: server motd'),
(737,'Command: tele'),
(738,'Command: tele add'),
(739,'Command: tele del'),
(740,'Command: tele name'),
(741,'Command: tele group'),
(742,'Command: ticket'),
(743,'Command: ticket assign'),
(744,'Command: ticket close'),
(745,'Command: ticket closedlist'),
(746,'Command: ticket comment'),
(747,'Command: ticket complete'),
(748,'Command: ticket delete'),
(749,'Command: ticket escalate'),
(750,'Command: ticket escalatedlist'),
(751,'Command: ticket list'),
(752,'Command: ticket onlinelist'),
(753,'Command: ticket reset'),
(754,'Command: ticket response'),
(755,'Command: ticket response append'),
(756,'Command: ticket response appendln'),
(757,'Command: ticket togglesystem'),
(758,'Command: ticket unassign'),
(759,'Command: ticket viewid'),
(760,'Command: ticket viewname'),
(761,'Command: titles'),
(762,'Command: titles add'),
(763,'Command: titles current'),
(764,'Command: titles remove'),
(765,'Command: titles set'),
(766,'Command: titles set mask'),
(767,'Command: wp'),
(768,'Command: wp add'),
(769,'Command: wp event'),
(770,'Command: wp load'),
(771,'Command: wp modify'),
(772,'Command: wp unload'),
(773,'Command: wp reload'),
(774,'Command: wp show'),
(777,'Command: mailbox'),
(778,'Command: ahbot'),
(779,'Command: ahbot items'),
(780,'Command: ahbot items gray'),
(781,'Command: ahbot items white'),
(782,'Command: ahbot items green'),
(783,'Command: ahbot items blue'),
(784,'Command: ahbot items purple'),
(785,'Command: ahbot items orange'),
(786,'Command: ahbot items yellow'),
(787,'Command: ahbot ratio'),
(788,'Command: ahbot ratio alliance'),
(789,'Command: ahbot ratio horde'),
(790,'Command: ahbot ratio neutral'),
(791,'Command: ahbot rebuild'),
(792,'Command: ahbot reload'),
(793,'Command: ahbot status'),
(794,'Command: guild info'),
(795,'Command: instance setbossstate'),
(796,'Command: instance getbossstate'),
(797,'Command: pvpstats'),
(798,'Command: mod xp'),
(835,'Command: debug loadcells'),
(836,'Command: debug boundary'),
(837,'Command: npc evade'),
(838,'Command: pet level'),
(839,'Command: server shutdown force'),
(840,'Command: server restart force'),
(841,'Command: debug neargraveyard'),
(843,'Command: reload quest_greeting'),
(852,'Command: debug dummy'),
(855,'Command: debug play music'),
(856,'Command: npc spawngroup'),
(857,'Command: npc despawngroup'),
(858,'Command: gobject spawngroup'),
(859,'Command: gobject despawngroup'),
(860,'Command: list respawns'),
(861,'Command: group set'),
(862,'Command: group set assistant'),
(863,'Command: group set maintank'),
(864,'Command: group set mainassist'),
(865,'Command: npc showloot'),
(866,'Command: list spawnpoints'),
(867,'Command: reload quest_greeting_locale'),
(870,'Command: debug threatinfo'),
(871,'Command: debug instancespawn'),
(872,'Command: server debug'),
(873,'Command: reload creature_movement_override'),
(874,'Command: debug asan'),
(875,'Command: lookup map id'),
(876,'Command: lookup item id'),
(877,'Command: lookup quest id'),
(878,'Command: debug questreset'),
(879,'Command: debug poolstatus'),
(880,'Command: pdump copy'),
(881,'Command: reload vehicle_template');
/*!40000 ALTER TABLE `rbac_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realmcharacters` (
  `realmid` int unsigned NOT NULL DEFAULT '0',
  `acctid` int unsigned NOT NULL,
  `numchars` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacters`
--

LOCK TABLES `realmcharacters` WRITE;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realmlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint unsigned NOT NULL DEFAULT '0',
  `flag` tinyint unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int unsigned NOT NULL DEFAULT '12340',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmlist`
--

LOCK TABLES `realmlist` WRITE;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` VALUES
(1,'Trinity','127.0.0.1','127.0.0.1','255.255.255.0',8085,0,2,1,0,0,12340);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_digest`
--

DROP TABLE IF EXISTS `secret_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secret_digest` (
  `id` int unsigned NOT NULL,
  `digest` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_digest`
--

LOCK TABLES `secret_digest` WRITE;
/*!40000 ALTER TABLE `secret_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `secret_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='List of all applied updates in this database.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES
('2014_11_10_00_auth.sql','0E3CB119442D09DD88E967015319BBC8DAFBBFE0','ARCHIVED','2014-11-10 00:00:00',0),
('2014_11_10_01_auth.sql','327E77A1DA3546D5275AB249915DD57EDD6FDD3D','ARCHIVED','2014-11-10 00:00:01',0),
('2014_12_10_00_auth.sql','821703A96D80F9080074852B5A46E2909C9562EA','ARCHIVED','2014-12-10 00:00:00',0),
('2014_12_21_00_auth.sql','CE2E5D2CD82E79C25294539ADED27A1429105B43','ARCHIVED','2014-12-21 00:00:00',0),
('2015_03_20_00_auth.sql','E8C5B74BB45F0F35DEC182C72BACF435C7066FB0','ARCHIVED','2015-03-20 00:00:00',0),
('2015_03_20_01_auth.sql','862961815354DA2746F5F71FBC8155F57CBE75AB','ARCHIVED','2015-03-20 00:00:01',0),
('2015_03_20_02_auth.sql','33E4F94086590768EF5D4855DD43D7DE7C06ADA4','ARCHIVED','2015-03-20 00:00:02',0),
('2015_08_21_00_auth.sql','C31A9E1D28E11B60BE8F8198637DD51F6D75123F','ARCHIVED','2015-08-21 00:00:00',0),
('2015_11_07_00_auth.sql','0ACDD35EC9745231BCFA701B78056DEF94D0CC53','ARCHIVED','2015-11-07 00:00:00',0),
('2016_01_13_00_auth.sql','24615CC69B3CD7BB4699874647C35BA86E8A93FD','ARCHIVED','2016-01-13 00:00:00',0),
('2016_04_11_00_auth.sql','0ACDD35EC9745231BCFA701B78056DEF94D0CC53','ARCHIVED','2016-04-11 00:00:00',0),
('2016_05_11_00_auth.sql','95B66235B8D67BF1CA216EB09F313C1F8F393B47','ARCHIVED','2016-05-11 00:00:00',0),
('2016_06_06_00_auth.sql','A0A8D73A952D0618833416513D53F73A70E7EA25','ARCHIVED','2016-06-06 00:00:00',0),
('2016_09_22_00_auth.sql','70047954E3556BFA430ADD5680EF8797F74A4B9E','ARCHIVED','2016-09-22 00:00:00',0),
('2016_10_16_00_auth.sql','0ACDD35EC9745231BCFA701B78056DEF94D0CC53','ARCHIVED','2016-10-16 00:00:00',0),
('2017_01_06_00_auth.sql','6CCFE6A9774EC733C9863D36A0F15F3534189BBD','ARCHIVED','2017-01-06 00:00:00',0),
('2017_01_08_00_auth.sql','A68511D0BF94C41F720A11B630CCB36BBEA6B17D','ARCHIVED','2017-01-08 00:00:00',0),
('2017_02_06_00_auth_335.sql','612068198F744892ECC0ACFE3BDCB6D72995916E','ARCHIVED','2017-02-06 00:00:00',0),
('2017_03_17_00_auth.sql','4902E9B1B063F399F928C2DD7AFD60427738E227','ARCHIVED','2017-03-17 00:00:00',0),
('2017_04_19_00_auth.sql','EAE1C1D3AA752259785C056A8F18515E1EF32BC9','ARCHIVED','2017-04-19 00:00:00',0),
('2017_05_29_00_auth.sql','74BBB703AABD8A6BCB905EA2F5C14A5E26124CDD','ARCHIVED','2017-05-29 00:00:00',0),
('2017_06_12_00_auth.sql','176532AED785F1F759382C79A28E0FED92E99779','ARCHIVED','2017-06-12 00:00:00',0),
('2017_06_12_01_auth.sql','661B4935E101AF188BEBF43203144104E89F8C54','ARCHIVED','2017-06-12 00:00:01',0),
('2017_06_12_02_auth.sql','166F059E411FAA4901BBBA09A41EF07B1CADC4B6','ARCHIVED','2017-06-12 00:00:02',0),
('2017_06_17_00_auth.sql','4A172895CB9DA8EFE1270434D6ECB22D4F4DCB17','ARCHIVED','2017-06-17 00:00:00',0),
('2017_06_28_00_auth_rbac.sql','D32EF80F57F629C23395D80F06E91D7E40719F83','ARCHIVED','2017-06-28 00:00:00',0),
('2017_08_01_00_auth.sql','6ECE808AF52345177189E962C0606B769B6806A6','ARCHIVED','2017-08-01 00:00:00',0),
('2017_10_13_00_auth.sql','87674E0D166AC60E3725B445714427892E42C6FE','ARCHIVED','2017-10-13 00:00:00',0),
('2017_10_29_00_auth.sql','F742569F56BB29CE9C8DBBD40A6AB474F846485C','ARCHIVED','2017-10-29 00:00:00',0),
('2017_12_17_00_auth.sql','2CD99730D4D32DBF0584CD5B1AA6F8F4AE3DA975','ARCHIVED','2017-12-17 00:00:00',0),
('2018_01_03_00_auth_2018_01_02_00_auth.sql','08AF5DAB45515B681B738DA17FA414C7C7CCA44E','ARCHIVED','2018-01-03 00:00:00',0),
('2018_01_09_00_auth.sql','A5D4EC8FCFAB4F2DCE70EDCAD1ACBFB484FD68D5','ARCHIVED','2018-01-09 00:00:00',0),
('2018_01_24_00_auth.sql','167B17D8A253D62A8112F8A7EB21C6E99CAEF1E4','ARCHIVED','2018-01-24 00:00:00',0),
('2018_02_19_00_auth.sql','80E50F9C7F1EE7BA62789EA4C4F009170B79E6C9','ARCHIVED','2018-02-19 00:00:00',0),
('2018_03_06_00_auth.sql','2D71E93DF7419A30D0D21D8A80CF05698302575A','ARCHIVED','2018-03-06 00:00:00',0),
('2018_03_08_00_auth.sql','624C58A07E0B4DDC4C1347E8BA8EFEEFD5B43DA7','ARCHIVED','2018-03-08 00:00:00',0),
('2018_06_23_00_auth.sql','BE35312C386A127D047E5A7CE0D14DB41D905F8E','ARCHIVED','2018-06-23 00:00:00',0),
('2018_08_30_00_auth.sql','22F69864361D3E72F800379338310172C0576D1C','ARCHIVED','2018-08-30 00:00:00',0),
('2018_09_06_00_auth.sql','309D21E0DF82ED8921F77EAFDE741F38AC32BB13','ARCHIVED','2018-09-06 00:00:00',0),
('2018_09_17_00_auth.sql','4DB671F0A4FA1A93AF28FB6426AF13DE72C7DA3D','ARCHIVED','2018-09-17 00:00:00',0),
('2018_12_30_00_auth.sql','680F4F9194FC37592041C2DB5B2B7006B14E836D','ARCHIVED','2018-12-30 00:00:00',0),
('2019_03_19_00_auth.sql','03BA8CFC60ACD5B874840A3E50F11CD2643730A0','ARCHIVED','2019-03-19 00:00:00',0),
('2019_04_15_00_auth.sql','EC67389946A24BFAA226B9DFCFEDB3BA095B4C42','ARCHIVED','2019-04-15 00:00:00',0),
('2019_04_27_00_auth.sql','84B1EB9CC9B09BAF55E6295D202EC57D99B1B60E','ARCHIVED','2019-04-27 00:00:00',0),
('2019_05_15_00_auth.sql','8A7B96E66D689DA63380654142FF60A1EE938697','ARCHIVED','2019-05-15 00:00:00',0),
('2019_06_06_00_auth.sql','6DE8159E04BEE7BA0A4A81D72D160EB74934B6A5','ARCHIVED','2019-06-06 00:00:00',0),
('2019_06_15_00_auth.sql','456B92D99FFD2E7B6CBF64F4C68555A42B24B298','ARCHIVED','2019-06-15 00:00:00',0),
('2019_06_16_00_auth.sql','B14AED4D3387B56FF8C8161D3671750AEEAE0F2E','ARCHIVED','2019-06-16 00:00:00',0),
('2019_06_21_00_auth.sql','C519239830204B68E710F698BC0C9E89B6D5FD24','ARCHIVED','2019-06-21 00:00:00',0),
('2019_07_15_00_auth.sql','64B491CD197A4466D7F739D67DD30C9502FF393A','ARCHIVED','2019-07-15 00:00:00',0),
('2019_07_16_00_auth.sql','36CB53A9EBD64BFDCF7030083E36E534F1753773','ARCHIVED','2019-07-16 00:00:00',0),
('2019_07_17_00_auth.sql','4F983F039904894ACC483BE885676C5F0A18F06B','ARCHIVED','2019-07-17 00:00:00',0),
('2019_08_10_00_auth.sql','E936802893474BB9B459D01BB5F181F54EDF0653','ARCHIVED','2019-08-10 00:00:00',0),
('2019_08_10_01_auth.sql','C58357260F0C70DA226A71F7E05DE2C49AAEFD74','ARCHIVED','2019-08-10 00:00:00',0),
('2019_08_16_00_auth.sql','99CF9C250EFBBD703DF0A2D1BDEB1E46D1063EE9','ARCHIVED','2019-08-16 06:25:07',0),
('2019_09_15_00_auth.sql','2EEE632B5A365D45747B7BB25DE5239FB5B1A1BD','ARCHIVED','2019-09-15 09:21:36',0),
('2019_10_18_00_auth.sql','DFEDA33D7B9A108773B6AD8DE3016C6B12BD3832','ARCHIVED','2019-10-18 08:37:37',0),
('2019_11_16_00_auth.sql','A7CC55B9329F0DDFE91ADC31BFABD0D934ED0A5E','ARCHIVED','2019-11-16 12:06:06',0),
('2019_12_07_00_auth.sql','F354DA31D5B300609C6AE8A25667CA4DE0A7349F','ARCHIVED','2019-12-07 12:57:23',0),
('2019_12_15_00_auth.sql','62CFB68A53F73E875B1104F0D0BAC81145090524','ARCHIVED','2019-12-15 18:26:21',0),
('2020_01_15_00_auth.sql','D486C0CEF68FDE5122E835128A1F663E0E72A21E','ARCHIVED','2020-01-15 07:45:18',0),
('2020_02_15_00_auth.sql','9CDBEBC722BEBB7C93091CF16EEB9C922C4116BD','ARCHIVED','2020-02-15 17:36:05',0),
('2020_03_16_00_auth.sql','B27E4CE14C713C73216930A7F3F770786D902A3F','ARCHIVED','2020-03-16 08:47:49',0),
('2020_04_07_00_auth.sql','6D73A4E1EC5382F10C39F20E2E6E764510A8A5E6','ARCHIVED','2020-04-07 22:23:35',0),
('2020_04_15_00_auth.sql','031E61B50B03E40406F07C196826DB9016A7203F','ARCHIVED','2020-04-15 11:03:56',0),
('2020_04_18_00_auth.sql','BD962B50760771B60F2785027D6957EEF2009240','ARCHIVED','2020-04-18 14:09:28',0),
('2020_05_15_00_auth.sql','765389B45F97A02160A58B373D63166F7F7D4427','ARCHIVED','2020-05-15 08:55:56',0),
('2020_06_15_00_auth.sql','3158036285CC9A4AB7D39063F9687649A21D0A94','ARCHIVED','2020-06-15 07:48:08',0),
('2020_06_20_00_auth.sql','85345FAF20B91DA7B157AE1E17DF5B6446C2E109','ARCHIVED','2020-06-11 10:48:00',0),
('2020_07_15_00_auth.sql','56748440894EA78C3BE72C4A3F2E97E256E6EE40','ARCHIVED','2020-07-15 00:00:00',0),
('2020_08_02_00_auth.sql','B0290F6558C59262D9DDD8071060A8803DD56930','ARCHIVED','2020-08-02 00:00:00',0),
('2020_08_03_00_auth.sql','492CA77C0FAEEEF3E0492121B3A92689373ECFA3','ARCHIVED','2020-08-03 00:00:00',0),
('2020_08_03_01_auth.sql','EC1063396CA20A2303D83238470D41EF4439EC72','ARCHIVED','2020-08-03 00:00:01',0),
('2020_08_11_00_auth.sql','14C99177E43003D83A4D6F2227722F15FC15A1D0','ARCHIVED','2020-08-11 00:00:00',0),
('2020_08_15_00_auth.sql','A49F4A776E1583B1FF63DFE99BC0E0DD97A74674','ARCHIVED','2020-08-15 00:00:00',0),
('2020_08_22_00_auth.sql','060A87FCC8F836A96D9D55BEDC32CBAD05008B4C','ARCHIVED','2020-08-22 00:00:00',0),
('2020_09_06_00_auth.sql','DC4B5D4C65EB138D5609F137799C3289B9CC2493','ARCHIVED','2020-09-06 00:00:00',0),
('2020_09_15_00_auth.sql','0AA5BCA384A372DC789647F838657766D51D8CC7','ARCHIVED','2020-09-15 19:35:18',0),
('2020_09_17_00_auth.sql','BBC0A8B2BBED38A57A83999909EB066753A893C5','ARCHIVED','2020-09-17 00:00:00',0),
('2020_10_15_00_auth.sql','8A79DE7DBDF35EBDA5C261BEBF9BC8E5CFF816CE','ARCHIVED','2020-10-15 07:33:13',0),
('2020_11_16_00_auth.sql','C0E1AAA8876DB65B2B2FA0AFD5D6CDF233020D37','ARCHIVED','2020-11-16 13:37:22',0),
('2020_12_15_00_auth.sql','C416FC93AF6BC33A6CE59185CEB03B4945701233','ARCHIVED','2020-12-15 22:47:26',0),
('2020_12_31_00_auth.sql','05C9C105D55C6588CDA0D75AE3B135B7E6B54C06','ARCHIVED','2020-12-31 12:58:21',0),
('2021_01_15_00_auth.sql','604B8B799F031C1074314D4D8081797CC8B22FE2','ARCHIVED','2021-01-15 08:29:32',0),
('2021_02_15_00_auth.sql','652C38A140C0B2C7E898A2F7A7AC799CA2440315','ARCHIVED','2021-02-15 12:37:46',0),
('2021_03_15_00_auth.sql','571D2FD6A62F066CC789C73A4ECDD613C6FF5F10','ARCHIVED','2021-03-15 17:31:39',0),
('2021_04_16_00_auth.sql','737670762C2AE4E04BFC2C2B0B6F3C71DCDF6C44','ARCHIVED','2021-04-16 21:23:03',0),
('2021_05_14_00_auth.sql','B89998D90CCFEB2480838D417AC9661372A6B959','ARCHIVED','2021-05-14 12:20:33',0),
('2021_06_15_00_auth.sql','DAFFA7699D3BF0A15AE72321AFC9F7D22F33B65C','ARCHIVED','2021-06-15 11:53:33',0),
('2021_06_20_00_auth.sql','7CA418D570DC1444C19AAD18F4A50FF187642310','ARCHIVED','2021-06-20 17:29:17',0),
('2021_07_15_00_auth.sql','C8B29D477A5A6704775517EF8203871BFE3D4906','ARCHIVED','2021-07-15 07:32:48',0),
('2021_08_15_00_auth.sql','256E06BF052C246B92B61AD7DD6233D98EEA6E9E','ARCHIVED','2021-08-15 16:59:31',0),
('2021_09_28_00_auth.sql','07B3ECF2EBAF1F1C3692059CB3A05B1088A93E18','ARCHIVED','2021-09-28 20:48:10',0),
('2021_10_15_00_auth.sql','4FFD29A3ED1DB13874E755A84BFD7ABA2DF5C2DB','ARCHIVED','2021-10-15 08:43:41',0),
('2021_11_15_00_auth.sql','82D88B06301130C7149E21A991364F62279E219B','ARCHIVED','2021-11-15 16:22:37',0),
('2021_12_16_00_auth.sql','A0765C5337833E827B029A5E29F8B7601C81F89E','ARCHIVED','2021-12-16 21:17:10',0),
('2022_01_01_00_auth.sql','CDC8349AA1135258D66F351141C0D9AD4EE7EB14','ARCHIVED','2022-01-01 19:35:19',0),
('2022_01_15_00_auth.sql','A2123CEC10327ECA4C92A8B2212AEE25B43C457B','ARCHIVED','2022-01-15 18:05:55',0),
('2022_02_16_00_auth.sql','CFB54EB37319916B1B80E29F5572D12A7D9A33F5','ARCHIVED','2022-02-16 21:52:01',0),
('2022_04_14_00_auth.sql','B1ED102EB7C9A2A0BDA866201960E70CCCA22FB5','ARCHIVED','2022-04-14 16:24:35',0);
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates_include`
--

DROP TABLE IF EXISTS `updates_include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='List of directories where we want to include sql updates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates_include`
--

LOCK TABLES `updates_include` WRITE;
/*!40000 ALTER TABLE `updates_include` DISABLE KEYS */;
INSERT INTO `updates_include` VALUES
('$/sql/updates/auth','RELEASED'),
('$/sql/custom/auth','RELEASED'),
('$/sql/old/3.3.5a/auth','ARCHIVED');
/*!40000 ALTER TABLE `updates_include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uptime`
--

DROP TABLE IF EXISTS `uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uptime` (
  `realmid` int unsigned NOT NULL,
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `uptime` int unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Uptime system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uptime`
--

LOCK TABLES `uptime` WRITE;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_log_history`
--

DROP TABLE IF EXISTS `vw_log_history`;
/*!50001 DROP VIEW IF EXISTS `vw_log_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_log_history` AS SELECT 
 1 AS `First Logged`,
 1 AS `Last Logged`,
 1 AS `Occurrences`,
 1 AS `Realm`,
 1 AS `type`,
 1 AS `level`,
 1 AS `string`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_rbac`
--

DROP TABLE IF EXISTS `vw_rbac`;
/*!50001 DROP VIEW IF EXISTS `vw_rbac`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rbac` AS SELECT 
 1 AS `Permission ID`,
 1 AS `Permission Group`,
 1 AS `Security Level`,
 1 AS `Permission`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'auth'
--

--
-- Final view structure for view `vw_log_history`
--

/*!50001 DROP VIEW IF EXISTS `vw_log_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 */
/*!50001 VIEW `vw_log_history` AS select from_unixtime(min(`logs`.`time`)) AS `First Logged`,from_unixtime(max(`logs`.`time`)) AS `Last Logged`,count(0) AS `Occurrences`,`realmlist`.`name` AS `Realm`,`logs`.`type` AS `type`,`logs`.`level` AS `level`,`logs`.`string` AS `string` from (`logs` left join `realmlist` on((`logs`.`realm` = `realmlist`.`id`))) group by `logs`.`string`,`logs`.`type`,`logs`.`realm` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rbac`
--

/*!50001 DROP VIEW IF EXISTS `vw_rbac`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 */
/*!50001 VIEW `vw_rbac` AS select `t1`.`linkedId` AS `Permission ID`,`t1`.`id` AS `Permission Group`,ifnull(`t2`.`secId`,'linked') AS `Security Level`,`t3`.`name` AS `Permission` from ((`rbac_linked_permissions` `t1` left join `rbac_default_permissions` `t2` on((`t1`.`id` = `t2`.`permissionId`))) left join `rbac_permissions` `t3` on((`t1`.`linkedId` = `t3`.`id`))) */;
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

-- Dump completed on 2022-04-14 16:24:38
