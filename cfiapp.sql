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

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `desc` varchar(5120) NOT NULL,
  `milestones` varchar(5120) NOT NULL,
  `cfi_poc` varchar(1024) NOT NULL,
  `ngo_partner` varchar(1024) NOT NULL,
  `ngo_poc` varchar(1024) NOT NULL,
  `members` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `NGO`
--

CREATE TABLE IF NOT EXISTS `ngodb` (
  `org_id` bigint NOT NULL AUTO_INCREMENT,
  `org_poc_email` VARCHAR(1024) NOT NULL, 
  `org_poc_name` VARCHAR(1024), 
  `org_poc_phone` VARCHAR(15), 
  PRIMARY KEY( org_id )
);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
