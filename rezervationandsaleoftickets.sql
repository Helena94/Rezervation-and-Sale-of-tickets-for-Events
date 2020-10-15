-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2020 at 06:53 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rezervationandsaleoftickets`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `description` text NOT NULL,
  `picture` text DEFAULT NULL,
  `video` text DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `date_time`, `description`, `picture`, `video`, `location_id`) VALUES
(1, 'Bajaga', '2020-10-03 18:30:00', 'Bajaga', 'https://www.bajaga.com/pics/bajaga-bg.jpg', 'https://www.youtube.com/embed/H2cr1cBgQbI', 2),
(2, 'Dani Sireva', '2020-09-26 09:11:10', 'Probajte razne sireve kako domacih tako i stranih', NULL, NULL, 2),
(3, 'pasteventtest ', '2020-06-08 16:43:47', 'pasteventtest', NULL, NULL, 4),
(4, 'pastevent2', '2020-01-23 12:27:19', 'pasteevent2 description', NULL, NULL, 5),
(5, 'event', '2021-04-21 18:00:00', 'event description', NULL, NULL, 5),
(6, 'Dani Vina', '2020-11-05 12:22:59', 'Probajte i kupite najbolja vina', NULL, NULL, 2),
(7, 'Dani čokolade', '2021-01-23 12:27:19', 'Čokolada svuda', NULL, NULL, 2),
(8, 'Event2', '2020-09-26 13:57:48', 'event 2 description', NULL, NULL, 4),
(10, 'Event3', '2020-09-13 08:11:53', 'Event3 description', 'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg', NULL, 6),
(11, 'Ajde event', '2020-09-14 09:41:05', 'Ajtext2de event description', NULL, 'https://www.youtube.com/embed/FFfGeFrfAbw', 6),
(16, 'Event4', '2020-10-23 10:37:00', 'Event4 description', '', 'https://www.youtube.com/embed/9NTrwrfI-X4', 2),
(17, 'Event5 ', '2020-10-10 19:32:00', 'Event5 description ', '', '', 2),
(18, 'Event6', '2020-09-26 18:33:00', 'Event6 description ', '', '', 2),
(19, 'Event7', '2020-11-28 19:50:00', 'Event7 description ', '', '', 2),
(20, 'Event 13', '2020-09-26 00:03:00', 'Event 13', '', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `title`, `address`, `city`) VALUES
(1, 'Štark Arena', 'Bulevar Arsenije Čarnojevića 58', 'Beograd'),
(2, 'Dom Omladine', 'Makendonska 22', 'Beograd'),
(3, 'locationtest', 'location adress 1', 'locationtest'),
(4, 'locationtest2', 'locationtest2 address 3', 'locationtest2'),
(5, 'KC Grad', 'Braće Krsmanović 4', 'Beograd'),
(6, 'locationtest4', 'locationtest4 address 91', 'locationtest4');

-- --------------------------------------------------------

--
-- Table structure for table `rezervations`
--

CREATE TABLE `rezervations` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticked_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `number_of_tickeds` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `tickets_purchached` enum('True','False') NOT NULL DEFAULT 'False',
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rezervations`
--

INSERT INTO `rezervations` (`id`, `ticked_id`, `user_id`, `number_of_tickeds`, `date_time`, `tickets_purchached`, `price`) VALUES
(1, 4, 2, 5, '2020-09-07 14:36:30', 'True', 2500),
(2, 4, 2, 3, '2020-08-20 14:38:38', 'False', 1800),
(3, 6, 9, 3, '2020-05-11 19:14:30', 'True', 2100),
(4, 9, 7, 4, '2020-05-20 19:14:30', 'False', 1000),
(5, 10, 2, 10, '2019-12-19 20:23:40', 'True', 10000),
(12, 5, 5, 3, '2020-09-20 13:03:26', 'False', 1800),
(13, 27, 5, 4, '2020-09-20 14:31:24', 'False', 4000),
(14, 27, 5, 4, '2020-09-20 14:33:49', 'False', 4000),
(15, 5, 2, 6, '2020-09-22 10:17:02', 'False', 3600),
(18, 7, 2, 1, '2020-05-29 23:52:01', 'True', 300),
(19, 29, 2, 4, '2020-09-23 20:34:43', 'False', 2000),
(20, 29, 2, 5, '2020-09-24 16:52:51', 'False', 2500);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `number_of_tickets` int(10) UNSIGNED NOT NULL,
  `number_of_rezerved_tickets` int(10) UNSIGNED NOT NULL,
  `max_rezerved_tickets_per_person` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `event_id`, `category`, `price`, `number_of_tickets`, `number_of_rezerved_tickets`, `max_rezerved_tickets_per_person`) VALUES
(1, 1, 'Severno', 800, 700, 700, 10),
(2, 1, 'Istok', 1000, 400, 100, 10),
(3, 1, 'Zapad', 1000, 400, 230, 10),
(4, 1, 'fanpit', 500, 2000, 1219, 10),
(5, 2, 'fanpit', 600, 4000, 2457, 10),
(6, 3, 'ticketstest east', 700, 1000, 340, 10),
(7, 3, 'ticketstest west', 700, 1000, 456, 10),
(8, 3, 'tickedtest south', 500, 2000, 1386, 20),
(9, 3, 'fanpit', 250, 3000, 2356, 20),
(10, 4, 'fanpit', 1000, 4000, 2677, 10),
(11, 5, 'left columns', 1500, 400, 230, 5),
(12, 5, 'right columns', 1500, 400, 334, 5),
(13, 5, 'fanpit', 800, 700, 350, 10),
(14, 1, 'sdvf', 1213, 122, 0, 12),
(17, 5, 'fanpit', 800, 700, 350, 10),
(18, 5, 'AJde', 800, 700, 350, 10),
(24, 1, 'asdsd', 200, 122, 0, 3),
(25, 1, 'ffffff', 111, 1111, 0, 12),
(26, 16, 'sdvf', 1213, 122, 0, 12),
(27, 16, 'sdvf33', 1000, 120, 120, 5),
(28, 18, 'fanpit', 200, 122, 2, 12),
(29, 19, 'fanpit', 500, 500, 11, 5),
(30, 20, 'fanpit', 200, 800, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `active` enum('True','False') NOT NULL,
  `role` enum('regular','admin','treasurer') NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `email`, `active`, `role`, `location_id`) VALUES
