-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2019 at 12:58 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(4) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Description` text CHARACTER SET utf8 NOT NULL,
  `Ordering` int(11) NOT NULL,
  `Visability` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Comment` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Ads` tinyint(4) NOT NULL DEFAULT 0,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Description`, `Ordering`, `Visability`, `Allow_Comment`, `Allow_Ads`, `parent`) VALUES
(28, 'Toys', 'Best Mobile', 5, 0, 0, 0, 0),
(30, 'Computers', 'Best Mobile', 5, 1, 1, 1, 0),
(31, 'Clothes', '', 5, 1, 1, 0, 0),
(32, 'Tools', '', 5, 0, 0, 0, 0),
(33, 'Hand Made', 'Best Category', 2, 0, 0, 0, 0),
(34, 'Nokia', 'Good Material', 5, 0, 0, 0, 31),
(35, 'Samsung', 'Best Mobile', 2, 0, 0, 0, 33);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `stuts` tinyint(4) NOT NULL,
  `c_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`c_id`, `comment`, `stuts`, `c_date`, `item_id`, `user_id`) VALUES
(19, 'Good Ball', 0, '2019-10-23', 32, 38),
(24, 'Good Ball In Category', 0, '2019-10-27', 32, 38),
(31, 'how many back cameras?', 1, '2019-12-09', 41, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Price` varchar(255) NOT NULL,
  `Add_Date` date NOT NULL,
  `Country_Made` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Stutus` varchar(255) NOT NULL,
  `Rating` smallint(255) NOT NULL,
  `Approve` tinyint(4) NOT NULL DEFAULT 0,
  `Cat_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_ID`, `Name`, `Description`, `Price`, `Add_Date`, `Country_Made`, `Image`, `Stutus`, `Rating`, `Approve`, `Cat_ID`, `Member_ID`, `tags`) VALUES
(24, 'Ball', 'Small Boys', '30$', '2019-10-19', 'USA', '', '1', 0, 1, 28, 37, ''),
(30, 'Badges', 'Best Item In Badges', '33$', '2019-10-19', 'Egypt', '', '1', 0, 0, 32, 37, ''),
(31, 'Mic Phone', 'Best Types For Iphone And Tablets', '700$', '2019-10-19', 'Egypt', '', '1', 0, 1, 32, 38, ''),
(32, 'Ball', 'PlayStation Work All Games', '400$', '2019-10-21', 'Egypt', '', '2', 0, 1, 32, 38, ''),
(33, 'Furnture', 'Chair', '55$', '2019-10-21', 'Egypt', '', '2', 0, 1, 31, 38, ''),
(34, 'Labtop', 'Best Item In Category', '100$', '2019-10-21', 'USA', '', '1', 0, 0, 30, 38, ''),
(37, 'Game', 'Test Games', '100$', '2019-10-22', 'Egypt', '', '1', 0, 1, 32, 38, ''),
(39, 'Keyboard', 'Come From Out Side Its The Best', '200$', '2019-10-23', 'Egypt', '', '1', 0, 1, 30, 38, 'offer,carllos'),
(40, 'Water', 'Its Best Water From OutSide', '100$', '2019-10-23', 'Canda', '', '1', 0, 0, 32, 38, ''),
(41, 'Pad', '', '400$', '2019-10-24', 'Egypt', '', '1', 0, 1, 35, 37, 'Carllos'),
(42, 'Screens', 'Its Very Imagine Type', '200$', '2019-10-24', 'Egypt', '', '1', 0, 1, 30, 38, 'Kiro,discount'),
(43, 'CD Room', 'Best Type in Category', '300$', '2019-10-24', 'Egypt', '', '1', 0, 1, 30, 38, 'Carllos , Ayman,');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL COMMENT 'to identify user',
  `Username` varchar(255) NOT NULL COMMENT 'Username To Login',
  `Password` varchar(255) NOT NULL COMMENT 'Password To Login',
  `Email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `GroupID` int(11) DEFAULT 0 COMMENT 'Identify User Group',
  `TrustStutus` int(11) NOT NULL DEFAULT 0 COMMENT 'Seller Rank',
  `RegStutus` int(11) NOT NULL DEFAULT 0 COMMENT 'User Approval',
  `Date` date NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `FullName`, `GroupID`, `TrustStutus`, `RegStutus`, `Date`, `avatar`) VALUES
(1, 'Carllos', '601f1889667efaebb33b8c12572835da3f027f78', 'carlos@yahoo.com', 'El Hasoubaty', 1, 0, 1, '2019-10-01', ''),
(37, 'Amr', '9cfdf0d0541e06d19405e4d84f2a5bf17800dc3d', 'Amr1233@gamil.com', 'Amr Samy', 0, 0, 1, '2019-10-19', '2868957578522213_ddd.png'),
(38, 'Shaker', '271c5a3b655613aaf885f380b35b29a84fe884ee', 'Shaker@yahoo.com', 'Shaker Shaker', 0, 0, 1, '2019-10-20', '9448161164166625_IMG-20191019-WA0009.jpg'),
(40, 'Ahmed', 'a7ff5d4e76adcf0ab9f853d6a3a3c312cf51dd06', 'Ahmed@gamil.com', 'Ahmed Yehyia', 0, 0, 1, '2019-10-20', '2646128952354692_IMG-20191019-WA0014.jpg'),
(46, 'Amr123', '601f1889667efaebb33b8c12572835da3f027f78', 'a@a.com', 'AmrSamy', 0, 1, 1, '2019-10-19', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_ID`),
  ADD KEY `member_1` (`Member_ID`),
  ADD KEY `cat_1` (`Cat_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'to identify user', AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `cat_1` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_1` FOREIGN KEY (`Member_ID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
