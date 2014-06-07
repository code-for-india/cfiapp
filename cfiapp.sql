-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 06, 2014 at 12:09 PM
-- Server version: 5.5.37
-- PHP Version: 5.3.10-1ubuntu3.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cfiapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint(20) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `date` varchar(1024) NOT NULL,
  `time` varchar(1024) NOT NULL,
  `venue` varchar(1024) NOT NULL,
  `max_attendees` varchar(1024) NOT NULL,
  `fb_event_id` varchar(1024) NOT NULL,
  `gplus_event_id` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(1024) NOT NULL,
  `last_name` varchar(1024) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `organization` varchar(1024) NOT NULL,
  `skills` varchar(2048) NOT NULL,
  `location` varchar(1024) NOT NULL,
  `fb_id` varchar(1024) NOT NULL,
  `linkedin_id` varchar(1024) NOT NULL,
  `github_id` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- -- mysql> show tables;
-- +-----------------------+
-- | Tables_in_cfi         |
-- +-----------------------+
-- | admindb               |
-- | ngodb                 |
-- | profiles              |
-- | project_members_db    |
-- | project_milestones_db |
-- | project_skills_db     |
-- | projectdb             |
-- +-----------------------+

-- --------------------------------------------------------

--
-- Table structure for table `Admins`
--

CREATE TABLE admindb(
  `admin_id` BIGINT NOT NULL AUTO_INCREMENT, 
  `admin_email` VARCHAR(1024) NOT NULL, 
  `admin_name` VARCHAR(1024) NOT NULL, 
  `admin_phone` VARCHAR(16), 
  PRIMARY KEY(admin_id)
);

-- describe admindb;
-- +-------------+---------------+------+-----+---------+----------------+
-- | Field       | Type          | Null | Key | Default | Extra          |
-- +-------------+---------------+------+-----+---------+----------------+
-- | admin_id    | bigint(20)    | NO   | PRI | NULL    | auto_increment |
-- | admin_email | varchar(1024) | NO   |     | NULL    |                |
-- | admin_name  | varchar(1024) | NO   |     | NULL    |                |
-- | admin_phone | varchar(16)   | YES  |     | NULL    |                |
-- +-------------+---------------+------+-----+---------+----------------+

-- --------------------------------------------------------

--
-- Table structure for table `NGO`
--

CREATE TABLE IF NOT EXISTS `ngodb` (
  `org_id` BIGINT NOT NULL AUTO_INCREMENT,
  `org_poc_email` VARCHAR(1024) NOT NULL, 
  `org_poc_name` VARCHAR(1024), 
  `org_poc_phone` VARCHAR(15), 
  PRIMARY KEY( org_id )
);

