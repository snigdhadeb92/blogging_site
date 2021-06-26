-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2021 at 06:40 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `msg` varchar(120) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(28, 'kushal ash', 'snigdho.ash@gmail.com', '9800075278', 'This is a test message.', '2021-05-18 21:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `img_file` varchar(30) NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `slug`, `content`, `img_file`, `date`) VALUES
(3, 'Netaji Subhas Chandra Bose', 'Netaji Subhas_Chandra_Bose', 'Subhas Chandra Bose, byname Netaji (Hindi: “Respected Leader”), (born c. January 23, 1897, Cuttack, Orissa [now Odisha], India—died August 18, 1945, Taipei, Taiwan?), Indian revolutionary prominent in the independence movement against British rule of India. He also led an Indian national force from abroad against the Western powers during World War II. He was a contemporary of Mohandas K. Gandhi, at times an ally and at other times an adversary. Bose was known in particular for his militant approach to independence and for his push for socialist policies.The son of a wealthy and prominent Bengali lawyer, Bose studied at Presidency College, Calcutta (Kolkata), from which he was expelled in 1916 for nationalist activities, and the Scottish Churches College (graduating in 1919). He then was sent by his parents to the University of Cambridge in England to prepare for the Indian Civil Service. In 1920 he passed the civil service examination, but in April 1921, after hearing of the nationalist turmoils in India, he resigned his candidacy and hurried back to India. ', 'netaji.jpeg', '2021-05-08 00:00:00.000000'),
(4, 'The City Of Joy', 'city_of_joy_kolkata', 'Kolkata, Bengali Kalikata, formerly Calcutta, city, capital of West Bengal state, and former capital (1772–1911) of British India. It is one of India’s largest cities and one of its major ports. The city is centred on the east bank of the Hugli (Hooghly) River, once the main channel of the Ganges (Ganga) River, about 96 miles (154 km) upstream from the head of the Bay of Bengal; there the port city developed as a point of transshipment from water to land and from river to sea. A city of commerce, transport, and manufacture, Kolkata is the dominant urban center of eastern India.', 'kolkata.jpg', '2021-05-08 00:00:00.000000'),
(5, 'Histotry Of Howrah Bridge', 'history_of_howrah_bridge', 'The Howrah Bridge is one of the most recognized landmarks in Kolkata. Connecting Kolkata with its neighboring industrial city of Howrah over the Hooghly river, the bridge will celebrate its 75th birthday next year.\r\nThe construction of the Howrah Bridge was first proposed in 1862. The Government of Bengal wanted to build a bridge over the Hooghly River. They asked the Chief Engineer of the East India Railway Company to study the feasibility of the idea and come up with a proposal. But for several reasons, his proposal never materialized.\r\nLater in the 1800s, a pontoon bridge or floating bridge was built between Howrah and Kolkata. But it wasn’t strong enough to handle the huge traffic between the two cities or to weather the frequent storms in the area. So the Bengal government continued to look for alternatives and, several decades later, the new bridge was finally commissioned. The contract to build it was awarded to a company called The Braithwaite Burn and Jessop Construction Company.\r\nConstructed without nuts and bolts, the Howrah Bridge was formed by riveting the entire steel structure. The bridge officially opened in 1943 when it was the world’s third-longest cantilever bridge. Today, it is the sixth-longest bridge of its type in the world.', 'howrahBridge.jpg', '2021-05-11 15:32:42.046569'),
(7, 'Battles of Panipat', 'Battles_of_Panipat', 'Battles of Panipat, (1526, 1556, 1761), three military engagements, important in the history of northern India, fought at Panipat, a level plain suitable for cavalry movements, about 50 miles (80 km) north of Delhi.\r\nFirst Battle of Panipat (1526)\r\nAn overwhelmingly outnumbered Mughal force prevailed at Panipat. This was due to the resourcefulness of its commander, Babur, demonstrated in his use of field fortifications and his instinctive sense of the value of the firepower of gunpowder. The victory enabled him to lay the foundations for the Indian Mughal Empire.\r\nA descendant of Timur, Babur became a refugee at the age of twelve when the Uzbeks seized Samarkand in 1494. At age fifteen he was back with his own Warband. He laid siege to his home city, but without success. Undaunted, he headed south into Afghanistan. Capturing Kabul in 1504, he made it his base for raids into Central Asia’s Transoxania region. Increasingly, however, he found himself tempted by the unimaginable wealth of India. In the years that followed, he mounted a series of incursions into Punjab.', 'maxresdefault.jpg', '2021-05-11 17:09:33.406020'),
(11, 'A brief introduction to popular cinema in Bengal', 'a_brief_introduction_to_popular_cinema_in_bengal', 'The idea of ‘Bengali’ cinema, we would like to argue, became forceful with the advent of sync sound in India; simultaneously, subjects of language and nation became significant within the debates on cinema and its making.1 Prior to this, as evident from silent films like Jamai Babu/The Brother-in-law (Dir. Kalipada Das, 1931) as well as from the Indian Cinematograph Committee Report (1927–1928) and articles and advertisements published in popular magazines of the period, intertitles of films produced from Bengal, rather Calcutta, included multiple languages like English, Hindi, Urdu, Gujarati, and Bengali. Clearly, such films were circulating across northern, western, and eastern territories of British India. Besides, the scene was intercepted by popular films from Hollywood. The notion of ‘Bengali’ language cinema and its materialization thus, had to have contended, explored, and achieved through a technology and form(s), which were being tried and tested during the late 1920s and early 1930s.2 The formation of the big studios in the early 1930s, investments in (sound) technology, and the involvement of eminent authors, playwrights, distinguished actors and performers, musicians, as well as of the iconic literary, and cultural figurehead Rabindranath Tagore, marked the beginning a self-conscious positioning of ‘Bengali-ness’ (and the Maha-jati/noble community) in cinema, which was coextensive with the cultural and political discourses of the late nineteenth and early twentieth centuries.3 Indeed, the notion of a definable and ‘respectable’ cinematic form, dealing with bhadralok cultural practices and refined bhasa (language), became pivotal in popular discourses on cinema during the 1930s and continued persuasively unto the 1960s through the Film Society publications.4', 'Harano.jpg', '2021-05-18 20:12:54.038313');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
