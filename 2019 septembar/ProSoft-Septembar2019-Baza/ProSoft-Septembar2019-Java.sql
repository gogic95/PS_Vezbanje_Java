/*
SQLyog Ultimate v9.50 
MySQL - 5.6.20 : Database - prosoftsept19
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prosoftsept19` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `prosoftsept19`;

/*Table structure for table `podnesak` */

DROP TABLE IF EXISTS `podnesak`;

CREATE TABLE `podnesak` (
  `PredmetID` int(11) NOT NULL,
  `RB` int(11) NOT NULL,
  `DatumPrijema` date DEFAULT NULL,
  `Opis` varchar(255) DEFAULT NULL,
  `VrstaPodneska` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PredmetID`,`RB`),
  CONSTRAINT `podnesak_ibfk_1` FOREIGN KEY (`PredmetID`) REFERENCES `predmet` (`PredmetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `podnesak` */

/*Table structure for table `predmet` */

DROP TABLE IF EXISTS `predmet`;

CREATE TABLE `predmet` (
  `PredmetID` int(11) NOT NULL AUTO_INCREMENT,
  `BrojPredmeta` varchar(255) DEFAULT NULL,
  `DatumPrijema` date DEFAULT NULL,
  `Tuzilac` varchar(255) DEFAULT NULL,
  `Tuzeni` varchar(255) DEFAULT NULL,
  `PlacenaSudskaTaksa` tinyint(1) DEFAULT NULL,
  `TipSporaID` int(11) DEFAULT NULL,
  `SudID` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PredmetID`),
  KEY `TipSporaID` (`TipSporaID`),
  KEY `SudID` (`SudID`),
  CONSTRAINT `predmet_ibfk_1` FOREIGN KEY (`TipSporaID`) REFERENCES `tipspora` (`TipSporaID`),
  CONSTRAINT `predmet_ibfk_2` FOREIGN KEY (`SudID`) REFERENCES `sud` (`SudID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `predmet` */

/*Table structure for table `sud` */

DROP TABLE IF EXISTS `sud`;

CREATE TABLE `sud` (
  `SudID` int(11) NOT NULL,
  `Naziv` varchar(255) DEFAULT NULL,
  `Adresa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SudID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sud` */

insert  into `sud`(`SudID`,`Naziv`,`Adresa`) values (1,'Vrhovni kasacioni sud','Adresa1'),(2,'Apelacioni sud','Adresa2'),(3,'Osnovni sud','Adresa3'),(4,'Upravni sud','Adresa4'),(5,'Privredni sud','Adresa5'),(6,'Prekrsajni sud','Adresa6'),(7,'Prekrsajno-apelacioni sud','Adresa7');

/*Table structure for table `tipspora` */

DROP TABLE IF EXISTS `tipspora`;

CREATE TABLE `tipspora` (
  `TipSporaID` int(11) NOT NULL,
  `Naziv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TipSporaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipspora` */

insert  into `tipspora`(`TipSporaID`,`Naziv`) values (1,'Porez'),(2,'Cutanje uprave'),(3,'Ostvarivanje prava iz osiguranja'),(4,'Takse'),(5,'Vracanje imovine'),(6,'Osiguranje'),(7,'Privredni prestup'),(8,'Obrazovanje');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
