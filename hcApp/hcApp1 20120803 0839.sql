-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.17


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema dbhc
--

CREATE DATABASE IF NOT EXISTS dbhc;
USE dbhc;

--
-- Definition of table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_group`
--

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` (`id`,`name`) VALUES 
 (2,'admin'),
 (1,'doctor');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


--
-- Definition of table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_group_permissions`
--

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


--
-- Definition of table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`,`name`,`content_type_id`,`codename`) VALUES 
 (1,'Can add permission',1,'add_permission'),
 (2,'Can change permission',1,'change_permission'),
 (3,'Can delete permission',1,'delete_permission'),
 (4,'Can add group',2,'add_group'),
 (5,'Can change group',2,'change_group'),
 (6,'Can delete group',2,'delete_group'),
 (7,'Can add user',3,'add_user'),
 (8,'Can change user',3,'change_user'),
 (9,'Can delete user',3,'delete_user'),
 (10,'Can add content type',4,'add_contenttype'),
 (11,'Can change content type',4,'change_contenttype'),
 (12,'Can delete content type',4,'delete_contenttype'),
 (13,'Can add session',5,'add_session'),
 (14,'Can change session',5,'change_session'),
 (15,'Can delete session',5,'delete_session'),
 (16,'Can add site',6,'add_site'),
 (17,'Can change site',6,'change_site'),
 (18,'Can delete site',6,'delete_site'),
 (19,'Can add log entry',7,'add_logentry'),
 (20,'Can change log entry',7,'change_logentry'),
 (21,'Can delete log entry',7,'delete_logentry'),
 (34,'Can add nota',12,'add_nota'),
 (35,'Can change nota',12,'change_nota'),
 (36,'Can delete nota',12,'delete_nota'),
 (40,'Can add perfil',14,'add_perfil'),
 (41,'Can change perfil',14,'change_perfil'),
 (42,'Can delete perfil',14,'delete_perfil'),
 (43,'Can add historial',15,'add_historial'),
 (44,'Can change historial',15,'change_historial'),
 (45,'Can delete historial',15,'delete_historial');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


--
-- Definition of table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`,`username`,`first_name`,`last_name`,`email`,`password`,`is_staff`,`is_active`,`is_superuser`,`last_login`,`date_joined`) VALUES 
 (1,'jnjimenez','Julio Noel','Jimenez Barea','email@gmail.com','pbkdf2_sha256$10000$6NBXmiJX53eU$Oqlrq2lRYXqUhSx4BNWTHET6/TXjGa/k4gi2eDYpL+E=',1,1,1,'2012-08-02 11:56:43','2012-06-26 09:21:28'),
 (2,'admin','','','','pbkdf2_sha256$10000$RcrEp0URXYbp$pbS/3ex3i29NGQQqjxvMNMbG6U/jbz2UQJTV88MOze0=',1,1,1,'2012-07-31 06:15:50','2012-07-20 09:46:28'),
 (3,'demo','','','','pbkdf2_sha256$10000$FgaxnWfKcofi$WgBphoD53Gr9qDjV6J5j5gL5kT7MGjcNP4i/vHl1Vh0=',0,1,0,'2012-07-25 09:40:09','2012-07-25 09:35:00');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


--
-- Definition of table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user_groups`
--

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` (`id`,`user_id`,`group_id`) VALUES 
 (9,1,1),
 (10,1,2),
 (3,2,2),
 (6,3,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


--
-- Definition of table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user_user_permissions`
--

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


--
-- Definition of table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`,`action_time`,`user_id`,`content_type_id`,`object_id`,`object_repr`,`action_flag`,`change_message`) VALUES 
 (2,'2012-06-26 10:03:23',1,12,'1','Nota object',1,''),
 (5,'2012-07-20 09:46:28',1,3,'2','admin',1,''),
 (6,'2012-07-25 09:34:21',1,2,'1','doctor',1,''),
 (7,'2012-07-25 09:34:28',1,2,'2','admin',1,''),
 (8,'2012-07-25 09:34:48',1,3,'1','jnjimenez',2,'Changed password and groups.'),
 (9,'2012-07-25 09:35:00',1,3,'3','doctor',1,''),
 (10,'2012-07-25 09:35:05',1,3,'3','doctor',2,'Changed password and groups.'),
 (11,'2012-07-25 09:36:31',1,14,'1','jnjimenez',1,''),
 (12,'2012-08-01 12:19:55',1,3,'2','admin',2,'Changed password, is_staff, is_superuser and groups.'),
 (13,'2012-08-01 12:20:27',1,3,'1','jnjimenez',2,'Changed password and groups.'),
 (14,'2012-08-01 12:57:25',1,3,'3','demo',2,'Changed username and password.'),
 (15,'2012-08-02 09:41:30',1,3,'1','jnjimenez',2,'Changed password, first_name and last_name.'),
 (16,'2012-08-02 09:44:40',1,3,'1','jnjimenez',2,'Changed password.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


--
-- Definition of table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`,`name`,`app_label`,`model`) VALUES 
 (1,'permission','auth','permission'),
 (2,'group','auth','group'),
 (3,'user','auth','user'),
 (4,'content type','contenttypes','contenttype'),
 (5,'session','sessions','session'),
 (6,'site','sites','site'),
 (7,'log entry','admin','logentry'),
 (12,'nota','principal','nota'),
 (14,'perfil','principal','perfil'),
 (15,'historial','principal','historial');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