-- mysql> describe ngodb;
-- +---------------+---------------+------+-----+---------+----------------+
-- | Field         | Type          | Null | Key | Default | Extra          |
-- +---------------+---------------+------+-----+---------+----------------+
-- | org_id        | bigint(20)    | NO   | PRI | NULL    | auto_increment |
-- | org_poc_email | varchar(1000) | NO   |     | NULL    |                |
-- | org_poc_name  | varchar(1000) | YES  |     | NULL    |                |
-- | org_poc_phone | varchar(15)   | YES  |     | NULL    |                |
-- +---------------+---------------+------+-----+---------+----------------+
-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projectdb` (
  `project_id` BIGINT NOT NULL AUTO_INCREMENT, 
  `org_id` BIGINT NOT NULL, 
  `project_name` VARCHAR(1024) NOT NULL, 
  `project_description` VARCHAR(5120) NOT NULL, 
  `org_poc_email` VARCHAR(1024), 
  `org_poc_name` VARCHAR(1024), 
  `org_poc_phone` VARCHAR(16), 
  `cfi_poc_id` BIGINT NOT NULL, 
  `creation_ts` TIMESTAMP, 
  `approval_status` ENUM('NEW', 'HOLD', 'APPROVED', 'DEFUNCT') NOT NULL, 
  `project_status` ENUM('NONE', 'ACTIVE', 'COMPLETE'), 
  `wiki_link` VARCHAR(1024), 
  `github_link` VARCHAR(1024), 
  `dashboard_link` VARCHAR(1024), 
  PRIMARY KEY(project_id), 
  FOREIGN KEY(org_id) REFERENCES ngodb(org_id), 
  FOREIGN KEY(cfi_poc_id) REFERENCES admindb(admin_id)
);

-- mysql> describe projectdb;
-- +---------------------+-----------------------------------------+------+-----+-------------------+-----------------------------+
-- | Field               | Type                                    | Null | Key | Default           | Extra                       |
-- +---------------------+-----------------------------------------+------+-----+-------------------+-----------------------------+
-- | project_id          | bigint(20)                              | NO   | PRI | NULL              | auto_increment              |
-- | org_id              | bigint(20)                              | NO   | MUL | NULL              |                             |
-- | project_name        | varchar(1024)                           | NO   |     | NULL              |                             |
-- | project_description | varchar(5120)                           | NO   |     | NULL              |                             |
-- | org_poc_email       | varchar(1024)                           | YES  |     | NULL              |                             |
-- | org_poc_name        | varchar(1024)                           | YES  |     | NULL              |                             |
-- | org_poc_phone       | varchar(16)                             | YES  |     | NULL              |                             |
-- | cfi_poc_id          | bigint(20)                              | NO   | MUL | NULL              |                             |
-- | creation_ts         | timestamp                               | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
-- | approval_status     | enum('NEW','HOLD','APPROVED','DEFUNCT') | NO   |     | NULL              |                             |
-- | project_status      | enum('NONE','ACTIVE','COMPLETE')        | YES  |     | NULL              |                             |
-- | wiki_link           | varchar(1024)                           | YES  |     | NULL              |                             |
-- | github_link         | varchar(1024)                           | YES  |     | NULL              |                             |
-- | dashboard_link      | varchar(1024)                           | YES  |     | NULL              |                             |
-- +---------------------+-----------------------------------------+------+-----+-------------------+-----------------------------+
-- --------------------------------------------------------

--
-- Table structure for table `project_milestone`
--
CREATE TABLE IF NOT EXISTS `project_milestones_db` (
  `project_id` BIGINT NOT NULL, 
  `milestone_id` BIGINT NOT NULL, 
  `milestone_name` VARCHAR(1024) NOT NULL, 
  `milestone_description` VARCHAR(5120) NOT NULL,
  `duration_seconds` INT,
  PRIMARY KEY(milestone_id),
  FOREIGN KEY(project_id) REFERENCES projectdb(project_id)
);

-- mysql> describe project_milestones_db;
-- +-----------------------+---------------+------+-----+---------+-------+
-- | Field                 | Type          | Null | Key | Default | Extra |
-- +-----------------------+---------------+------+-----+---------+-------+
-- | milestone_id          | bigint(20)    | NO   | PRI | NULL    |       |
-- | project_id            | bigint(20)    | NO   | MUL | NULL    |       |
-- | milestone_name        | varchar(1024) | NO   |     | NULL    |       |
-- | milestone_description | varchar(5120) | NO   |     | NULL    |       |
-- | duration_seconds      | int(11)       | YES  |     | NULL    |       |
-- +-----------------------+---------------+------+-----+---------+-------+

-- --------------------------------------------------------

--
-- Table structure for table `project_skills`
--
CREATE TABLE IF NOT EXISTS `project_skills_db` (
  `project_id` BIGINT NOT NULL, 
  `skill` VARCHAR(1024) NOT NULL, 
  FOREIGN KEY(project_id) REFERENCES projectdb(project_id)
);

-- mysql> describe project_skills_db;
-- +------------+---------------+------+-----+---------+-------+
-- | Field      | Type          | Null | Key | Default | Extra |
-- +------------+---------------+------+-----+---------+-------+
-- | project_id | bigint(20)    | NO   | MUL | NULL    |       |
-- | skill      | varchar(1024) | NO   |     | NULL    |       |
-- +------------+---------------+------+-----+---------+-------+
-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--
CREATE TABLE IF NOT EXISTS `project_members_db` (
  `project_id` BIGINT NOT NULL, 
  `member_id` BIGINT NOT NULL, 
  FOREIGN KEY(member_id) REFERENCES profiles(id)
);

-- mysql> describe project_members_db;
-- +------------+------------+------+-----+---------+-------+
-- | Field      | Type       | Null | Key | Default | Extra |
-- +------------+------------+------+-----+---------+-------+
-- | project_id | bigint(20) | NO   |     | NULL    |       |
-- | member_id  | bigint(20) | NO   | MUL | NULL    |       |
-- +------------+------------+------+-----+---------+-------+


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
