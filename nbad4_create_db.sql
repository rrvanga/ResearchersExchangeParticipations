
drop database if exists rpnbad4;
Create database rpnbad4;
use rpnbad4;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `User`
-- ----------------------------

DROP TABLE IF EXISTS `User`;
Create Table User(
Email VARCHAR(50) NOT NULL DEFAULT '',
Password VARCHAR(50) DEFAULT NULL,
UserName VARCHAR(40) DEFAULT NULL,
Type VARCHAR(50) DEFAULT NULL,
Studies int(15) DEFAULT NULL,
Participation int(15) DEFAULT NULL,
Coins int(15) DEFAULT NULL,
Salt VARCHAR(200) DEFAULT NULL,
Token VARCHAR(100) DEFAULT NULL,
Primary key(Email)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `TempUser`
-- ----------------------------
DROP TABLE IF EXISTS `TempUser`;
create table TempUser(
UserName varchar(40) NOT NULL DEFAULT '',
Email varchar(50) DEFAULT NULL,
Password varchar(100) DEFAULT NULL,
Token varchar(100) DEFAULT NULL,
Salt varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Study`
-- ----------------------------

DROP TABLE IF EXISTS `Study`;
CREATE TABLE `Study` (
  `StudyID` varchar(40) NOT NULL DEFAULT '',
  `StudyName` varchar(40) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `CreatorEmail` VARCHAR(50) DEFAULT NULL,
  `CreatorUsername` varchar(50) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `ImageURL` varchar(300) DEFAULT NULL,
  `ReqParticipants` int(15) DEFAULT NULL,
  `ActParticipants` int(15) DEFAULT NULL,
  `AnswerType` VARCHAR(10) DEFAULT NULL,
  `SStatus` varchar(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`StudyID`),
  KEY `CreatorEmail` (`CreatorEmail`),
  CONSTRAINT `study_ibfk_1` FOREIGN KEY (`CreatorEmail`) REFERENCES `User` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Answer`
-- ----------------------------

DROP TABLE IF EXISTS `Answer`;
CREATE TABLE `Answer` (
  `StudyID` varchar(40) NOT NULL DEFAULT '',
  `QuestionID` varchar(40) NOT NULL DEFAULT '',
  `UserName` varchar(40) NOT NULL DEFAULT '',
  `Choice` varchar(40) DEFAULT NULL,
  `DateSubmitted` datetime DEFAULT NULL,
  PRIMARY KEY (`StudyID`,`QuestionID`,`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
--  Table structure for `Question`
-- ----------------------------

DROP TABLE IF EXISTS `Question`;
CREATE TABLE `Question` (
  `QuestionID`INT NOT NULL AUTO_INCREMENT,
  `StudyID` varchar(40) DEFAULT NULL,
  `Question` varchar(50) DEFAULT NULL,
  `AnswerType` varchar(10) DEFAULT NULL,
  `Option1` varchar(40) DEFAULT NULL,
  `Option2` varchar(40) DEFAULT NULL,
  `Option3` varchar(40) DEFAULT NULL,
  `Option4` varchar(40) DEFAULT NULL,
  `Option5` varchar(40) DEFAULT NULL,
  `Options` int(10) DEFAULT 3,
  PRIMARY KEY (`QuestionID`, `StudyID`),
  KEY `StudyID` (`StudyID`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`StudyID`) REFERENCES `Study` (`StudyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Reported`
-- ----------------------------

DROP TABLE IF EXISTS `Reported`;
CREATE TABLE `Reported` (
  `QuestionID` INT NOT NULL,
  `StudyID` varchar(40) NOT NULL DEFAULT '',
  `Date` datetime DEFAULT NULL,
  `NumParticipants` int(15) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `ReporterEmail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`StudyID`,`QuestionID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `reported_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  KEY `StudyID` (`StudyID`),
  CONSTRAINT `reported_ibfk_2` FOREIGN KEY (`StudyID`) REFERENCES `Study` (`StudyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Recommended`
-- ----------------------------
DROP TABLE IF EXISTS `Recommended`;

CREATE TABLE `Recommended` (
 `ID` int(5) auto_increment,
 `Email` varchar(60) NOT NULL,
 `RecommendeEmail` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `recommended_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `User` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