--
-- Definition of table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`,`session_data`,`expire_date`) VALUES 
 ('012d444e865bcb2b924f699792568cdd','YmM4ODZmNzI5ZDA0MTIyZWE2YmIyMGJjMDBmMWJiYWViZGMzOTdhYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-16 11:56:43'),
 ('42a50b5a1e2ab734be230d21f95480f1','ZGUzN2Y4YjAwYjVjNWJhOWZlOTc1Mjc2MGIxMzJlNDJiZGMxOTk4NjqAAn1xAS4=\n','2012-08-08 10:07:43'),
 ('4a6a9e1498a469468db6d79e7f061d49','YmM4ODZmNzI5ZDA0MTIyZWE2YmIyMGJjMDBmMWJiYWViZGMzOTdhYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-15 12:20:37'),
 ('65d0e16cc531b44bb7d24e47f7950cb3','YmM4ODZmNzI5ZDA0MTIyZWE2YmIyMGJjMDBmMWJiYWViZGMzOTdhYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-07-10 09:44:17'),
 ('ac4c827df4546c021521f2f46d14c948','YmM4ODZmNzI5ZDA0MTIyZWE2YmIyMGJjMDBmMWJiYWViZGMzOTdhYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-03 09:46:16'),
 ('bbb5b2d550877d93f98966050c141e4f','YmM4ODZmNzI5ZDA0MTIyZWE2YmIyMGJjMDBmMWJiYWViZGMzOTdhYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-16 07:14:32'),
 ('bbc27143f7c35c606070e2927e6b16eb','YmM4ODZmNzI5ZDA0MTIyZWE2YmIyMGJjMDBmMWJiYWViZGMzOTdhYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-15 12:56:40'),
 ('d34dbd0aab05a0738e1597e5538825ac','NWM1ZDY2YmYxOGY1YzA1YjU3Njk1MDk1MjM3ZGYyN2I5M2U1Y2ZjYTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUSX2F1dGhfdXNlcl9iYWNrZW5kcQJVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBAXUu\n','2012-08-14 06:25:45'),
 ('dc2510853c0a65fc343b694c30234c4f','ZGUzN2Y4YjAwYjVjNWJhOWZlOTc1Mjc2MGIxMzJlNDJiZGMxOTk4NjqAAn1xAS4=\n','2012-08-14 08:34:48'),
 ('e7069de52c06816f23cd69cb3bf9416c','ZGUzN2Y4YjAwYjVjNWJhOWZlOTc1Mjc2MGIxMzJlNDJiZGMxOTk4NjqAAn1xAS4=\n','2012-08-08 09:38:17');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;


--
-- Definition of table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_site`
--

/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` (`id`,`domain`,`name`) VALUES 
 (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;


--
-- Definition of table `principal_historial`
--

DROP TABLE IF EXISTS `principal_historial`;
CREATE TABLE `principal_historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(14) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `profesion` varchar(50) DEFAULT NULL,
  `numAfilicacion` int(11) DEFAULT NULL,
  `compania` int(11) DEFAULT NULL,
  `fechaApertura` datetime NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  KEY `principal_historial_32ec34e8` (`autor_id`),
  CONSTRAINT `autor_id_refs_id_211d2b61` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `principal_historial`
--

/*!40000 ALTER TABLE `principal_historial` DISABLE KEYS */;
INSERT INTO `principal_historial` (`id`,`dni`,`nombre`,`apellido1`,`apellido2`,`fechaNacimiento`,`sexo`,`telefono`,`profesion`,`numAfilicacion`,`compania`,`fechaApertura`,`autor_id`) VALUES 
 (1,'2880dni','julio noel','jimenez','barea',NULL,NULL,NULL,NULL,NULL,NULL,'2012-08-02 07:21:22',NULL),
 (2,'45','gfgf','gfdgd','dfgdf',NULL,NULL,NULL,'',NULL,NULL,'2012-08-02 10:57:07',NULL),
 (3,'7454','oseas','ds','barea','1981-12-12',1,67613,'',NULL,NULL,'2012-08-02 11:00:56',NULL),
 (4,'9999','manolo','jimenez','barea','1983-12-12',0,9851,'',NULL,NULL,'2012-08-02 12:37:04',NULL);
/*!40000 ALTER TABLE `principal_historial` ENABLE KEYS */;


--
-- Definition of table `principal_nota`
--

DROP TABLE IF EXISTS `principal_nota`;
CREATE TABLE `principal_nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `historial_id` int(11) NOT NULL,
  `texto` longtext NOT NULL,
  `fecha` datetime NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `principal_nota_37831b3a` (`historial_id`),
  KEY `principal_nota_32ec34e8` (`autor_id`),
  CONSTRAINT `historial_id_refs_id_17d5fc7d` FOREIGN KEY (`historial_id`) REFERENCES `principal_historial` (`id`),
  CONSTRAINT `autor_id_refs_id_4ae4c191` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `principal_nota`
--

/*!40000 ALTER TABLE `principal_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `principal_nota` ENABLE KEYS */;


--
-- Definition of table `principal_perfil`
--

DROP TABLE IF EXISTS `principal_perfil`;
CREATE TABLE `principal_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_20b1c771` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `principal_perfil`
--

/*!40000 ALTER TABLE `principal_perfil` DISABLE KEYS */;
INSERT INTO `principal_perfil` (`id`,`user_id`,`dni`,`telefono`) VALUES 
 (1,1,'28807894','676177845');
/*!40000 ALTER TABLE `principal_perfil` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
