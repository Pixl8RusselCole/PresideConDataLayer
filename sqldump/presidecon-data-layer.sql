# ************************************************************
# Sequel Ace SQL dump
# Version 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.3.29-MariaDB-1:10.3.29+maria~bionic)
# Database: rptestbed
# Generation Time: 2023-06-20 13:24:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table pobj_presidecon_complexa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_complexa`;

CREATE TABLE `pobj_presidecon_complexa` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_complexa_datemodified` (`datemodified`),
  KEY `ix_presidecon_complexa_datecreated` (`datecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_complexa` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_complexa` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_complexa` (`id`, `label`, `datecreated`, `datemodified`)
VALUES
	('COMPLEXA1','Complex 1','2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_complexa` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_complexb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_complexb`;

CREATE TABLE `pobj_presidecon_complexb` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `should_use` tinyint(1) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_complexb_datecreated` (`datecreated`),
  KEY `ix_presidecon_complexb_datemodified` (`datemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_complexb` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_complexb` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_complexb` (`id`, `label`, `parent`, `should_use`, `datecreated`, `datemodified`)
VALUES
	('COMPLEXB1','Complex B Use','COMPLEXA1',1,'2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('COMPLEXB2','Complex Don\'t Use','COMPLEXA1',0,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_complexb` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_deprecationnofield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_deprecationnofield`;

CREATE TABLE `pobj_presidecon_deprecationnofield` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_field` int(11) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_deprecationnofield_datecreated` (`datecreated`),
  KEY `ix_presidecon_deprecationnofield_datemodified` (`datemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_deprecationnofield` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_deprecationnofield` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_deprecationnofield` (`id`, `label`, `new_field`, `datecreated`, `datemodified`)
VALUES
	('DEPN','Deprecated No Field',NULL,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_deprecationnofield` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_deprecationoriginal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_deprecationoriginal`;

CREATE TABLE `pobj_presidecon_deprecationoriginal` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_field` int(11) DEFAULT NULL,
  `new_field` int(11) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_deprecationoriginal_datemodified` (`datemodified`),
  KEY `ix_presidecon_deprecationoriginal_datecreated` (`datecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_deprecationoriginal` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_deprecationoriginal` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_deprecationoriginal` (`id`, `label`, `old_field`, `new_field`, `datecreated`, `datemodified`)
VALUES
	('DEPO','Original field',100,NULL,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_deprecationoriginal` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_deprecationprefixed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_deprecationprefixed`;

CREATE TABLE `pobj_presidecon_deprecationprefixed` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `__deprecated__old_field` int(11) DEFAULT NULL,
  `new_field` int(11) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_deprecationprefixed_datecreated` (`datecreated`),
  KEY `ix_presidecon_deprecationprefixed_datemodified` (`datemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_deprecationprefixed` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_deprecationprefixed` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_deprecationprefixed` (`id`, `label`, `__deprecated__old_field`, `new_field`, `datecreated`, `datemodified`)
VALUES
	('DEPP','Prefixed',200,NULL,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_deprecationprefixed` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_extrajoinattendee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_extrajoinattendee`;

CREATE TABLE `pobj_presidecon_extrajoinattendee` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_extrajoinattendee_datecreated` (`datecreated`),
  KEY `ix_presidecon_extrajoinattendee_datemodified` (`datemodified`),
  KEY `fk_e1ae82314e6a3e2f7c4ddd853f833ca6` (`country`),
  CONSTRAINT `fk_e1ae82314e6a3e2f7c4ddd853f833ca6` FOREIGN KEY (`country`) REFERENCES `pobj_presidecon_extrajoincountry` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_extrajoinattendee` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_extrajoinattendee` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_extrajoinattendee` (`id`, `label`, `country`, `company`, `datecreated`, `datemodified`)
VALUES
	('A1','Seb','GB','Pixl8','2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('A2','Russ','GB','Pixl8','2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('A3','Jan','DE','Pixl8','2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('A4','Joe','GB','Meta','2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_extrajoinattendee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_extrajoincountry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_extrajoincountry`;

CREATE TABLE `pobj_presidecon_extrajoincountry` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_extrajoincountry_datecreated` (`datecreated`),
  KEY `ix_presidecon_extrajoincountry_datemodified` (`datemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_extrajoincountry` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_extrajoincountry` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_extrajoincountry` (`id`, `label`, `datecreated`, `datemodified`)
VALUES
	('DE','Germany','2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('GB','Great Britain','2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_extrajoincountry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_inserta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_inserta`;

CREATE TABLE `pobj_presidecon_inserta` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldA1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_insert` tinyint(1) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `datemodified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_inserta` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_inserta` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_inserta` (`id`, `label`, `fieldA1`, `should_insert`, `datecreated`, `datemodified`)
VALUES
	('1','Label1','Field1',1,NULL,NULL),
	('2','Label2','Field2',0,NULL,NULL);

/*!40000 ALTER TABLE `pobj_presidecon_inserta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_insertb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_insertb`;

CREATE TABLE `pobj_presidecon_insertb` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldB1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldB2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `datemodified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table pobj_presidecon_migrationa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_migrationa`;

CREATE TABLE `pobj_presidecon_migrationa` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_val` int(11) DEFAULT NULL,
  `migrated_sync_val` int(11) DEFAULT NULL,
  `migrated_async_val` int(11) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_migrationa_datecreated` (`datecreated`),
  KEY `ix_presidecon_migrationa_datemodified` (`datemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_migrationa` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_migrationa` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_migrationa` (`id`, `label`, `original_val`, `migrated_sync_val`, `migrated_async_val`, `datecreated`, `datemodified`)
VALUES
	('MIGRATIONA','Migration A',1,NULL,NULL,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_migrationa` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_obja
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_obja`;

CREATE TABLE `pobj_presidecon_obja` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldA1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_insert` tinyint(1) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_obja_datemodified` (`datemodified`),
  KEY `ix_presidecon_obja_datecreated` (`datecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_obja` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_obja` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_obja` (`id`, `label`, `fieldA1`, `should_insert`, `datecreated`, `datemodified`)
VALUES
	('1','Label1','Field1',1,'2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('2','Label2','Field2',0,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_obja` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_objb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_objb`;

CREATE TABLE `pobj_presidecon_objb` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldB1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldB2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_objb_datemodified` (`datemodified`),
  KEY `ix_presidecon_objb_datecreated` (`datecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table pobj_presidecon_uniona
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_uniona`;

CREATE TABLE `pobj_presidecon_uniona` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldA1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldA2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_uniona_datecreated` (`datecreated`),
  KEY `ix_presidecon_uniona_datemodified` (`datemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_uniona` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_uniona` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_uniona` (`id`, `label`, `fieldA1`, `fieldA2`, `sort_order`, `datecreated`, `datemodified`)
VALUES
	('A1','First','1','1',1,'2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('A5','Fifth','5','5',5,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_uniona` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_unionb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_unionb`;

CREATE TABLE `pobj_presidecon_unionb` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldB1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldB2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_unionb_datecreated` (`datecreated`),
  KEY `ix_presidecon_unionb_datemodified` (`datemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_unionb` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_unionb` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_unionb` (`id`, `label`, `fieldB1`, `fieldB2`, `sort_order`, `datecreated`, `datemodified`)
VALUES
	('B2','Second','2','2',2,'2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('B6','Sixth','6','6',6,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_unionb` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pobj_presidecon_unionc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pobj_presidecon_unionc`;

CREATE TABLE `pobj_presidecon_unionc` (
  `id` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldC3` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldC4` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `datemodified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_presidecon_unionc_datemodified` (`datemodified`),
  KEY `ix_presidecon_unionc_datecreated` (`datecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pobj_presidecon_unionc` WRITE;
/*!40000 ALTER TABLE `pobj_presidecon_unionc` DISABLE KEYS */;

INSERT INTO `pobj_presidecon_unionc` (`id`, `label`, `fieldC3`, `fieldC4`, `sort_order`, `datecreated`, `datemodified`)
VALUES
	('C3','Third','Third','3',3,'2023-01-01 12:00:00','2023-01-01 12:00:00'),
	('C4','Fourth','Fourth','4',4,'2023-01-01 12:00:00','2023-01-01 12:00:00');

/*!40000 ALTER TABLE `pobj_presidecon_unionc` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