(2, 'Jelena', 'Jovanocic', 'helenkeler', 'helenkeler', 'jjjovanovic94@gmail.com', 'True', 'regular', NULL),
(4, 'firstnametest', 'lastnametest', 'usernametest', 'Passwordtest1#', 'usernametest@gmail.com', 'True', 'regular', NULL),
(5, 'firstnametest2', 'lastnametest2', 'usernametest2', 'passwordtest2', 'usernametest2@gmail.com', 'True', 'regular', NULL),
(6, 'firstnametest3', 'lastnametest3', 'usernametest3', 'passwordtest3', 'usernametest3@gmail.com', 'True', 'regular', NULL),
(7, 'firstnametest4', 'lastnametest4', 'usernametest4', 'passwordtest4', 'usernametest4@gmail.com', 'True', 'regular', NULL),
(8, 'firstnametest5', 'lastnametest5', 'usernametest5', 'passwordtest5', 'usernametest5@gmail.com', 'True', 'regular', NULL),
(9, 'firstnametest6', 'lastnametest6', 'usernametest6', 'passwordtest6', 'usernametest6@yahoo.com', 'True', 'treasurer', 1),
(10, 'firstnametest7', 'lastnametest7', 'usernametest7', 'passwordtest7', 'usernametest7@gmail.com', 'True', 'treasurer', 2),
(11, 'firstnameadmintest', 'lastnameadmintest', 'usernameadmintest', 'passwordadmintest', 'usernameadmintest@microsoft.com', 'True', 'admin', NULL),
(14, 'firstnametest8', 'lastnametest8', 'usernametest8', 'passwordtest8', 'emailtest8@gmail.com', 'False', 'treasurer', 5),
(16, 'Jelena', 'Jovanovic', 'pantelija943', '#Pantelija943', 'jjjovanovic93@gmail.com', 'False', 'regular', NULL),
(17, 'ajde', 'ajde', 'ajde', 'Ajdeajde94#', 'ajde@gmail.com', 'False', 'regular', NULL),
(18, 'test1', 'test1', 'test1', '#Testtest1', 'test1@ajde.com', 'True', 'treasurer', 4),
(19, 'ajdetest', 'ajdetest', 'ajdetest ', '#Ajdetest94', 'ajdetest', 'False', 'regular', NULL),
(20, 'hajde', 'hajde', 'hajde', '#Hajde943', 'hajde@nesto.com', 'False', 'regular', NULL),
(21, 'danas', 'danas', 'danas', 'Danas943#', 'danas@gmail.com', 'False', 'regular', NULL),
(22, 'firstname1', 'lastname1', 'username', 'Password1#', 'email1@email.com', 'False', 'admin', NULL),
(23, 'test2', 'test2', 'test2', 'Test2#943', 'test2@test2.com', 'True', 'treasurer', 1),
(24, 'test3', 'test3', 'test3', '#Test3943', 'test3@test3.com', 'True', 'admin', NULL),
(25, 'ajdetest1', 'ajdetest2', 'ajdetest2', 'Ajdetest2#', 'ajdetest2@gmail.com', 'False', 'regular', NULL),
(26, 'ajdetest3', 'ajdetest3', 'ajdetest3', 'AJdetest3#', 'ajdetest3@mail.com', 'False', 'regular', NULL),
(27, 'Jelena', 'Jovanovic', 'helenkeler1', 'Helenkeler1#', 'jjjovanovic98@gmail.com', 'False', 'regular', NULL),
(28, 'test4', 'test4', 'test4', 'Test4#943', 'test4@test4.com', 'True', 'regular', NULL),
(30, 'firstnametest9', 'lastnametest9', 'usernametest9', 'passwordtest9', 'emailtest9@gmail.com', 'False', 'treasurer', 5),
(31, 'molimte2', 'molimte2', 'molimte2', 'Molimte2#', 'molimte2@gmail.com', 'True', 'regular', NULL),
(32, 'Jelena', 'Jovanovic', 'helenkeler3', 'Helenkeler3#', 'jjjovanovic941@gmail.com', 'True', 'regular', NULL),
(33, 'Jelena', 'Jovanovic', 'helenkeler2', 'Helenkeler2#', 'jjjovanovic3@gmail.com', 'True', 'regular', NULL),
(34, 'Jelena', 'Jovanovic', 'jjjovanovic8', 'Jovanovic1#', 'jjjovanovic8@gmail.com', 'True', 'regular', NULL),
(35, 'firstnameadmintest2', 'lastnameadmintest2', 'usernameadmintest2', 'Passwordadmintest2#', 'emailadmintest2@email.com', 'True', 'admin', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id2` (`location_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rezervations`
--
ALTER TABLE `rezervations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ticked_id` (`ticked_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `password` (`password`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `location_id` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rezervations`
--
ALTER TABLE `rezervations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `location_id2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rezervations`
--
ALTER TABLE `rezervations`
  ADD CONSTRAINT `ticked_id` FOREIGN KEY (`ticked_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `location_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
