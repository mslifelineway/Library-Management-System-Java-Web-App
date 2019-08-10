-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 12:39 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cits_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `username` text NOT NULL,
  `contact_no` text NOT NULL,
  `image` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `username`, `contact_no`, `image`, `reg_date`) VALUES
(3, 'mukesh', 'mukeshms40003@gmail.com', 'mukesh@123', 'mukesh', '7015720216', 'default.png', '2019-03-25 12:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` bigint(20) NOT NULL,
  `admin_id` bigint(20) NOT NULL,
  `book_name` text NOT NULL,
  `author_name` text NOT NULL,
  `edition` int(11) NOT NULL,
  `department_name` int(11) NOT NULL,
  `total_books` bigint(20) NOT NULL,
  `book_added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `admin_id`, `book_name`, `author_name`, `edition`, `department_name`, `total_books`, `book_added_date`) VALUES
(14, 3, 'Surveying Vol-1', 'Dr. B.C. Punmia', 16, 4, 20, '2019-03-25 20:55:54'),
(15, 3, 'C-PROGRAMMING', 'Ansi c', 6, 1, 10, '2019-03-25 17:05:44'),
(16, 3, 'Engineering Mathematics', 'B.M Sharma', 8, 0, 4, '2019-03-25 17:07:56'),
(17, 3, 'ENVIRONMENTAL SCIENCE', 'A.S Reddy', 7, 0, 16, '2019-03-25 23:16:27'),
(18, 3, 'Operating System', 'Lemon Deepak Jha', 21, 1, 6, '2019-03-27 16:47:56'),
(19, 3, 'MPI', 'Ramya', 6, 1, 4, '2019-03-28 09:18:36'),
(20, 3, 'css', 'mukesh', 15, 1, 4, '2019-03-28 10:05:44'),
(21, 3, 'asdf', 'as', 5, 1, 3, '2019-04-18 15:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `book_numbers`
--

CREATE TABLE `book_numbers` (
  `book_number_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `admin_id` bigint(20) NOT NULL,
  `book_number` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_numbers`
--

INSERT INTO `book_numbers` (`book_number_id`, `book_id`, `admin_id`, `book_number`) VALUES
(25, 14, 3, 6329),
(26, 14, 3, 6230),
(27, 14, 3, 6331),
(28, 14, 3, 6332),
(29, 14, 3, 6333),
(30, 14, 3, 6334),
(31, 14, 3, 6335),
(32, 14, 3, 6336),
(33, 14, 3, 6337),
(34, 14, 3, 6338),
(35, 14, 3, 6339),
(36, 14, 3, 6340),
(37, 14, 3, 6341),
(38, 14, 3, 6342),
(39, 14, 3, 6343),
(40, 14, 3, 6344),
(41, 14, 3, 6345),
(42, 14, 3, 6346),
(43, 14, 3, 6348),
(44, 14, 3, 6349),
(45, 15, 3, 1001),
(46, 15, 3, 1002),
(47, 15, 3, 1003),
(48, 15, 3, 1004),
(49, 15, 3, 1005),
(50, 15, 3, 1006),
(51, 15, 3, 1007),
(52, 15, 3, 1008),
(53, 15, 3, 1009),
(54, 15, 3, 1010),
(55, 16, 3, 5001),
(56, 16, 3, 5002),
(57, 16, 3, 5003),
(58, 16, 3, 5004),
(59, 17, 3, 2000),
(60, 17, 3, 2001),
(61, 17, 3, 2002),
(62, 17, 3, 2003),
(63, 17, 3, 2004),
(64, 17, 3, 2005),
(65, 17, 3, 2006),
(66, 17, 3, 2007),
(67, 17, 3, 2008),
(68, 17, 3, 2009),
(69, 17, 3, 2010),
(70, 17, 3, 2011),
(71, 17, 3, 2012),
(72, 17, 3, 2013),
(73, 17, 3, 2014),
(74, 17, 3, 2015),
(75, 18, 3, 8001),
(76, 18, 3, 8002),
(77, 18, 3, 8003),
(78, 18, 3, 8004),
(79, 18, 3, 8005),
(80, 18, 3, 8006),
(81, 19, 3, 5007),
(82, 19, 3, 5008),
(83, 19, 3, 80014),
(84, 19, 3, 8008),
(85, 20, 3, 51682),
(86, 20, 3, 42841),
(87, 20, 3, 15642),
(88, 20, 3, 48452),
(89, 21, 3, 444444),
(90, 21, 3, 101055),
(91, 21, 3, 634944);

-- --------------------------------------------------------

--
-- Table structure for table `issue_book`
--

CREATE TABLE `issue_book` (
  `issued_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `admin_id` bigint(20) NOT NULL,
  `book_number` bigint(11) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `status` int(2) NOT NULL,
  `issued_date` text NOT NULL,
  `returned_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue_book`
--

INSERT INTO `issue_book` (`issued_id`, `book_id`, `admin_id`, `book_number`, `student_id`, `status`, `issued_date`, `returned_date`) VALUES
(33, 16, 3, 5001, 1, 2, '', '01/04/2019 16:15:55'),
(34, 16, 3, 5001, 1, 1, '01/04/2019 16:21:14', ''),
(35, 17, 3, 2000, 1, 2, '', '01/04/2019 16:23:34'),
(36, 18, 3, 8001, 1, 1, '01/04/2019 16:23:48', ''),
(37, 19, 3, 5007, 1, 1, '01/04/2019 16:24:24', ''),
(38, 14, 3, 6329, 1, 1, '01/04/2019 16:24:46', ''),
(39, 15, 3, 1001, 2, 1, '01/04/2019 17:58:51', ''),
(40, 21, 3, 444444, 5, 1, '18/04/2019 20:34:41', ''),
(41, 21, 3, 101055, 2, 2, '18/04/2019 20:35:54', '');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `s_id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `admission_no` varchar(10) NOT NULL,
  `hall_ticket_no` varchar(15) NOT NULL,
  `course` int(3) NOT NULL,
  `year` int(3) NOT NULL,
  `sem` int(3) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `password` text NOT NULL,
  `var_code` varchar(6) NOT NULL,
  `status` int(3) NOT NULL,
  `profile_image` varchar(100) NOT NULL,
  `birth_date` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`s_id`, `name`, `admission_no`, `hall_ticket_no`, `course`, `year`, `sem`, `contact_no`, `password`, `var_code`, `status`, `profile_image`, `birth_date`, `reg_date`) VALUES
(1, 'Mukesh Kumar', 'E16356', '16493T0956', 1, 4, 1, 7015720216, 'mukesh@123', '933422', 2, '1_439507.png', '18/December/1998', '2019-05-11 06:52:12'),
(2, 'M Kumar', 'E16357', '16443T0947', 2, 2, 1, 902999383, 'mukesh@123', '704072', 2, 'default.png', '04/06/1999', '2019-03-31 22:47:34'),
(4, 'Deepak Jha', 'E16353', '16493T0953', 0, 0, 0, 7993882273, 'deepak@jhs', '725136', 1, 'default.png', '16/July/1980', '2019-03-31 19:27:30'),
(5, 'Ans Irfan', 'E16355', '', 1, 3, 2, 7981784872, 'irfan@55', '424246', 1, 'default.png', '24/May/1997', '2019-05-11 06:45:51'),
(6, 'T. Akhila Reddy', 'E16326', '16493T0926', 1, 4, 1, 9100352356, 'akhila@26', '280254', 2, '6_856675.png', '2/April/1998', '2019-05-11 06:52:08'),
(7, 'Ramya', 'E16369', '', 0, 0, 0, 8000544145, 'ramya@1', '318852', 1, 'default.png', '16/July/2019', '2019-05-04 10:17:13'),
(8, 'viay', 'v123456', '16493T0999', 1, 3, 1, 1231231231, 'vijay@1', '729695', 2, 'default.png', '19/December/1999', '2019-05-11 06:46:23'),
(9, 'B. Hemanth Nayak', 'e16351', '16493T0951', 1, 4, 1, 8895869569, 'bhemanth', '838446', 3, '9_966010.png', '20/August/1997', '2019-05-10 22:30:41'),
(10, 'Rakesh Jackson', 'E16334', '16493T0934', 1, 4, 1, 7674956960, 'rakesh@1', '389410', 3, '10_994220.png', '8/September/1998', '2019-05-11 10:08:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `book_numbers`
--
ALTER TABLE `book_numbers`
  ADD PRIMARY KEY (`book_number_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `book_number` (`book_number`);

--
-- Indexes for table `issue_book`
--
ALTER TABLE `issue_book`
  ADD PRIMARY KEY (`issued_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `book_number` (`book_number`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `book_numbers`
--
ALTER TABLE `book_numbers`
  MODIFY `book_number_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `issue_book`
--
ALTER TABLE `issue_book`
  MODIFY `issued_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `s_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_numbers`
--
ALTER TABLE `book_numbers`
  ADD CONSTRAINT `book_numbers_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_numbers_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issue_book`
--
ALTER TABLE `issue_book`
  ADD CONSTRAINT `issue_book_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issue_book_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issue_book_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `students` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issue_book_ibfk_5` FOREIGN KEY (`book_number`) REFERENCES `book_numbers` (`book_number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
