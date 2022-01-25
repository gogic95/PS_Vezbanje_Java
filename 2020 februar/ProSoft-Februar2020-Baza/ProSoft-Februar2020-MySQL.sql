/*
SQLyog Ultimate v9.50 
MySQL - 5.6.20 : Database - prosoftfeb20
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prosoftfeb20` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `prosoftfeb20`;

/*Table structure for table `intervju` */

DROP TABLE IF EXISTS `intervju`;

CREATE TABLE `intervju` (
  `IntervjuID` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` date DEFAULT NULL,
  `Opis` varchar(255) DEFAULT NULL,
  `BrojPoenaTest` decimal(10,2) DEFAULT NULL,
  `VozackaDozvola` varchar(10) DEFAULT NULL,
  `PrethodnoIskustvo` tinyint(1) DEFAULT NULL,
  `KandidatID` int(11) DEFAULT NULL,
  `RegruterID` int(11) DEFAULT NULL,
  PRIMARY KEY (`IntervjuID`),
  KEY `KandidatID` (`KandidatID`),
  KEY `RegruterID` (`RegruterID`),
  CONSTRAINT `intervju_ibfk_1` FOREIGN KEY (`KandidatID`) REFERENCES `kandidat` (`KandidatID`),
  CONSTRAINT `intervju_ibfk_2` FOREIGN KEY (`RegruterID`) REFERENCES `regruter` (`RegruterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `intervju` */

/*Table structure for table `kandidat` */

DROP TABLE IF EXISTS `kandidat`;

CREATE TABLE `kandidat` (
  `KandidatID` int(11) NOT NULL,
  `ImePrezime` varchar(255) DEFAULT NULL,
  `StrucnaSprema` varchar(255) DEFAULT NULL,
  `Zanimanje` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KandidatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kandidat` */

insert  into `kandidat`(`KandidatID`,`ImePrezime`,`StrucnaSprema`,`Zanimanje`) values (1,'Ivan Ivic','IV','ekonomski tehnicar'),(2,'Marija Markovic','VII-1','diplomirani pravnik'),(3,'Jovan Jovic','VII-2','magistar farmacije'),(4,'Slobodan Senic','IV','elektrotehnicar'),(5,'Milan Milovic','VII-1','diplomirani inzenjer organizacionih nauka'),(6,'Snezana Pavlovic','VII-2','master inzenjer organizacionih nauka'),(7,'Dragan Petrovic','VII-1','diplomirani inzenjer elektrotehnike');

/*Table structure for table `regruter` */

DROP TABLE IF EXISTS `regruter`;

CREATE TABLE `regruter` (
  `RegruterID` int(11) NOT NULL,
  `ImePrezime` varchar(255) DEFAULT NULL,
  `KorisnickoIme` varchar(50) DEFAULT NULL,
  `Lozinka` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RegruterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `regruter` */

insert  into `regruter`(`RegruterID`,`ImePrezime`,`KorisnickoIme`,`Lozinka`) values (1,'Stefan Stefanovic','r1','r1'),(2,'Dragana Draganic','r2','r2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
