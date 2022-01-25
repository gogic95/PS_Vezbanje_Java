/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.4.17-MariaDB : Database - prosoftjan21
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prosoftjan21` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `prosoftjan21`;

/*Table structure for table `paket` */

DROP TABLE IF EXISTS `paket`;

CREATE TABLE `paket` (
  `PaketID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(255) NOT NULL,
  `Opis` varchar(255) NOT NULL,
  `Cena` decimal(10,2) NOT NULL,
  `Aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`PaketID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `paket` */

insert  into `paket`(`PaketID`,`Naziv`,`Opis`,`Cena`,`Aktivan`) values (1,'Duo TV-NET','Televizija i Internet','2599.00',1),(2,'Duo TV-TEL','Televizija i telefonija','2399.00',0),(3,'Duo NET-TEL','Internet i telefonija','2299.00',1),(4,'Trio TV-NET-TEL','Televizija, Internet i telefonija','3199.00',1),(5,'Singl TV','Televizija','1599.00',1),(6,'Singl NET','Internet','1599.00',1),(7,'Singl TEL','Telefonija','599.00',1);

/*Table structure for table `pretplatnik` */

DROP TABLE IF EXISTS `pretplatnik`;

CREATE TABLE `pretplatnik` (
  `PretplatnikID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Ime` varchar(255) NOT NULL,
  `Prezime` varchar(255) NOT NULL,
  PRIMARY KEY (`PretplatnikID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pretplatnik` */

insert  into `pretplatnik`(`PretplatnikID`,`Ime`,`Prezime`) values (1,'Marko','Markovic'),(2,'Dragana','Draganic'),(3,'Ivan','Ivanic'),(4,'Marija','Markovic'),(5,'Petar','Petrovic'),(6,'Dusanka','Dusanic'),(7,'Jovan','Jovanovic'),(8,'Ana','Anic');

/*Table structure for table `ugovor` */

DROP TABLE IF EXISTS `ugovor`;

CREATE TABLE `ugovor` (
  `UgovorID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DatumEvidentiranja` date NOT NULL,
  `VrstaUgovora` varchar(50) NOT NULL,
  `DodatneUsluge` tinyint(1) NOT NULL,
  `Cena` decimal(10,2) NOT NULL,
  `PaketID` bigint(20) unsigned NOT NULL,
  `PretplatnikID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`UgovorID`),
  KEY `PaketID` (`PaketID`),
  KEY `PretplatnikID` (`PretplatnikID`),
  CONSTRAINT `ugovor_ibfk_1` FOREIGN KEY (`PaketID`) REFERENCES `paket` (`PaketID`),
  CONSTRAINT `ugovor_ibfk_2` FOREIGN KEY (`PretplatnikID`) REFERENCES `pretplatnik` (`PretplatnikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ugovor` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
