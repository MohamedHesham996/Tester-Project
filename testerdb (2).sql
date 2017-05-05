-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2017 at 07:30 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testerdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `following`
--

CREATE TABLE `following` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `student_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `following`
--

INSERT INTO `following` (`id`, `doctor_id`, `student_name`) VALUES
(1, 1, 'mona'),
(2, 2, 'mohamed'),
(60, 2, 'abouzaid'),
(63, 2, 'mona'),
(73, 2, 'samir'),
(75, 1, 'abouzaid'),
(76, 9, 'mena'),
(77, 1, 'mena');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `submit_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `student_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `quiz_id`, `submit_id`, `doctor_id`, `student_name`) VALUES
(1, 1001, 1, 1, 'mohamed'),
(2, 1002, 2, 1, 'mohamed'),
(3, 1003, 3, 2, 'mohamed'),
(4, 1001, 4, 1, 'mona'),
(5, 1002, 5, 1, 'mona'),
(6, 1002, 6, 1, 'samir'),
(7, 1003, 7, 2, 'samir'),
(8, 1004, 8, 2, 'samir'),
(9, 1003, 9, 2, 'abouzaid'),
(10, 1004, 10, 2, 'abouzaid'),
(15, 1001, 19, 1, 'samir');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `header` text NOT NULL,
  `answer_1` varchar(100) NOT NULL,
  `answer_2` varchar(100) NOT NULL,
  `answer_3` varchar(100) DEFAULT NULL,
  `answer_4` varchar(100) DEFAULT NULL,
  `correct_answer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `quiz_id`, `header`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `correct_answer`) VALUES
(1, 1002, 'are you a gril ?', 'yes', 'no', 'sure', 'maybe', 'yes'),
(2, 1001, 'are you human ?', 'yes', 'very yes', 'no', 'sure no', 'yes'),
(3, 1003, 'Are You Carzy ?', 'yes', 'sure', 'nop', 'sorry !', 'yes'),
(4, 1001, 'how are you ?', 'fine', 'thank you', 'good', 'so good', 'so good'),
(5, 1004, 'cant you help me?', 'fine ok', 'okey', 'no no', 'nop', 'fine ok');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL,
  `quiz_name` varchar(100) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `password` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `full_mark` int(11) NOT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`quiz_id`, `quiz_name`, `doctor_id`, `password`, `date`, `full_mark`, `doctor_name`, `state`) VALUES
(1001, 'test1', 1, 2222, '2017-04-25 05:05:17', 30, 'dr.maher', ''),
(1002, 'test2', 1, NULL, '2017-04-25 05:05:20', 25, 'dr.maher', ''),
(1003, 'test3', 2, 5555, '2017-04-15 16:28:45', 40, 'dr.hazem', ''),
(1004, 'test4', 2, NULL, '2017-04-15 16:28:49', 50, 'dr.hazem', ''),
(1005, 'firstExam', 9, 555444, '2017-04-25 05:09:10', 55, 'mr.mazen\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `student_name` varchar(100) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `student_answer` varchar(100) NOT NULL,
  `question_header` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`student_name`, `quiz_id`, `student_answer`, `question_header`) VALUES
('mohamed', 1001, 'yes', 'are you human ?'),
('mohamed', 1001, 'fine', 'how are you ? '),
('mona', 1002, 'yes', 'are you a gril ?'),
('mohamed', 1002, 'no', 'are you a gril ?'),
('samir', 1001, 'yes', 'are you human ?'),
('samir', 1001, 'so good', 'how are you ?');

-- --------------------------------------------------------

--
-- Table structure for table `submits`
--

CREATE TABLE `submits` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submits`
--

INSERT INTO `submits` (`id`, `student_id`, `quiz_id`, `mark`, `time`) VALUES
(1, 3, 1001, 30, '00:08:18'),
(2, 3, 1002, 25, '00:10:10'),
(3, 3, 1003, 20, '00:08:10'),
(4, 4, 1001, 25, '00:10:00'),
(5, 4, 1002, 22, '00:10:07'),
(6, 5, 1002, 23, '00:06:06'),
(7, 5, 1003, 24, '00:14:16'),
(8, 5, 1004, 18, '00:13:10'),
(9, 6, 1003, 20, '00:10:21'),
(10, 6, 1004, 19, '00:15:14'),
(19, 5, 1001, 30, '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `birth_day` date NOT NULL,
  `country` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `image` blob,
  `university` varchar(100) NOT NULL,
  `faculty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `type`, `birth_day`, `country`, `gender`, `phone`, `image`, `university`, `faculty`) VALUES
(1, 'dr.maher', '252', 'mm@gmail.com', 'doctor', '1975-04-06', 'egypt', 'male', '021515151', NULL, 'scu', 'fci'),
(2, 'dr.hazem', '252', 'h@gmail.com', 'doctor', '1975-04-06', 'egypt', 'male', '021515151', '', 'scu', 'fci'),
(3, 'mohamed', '123', 'medo@gmail.com', 'student', '1996-08-18', 'egypt', 'male', '012022255', '', 'scu', 'fci'),
(4, 'mona', '213', 'mona@gmail.com', 'student', '1996-10-20', 'egypt', 'femal', '012000000', '', 'scu', 'fci'),
(5, 'samir', '123', 'sam@gmail.com', 'student', '1996-04-08', 'egypt', 'male', '012000000', '', 'scu', 'fci'),
(6, 'abouzaid', '55221', 'zaid@gmail.com', 'student', '1996-02-10', 'egypt', 'male', '01255221222', '', 'scu', 'fci'),
(9, 'dr.mazen', '123', 'ssh@gmail.com', 'doctor', '1975-04-06', 'egypt', 'female', '02151555', NULL, 'scu', 'fci'),
(10, 'maged', '213', 'medo@mal.com', 'admin', '1978-05-25', 'egypt', 'male', '220001111000', '', '', ''),
(223, 'mr.ahmed\n', '213', 'ah@gmail.com', 'doctor', '1980-04-06', 'egypt', 'male', '011000066', '', 'scu', 'fci'),
(224, 'maged elmasry', '2131', 'maego@hotmail.com', 'doctor', '2017-04-21', 'Austria', 'male', '0120005421151', NULL, 'suez canal university', 'computer sencie'),
(225, 'Hesham Mohamed', '213', 'hesham@gmail.com', 'doctor', '2017-04-08', 'Korea', 'female', '01221010', NULL, 'scu', 'gci'),
(226, 'mena', '123', 'mena@gmail.com', 'student', '2017-04-08', 'Korea', 'male', '01221010', NULL, 'scu', 'gci');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `following`
--
ALTER TABLE `following`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`doctor_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctor_id` (`id`) USING BTREE,
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `submit_id` (`submit_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `doctor_id` (`doctor_id`) USING BTREE;

--
-- Indexes for table `submits`
--
ALTER TABLE `submits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `following`
--
ALTER TABLE `following`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;
--
-- AUTO_INCREMENT for table `submits`
--
ALTER TABLE `submits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;