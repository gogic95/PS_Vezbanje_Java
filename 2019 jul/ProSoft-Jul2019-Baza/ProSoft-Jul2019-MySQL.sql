/*
SQLyog Ultimate v9.50 
MySQL - 5.6.20 : Database - prosoftjul19
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prosoftjul19` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `prosoftjul19`;

/*Table structure for table `gazdinstvo` */

DROP TABLE IF EXISTS `gazdinstvo`;

CREATE TABLE `gazdinstvo` (
  `GazdinstvoID` int(11) NOT NULL,
  `Naziv` varchar(255) DEFAULT NULL,
  `DatumRegistracije` date DEFAULT NULL,
  `UkupnoSubvencija` decimal(10,2) DEFAULT NULL,
  `PoljoprivrednikID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GazdinstvoID`),
  KEY `PoljoprivrednikID` (`PoljoprivrednikID`),
  CONSTRAINT `gazdinstvo_ibfk_1` FOREIGN KEY (`PoljoprivrednikID`) REFERENCES `poljoprivrednik` (`PoljoprivrednikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gazdinstvo` */

/*Table structure for table `poljoprivrednik` */

DROP TABLE IF EXISTS `poljoprivrednik`;

CREATE TABLE `poljoprivrednik` (
  `PoljoprivrednikID` int(11) NOT NULL,
  `Ime` varchar(255) DEFAULT NULL,
  `Prezime` varchar(255) DEFAULT NULL,
  `KorisnickoIme` varchar(50) DEFAULT NULL,
  `Lozinka` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PoljoprivrednikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `poljoprivrednik` */

insert  into `poljoprivrednik`(`PoljoprivrednikID`,`Ime`,`Prezime`,`KorisnickoIme`,`Lozinka`) values (1,'Marko','Markovic','marko','marko123'),(2,'Ana','Antic','ana','ana123'),(3,'Dragan','Draganic','dragan','dragan123'),(4,'Ivana','Ivic','ivana','ivana123');

/*Table structure for table `stado` */

DROP TABLE IF EXISTS `stado`;

CREATE TABLE `stado` (
  `GazdinstvoID` int(11) NOT NULL,
  `StadoID` int(11) NOT NULL,
  `BrojGrla` int(11) DEFAULT NULL,
  `IznosSubvencije` decimal(10,2) DEFAULT NULL,
  `ZivotinjaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GazdinstvoID`,`StadoID`),
  KEY `ZivotinjaID` (`ZivotinjaID`),
  CONSTRAINT `stado_ibfk_1` FOREIGN KEY (`GazdinstvoID`) REFERENCES `gazdinstvo` (`GazdinstvoID`),
  CONSTRAINT `stado_ibfk_2` FOREIGN KEY (`ZivotinjaID`) REFERENCES `zivotinja` (`ZivotinjaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stado` */

/*Table structure for table `zivotinja` */

DROP TABLE IF EXISTS `zivotinja`;

CREATE TABLE `zivotinja` (
  `ZivotinjaID` int(11) NOT NULL,
  `Naziv` varchar(255) DEFAULT NULL,
  `AutohtonaVrsta` tinyint(1) DEFAULT NULL,
  `SubvencijaPoGrlu` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ZivotinjaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zivotinja` */

insert  into `zivotinja`(`ZivotinjaID`,`Naziv`,`AutohtonaVrsta`,`SubvencijaPoGrlu`) values (1,'Mangulica',1,'199.99'),(2,'Moravka',1,'299.99'),(3,'Sumadinka',1,'149.99'),(4,'Sjenicko-pesterska ovca',1,'259.99'),(5,'Svrljiska ovca',1,'179.99'),(6,'Pirotska ovca',1,'169.99'),(7,'Balkanska koza',1,'299.99'),(8,'Busa',1,'129.99'),(9,'Domaci bivo',1,'139.99'),(10,'Balkanski magarac',1,'149.99'),(11,'Krava',0,'99.99'),(12,'Konj',0,'89.99'),(13,'Ovca',0,'109.99'),(14,'Koza',0,'101.99');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
