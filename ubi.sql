-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 18, 2019 at 06:55 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ubi`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `title`) VALUES
(1001, 'PUBG'),
(1002, 'Call Of Duty 2'),
(1003, 'Counter Strike');

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
CREATE TABLE IF NOT EXISTS `leaderboard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  `gameID` bigint(20) NOT NULL,
  `matchTitle` varchar(100) NOT NULL,
  `kills` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaderboard`
--

INSERT INTO `leaderboard` (`id`, `userID`, `gameID`, `matchTitle`, `kills`, `points`, `createdAt`) VALUES
(1, 1, 1, 'war2019', 10, 100, '2019-10-17 04:26:37'),
(2, 2, 1, 'war2019', 4, 40, '2019-10-17 04:27:37'),
(3, 3, 1, 'match2019', 8, 80, '2019-10-17 04:28:37'),
(4, 4, 1, 'match2019', 7, 70, '2019-10-17 04:29:37'),
(5, 5, 2, 'abc', 15, 150, '2019-10-17 04:30:37'),
(6, 6, 2, 'abc', 33, 330, '2019-10-17 05:55:37'),
(7, 7, 2, 'abc', 26, 260, '2019-10-17 05:25:37'),
(8, 8, 2, 'abc', 17, 170, '2019-10-17 06:25:37'),
(9, 3, 2, 'abc', 26, 260, '2019-10-17 05:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `username`, `name`) VALUES
(1, 'jan', 'Jan'),
(2, 'ron', 'Ron'),
(3, 'rick', 'Rick'),
(4, 'john', 'John'),
(5, 'micheal', 'Micheal'),
(6, 'shon', 'Shon'),
(7, 'shenon', 'Shenon'),
(8, 'glee', 'Glee'),
(9, 'bright', 'Bright'),
(10, 'bob', 'Bob');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
