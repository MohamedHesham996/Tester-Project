-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2017 at 08:00 PM
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
(75, 1, 'abouzaid'),
(76, 9, 'mena'),
(77, 1, 'mena'),
(80, 9, 'samir');

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
(4, 1001, 4, 1, 'mona'),
(5, 1002, 5, 1, 'mona'),
(16, 1001, 20, 1, 'mena'),
(20, 1002, 51, 1, 'samir'),
(21, 1005, 52, 9, 'samir');

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
(4, 1001, 'how are you ?', 'fine', 'thank you', 'good', 'so good', 'so good'),
(133, 1005, 'sum 5 + 5 ?', '10', '15', '20', '25', '10'),
(135, 1008, 'How Are You ?', 'asdasdd', 'asdasdsad', 'asdasdasd', 'asdasd', 'asdasdd');

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
  `state` varchar(20) DEFAULT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`quiz_id`, `quiz_name`, `doctor_id`, `password`, `date`, `full_mark`, `doctor_name`, `state`, `time`) VALUES
(1001, 'test1', 1, NULL, '2017-05-09 00:15:52', 25, 'dr.maher', 'opened', '00:10:00'),
(1002, 'test2', 1, 2525, '2017-05-08 18:16:08', 25, 'dr.maher', 'opened', '00:00:00'),
(1006, 'math', 1, 555444, '2017-05-08 18:16:08', 20, 'mr.mazen\r\n', 'opened', '00:00:00'),
(1008, 'H', 2, 123, '2017-05-09 08:12:35', 30, 'dr.hazem', 'opened', '00:00:00'),
(1009, '', 0, NULL, '2017-05-09 15:24:14', 0, '', 'dr.hazem', '00:00:00'),
(1010, '', 0, NULL, '2017-05-09 15:24:55', 0, '', 'dr.hazem', '00:00:00');

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
('mena', 1001, 'very yes', 'are you human ?'),
('mena', 1001, 'so good', 'how are you ?'),
('samir', 1002, 'no', 'are you a gril ?'),
('samir', 1005, '10', 'sum 5 + 5 ?');

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
(4, 4, 1001, 25, '00:10:00'),
(5, 4, 1002, 22, '00:10:07'),
(20, 226, 1001, 15, '00:00:00'),
(51, 5, 1002, 0, '00:00:00'),
(52, 5, 1005, 55, '00:00:00');

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
  `image` longblob,
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
(223, 'mr.ahmed', '213', 'ah@gmail.com', 'doctor', '1980-04-06', 'egypt', 'male', '011000066', '', 'scu', 'fci'),
(224, 'maged elmasry', '2131', 'maego@hotmail.com', 'doctor', '2017-04-21', 'Austria', 'male', '0120005421151', NULL, 'suez canal university', 'computer sencie'),
(225, 'Hesham Mohamed', '213', 'hesham@gmail.com', 'doctor', '2017-04-08', 'Korea', 'female', '01221010', NULL, 'scu', 'gci'),
(226, 'mena', '123', 'mena@gmail.com', 'student', '2017-04-08', 'Korea', 'male', '01221010', NULL, 'scu', 'gci');
INSERT INTO `users` (`id`, `username`, `password`, `email`, `type`, `birth_day`, `country`, `gender`, `phone`, `image`, `university`, `faculty`) VALUES
INSERT INTO `users` (`id`, `username`, `password`, `email`, `type`, `birth_day`, `country`, `gender`, `phone`, `image`, `university`, `faculty`) VALUES
INSERT INTO `users` (`id`, `username`, `password`, `email`, `type`, `birth_day`, `country`, `gender`, `phone`, `image`, `university`, `faculty`) VALUES
(236, 'ahmed_ahmed', '123', 'ahmeddksjahdksa@dsjabkd', '', '0000-00-00', 'Lebanon', '', '', '', '', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;
--
-- AUTO_INCREMENT for table `submits`
--
ALTER TABLE `submits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;