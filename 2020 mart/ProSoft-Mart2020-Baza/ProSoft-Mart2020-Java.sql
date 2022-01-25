/*
SQLyog Ultimate v9.50 
MySQL - 5.6.20 : Database - mart2020
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mart2020` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mart2020`;

/*Table structure for table `izdanje` */

DROP TABLE IF EXISTS `izdanje`;

CREATE TABLE `izdanje` (
  `IzdanjeID` int(11) NOT NULL,
  `Datum` date DEFAULT NULL,
  `Broj` int(11) DEFAULT NULL,
  `PublikacijaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`IzdanjeID`),
  KEY `PublikacijaID` (`PublikacijaID`),
  CONSTRAINT `izdanje_ibfk_1` FOREIGN KEY (`PublikacijaID`) REFERENCES `publikacija` (`PublikacijaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `izdanje` */

/*Table structure for table `publikacija` */

DROP TABLE IF EXISTS `publikacija`;

CREATE TABLE `publikacija` (
  `PublikacijaID` int(11) NOT NULL,
  `Naziv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PublikacijaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `publikacija` */

insert  into `publikacija`(`PublikacijaID`,`Naziv`) values (1,'Sportski zurnal'),(2,'Politika'),(3,'Danas'),(4,'Blic'),(5,'Bazar'),(6,'Politikin Zabavnik');

/*Table structure for table `vest` */

DROP TABLE IF EXISTS `vest`;

CREATE TABLE `vest` (
  `IzdanjeID` int(11) NOT NULL,
  `RB` int(11) NOT NULL,
  `Naslov` varchar(100) DEFAULT NULL,
  `Vest` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`IzdanjeID`,`RB`),
  CONSTRAINT `vest_ibfk_1` FOREIGN KEY (`IzdanjeID`) REFERENCES `izdanje` (`IzdanjeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vest` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
