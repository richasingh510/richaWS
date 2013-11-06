CREATE DATABASE  IF NOT EXISTS `marketplace`
USE `marketplace`;

DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE `userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `advertisements`;
CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(20) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `itemdescription` varchar(200) NOT NULL,
  `itemprice` int(11) NOT NULL,
  `itemquantity` varchar(10) NOT NULL,
  `isSold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE  `useraccount` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(50) NOT NULL,
  `itemprice` int(10)NOT NULL,
  `itemquantity` int(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `accounttype` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
