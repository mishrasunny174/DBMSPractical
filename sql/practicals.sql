-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `practicals`;
CREATE DATABASE `practicals` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `practicals`;

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dno` int(11) NOT NULL,
  `dname` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT 'New Delhi',
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `department`;
INSERT INTO `department` (`dno`, `dname`, `location`) VALUES
(10,	'accounting',	'new delhi'),
(20,	'research',	'Banglore'),
(30,	'sales',	'new delhi'),
(40,	'operations',	'Chennai');

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `eno` char(4) NOT NULL,
  `ename` varchar(50) NOT NULL,
  `job_type` varchar(50) NOT NULL,
  `manager` char(4) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `dno` int(11) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `salary` decimal(7,2) NOT NULL,
  PRIMARY KEY (`eno`),
  KEY `dno` (`dno`),
  KEY `manager` (`manager`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`manager`) REFERENCES `employee` (`eno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `employee`;
INSERT INTO `employee` (`eno`, `ename`, `job_type`, `manager`, `hire_date`, `dno`, `commission`, `salary`) VALUES
('7369',	'Smith',	'clerk',	'7902',	'1998-06-13',	20,	800.00,	24000.00),
('7499',	'Allen',	'salesman',	'7698',	'1998-08-15',	30,	3000.00,	26000.00),
('7521',	'Ward',	'salesman',	'7698',	'1996-03-26',	30,	1500.00,	20000.00),
('7566',	'Jones',	'Manager',	'7839',	'1995-10-31',	20,	0.00,	50000.00),
('7654',	'Martin',	'salesman',	'7698',	'1998-12-05',	30,	1250.00,	23000.00),
('7698',	'Blake',	'Manager',	'7839',	'1992-06-11',	30,	0.00,	48000.00),
('7782',	'Clark',	'Manager',	'7839',	'1993-05-14',	10,	0.00,	45000.00),
('7788',	'Scott',	'analyst',	'7566',	'1996-03-05',	20,	NULL,	60000.00),
('7839',	'King',	'President',	NULL,	'1990-06-09',	10,	0.00,	99999.00),
('7844',	'Turner',	'salesman',	'7698',	'1995-06-04',	30,	5000.00,	30000.00),
('7876',	'Adams',	'clerk',	'7788',	'1999-06-04',	20,	NULL,	30000.00),
('7900',	'James',	'clerk',	'7698',	'2000-06-23',	30,	NULL,	25000.00),
('7902',	'Ford',	'analyst',	'7566',	'1997-12-05',	20,	NULL,	60000.00),
('7934',	'Miller',	'clerk',	'7782',	'2000-01-21',	10,	NULL,	30000.00);

-- 2019-05-02 15:08:10
