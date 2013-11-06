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


DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer` varchar(20) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `itemprice` int(11) NOT NULL,
  `itemquantity` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `checkout`;
CREATE TABLE  `checkout` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(10) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `email` varchar(15) NOT NULL,
  `country` varchar(10) NOT NULL,
  `phone` int(10)NOT NULL,
  `ccno` int(20) NOT NULL,
  `CCExpiresMonth` varchar(10) NOT NULL,
  `CCExpiresYear` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
