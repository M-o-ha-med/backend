-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 07:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectpaw`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `bookingID` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `userID` bigint(20) NOT NULL,
  `isConfirmed` tinyint(1) DEFAULT 0,
  `hotelID` bigint(20) DEFAULT NULL,
  `bookingDate` date DEFAULT NULL,
  `dayOfreservation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bookingID`, `created_at`, `updated_at`, `userID`, `isConfirmed`, `hotelID`, `bookingDate`, `dayOfreservation`) VALUES
(117, '2024-12-28 23:39:28', '2024-12-28 23:39:28', 19, 0, 69, '2024-12-29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotelID` bigint(20) NOT NULL,
  `namaHotel` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `regionID` bigint(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `alamatHotel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotelID`, `namaHotel`, `deskripsi`, `regionID`, `photo`, `alamatHotel`) VALUES
(53, 'Swissotel Jakarta PIK Avenue Golf Course', 'Hotel bintang lima yang terletak di Pantai Indah Kapuk, menawarkan akses langsung ke pusat perbelanjaan PIK Avenue dan fasilitas modern.', 1, '1735320975248-Swissotel Jakarta PIK Avenue Golf Course.jpg', 'Jalan Pantai Indah Kapuk, Kamal Muara Penjaringan, Jakarta, Jakarta 14470n'),
(54, 'Mercure Convention Center Ancol', 'Pilihan tepat untuk liburan keluarga di Ancol, dengan berbagai kegiatan seru untuk anak-anak dan akses mudah ke tempat wisata.', 1, 'Mercure Convention Center Ancol.jpg', 'Jalan Pantai Indah, Jakarta, Jakarta 14430'),
(55, 'The Westin Jakarta', 'Hotel tertinggi di Indonesia yang terletak di Gama Tower, menawarkan pemandangan kota yang menakjubkan dan fasilitas mewah, termasuk Heavenly® Bed yang terkenal.', 1, 'The Westin Jakarta.jpg', 'Jl. H.R. Rasuna Said Kav. C-22 A (Jl. Casablanca Raya), South Jakarta, Special Kapital Region of Jakarta 12940'),
(56, 'The Westin Surabaya', 'Hotel bintang lima yang terhubung langsung dengan Pakuwon Mall, menawarkan pemandangan kota dari lantai 27 hingga 37. Fasilitas Sky Lounge di lantai 37 menyajikan berbagai menu koktail dengan pemandangan kota yang menakjubkan.', 2, 'The Westin Surabaya.jpg', 'Pakuwon Mall, Jalan Puncak Indah Lontar no 2, Surabaya, Jawa Timur 60216'),
(57, 'Four Points by Sheraton Surabaya, Pakuwon Indah', 'Terletak di kawasan yang sama dengan The Westin Surabaya, hotel ini menempati lantai 20 hingga 27. Setiap kamar dilengkapi dengan jendela besar untuk menikmati pemandangan kota Surabaya.', 2, 'Four Points by Sheraton Surabaya Pakuwon Indah.jpg', 'Pakuwon Mall, Jalan Puncak Indah Lontar no 2, Surabaya, Jawa Timur 60216'),
(58, 'Hotel Ciputra World', 'Hotel pertama di Surabaya dengan kolam renang outdoor diatap, menawarkan pemandangan kota yang romantis. Dilengkapi dengan dua kolam renang, spa, dan fasilitas bisnis.', 2, 'Hotel Ciputra World.jpg', 'Jl. Mayjend. Sungkono No. 89, Surabaya, Jawa Timur 60224'),
(59, 'Swiss-Belinn Manyar', 'Hotel dengan desain modern kontemporer yang menawarkan pemandangan kota dari rooftop dengan kolam renang.', 2, 'Swiss-Belinn Manyar.jpg', 'Jl. Manyar Kertoarjo No. 100, Surabaya, Jawa Timur 60116'),
(60, 'InterContinental Bandung Dago Park', 'Hotel bintang 5 yang menawarkan pemandangan alam Dago yang indah, cocok untuk liburan keluarga dengan kamar luas dan fasilitas lengkap.', 3, 'InterContinental Bandung Dago Park.jpg', 'Jl. Resor Dago Pakar No. 2B, Bandung, Jawa Barat 40198'),
(61, 'Heritage', 'Terletak di sekitar lapangan golf dengan pemandangan perbukitan yang menawan, hotel ini memiliki kamar dengan bathtub yang menghadap pepohonan pinus.', 3, 'Heritage.jpg', 'Jl. RE Martadinata No. 63 (Jalan Riau), Bandung, Jawa Barat 40115'),
(62, 'Sheraton Bandung Hotel & Towers', 'Berlokasi di lembah Dago dengan nuansa tropis yang asri, hotel ini menawarkan taman luas, pemandangan bukit, dan fasilitas seperti spa, sauna.', 3, 'Sheraton Bandung Hotel & Towers.jpeg', 'Jalan Ir. H. Janda No. 390, Bandung, Jawa Barat 40135'),
(63, 'The Trans Luxury Hotel', 'Hotel mewah dengan akses langsung ke Trans Studio Mall dan Trans Studio Bandung, menawarkan fasilitas lengkap seperti kolam renang outdoor.', 3, 'The Trans Luxury Hotel.jpg', 'Jl. Jend. Gatot Subroto No. 289, Bandung, Jawa Barat 40273'),
(64, 'Infinity Pool, The Seminyak Beach Resort & Spa', 'Hotel bintang 5 yang terletak di tepi pantai, menawarkan suasana mewah dan layanan spa berkualitas.', 4, 'Infinity Pool The Seminyak Beach Resort & Spa.jpg', 'JL. Kayu Aya, Seminyak, Bali'),
(65, 'Adiwana Bisma', 'Hotel bintang 5 yang menawarkan suasana asri dengan fasilitas modern, ideal untuk relaksasi.', 4, 'Adiwana Bisma.jpg', 'Jl. Bisma, Ubud, Kecamatan Ubud, Kabupaten Gianyar, Bali 80571'),
(66, 'Nusa Dua Beach Hotel & Spa', 'Hotel bintang 5 yang menawarkan pantai pribadi, fasilitas lengkap, dan layanan berkualitas.', 4, 'Nusa Dua Beach Hotel & Spa.jpg', 'Kawasan Pariwisata Nusa Dua Lot. North 4, Jl. Nusa Dua, Benoa, South Kuta, Badung Regency, Bali 80363'),
(67, 'The Mulia, Mulia Resort & Villas', 'Resor bintang 5 yang menawarkan fasilitas mewah, kolam renang, dan akses langsung ke pantai.', 4, 'The Mulia Mulia Resort & Villas.jpg', 'Kawasan Sawangan, Jl. Raya Nusa Dua Selatan, Benoa, Kec. Kuta Sel., Kabupaten Badung, Bali 80362'),
(68, 'Hotel Tentrem Yogyakarta', 'Hotel mewah dengan fasilitas lengkap, termasuk kolam renang, spa, dan pusat kebugaran.', 5, 'Hotel Tentrem Yogyakarta.jpg', 'Jl. P. Mangkubumi No.72A, Cokrodiningratan, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55233'),
(69, 'Hyatt Regency Yogyakarta', 'Hotel bintang 5 yang menawarkan pemandangan taman tropis dan kolam renang.', 5, 'Hyatt Regency Yogyakarta.jpg', 'Jl. Palagan Tentara Pelajar, Panggung Sari, Sariharjo, Kec. Ngaglik, Yogyakarta, Daerah Istimewa Yogyakarta 55581'),
(70, 'Novotel Suites Yogyakarta Malioboro', 'Berlokasi strategis, dapat berjalan kaki ke Jalan Malioboro yang terkenal.', 5, 'Novotel Suites Yogyakarta Malioboro.jpg', 'Jl. Malioboro No.52 58, Suryatmajan, Kec. Danurejan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55001'),
(71, 'Sheraton Mustika Yogyakarta Resort & Spa', 'Menawarkan suasana alami dengan sentuhan tradisional khas Jawa yang didesain secara modern.', 5, 'Sheraton Mustika Yogyakarta Resort & Spa.jpg', '6CCH+GF7, Nayan, Maguwoharjo, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281'),
(75, 'Mandarin Oriental Jakarta ', 'Terkenal dengan layanan personal yang luar biasa dan pemandangan spektakuler Bundaran HI. Menyediakan kamar dan suite mewah dengan berbagai fasilitas modern.', 1, '1735396878027-Mandarin Oriental.jpg', 'Jalan M.H. Thamrin (PO BOX 3392), Jakarta, Jakarta 10310'),
(76, '•	Ayana Resortvand Spa', 'Resor mewah di Jimbaran dengan fasilitas spa kelas dunia dan pemandangan laut yang indah.', 5, '1735404073856-Ayana Resortvand Spa.jpg', 'Jalan Karang Mas Sejahtera (Jimbaran), Jimbaran, Bali 80364'),
(77, 'Bumi Surabaya City Resort', 'Hotel dengan konsep perpaduan budaya tradisional dan modern, menawarkan lingkungan asri dan fasilitas lengkap, cocok untuk liburan keluarga.', 4, '1735404138679-Bumi Surabaya City Resort.jpg', 'Bumi Surabaya Hotel, Kecamatan Genteng, Jawa Timur 60271'),
(78, '•	DoubleTree by Hilton Surabaya', 'Hotel ramah anak dengan fasilitas mini playground, cocok untuk liburan keluarga dengan pelayanan dan fasilitas bintang lima.', 4, '1735404207672-DoubleTree by Hilton Surabaya.jpg', 'Jl. Tunjungan No. 12, Surabaya, Jawa Timur 60275'),
(79, 'G.H. Universal Hotel', 'Menghadirkan kemewahan dengan arsitektur bergaya Renaissance Eropa, memberikan pengalaman menginap yang unik dan mewah.', 2, '1735404285576-G.H. Universal Hotel.jpg', 'Jalan Dr. Setiabudi No. 376, Bandung, Jawa Barat 40143'),
(80, 'Greenhost Boutique Hotel', 'Hotel dengan konsep ramah lingkungan dan desain artistik. Fasilitasnya meliputi kolam renang dan restoran dengan menu organik.', 3, '1735404409034-Greenhost Boutique Hotel.jpg', 'Jl. Prawirotaman II No. 629 Brontokusuman, Yogyakarta, DI Yogyakarta'),
(81, 'Hotel Borobudur Jakarta', 'Hotel bersejarah dengan taman tropis yang luas, menyediakan suasana tenang di tengah hiruk pikuk kota.', 1, '1735404466876-Hotel Borobudur Jakarta.jpg', 'Jl. Lapangan BantengnSelatan No. 1 (P.O> Box 1329) Jakarta Pusat, Jakarta 10710'),
(82, 'Pullman Jakarta Central Park', 'Hotel dengan desain kontemporer yang terletak di kawasan strategis, dekat dengan pusat hiburan dan perbelanjaan.', 1, '1735404517477-Pullman Jakarta Central Park.jpg', 'Podomoro City (Jl. Letnan Jenderal S. Parman Kav. 28), Jakarta Barat, Jakarta 11470'),
(83, 'Taman Boutique Hotel', 'Hotel bertema korea dengan desain unik, memberikan nuansa berbeda dan menarik bagi para tamu.', 2, '1735404582556-Tama Boutique Hotel.jpg', 'Jl. Dr. Radjiman, Bandung, Jawa Barat'),
(84, 'The Kayon Jungle Resort', 'Resor mewah dengan pemandangan hutan tropis dan kolam renang bertingkat, menawarkan pengalaman menginap yang unik dan romantis.', 5, '1735404633831-The Kayon Jungle Resort.jpg', 'Gianyar, Bali Eyaleti 80572'),
(85, 'YATS Colony', 'Hotel dengan konsep urban minimalis, menawarkan berbagai fasilitas seperti kolam renang dan onsen.', 3, '1735404683796-YATS Colony.jpg', 'Jalan Patangpuluhan 23, Wirobrajan, Yogyakarta, DI Yogyakarta 55251');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `regionID` bigint(20) NOT NULL,
  `regionName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`regionID`, `regionName`) VALUES
(1, 'Jakarta'),
(2, 'Surabaya'),
(3, 'Bandung'),
(4, 'Bali'),
(5, 'Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomID` bigint(20) NOT NULL,
  `roomType` varchar(255) DEFAULT NULL,
  `numberOfBeds` int(11) DEFAULT NULL,
  `numberOfBathroom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` bigint(20) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `Role` varchar(50) DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userName`, `userEmail`, `userPassword`, `Role`) VALUES
(18, 'Mohamed', 'tahungak@gmail.com', '$2b$12$i0iHd4AafYlazDDA5wFZf.snM2pt.AHksWzaHnfCAj9C1Xtci/L.K', 'Admin'),
(19, 'Azfa', 'azfa@gmail.com', '$2b$12$GqJ2THKYiZtjFS.432hD4eh/S0D7dVM3j5HJmSCReRQsrRzVnE7.a', 'User'),
(20, 'giant', 'email@giant.com', '$2b$12$RuvWSHliRgom9Qlb1ofV2OfSf2N24H21Y7zRizqVKgO9.27Pcujw6', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`bookingID`),
  ADD UNIQUE KEY `bookingID` (`bookingID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `hotelID` (`hotelID`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotelID`),
  ADD KEY `regionID` (`regionID`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`regionID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomID`),
  ADD UNIQUE KEY `pk_roomID` (`roomID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `bookingID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotelID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `regionID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `Hotels_ibfk_1` FOREIGN KEY (`regionID`) REFERENCES `regions` (`regionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
