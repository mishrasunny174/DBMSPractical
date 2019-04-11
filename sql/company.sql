-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `company`;
CREATE DATABASE `company` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `company`;

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DNAME` varchar(15) NOT NULL,
  `DNUMBER` int(11) NOT NULL,
  `MGR_SSN` char(9) NOT NULL,
  `MGR_START_DATE` date DEFAULT NULL,
  PRIMARY KEY (`DNUMBER`),
  UNIQUE KEY `DNAME` (`DNAME`),
  KEY `MGR_SSN` (`MGR_SSN`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MGR_SSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `department`;
INSERT INTO `department` (`DNAME`, `DNUMBER`, `MGR_SSN`, `MGR_START_DATE`) VALUES
('Headquarters',	1,	'888665555',	'1981-06-19'),
('Administration',	4,	'987654321',	'1995-01-01'),
('Research',	5,	'333445555',	'1988-05-22');

DROP TABLE IF EXISTS `dependent`;
CREATE TABLE `dependent` (
  `ESSN` char(9) NOT NULL,
  `DEPENDENT_NAME` varchar(15) NOT NULL,
  `SEX` char(1) DEFAULT NULL,
  `BDATE` date DEFAULT NULL,
  `RELATIONSHIP` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`DEPENDENT_NAME`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `dependent`;
INSERT INTO `dependent` (`ESSN`, `DEPENDENT_NAME`, `SEX`, `BDATE`, `RELATIONSHIP`) VALUES
('123456789',	'Alice',	'F',	'1988-12-30',	'Daughter'),
('123456789',	'Elizabeth',	'F',	'1967-05-05',	'Spouse'),
('123456789',	'Michael',	'M',	'1988-12-30',	'Daughter'),
('333445555',	'Alice',	'F',	'1986-04-05',	'Daughter'),
('333445555',	'Joy',	'F',	'1958-05-03',	'Spouse'),
('333445555',	'Theodore',	'M',	'1958-10-25',	'Son'),
('987654321',	'Abner',	'M',	'1942-02-28',	'Spouse');

DROP TABLE IF EXISTS `dept_locations`;
CREATE TABLE `dept_locations` (
  `DNUMBER` int(11) NOT NULL,
  `DLOCATION` varchar(15) NOT NULL,
  PRIMARY KEY (`DNUMBER`,`DLOCATION`),
  CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`DNUMBER`) REFERENCES `department` (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `dept_locations`;
INSERT INTO `dept_locations` (`DNUMBER`, `DLOCATION`) VALUES
(1,	'Houstan'),
(4,	'Stafford'),
(5,	'Bellaire'),
(5,	'Houstan'),
(5,	'Sugarland');

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `FNAME` varchar(15) NOT NULL,
  `MINIT` char(1) DEFAULT NULL,
  `LNAME` varchar(15) NOT NULL,
  `SSN` char(9) NOT NULL,
  `BDATE` date DEFAULT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  `SUPER_SSN` char(9) DEFAULT NULL,
  `DNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `employee`;
INSERT INTO `employee` (`FNAME`, `MINIT`, `LNAME`, `SSN`, `BDATE`, `ADDRESS`, `SEX`, `SALARY`, `SUPER_SSN`, `DNO`) VALUES
('John',	'B',	'Smith',	'123456789',	'1965-01-09',	'731 Fondren, Houstan, TX',	'M',	30000.00,	'333445555',	5),
('Franklin',	'T',	'Wong',	'333445555',	'1955-12-08',	'638 Voss, Houston, TX',	'M',	40000.00,	'888665555',	5),
('Joyce',	'A',	'English',	'453453453',	'1972-07-31',	'5631 Rice, Houstan, TX',	'F',	25000.00,	'333445555',	5),
('Ramesh',	'K',	'Narayan',	'666884444',	'1962-09-15',	'975 Fire Oak, Humble, TX',	'M',	38000.00,	'333445555',	5),
('James',	'E',	'Borg',	'888665555',	'1937-11-10',	'450 Stone, Houstan, TX',	'M',	55000.00,	NULL,	1),
('Jennifer',	'S',	'Wallace',	'987654321',	'1941-06-20',	'291 Berry, Bellaire, TX',	'F',	43000.00,	'888665555',	4),
('Ahmad',	'V',	'Jabbar',	'987987987',	'1969-03-29',	'980 Dallas, Houstan, TX',	'M',	25000.00,	'987654321',	4),
('Alicia',	'J',	'Zelaya',	'999887777',	'1968-01-19',	'3321 Castle, Spring, TX',	'F',	25000.00,	'987654321',	4);

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `PNAME` varchar(15) NOT NULL,
  `PNUMBER` int(11) NOT NULL,
  `PLOCATION` varchar(15) DEFAULT NULL,
  `DNUM` int(11) NOT NULL,
  PRIMARY KEY (`PNUMBER`),
  UNIQUE KEY `PNAME` (`PNAME`),
  KEY `DNUM` (`DNUM`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNUM`) REFERENCES `department` (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `project`;
INSERT INTO `project` (`PNAME`, `PNUMBER`, `PLOCATION`, `DNUM`) VALUES
('ProductX',	1,	'Bellaire',	5),
('ProductY',	2,	'Sugarland',	5),
('ProductZ',	3,	'Houstan',	5),
('Computerization',	10,	'Stafford',	4),
('Reorganizations',	20,	'Houstan',	1),
('Newbenefits',	30,	'Stafford',	4);

DROP TABLE IF EXISTS `works_on`;
CREATE TABLE `works_on` (
  `ESSN` char(9) NOT NULL,
  `PNO` int(11) NOT NULL,
  `HOURS` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`PNO`),
  KEY `PNO` (`PNO`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`PNO`) REFERENCES `project` (`PNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `works_on`;
INSERT INTO `works_on` (`ESSN`, `PNO`, `HOURS`) VALUES
('123456789',	1,	32.5),
('123456789',	2,	7.5),
('333445555',	2,	10.0),
('333445555',	3,	10.0),
('333445555',	10,	10.0),
('333445555',	20,	10.0),
('453453453',	1,	20.0),
('453453453',	2,	20.0),
('666884444',	3,	40.0),
('888665555',	20,	NULL),
('987654321',	20,	15.0),
('987654321',	30,	20.0),
('987987987',	10,	35.0),
('987987987',	30,	5.0),
('999887777',	10,	10.0),
('999887777',	30,	30.0);

-- 2019-04-11 12:41:54
