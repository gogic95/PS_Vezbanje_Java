/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.4.17-MariaDB : Database - prosoftfeb21
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prosoftfeb21` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `prosoftfeb21`;

/*Table structure for table `opstina` */

DROP TABLE IF EXISTS `opstina`;

CREATE TABLE `opstina` (
  `OpstinaID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PttBroj` int(11) DEFAULT NULL,
  `Naziv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OpstinaID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `opstina` */

insert  into `opstina`(`OpstinaID`,`PttBroj`,`Naziv`) values (1,11000,'Savski venac'),(2,11000,'Stari grad'),(3,11000,'Vracar'),(4,11010,'Vozdovac'),(5,11030,'Cukarica'),(6,11050,'Zvezdara'),(7,11060,'Palilula'),(8,11070,'Novi Beograd'),(9,11080,'Zemun'),(10,11090,'Rakovica'),(11,11460,'Barajevo'),(12,11306,'Grocka'),(13,11550,'Lazarevac'),(14,11400,'Mladenovac'),(15,11500,'Obrenovac'),(16,11450,'Sopot'),(17,11271,'Surcin');

/*Table structure for table `prijava` */

DROP TABLE IF EXISTS `prijava`;

CREATE TABLE `prijava` (
  `PrijavaID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Drzavljanstvo` varchar(100) NOT NULL,
  `JMBG` varchar(13) NOT NULL,
  `Ime` varchar(255) NOT NULL,
  `Prezime` varchar(255) NOT NULL,
  `ElektronskaPosta` varchar(255) NOT NULL,
  `MobilniTelefon` varchar(255) NOT NULL,
  `SpecificnaOboljenja` tinyint(1) NOT NULL,
  `DatumPrijave` datetime NOT NULL,
  `OpstinaID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`PrijavaID`),
  KEY `OpstinaID` (`OpstinaID`),
  CONSTRAINT `prijava_ibfk_1` FOREIGN KEY (`OpstinaID`) REFERENCES `opstina` (`OpstinaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `prijava` */

/*Table structure for table `stavkaprijave` */

DROP TABLE IF EXISTS `stavkaprijave`;

CREATE TABLE `stavkaprijave` (
  `PrijavaID` bigint(20) unsigned NOT NULL,
  `RB` int(11) unsigned NOT NULL,
  `TipVakcine` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PrijavaID`,`RB`),
  CONSTRAINT `stavkaprijave_ibfk_1` FOREIGN KEY (`PrijavaID`) REFERENCES `prijava` (`PrijavaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `stavkaprijave` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
