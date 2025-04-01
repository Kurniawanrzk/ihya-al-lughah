-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 30, 2025 at 06:21 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ihyaallughah`
--


-- --------------------------------------------------------

--
-- Table structure for table `tb_benar_salah`
--

CREATE TABLE `tb_benar_salah` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_benar_salah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil_mufrodat`
--

CREATE TABLE `tb_hasil_mufrodat` (
  `id` bigint UNSIGNED NOT NULL,
  `id_konten_mufrodat` bigint UNSIGNED NOT NULL,
  `guest_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil_soal_benar_salah`
--

CREATE TABLE `tb_hasil_soal_benar_salah` (
  `id` bigint UNSIGNED NOT NULL,
  `guest_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `latihan_id` bigint UNSIGNED NOT NULL,
  `soal_benar_salah_id` bigint UNSIGNED NOT NULL,
  `benar` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_hasil_soal_benar_salah`
--

INSERT INTO `tb_hasil_soal_benar_salah` (`id`, `guest_id`, `user_id`, `latihan_id`, `soal_benar_salah_id`, `benar`, `created_at`, `updated_at`) VALUES
(46, 'guest_67db68231f1e6', NULL, 5, 90, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(47, 'guest_67db68231f1e6', NULL, 5, 91, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(48, 'guest_67db68231f1e6', NULL, 5, 92, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(49, 'guest_67db68231f1e6', NULL, 5, 93, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(50, 'guest_67db68231f1e6', NULL, 5, 94, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil_soal_latihan`
--

CREATE TABLE `tb_hasil_soal_latihan` (
  `id` bigint UNSIGNED NOT NULL,
  `guest_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `latihan_id` bigint UNSIGNED NOT NULL,
  `soal_latihan_id` bigint UNSIGNED NOT NULL,
  `jawaban_latihan_id` bigint UNSIGNED NOT NULL,
  `benar` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_hasil_soal_latihan`
--

INSERT INTO `tb_hasil_soal_latihan` (`id`, `guest_id`, `user_id`, `latihan_id`, `soal_latihan_id`, `jawaban_latihan_id`, `benar`, `created_at`, `updated_at`) VALUES
(161, 'guest_67db68231f1e6', NULL, 5, 462, 1825, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(162, 'guest_67db68231f1e6', NULL, 5, 463, 1830, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(163, 'guest_67db68231f1e6', NULL, 5, 464, 1835, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(164, 'guest_67db68231f1e6', NULL, 5, 465, 1837, 0, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(165, 'guest_67db68231f1e6', NULL, 5, 466, 1845, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(166, 'guest_67db68231f1e6', NULL, 5, 467, 1850, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(167, 'guest_67db68231f1e6', NULL, 5, 468, 1855, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(168, 'guest_67db68231f1e6', NULL, 5, 469, 1860, 1, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(169, 'guest_67db68231f1e6', NULL, 5, 470, 1864, 0, '2025-03-19 18:04:16', '2025-03-19 18:04:16'),
(170, 'guest_67db68231f1e6', NULL, 5, 471, 1866, 0, '2025-03-19 18:04:16', '2025-03-19 18:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `tb_isi_kalam`
--

CREATE TABLE `tb_isi_kalam` (
  `id` int NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `teks_percakapan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `suara_percakapan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_kalam` int UNSIGNED NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_isi_kalam`
--

INSERT INTO `tb_isi_kalam` (`id`, `video`, `teks_percakapan`, `suara_percakapan`, `id_kalam`, `updated_at`, `created_at`) VALUES
(1, '/storage/video/1741829238_Video animasi percakapan bahasa Arab tentang Profesi.mp4', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>المهنة</strong></span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> عُمَر</strong> : يَا مَحمُود, كَيفَ حَالُكَ ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 18pt;\"><span style=\"font-size: 14pt;\"><strong> مَحمُود</strong></span> : الحَمدُ لِلَّه بِخَيرٍ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> عُمَر</strong>: أينَ أبُوكَ ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> مَحمُود</strong>: أَبِي فِي المُستَشفَى, هُوَ طَبِيبٌ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>عُمَر</strong>: فِي أَيِّ مُستَشفَى؟ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>مَحمُود</strong>: هُوَ يَعمَلُ فِي المُستَشفَى سِتِي خَدِيجَة</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> عُمَر</strong>: كَم يَومًا يَعمَلُ فِي الأُسبوعِ؟ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>مَحمُود</strong>: خَمسَةَ أَيَّامٍ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>عُمَر</strong>: وَ أَينَ أُمُّكَ؟ هَل هِيَ فِي البَيتِ ؟ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>مَحمُود</strong>: نَعَم, أُمِّي فِي المَطبَخ هِيَ خَبَّاَزَةٌ , وَمَا مِهَنة أَبِيكَ؟ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>عُمَر</strong>: هُوَ مُدَرِّسٌ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> مَحمُود</strong>: في أَيَّةِ مَدرَسَةٍ ؟ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>عُمَر</strong>: فِي المَدرَسَةِ الثَّانَوِيَّةِ المُحَمَّدِيَة </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>مَحمُود</strong>: كَمْ يَوْمًا يُدَرِّسُ فِي الْأَسْبُوعِ ؟ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>عُمَر</strong>: خَمْسَةَ أَيَّامٍ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 18pt;\"><span style=\"font-size: 14pt;\"><strong>مَحمُود</strong>: وَمَا مِهْنَةُ أُمِّكَ؟ </span></span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>عُمَر</strong>: هِيَ مُدَرِّسَةٌ أَيْضًا </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>مَحمُود</strong>: أنا سَعِيدٌ بِلِقَائِكَ</span></p>', 'bab1.mp3', 1, '2025-03-12 18:27:19', '0000-00-00 00:00:00'),
(3, '/storage/video/1741829612_PERCAKAPAN TENTANG ALAT TRANSPORTASI __ المحادثة __ belajar bahasa Arab pemula.mp4', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>آلاَتُ المُوَاصَلاَتِ</strong></span></p>\r\n<p style=\"text-align: right;\"><strong><span style=\"font-size: 14pt;\"> أَمِير</span></strong>:<span style=\"font-size: 14pt;\"> يَا عُثمَان، هَل عَرَفتَ أَنواعَ الآتِ المُوَاصَلاَتِ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt; font-family: arial, helvetica, sans-serif;\"><strong> عُثمَان</strong> : نَعَم, عَرَفتُهَا </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt; font-family: arial, helvetica, sans-serif;\"><strong>أَمِير</strong>: اُذكُر أَنوَاعَ آلاتِ المُوَاصَلاتِ التي عَرَفتَهَا ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\"><strong> عُثمَان</strong> : هِيَ آلاتُ المُوَاصَلَاتِ&nbsp;<span style=\"background-color: white; color: #1f2937;\">البَرَّيَّةُ</span>&nbsp;وَالاتُ المُوَاصَلاَتِ البَحرِيَّة وآلاتِ المُواصَلاَتِ <span style=\"background-color: white; color: #1f2937;\">الجَوِّيّة</span></span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt; font-family: arial, helvetica, sans-serif;\"><strong> أَمِير</strong>: وَكَيفَ نَقَلَ النَّاسُ الأَشيَاءَ مِن مَكَانٍ إِلَى مَكَانٍ آَخَرَ فِي المَاضِيَ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt; font-family: arial, helvetica, sans-serif;\"><strong> عُثمَان</strong> : كَانَت آلاتُ المُوَاصَلاَتِ فِي المَاضَِي مَشيًا عَلَى الأقدَامِ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><span style=\"font-family: arial, helvetica, sans-serif;\"><strong> أَمِير</strong>: والآن نَنتَقِلُ مِن مَكَانٍ إِلَى مَكَانٍ آَخَرَ فِي وَقتٍ قَصِيٍر وَشَعُرنَا أَنَّ الدُّنيَا صَغِيرَ</span>ةٌ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> عُثمَان</strong> : إِذَن، تَفَضَّل إِلَى بَيتِي فِي جَاكَرتَا </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>أَمِير</strong>: إن شَاءَ اللهُ، نَشْكُرُ اللهَ بِلِقَائِنا</span></p>', 'bab2.mp3', 8, '2025-03-19 20:13:20', '2025-02-10 08:53:27'),
(4, '/storage/video/1741830006_Hiwar bahasa arab tentang Hari raya Idul Fitri.mp4', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>يَومُ العِيدِ</strong></span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الاِبنُ</strong> : مَتَى يَكُونُ عِيدُ الفِطرِ يَا أَبِي ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الأَبُ</strong> : بَعدَ شَهرِ رَمَضَانَ, فِي اليَومِ الأَوَّلِ مِن شَوَّالٍ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الاِبنُ</strong> : مَاذَا نَعمَلُ فِي لَيلَةِ يَومِ العِيدِ ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الأَبُ</strong> : نُعطِى زَكَاةَ الفِطرِ لِلفُقَرَاءِ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الاِبنُ</strong> : وَمَا زَكَاةُ الفِطرِ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الأَبُ</strong> : صَاعٌ مِن طَعَامٍ عَن كُلِّ شَخصٍ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الاِبنُ</strong> : وَمَاذَا نَفعَلُ فِي يَومِ العِيدِ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الأَبُ</strong> : احتَفَلَ المُسلِمُونَ بِتَكبِيرٍ فِي المَسَاجِدِ والشَّوارِعِ ثُمَّ يَصُلُّونَ العَيدِ وَيَزُورُونَ الجِيرَانِ والأَصدِقَاءَ </span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong>الاِبنُ</strong> : مَا عُرفُ المُسلِمِينَ فِي يَومِ عِيدِ الفِطرِ ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الأَبُ</strong> : أَنَّ أَهَالِى المُدُنِ يَرجِعُونَ إِلَى القَريَةِ لِزِيَارَةِ أَهلِ القُرَى. وَعَيدُ الفِطرِ هُوَ فُرصَةٌ عَظِيمَةٌ لِصِلَةِ الرَّحمِ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الاِبنُ</strong> : شُكرًا عَلَى شَرحِكَ يَا أَبِي! هُوَ يُعجِبُنِي</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> الأَبُ</strong>: اَلحَمدُلِلَّهِ , أَنَا سَعِيدٌ</span></p>', 'bab3.mp3', 9, '2025-03-12 18:40:06', '2025-02-10 08:59:25'),
(5, '/storage/video/bab4.mp4', '<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong>الشِّرَاءُ فِي السُّوقِ</strong></span></p>\r\n<p style=\"text-align: right;\">ذَهَبَت فَاطِمَة إِلَى السُّوقِ. وَالشَّوَارِعُ مُزدَحِمَةٌ. دَخَلَت فَاطِمة فِي أَحَدِ المَحَلاَّت</p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> البَائِعُ</strong>: مَرحَبًا، أي خِدمَةٍ ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> فَاطِمَةُ</strong>: أُفَضِّلُ سَمَكًا وَلَحمَا وَدَجَّاجًا</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> البَائِعُ</strong>: تَفَضَّلِي السَّمَكَ وَاللَّحمَ وَالدَّجَّاجَ. وَمَاذا تُفَضِّلِينَ أَيضًا؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> فَاطِمَةُ</strong>: أُفَضِّلُ سُكَّرًا وَ شَايًا</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> البَائِعُ</strong>: هَل تُفَضِّلِينَ شَيئًا أَخَرَ ؟</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> فَاطِمَةُ</strong>: شُكرًا، كَفَيتُ هَذا الشِّرَاءَ</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> البَائِعُ</strong>: المَطلُوبُ خَمسُونَ اَلفَ ُروبِيَةً</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-size: 14pt;\"><strong> فَاطِمَةُ</strong>: هَل سَبَقَ لَكَ أَن تُعطِيَنِي المَكتُوبَ</span> ؟</p>\r\n<p style=\"text-align: right;\"><span style=\"text-decoration: underline;\"><span style=\"font-size: 14pt;\"><strong> البَائِعُ</strong>: طَبعًا، هَا هُوَ الْمَكْتُوبَ لَكِ دَفَعَت فَاطِمَة الشِّرَاء وَخَرَجَت مِنَ المَحَلِّ سَعِيدَةً، عَادَت فَاطِمَةُ مِنَ السُّوقِ مَاشِيَةً</span></span></p>', 'bab4.mp3', 10, '2025-02-26 09:25:34', '2025-02-10 09:04:21');

-- --------------------------------------------------------

--
-- Table structure for table `tb_isi_konten_mufrodat`
--

CREATE TABLE `tb_isi_konten_mufrodat` (
  `id` bigint UNSIGNED NOT NULL,
  `id_mufrodat` bigint UNSIGNED NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kosakata` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suara` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_isi_konten_mufrodat`
--

INSERT INTO `tb_isi_konten_mufrodat` (`id`, `id_mufrodat`, `gambar`, `kosakata`, `suara`, `created_at`, `updated_at`) VALUES
(31, 21, '1738920188_dokter.jpg', 'طَبِيبٌ', 'ttsMP3.com_VoiceText_2025-2-12_13-30-22.mp3', '2025-02-07 02:23:08', '2025-02-07 02:23:08'),
(32, 21, '1738920270_petani.jpg', 'فَلَّاحٌ', 'ttsMP3.com_VoiceText_2025-2-12_13-31-57.mp3', '2025-02-07 02:24:30', '2025-02-07 02:24:30'),
(35, 21, '1738920744_pilot.jpg', 'طَيَّارٌ', 'ttsMP3.com_VoiceText_2025-2-12_13-34-16.mp3', '2025-02-07 02:32:24', '2025-02-07 02:32:24'),
(36, 21, '1738920830_guru 2.jpg', 'مُدَرِّسٌ', 'ttsMP3.com_VoiceText_2025-2-12_13-34-28.mp3', '2025-02-07 02:33:50', '2025-02-07 02:33:50'),
(37, 21, '1738920987_perawat lk.jpg', 'مُمَرِّضٌ', 'ttsMP3.com_VoiceText_2025-2-12_13-34-41.mp3', '2025-02-07 02:36:27', '2025-02-07 02:36:27'),
(38, 21, '1738921185_polisi.jpg', 'شُرطِيٌّ', 'ttsMP3.com_VoiceText_2025-2-12_13-34-52.mp3', '2025-02-07 02:39:45', '2025-02-07 02:39:45'),
(39, 21, '1738921230_tentara.jpg', 'جُندِيٌّ', 'ttsMP3.com_VoiceText_2025-2-12_13-35-2.mp3', '2025-02-07 02:40:30', '2025-02-07 02:40:30'),
(40, 22, '1738922753_motor.jpg', 'جَوَّالَةٌ', 'جَوَّالَةٌ.mp3', '2025-02-07 03:05:53', '2025-02-26 09:07:51'),
(41, 22, '1738922881_sepeda.jpg', 'دَرَّاجَةٌ', 'دَرَّاجَةٌ.mp3', '2025-02-07 03:08:01', '2025-02-26 09:07:51'),
(42, 22, '1738923045_pesawat.jpg', 'طَائِرَةٌ', 'طَائِرَةٌ.mp3', '2025-02-07 03:10:45', '2025-02-26 09:07:51'),
(43, 22, '1738923104_kereta.jpg', 'قِطَارٌ', 'قِطَارٌ.mp3', '2025-02-07 03:11:44', '2025-02-26 09:07:51'),
(44, 22, '1738923187_mobil.jpg', 'سَيَّارَةٌ', 'سَيَّارَةٌ.mp3', '2025-02-07 03:13:07', '2025-02-26 09:07:51'),
(45, 22, '1738923292_bis 1.jpg', 'حَافِلَةٌ', 'حَافِلَةٌ.mp3', '2025-02-07 03:14:52', '2025-02-26 09:07:51'),
(46, 22, '1738923341_kapal 1.jpg', 'سَفِينَةٌ', 'سَفِينَةٌ.mp3', '2025-02-07 03:15:41', '2025-02-26 09:07:51'),
(48, 22, '1738934951_becak 1.jpg', 'بِيشَاكٌ', 'بِيشَاكٌ.mp3', '2025-02-07 06:29:11', '2025-02-26 09:07:51'),
(49, 22, '1738935080_prahu.jpg', 'قَارِبٌ', 'قَارِبٌ.mp3', '2025-02-07 06:31:20', '2025-02-26 09:07:51'),
(50, 23, '1739098825_orang berpuasa.jpg', 'صَامَ- يَصُومُ', 'صَامَ- يَصُومُ.mp3', '2025-02-09 04:00:25', '2025-02-26 09:12:05'),
(51, 23, '1739099074_org shalat.jpg', 'صَلَّي- يُصَلِّي', 'صَلَّي- يُصَلِّي.mp3', '2025-02-09 04:04:34', '2025-02-26 09:12:05'),
(52, 23, '1739099261_takbiran.jpg', 'كَبَّرَ - يُكَبِّرُ', 'كَبَّرَ - يُكَبِّرُ.mp3', '2025-02-09 04:07:41', '2025-02-26 09:12:05'),
(53, 23, '1739099656_orang salam an.jpg', 'صَافَحَ - يُصَافِحُ', 'صَافَحَ - يُصَافِحُ.mp3', '2025-02-09 04:14:16', '2025-02-26 09:12:05'),
(54, 23, '1739099809_zakat.jpg', 'أَعطَى - يُعطِى', 'أَعطَى - يُعطِى.mp3', '2025-02-09 04:16:49', '2025-02-26 09:12:05'),
(55, 23, '1739100246_baju baru.jpg', 'ثَوبٌ - أَثوَابٌ', 'ثَوبٌ - أَثوَابٌ.mp3', '2025-02-09 04:24:06', '2025-02-26 09:12:05'),
(58, 23, '1739100523_lebaran tetangga.jpg', 'جَارٌ- جِيرَانٌ', 'جَارٌ- جِيرَانٌ.mp3', '2025-02-09 04:28:43', '2025-02-26 09:12:05'),
(59, 23, '1739100572_berkunjung.jpg', 'زَارَ- يَزُورُ', 'زَارَ- يَزُورُ.mp3', '2025-02-09 04:29:32', '2025-02-26 09:12:05'),
(61, 24, '1739151511_minuman.jpg', 'مَشرُوبَاتٌ', 'مَشرُوبَاتٌ.mp3', '2025-02-09 18:38:31', '2025-02-26 09:17:22'),
(62, 24, '1739151559_buah buah AN.jpg', 'فَواكِهُ', 'فَواكِهُ.mp3', '2025-02-09 18:39:19', '2025-02-26 09:17:22'),
(63, 24, '1739151602_daging.jpg', 'لَحمٌ', 'لَحمٌ.mp3', '2025-02-09 18:40:02', '2025-02-26 09:17:22'),
(65, 24, '1739151699_sayuran.jpg', 'خَضرَواتٌ', 'خَضرَواتٌ.mp3', '2025-02-09 18:41:39', '2025-02-26 09:17:22'),
(66, 24, '1739151834_telor.jpg', 'بَيضَةٌ', 'بَيضَةٌ.mp3', '2025-02-09 18:43:54', '2025-02-26 09:17:22'),
(67, 24, '1739151877_ikan.jpg', 'اَسمَاكٌ', 'اَسمَاكٌ.mp3', '2025-02-09 18:44:37', '2025-02-26 09:17:22'),
(69, 24, '1739151991_ayam.jpg', 'دَجَاجٌ', 'دَجَاجٌ.mp3', '2025-02-09 18:46:31', '2025-02-26 09:17:22'),
(70, 24, '1739152032_gula.jpg', 'سُكَّرٌ', 'سُكَّرٌ.mp3', '2025-02-09 18:47:12', '2025-02-26 09:17:22'),
(71, 24, '1739152067_garam.jpg', 'مِلحٌ', 'مِلحٌ.mp3', '2025-02-09 18:47:47', '2025-02-26 09:17:22'),
(77, 21, '1742445885_jurnalis.jpg', 'صَحَفِيٌّ', '1742445885_bahasa arab reporter.aac', NULL, '2025-03-19 21:44:45'),
(78, 21, '1742445885_insinyur.jpg', 'مُهَندِسٌ', '1742445885_مُهَندِسٌ.aac', NULL, '2025-03-19 21:44:45'),
(79, 22, '1742647377_dokar.jpg', 'عَربَةٌ', '1742647377_عَربَةٌ.aac', NULL, '2025-03-22 05:42:57'),
(80, 23, '1742649821_permen lebaran.jpg', 'حَلَوِيَّاتٌ', '1742649821_حَلَوِيَّاتٌ (1).mp3', NULL, '2025-03-22 06:23:41'),
(81, 23, '1742649821_berpergian.jpg', 'سَافَرَ- يُسَافِرُ', '1742649821_سَافَرَ- يُسَافِرُ (1).mp3', NULL, '2025-03-22 06:23:41'),
(82, 21, '1742970176_apoteker hijab.jpg', 'صَيدَلِيَّةٌ', '1742970176_arab apoteker.mp3', NULL, '2025-03-25 23:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_isi_qiraah`
--

CREATE TABLE `tb_isi_qiraah` (
  `id` int NOT NULL,
  `id_qiraah` int NOT NULL,
  `teks_bacaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `suara` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_isi_qiraah`
--

INSERT INTO `tb_isi_qiraah` (`id`, `id_qiraah`, `teks_bacaan`, `suara`, `updated_at`, `created_at`) VALUES
(1, 2, '<p style=\"text-align: center;\"><span style=\"font-size: 24pt;\"><strong>أُسْتَاذَتِي الْمَحْبُوْبَةُ</strong></span><span id=\"docs-internal-guid-83e8988a-7fff-3144-4034-58c22d9e80cd\"></span><span id=\"docs-internal-guid-855135aa-7fff-2b06-2007-dc851bf0b9a6\"></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 24pt;\"><span id=\"docs-internal-guid-c1c102a4-7fff-bdc6-d021-dc0e18515413\"><span style=\"font-size: 20pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">&nbsp;</span><span style=\"font-size: 20pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا. بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.&nbsp; هِيِ تُدَرِّسُ&nbsp; لِمَادَةَ اللُّغَةِ العَرَبِيةِ. تُدَرِّسُ الطَّلَبَةَ بِالْجدِّ وَالْاِجْتِهَادِ.&nbsp; هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّابِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ</span> <span style=\"font-size: 20pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ&nbsp; وَحَثٌّ جَاذِبٌ مُنَاسِبٌ</span> <span style=\"font-size: 20pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا</span></span></span></p>', 'bab1.mpeg', '2025-03-25 14:35:20', '2025-01-14 09:35:43'),
(2, 3, '<p style=\"text-align: center;\"><span style=\"font-size: 24pt;\"><strong>آلات المواصلات</strong></span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 18pt;\">فِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 18pt;\">أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات. وَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 18pt;\">أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 18pt;\">السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِلسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ الثَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ، فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.</span></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 18pt;\">وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ.</span></p>', 'bab2.mpeg', '2025-03-25 14:48:34', '2025-02-10 01:15:13'),
(3, 4, '<p class=\"MsoNormal\" style=\"text-align: center;\"><span style=\"font-size: 24pt;\"><strong><span style=\"font-family: \'Arial\',sans-serif;\">الأَعيادُ</span> </strong><strong><span style=\"font-family: \'Arial\',sans-serif;\">عِندَ</span> </strong><strong><span style=\"font-family: \'Arial\',sans-serif;\">المُسلِمِينَ</span></strong>&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size: 18pt;\"><span style=\"font-family: \'Arial\',sans-serif;\">الْعِيدَانُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">عِندَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">المُسلِمينَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">هُماَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">عِيدُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الفِطرِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">وَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">عِيدُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الأضحَى</span>. <span style=\"font-family: \'Arial\',sans-serif;\">فَعِيدُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الفِطرِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">يَكُونُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">فِي</span> <span style=\"font-family: \'Arial\',sans-serif;\">أَوَّلِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">شَوَّالٍ</span> <span style=\"font-family: \'Arial\',sans-serif;\">بَعْدَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">أَنْ</span> <span style=\"font-family: \'Arial\',sans-serif;\">صَامَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الْمُسْلِمُونَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">رَمَضَانَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">شَهْرًا</span> <span style=\"font-family: \'Arial\',sans-serif;\">كَامِلًا</span> <span style=\"font-family: \'Arial\',sans-serif;\">وَعِيدُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الأَضْحَى</span> <span style=\"font-family: \'Arial\',sans-serif;\">فِي</span> <span style=\"font-family: \'Arial\',sans-serif;\">الْعَاشِرِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">مِنْ</span> <span style=\"font-family: \'Arial\',sans-serif;\">ذِي</span> <span style=\"font-family: \'Arial\',sans-serif;\">الحِجَّةِ</span>. <span style=\"font-family: \'Arial\',sans-serif;\">إِنَّ</span> <span style=\"font-family: \'Arial\',sans-serif;\">المُسلِمِينَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">يُكَبِّرُونَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">لَيلَةَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">العِيدِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">حَتَّى</span> <span style=\"font-family: \'Arial\',sans-serif;\">صَلَاةِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">عِيدِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الفِطْرِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">فِي</span> <span style=\"font-family: \'Arial\',sans-serif;\">الصَّبَاحِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">وَيُوَاصِلُونَهُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">حَتَّى</span> <span style=\"font-family: \'Arial\',sans-serif;\">اليَومَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الرَّابِعَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">فِي</span> <span style=\"font-family: \'Arial\',sans-serif;\">عِيدِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الأَضحَى</span>. <span style=\"font-family: \'Arial\',sans-serif;\">قَد</span> <span style=\"font-family: \'Arial\',sans-serif;\">اَعتَادَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">المُسلمُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">أَن</span> <span style=\"font-family: \'Arial\',sans-serif;\">يَصَافَحَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الْوَالِدَيْنِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">وَيَطْلُبُ</span> <span style=\"font-family: \'Arial\',sans-serif;\">مِنْهُمَا</span> <span style=\"font-family: \'Arial\',sans-serif;\">الْعَفْوَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">وَالسَّمَاحَةَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">عَلَى</span> <span style=\"font-family: \'Arial\',sans-serif;\">الأخطَاءَِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">،</span> <span style=\"font-family: \'Arial\',sans-serif;\">ثُمَّ</span> <span style=\"font-family: \'Arial\',sans-serif;\">يَزُورُونَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">الأَقَارِبَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">وَالأَصْدِقَاءَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">وَالجِيرَانَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">وَيَتَمَتَّعُونَ</span> <span style=\"font-family: \'Arial\',sans-serif;\">بِوَاجِبَاتِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">المَأ</span> <span style=\"font-family: \'Arial\',sans-serif;\">كُولَاتِ</span> <span style=\"font-family: \'Arial\',sans-serif;\">والحُلوِيَاتِ</span></span></p>\r\n<p class=\"MsoNormal\">&nbsp;</p>', 'bab3.mpeg', '2025-03-25 14:36:54', '2025-02-10 08:29:25'),
(4, 5, '<p style=\"text-align: center;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\"><span style=\"font-size: 24pt;\"><strong><span style=\"font-family: \'Arial\',sans-serif;\">في</span> <span style=\"font-family: \'Arial\',sans-serif;\">السُّوقِ</span></strong></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-family: \'Times New Roman\', serif; font-size: 18pt;\">ذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أُفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟&nbsp; أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.&nbsp; دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size: 24pt;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'bab4.mpeg', '2025-03-25 14:37:52', '2025-02-10 08:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jawaban_soal_benar_salah`
--

CREATE TABLE `tb_jawaban_soal_benar_salah` (
  `id` bigint UNSIGNED NOT NULL,
  `id_soal_benar_salah` bigint UNSIGNED NOT NULL,
  `jawaban` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `benar` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jawaban_soal_latihan`
--

CREATE TABLE `tb_jawaban_soal_latihan` (
  `id` bigint UNSIGNED NOT NULL,
  `id_soal_latihan` bigint UNSIGNED NOT NULL,
  `jawaban` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `benar` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_jawaban_soal_latihan`
--

INSERT INTO `tb_jawaban_soal_latihan` (`id`, `id_soal_latihan`, `jawaban`, `benar`, `created_at`, `updated_at`) VALUES
(1771, 452, 'ٱلْحِصَانُ، ٱلْجَامُوسُ، ٱلْحِمَارُ، وَٱلْجَمَلُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1772, 452, ' ٱلْحِمَارُ، ٱلْبَقَرُ، ٱلْبَغْلُ، وَٱلْجَمَلُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1773, 452, 'ٱلْحِصَانُ، ٱلْكَلْبُ، ٱلْحِمَارُ، وَٱلْبَغْلُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1774, 452, ' ٱلْبَغْلُ، ٱلْجَامُوسُ، ٱلْحِصَانُ، وَٱلْجَمَلُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1775, 452, ' ٱلْحِصَانُ، ٱلْبَغْلُ، ٱلْحِمَارُ، وَٱلْجَمَلُ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1776, 453, 'ٱلسَّيَّارَةُ وَٱلْقِطَارُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1777, 453, ' ٱلسَّيَّارَةُ وَٱلسَّفِينَةُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1778, 453, 'ٱلسَّيَّارَةُ وَٱلطَّائِرَةُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1779, 453, 'ٱلسَّفِينَةُ وَٱلْقِطَارُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1780, 453, 'ٱلسَّفِينَةُ وَٱلطَّائِرَةُ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1781, 454, ' فِي ٱلْمَاضِيِّ، كَانَ ٱلنَّاسُ يَسْتَخْدِمُونَ ٱلطَّائِرَةَ فَقَطْ لِلسَّفَرِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1782, 454, 'وَسَائِلُ ٱلنَّقْلِ فِي ٱلْمَاضِيِّ أَسْرَعُ مِنَ ٱلْيَوْمِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1783, 454, 'فِي ٱلْمَاضِيِّ، لَمْ تَحْتَاجِ ٱلسَّفَرَاتُ إِلَىٰ تَكْلِفَةٍ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1784, 454, 'وَسَائِلُ ٱلنَّقْلِ فِي ٱلْمَاضِيِّ أَرْخَصُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1785, 454, 'فِي ٱلْيَوْمِ، وَسَائِلُ ٱلنَّقْلِ أَكْثَرُ تَنَوُّعًا', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1786, 455, 'ٱلْمَالُ وَٱلطَّعَامُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1787, 455, 'فَقَطْ ٱلْمَالُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1788, 455, 'ٱلْجَوَازُ وَٱتِّبَاعُ ٱلطَّائِرَةِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1789, 455, 'ٱلطَّعَامُ وَتَذْكِرَةُ ٱلسَّفِينَةِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1790, 455, 'ٱلْجَوَازُ وَٱلتَّأْشِيرَةُ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1791, 456, ' نَقْلِ ٱلْأَشْيَاءِ ٱلثَّقِيلَةِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1792, 456, 'ٱلسَّفَرِ بَيْنَ ٱلدُّوَلِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1793, 456, 'نَقْلِ ٱلرُّكَّابِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1794, 456, 'ٱلسَّفَرِ ٱلسَّرِيعِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1795, 456, 'ٱلسَّفَرِ لِمَسَافَاتٍ بَعِيدَةٍ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1796, 457, 'فَائِدَةُ ٱلطَّائِرَةِ كَأَسْرَعِ وَسِيلَةٍ لِلنَّقْلِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1797, 457, ' تَارِيخُ رِحْلَةِ ٱلْإِنسَانِ بِاِسْتِخْدَامِ ٱلْحَيَوَانَاتِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1798, 457, 'ٱلْفَرْقُ بَيْنَ ٱلسَّفَرِ لِمَسَافَاتٍ قَرِيبَةٍ وَبَعِيدَةٍ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1799, 457, 'دَوْرُ ٱلْجَوَازِ وَٱلتَّأْشِيرَةِ فِي ٱلسَّفَرِ بَيْنَ ٱلدُّوَلِ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1800, 457, 'تَطَوُّرُ وَسَائِلِ ٱلنَّقْلِ مِنَ ٱلْمَاضِيِّ إِلَىٰ ٱلْيَوْمِ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1801, 458, 'ٱلْمَشْيُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1802, 458, 'ٱلْاِنتِظَارُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1803, 458, 'ٱلْوُقُوفُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1804, 458, 'الٱبْتِدَاءُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1805, 458, 'ٱلذَّهَابُ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1806, 459, ' ٱلْحُرِّيَّةُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1807, 459, 'ٱلَّمَفْتُوحَةُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1808, 459, 'ٱلْإِنْجَازُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1809, 459, 'ٱلْتَّحْضِيرُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1810, 459, 'ٱلْمُحَادَةُ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1811, 460, 'طَوِيلَةٍ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1812, 460, 'قَصِيرَةٍ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1813, 460, 'سَهْلَةٍ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1814, 460, 'سَرِيعَةٍ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1815, 460, 'بَعِيدَةٍ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1816, 461, 'أخيَرُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1817, 461, 'أَجمَلُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1818, 461, 'أَحسَنُ', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1819, 461, 'أَعلَى', 0, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1820, 461, 'أَبطأُ', 1, '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(1821, 462, 'الرِّيَاضِيَّاتُ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1822, 462, ' اللُّغَةُ الإِنْدُونِيسِيَّةُ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1823, 462, 'الْعُلُومُ الطَّبِيعِيَّةُ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1824, 462, 'اللُّغَةُ الْجَاوِيَّةُ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1825, 462, 'اللُّغَةُ الْعَرَبِيَّةُ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1826, 463, 'بِشَرْحِ الْمَوَادِّ مَعَ تَقْدِيمِ تَدْرِيبَاتٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1827, 463, 'بِتَقْدِيمِ اخْتِبَارٍ قَصِيرٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1828, 463, 'بِطَلَبِ التَّلَامِيذِ قِرَاءَةَ النَّصِّ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1829, 463, 'بِشَرْحِ الْمَوَادِّ مَعَ تَقْدِيمِ تَدْرِيبَاتٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1830, 463, ' بِسَرْدِ قِصَّةٍ وَعَرْضِ الصُّوَرِ\n', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1831, 464, ' الْخَوْفُ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1832, 464, 'الْمَلَلُ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1833, 464, 'الْغَضَبُ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1834, 464, 'الْكَرَاهِيَةُ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1835, 464, 'الِاحْتِرَامُ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1836, 465, 'جَامِدٌ وَمُمِلٌّ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1837, 465, 'صَعْبٌ جِدًّا لِلْفَهْمِ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1838, 465, 'مُرَكَّزُ فَقَطْ عَلَى النَّظَرِيَّةِ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1839, 465, 'مُرْبِكٌ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1840, 465, ' مُبْتَكَرٌ وَمُمْتِعٌ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1841, 466, 'أَهَمِّيَّةُ الْاِنْضِبَاطِ فِي التَّعَلُّمِ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1842, 466, 'أَهَمِّيَّةُ تَعَلُّمِ اللُّغَاتِ الأَجْنَبِيَّةِ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1843, 466, 'أَهَمِّيَّةُ اتِّبَاعِ كُلِّ أَوَامِرِ الْمُعَلِّمِ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1844, 466, ' أَهَمِّيَّةُ فَهْمِ الْمَوَادِّ الدِّرَاسِيَّةِ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1845, 466, ' أَهَمِّيَّةُ دَوْرِ الْمُعَلِّمِ فِي تَشْكِيلِ شَخْصِيَّةِ التَّلَامِيذِ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1846, 467, 'الأَنْشِطَةُ الْيَوْمِيَّةُ فِي الْمَدْرَسَةِ\n', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1847, 467, 'أَهَمِّيَّةُ تَعَلُّمِ اللُّغَةِ الْعَرَبِيَّةِ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1848, 467, 'طَرِيقَةُ التَّعَلُّمِ الْفَعَّالَةِ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1849, 467, 'طَرِيقَةٌ سَرِيعَةٌ لِفَهْمِ الْمَوَادِّ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1850, 467, 'وَصْفُ مُعَلِّمٍ جَيِّدٍ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1851, 468, ' كَسُولٌ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1852, 468, 'بَطِيءٌ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1853, 468, 'مُهْمِلٌ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1854, 468, 'غَبِيٌّ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1855, 468, 'نَشِيطٌ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1856, 469, 'غَاضِبٌ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1857, 469, ' مُتَكَبِّرٌ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1858, 469, 'قَلِقٌ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1859, 469, 'مُهْمِلٌ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1860, 469, 'مُطْمَئِنٌّ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1861, 470, 'خَفِيفَةٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1862, 470, 'بَسِيطَةٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1863, 470, 'هَيِّنَةٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1864, 470, 'ثَقِيلَةٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1865, 470, 'صَعْبَةٍ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1866, 471, 'مُزعَجَة', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1867, 471, 'مَسْرُورَةٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1868, 471, 'مُبْهِمَةٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1869, 471, 'مُزْعِجَةٍ', 0, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1870, 471, 'مُمِلَّةٍ', 1, '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(1871, 472, 'الْأَوَّلُ مِنْ شَوَّال', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1872, 472, 'الثَّلَاثُوْنَ مِنْ رَمَضَان', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1873, 472, 'الخَامِسُ عَشَرَ مِنْ شَوَّال', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1874, 472, 'الْأَوَّلُ مِنْ ذِي الْحِجَّة', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1875, 472, 'العَاشِرُ مِنْ ذِي الْحِجَّة', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1876, 473, ' الْمُوَاظَبَةُ عَلَى الذِّكْرِ حَتَّى يَوْمِ الرَّابِعِ مِنْ عِيدِ الْأَضْحَى', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1877, 473, 'الصَّوْمُ لِمُدَّةِ أُسْبُوعٍ آخَرَ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1878, 473, 'بَدْءُ صَلاَةِ اللَّيْلِ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1879, 473, ' زِيَارَةُ الْمَسَاجِدِ طِوَالَ النَّهَارِ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1880, 473, 'طَلَبُ الْمَعْذِرَةِ مِنَ الْكِبَارِ', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1881, 474, 'يَعْتَذِرُ الْمُسْلِمُونَ لِوَالِدِيَّهُمْ فِي الْأَعْيَادِ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1882, 474, 'مِنْ عَادَاتِ الْمُسْلِمِينَ الْاِعْتِذَارَ لِلْوَالِدِينَ فِي الْأَعْيَادِ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1883, 474, 'يَعْتَذِرُ الْمُسْلِمُونَ لِوَالِدِيَّهُمْ كَعَلَاَمَةٍ عَلَى بِرِّ الْوَالِدَيْنِ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1884, 474, 'يُظْهِرُ الْمُسْلِمُونَ الْاِحْتِرَامَ لِلْوَالِدِينَ بِالْاِعْتِذَارِ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1885, 474, 'جَمِيعَ الْإِجَابَاتِ صَحِيحَةً', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1886, 475, 'الْمُسْلِمُونَ مُلْزَمُونَ بِتَقْديمِ الطَّعَامِ وَالْحَلْوَى فِي الْعِيدِ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1887, 475, 'لَا يَجُوزُ لِلْمُسْلِمِينَ التَّمَتُّعَ بِالطَّعَامِ وَالْحَلْوَيَاتِ الْوَاجِبَةِ إِلَّا فِي يَوْمِ الْعِيدِ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1888, 475, 'يَزُورُ الْمُسْلِمُونَ بُيُوتَ الْأَقَارِبِ وَالْأَصْدِقَاءِ وَالْجِيرَانِ لِطَلَبَ الطَّعَامُ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1889, 475, 'يَحْتَفِلُ الْمُسْلِمُونَ بِيَوْمِ الْعِيدِ مِنْ خِلَالَ تُنَاوِلُ الطَّعَامَ معًَا فِي الْمَطَاعِمِ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1890, 475, 'يَتَوَاصَلُ الْمُسْلِمُونَ وَيَتَبَادَلُونَ الطَّعَامَ مَعَ أقْرَبُ النَّاسِ إِلَيْهِمْ.', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1891, 476, 'عِيدُ الْفِطْرِ وَعِيدِ الْأَضْحَى هُمَا عِيدَانِ إِسْلَامِيَّانِ يَحْتَفِلُ بِهُمَا الْمُسْلِمُونَ بِإِسْرَافٍ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1892, 476, 'عِيدُ الْفِطْرِ وَعِيدِ الْأَضْحَى هُمَا عِيدَانِ إِسْلَامِيَّانِ يَحْتَفِلُ بِهُمَا بَعْضُ النَّاسِ فَقَطْ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1893, 476, 'عِيدُ الْفِطْرِ وَعِيدِ الْأَضْحَى هُمَا عِيدَانِ إِسْلَامِيَّانِ لَيْسَ لَهُمَا أهَمِّيَّةُ خَاصَّةِ عِنْدَ الْمُسْلِمِينَ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1894, 476, 'عِيدُ الْفِطْرِ وَعِيدِ الْأَضْحَى هُمَا عِيدَانِ إِسْلَامِيَّانِ يَحْتَفِلُ بِهُمَا الْمُسْلِمُونَ بِطُرُقِ مُخْتَلِفَةِ فِي مَنَاطِقِ مُخْتَلِفَةِ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1895, 476, 'عِيدُ الْفِطْرِ وَعِيدِ الْأَضْحَى هُمَا عِيدَانِ إِسْلَامِيَّانِ مليئان بِالْأَنْشِطَةِ التَّعَبُّدِيَّةِ وَالصِّدْقَاتِ.', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1896, 477, 'يَقُومُ الْمُسْلِمُونَ بِالذِّكْرِ فِي لَيْلَةِ عِيدِ الْفِطْرِ إِلَى الْيَوْمِ الرَّابِعِ مِنْ عِيدِ الْأَضْحَى', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1897, 477, 'يُحْتَفَلُ بِعِيدِ الْفِطْرِ بَعْدَ شَهْرِ رَمَضَانَ، وَعِيدِ الْأَضْحَى فِي شَهْرِ ذِي الْحِجَّةِ.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1898, 477, 'يَقُومُ الْمُسْلِمُونَ بِمُصَافَحَةِ وَالِدَيهِمْ وَطَلَبِ الْمَغْفِرَةِ مِنْهُمَا.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1899, 477, '. تَتَضَمَّنُ تَقَالِيدُ الْمُسْلِمِينَ فِي الْإِحْتِفَالِ بِعِيدِ الْفِطْرِ وَعِيدِ الْأَضْحَى تَنَاوُلَ الطَّعَامِ وَالْحَلَوَى.', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1900, 477, 'عِيدُ الْفِطْرِ وَعِيدُ الْأَضْحَى هُمَا عِيدَانِ يَحْتَفِلُ بِهِمَا الْمُسْلِمُونَ.\r\n', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1901, 478, 'يَتْرُكُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1902, 478, 'يُهْمِلُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1903, 478, 'يُنْجِزُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1904, 478, 'يَتَجَنَّبُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1905, 478, 'يُؤَدِّيْ', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1906, 479, 'الأَصْدِقَاءُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1907, 479, ' الأَصْحَابُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1908, 479, 'الجِيرَانُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1909, 479, 'الزُّمَلاَءُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1910, 479, 'الأُسْرَةُ', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1911, 480, ' كَامِلٌ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1912, 480, ' كَثِيرٌ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1913, 480, 'مَحْدُودٌ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1914, 480, 'مُزْدَحِمٌ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1915, 480, ' فَارِغٌ', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1916, 481, 'القَبُولُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1917, 481, 'الطَّلَبُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1918, 481, 'الرَّحْمَةُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1919, 481, 'المَغْفِرَةُ', 0, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1920, 481, 'العِقَابُ', 1, '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(1921, 482, 'سَمَكٌ، لَحْمٌ، دَجَاجٌ، حَلِيبٌ، وَخُبْزٌ', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1922, 482, 'سَمَكٌ، سُكَّرٌ، شَايٌ، فَاكِهَةٌ، وَخُضَرٌ\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1923, 482, 'دَجَاجٌ، لَحْمٌ، سُكَّرٌ، قَهْوَةٌ، وَشَايٌ\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1924, 482, 'لَحْمٌ، سَمَكٌ، خُبْزٌ، شَايٌ، وَسُكَّرٌ\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1925, 482, 'سَمَكٌ، لَحْمٌ، دَجَاجٌ، سُكَّرٌ، وَشَايٌ\r\n', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1926, 483, 'خَمْسَةَ عَشَرَ أَلْفًا\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1927, 483, 'ثَلاثُونَ أَلْفًا', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1928, 483, 'مِائَةٌ أَلْفٍ', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1929, 483, 'خَمْسَةٌ وَعِشْرُونَ أَلْفًا', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1930, 483, 'خَمْسُونَ أَلْفًا', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1931, 484, ' فَاطِمَةُ تَشْتَرِي الْأَشْيَاءَ بِعَجَلَةٍ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1932, 484, 'فَاطِمَةُ تَشْتَرِي الْأَشْيَاءَ الَّتِي يَقْدِمُهَا لَهَا الْبَائِعُ دُونَ خِيَارٍ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1933, 484, 'فَاطِمَةُ تَطْلُبُ نَصِيحَةَ الْبَائِعِ لِشِرَاءِ الْأَشْيَاءِ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1934, 484, 'فَاطِمَةُ لَا تَعْرِفُ مَا تُرِيدُ شِرَائَهُ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1935, 484, 'فَاطِمَةُ قَدْ خَطَّطَتْ لِلْأَشْيَاءِ الَّتِي تُرِيْدُ شِرَائَهَا.', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1936, 485, ' لِأَنَّهَا حَصَلَتْ عَلَى الْأَشْيَاءِ بِأَسْعَارٍ رَخِيصَةٍ.\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1937, 485, 'لِأَنَّهَا حَصَلَتْ عَلَى هَدَايَا مِنَ الْبَائِعِ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1938, 485, 'أَنَّ الْبَائِعَ كَانَ رَحِيمًا وَوَدُودًا مَعَهَا.\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1939, 485, ' لِأَنَّهَا اشْتَرَتْ قَلِيلًا مِنْ الْأَشْيَاءِ.\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1940, 485, 'لِأَنَّهَا نَجَحَتْ فِي شِرَاءِ جَمِيعِ مَا كَانَتْ تَحْتَاجُهُ.', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1941, 486, 'فَاطِمَةٌ تُسَافِرُ مِنْ وَإِلَى السُّوقِ بِوَسَائِلِ النَّقْلِ الْعَامِّ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1942, 486, 'تَذْهَبُ فَاطِمَةٌ إِلَى السُّوقِ سَيْرًا عَلَى الْأَقْدَامِ وَتَعَوُّدٍ بِالْمُوَاصَلَاتِ الْعَامَّةِ.\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1943, 486, 'سَافَرَتْ فَاطِمَةٌ إِلَى السُّوقِ بِالْمُوَاصَلَاتِ الْعَامَّةِ وَعَادَتْ سَيْرًا عَلَى الْأَقْدَامِ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1944, 486, 'ذَهَبَتْ فَاطِمَةٌ إِلَى السُّوقِ مَعَ شَخْصٍ مَا وَعَادَتْ وَحْدُهَا.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1945, 486, 'تُغَادِرُ فَاطِمَةٌ وَتَعَوُّدٌ إِلَى السُّوقِ سَيْرًا عَلَى الْأَقْدَامِ\r\n', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1946, 487, 'فَاطِمَةُ دَفَعَتْ ثَمَنَ مُسْتَلَزَمَاتِهَا فِي الدُّكَّانِ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1947, 487, 'فَاطِمَةُ سَارَتْ عَلَى قَدَمَيْهَا إِلَى السُّوقِ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1948, 487, 'فَاطِمَةُ تَحَدَّثَتْ مَعَ الْبَائِعِ فِي السُّوقِ.\r\n', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1949, 487, 'فَاطِمَةُ سَعِيدَةٌ بِالتَّسَوُّقِ فِي السُّوقِ.', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1950, 487, 'فَاطِمَةُ اشْتَرَتْ سَمَكًا، وَلَحْمًا، وَدَجَاجًا، وَسُكَّرًا، وَشَايًّا فِي السُّوقِ.', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1951, 488, 'حَزِين', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1952, 488, 'غَاضِب', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1953, 488, 'خَائِب', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1954, 488, 'قَلِق', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1955, 488, ' فَرِح', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1956, 489, 'إِلَى اللِّقَاء', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1957, 489, ' لَيْلَةٌ سَعِيْدَةٌ', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1958, 489, ' كَيْفَ حَالُكَ', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1959, 489, 'شُكْرًا', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1960, 489, 'صَبَاحُ الْخَيْر', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1961, 490, ' أَكْثَر', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1962, 490, ' كَثِير', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1963, 490, 'قَلِيل', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1964, 490, ' نَفْسُه', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1965, 490, ' أَقَلُّ', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1966, 491, 'دَاخِل', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1967, 491, 'جَاءَ', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1968, 491, 'ذَهَبَ', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1969, 491, 'جَلَسَ', 0, '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(1970, 491, 'خَرَجَ', 1, '2025-03-19 12:12:16', '2025-03-19 12:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kalam`
--

CREATE TABLE `tb_kalam` (
  `id` int UNSIGNED NOT NULL,
  `urutan_bab` char(3) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `nama_materi` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `keys` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_kalam`
--

INSERT INTO `tb_kalam` (`id`, `urutan_bab`, `thumbnail`, `nama_materi`, `deskripsi`, `keys`, `created_at`, `updated_at`) VALUES
(1, '1', '/storage/thumbnails/1742317271_dokter.jpg', 'المِهنَة', 'BAB INI BERISIKAN TEKS PERCAKAPAN DAN VIDIO ANIMASI DENGAN TEMA PROFESI', 'pekerjaan, dokter, guru', '0000-00-00 00:00:00', '2025-03-18 21:09:45'),
(8, '2', '/storage/thumbnails/1739202739_kereta.jpg', 'اَلآتُ المُوَاصَلَاتِ', 'BAB INI BERISIKAN TEKS PERCAKAPAN DAN VIDIO ANIMASI DENGAN TEMA MACAM MACAM TRANSPORTASI', 'macam macam transportasi', '2025-02-10 08:52:19', '2025-03-18 21:12:08'),
(9, '3', '/storage/thumbnails/1739203098_lebaran tetangga.jpg', 'يَومُ العِيدِ', 'BAB INI BERISIKAN TEKS PERCAKAPAN DAN VIDIO ANIMASI  DENGAN TEMA HARI RAYA UMAT MUSLIM', 'hari raya umat muslim', '2025-02-10 08:58:18', '2025-03-18 21:14:02'),
(10, '4', '/storage/thumbnails/1739203382_pasar.jpg', 'فيِ السُّوق', 'BAB INI BERISIKAN TEKS PERCAKAPAN DAN VIDIO ANIMASI DENGAN TEMA DI PASAR', 'pasar tradisional, pasar modern', '2025-02-10 09:03:02', '2025-03-18 21:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `tb_konten_mufrodat`
--

CREATE TABLE `tb_konten_mufrodat` (
  `id` bigint UNSIGNED NOT NULL,
  `id_mufrodat` bigint UNSIGNED NOT NULL,
  `nama_konten_mufrodat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_latihan_kalam`
--

CREATE TABLE `tb_latihan_kalam` (
  `id` int NOT NULL,
  `nama_latihan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `urutan_bab` char(3) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `keys` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_latihan_kalam`
--

INSERT INTO `tb_latihan_kalam` (`id`, `nama_latihan`, `urutan_bab`, `thumbnail`, `deskripsi`, `keys`, `created_at`, `updated_at`) VALUES
(5, 'Latihan Kalam (تَدْرِيْبُ الْكَلاَمِ )', '1', '/storage/thumbnails/1741791968_profesi.jpg', 'jawablah latihan soal berikut dengan merekam suara (berbicara) sesuai dengan panduan perintah yang ada ( أَجِبْ عَنِ التَّمَارِينِ التَّالِيَةِ مَعَ تَسْجِيلِ الصَّوْتِ (التَّحَدُّثِ) وَفْقًا لِتَوْجِيهَاتِ الْأَمْرِ الْمَوْجُودَةِ)', 'المِهنَة', '2025-03-12 08:06:08', '2025-03-19 12:21:19'),
(6, 'Latihan Kalam (تَدْرِيْبُ الْكَلاَمِ ) ', '2', '/storage/thumbnails/1741801754_alat transportasi.jpg', 'jawablah latihan soal berikut dengan merekam suara (berbicara) sesuai dengan panduan perintah yang ada ( أَجِبْ عَنِ التَّمَارِينِ التَّالِيَةِ مَعَ تَسْجِيلِ الصَّوْتِ (التَّحَدُّثِ) وَفْقًا لِتَوْجِيهَاتِ الْأَمْرِ الْمَوْجُودَةِ)', 'يَومُ العِيدِ', '2025-03-12 10:49:14', '2025-03-12 10:49:14'),
(7, 'Latihan Kalam (تَدْرِيْبُ الْكَلاَمِ ) ', '3', '/storage/thumbnails/1741802315_lebaran tetangga.jpg', 'jawablah latihan soal berikut dengan merekam suara (berbicara) sesuai dengan panduan perintah yang ada ( أَجِبْ عَنِ التَّمَارِينِ التَّالِيَةِ مَعَ تَسْجِيلِ الصَّوْتِ (التَّحَدُّثِ) وَفْقًا لِتَوْجِيهَاتِ الْأَمْرِ الْمَوْجُودَةِ)', 'يَومُ العِيدِ', '2025-03-12 10:58:35', '2025-03-12 10:58:35'),
(8, 'Latihan Kalam (تَدْرِيْبُ الْكَلاَمِ ) ', '4', '/storage/thumbnails/1741802876_pasar.jpg', 'jawablah latihan soal berikut dengan merekam suara (berbicara) sesuai dengan panduan perintah yang ada ( أَجِبْ عَنِ التَّمَارِينِ التَّالِيَةِ مَعَ تَسْجِيلِ الصَّوْتِ (التَّحَدُّثِ) وَفْقًا لِتَوْجِيهَاتِ الْأَمْرِ الْمَوْجُودَةِ)', 'فيِ السُّوق', '2025-03-12 11:07:56', '2025-03-12 11:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_latihan_kalam_user`
--

CREATE TABLE `tb_latihan_kalam_user` (
  `id` int NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_latihan_kalam` int NOT NULL,
  `status` enum('in_progress','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_progress',
  `score` decimal(5,2) DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_latihan_kalam_user`
--

INSERT INTO `tb_latihan_kalam_user` (`id`, `id_user`, `id_latihan_kalam`, `status`, `score`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'completed', '100.00', '2025-02-23 20:15:41', '2025-02-14 20:04:58', '2025-02-23 20:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `tb_latihan_qiraah`
--

CREATE TABLE `tb_latihan_qiraah` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_latihan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan_bab` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_latihan_qiraah`
--

INSERT INTO `tb_latihan_qiraah` (`id`, `nama_latihan`, `thumbnail`, `urutan_bab`, `deskripsi`, `keys`, `created_at`, `updated_at`) VALUES
(5, 'latihan evaluasi (التَّدْرِيبُ التَّقْوِيمِ)', '/storage/thumbnails/1739964419_dokter.jpg', '1', 'kerjakanlah soal pilihan ganda berikut dengan jawaban yang menurut anda benar dan jawablah latihan benar salah dengan jawaban yang seharusnya. (أَجِبْ عَنْ أَسْئِلَةَ الِاخْتِيَارِ الْمُتَعَدِّدِ التَّالِيَةَ بِالْإِجَابَةِ الَّتِي تَرَاهَا صَحِيحَةً، وَأَجِبْ عَنْ تَدْرِيبِ الصَّحِيحِ وَالْخَطَإِ بِالْإِجَابَةِ الَّتِي يَجِبُ أَنْ تَكُونَ)', 'المِهنَة', '2025-02-19 04:26:59', '2025-03-18 10:25:12'),
(6, 'latihan evaluasi (التَّدْرِيبُ التَّقْوِيمِ)', '/storage/thumbnails/1739968720_dokar.jpg', '2', 'kerjakanlah soal pilihan ganda berikut dengan jawaban yang menurut anda benar dan jawablah latihan benar salah dengan jawaban yang seharusnya. (أَجِبْ عَنْ أَسْئِلَةَ الِاخْتِيَارِ الْمُتَعَدِّدِ التَّالِيَةَ بِالْإِجَابَةِ الَّتِي تَرَاهَا صَحِيحَةً، وَأَجِبْ عَنْ تَدْرِيبِ الصَّحِيحِ وَالْخَطَإِ بِالْإِجَابَةِ الَّتِي يَجِبُ أَنْ تَكُونَ)', 'اَلآتُ المُوَاصَلَاتِ', '2025-02-19 05:38:40', '2025-03-18 10:25:51'),
(7, 'latihan evaluasi (التَّدْرِيبُ التَّقْوِيمِ)', '/storage/thumbnails/1740011931_lebaran tetangga.jpg', '3', 'kerjakanlah soal pilihan ganda berikut dengan jawaban yang menurut anda benar dan jawablah latihan benar salah dengan jawaban yang seharusnya. (أَجِبْ عَنْ أَسْئِلَةَ الِاخْتِيَارِ الْمُتَعَدِّدِ التَّالِيَةَ بِالْإِجَابَةِ الَّتِي تَرَاهَا صَحِيحَةً، وَأَجِبْ عَنْ تَدْرِيبِ الصَّحِيحِ وَالْخَطَإِ بِالْإِجَابَةِ الَّتِي يَجِبُ أَنْ تَكُونَ)', 'يَومُ العِيدِ', '2025-02-19 17:38:51', '2025-03-18 10:26:53'),
(8, 'latihan evaluasi (التَّدْرِيبُ التَّقْوِيمِ)', '/storage/thumbnails/1740012412_telur.jpg', '4', 'kerjakanlah soal pilihan ganda berikut dengan jawaban yang menurut anda benar dan jawablah latihan benar salah dengan jawaban yang seharusnya. (أَجِبْ عَنْ أَسْئِلَةَ الِاخْتِيَارِ الْمُتَعَدِّدِ التَّالِيَةَ بِالْإِجَابَةِ الَّتِي تَرَاهَا صَحِيحَةً، وَأَجِبْ عَنْ تَدْرِيبِ الصَّحِيحِ وَالْخَطَإِ بِالْإِجَابَةِ الَّتِي يَجِبُ أَنْ تَكُونَ)', 'فيِ السُّوق', '2025-02-19 17:46:52', '2025-03-18 10:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mufrodat`
--

CREATE TABLE `tb_mufrodat` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_materi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan_bab` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_mufrodat`
--

INSERT INTO `tb_mufrodat` (`id`, `nama_materi`, `urutan_bab`, `deskripsi`, `thumbnail`, `keys`, `created_at`, `updated_at`) VALUES
(21, 'المِهنَة', '1', 'Bab ini berisikan tentang kosa kata tentang profesi (pekerjaan) dalam bahasa arab', '/storage/thumbnails/1738919930_apoteker 2.jpg', 'profesi', '2025-01-14 10:01:49', '2025-03-05 20:45:42'),
(22, 'اَلآتُ المُوَاصَلَاتِ', '2', 'Bab ini berisikan tentang kosa kata tentang macam macam transportasi (kendaraan) dalam bahasa arab', '/storage/thumbnails/1739204269_kereta.jpg', 'jenis jenis kendaraan', '2025-01-15 11:27:08', '2025-03-05 20:47:27'),
(23, 'يَومُ العِيدِ', '3', 'Bab ini berisikan tentang kosa kata tentang hari raya idul fitri (lebaran) dalam bahasa arab', '/storage/thumbnails/1739204346_lebaran tetangga.jpg', 'hari raya umat muslim', '2025-01-22 10:03:37', '2025-03-05 20:48:03'),
(24, 'فيِ السُّوق', '4', 'Bab ini berisikan tentang kosa kata tentang apa saja yang ada di pasar  dalam bahasa arab', '/storage/thumbnails/1739100871_pasar.jpg', 'pasar tradisional, pasar modern', '2025-02-09 04:34:31', '2025-03-05 20:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pertanyaan_soal_cerita`
--

CREATE TABLE `tb_pertanyaan_soal_cerita` (
  `id` int NOT NULL,
  `id_soal_cerita` int NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pertanyaan_soal_cerita`
--

INSERT INTO `tb_pertanyaan_soal_cerita` (`id`, `id_soal_cerita`, `pertanyaan`, `created_at`, `updated_at`) VALUES
(1, 1, 'أَيْنَ يَعْمَلُ الطَّبِيبُ عَادَةً؟', '2025-02-02 06:49:08', '2025-02-02 06:49:08'),
(2, 1, 'مَا اسْمُ الأَدَاةِ الَّتِي يَسْتَخْدِمُهَا الطَّبِيبُ لِسَمَاعِ دَقَّاتِ قَلْبِ الْمَرِيضِ؟', '2025-02-02 10:02:06', '2025-02-02 10:02:06'),
(3, 2, 'd', '2025-02-14 17:47:56', '2025-02-14 17:47:56'),
(4, 2, 'd', '2025-02-14 17:47:56', '2025-02-14 17:47:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_qiraah`
--

CREATE TABLE `tb_qiraah` (
  `id` int NOT NULL,
  `urutan_bab` char(4) NOT NULL,
  `nama_materi` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `keys` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_qiraah`
--

INSERT INTO `tb_qiraah` (`id`, `urutan_bab`, `nama_materi`, `deskripsi`, `thumbnail`, `keys`, `created_at`, `updated_at`) VALUES
(2, '1', 'المِهنَة', 'Bab ini berisikan teks bacaan tentang profesi dalam bahasa arab dan dilengkapi dengan rekaman bacaan teks tersebut', '/storage/thumbnails/1741233750_dokter.jpg', 'dokter, guru', '2025-01-14 09:25:23', '2025-03-05 21:02:30'),
(3, '2', 'اَلآتُ المُوَاصَلَاتِ', 'Bab ini berisikan teks bacaan tentang macam-macam kendaraan dalam bahasa arab dan dilengkapi dengan rekaman bacaan teks tersebut', '/storage/thumbnails/1739175270_kereta.jpg', 'trasnsportasi', '2025-02-10 01:14:30', '2025-02-18 18:56:22'),
(4, '3', 'يَومُ العِيدِ', 'Bab ini berisikan teks bacaan tentang hari raya umat muslim dalam bahasa arab dan dilengkapi dengan rekaman bacaan teks tersebut', '/storage/thumbnails/1739201256_lebaran tetangga.jpg', 'Idul Fitri, Idul Adha', '2025-02-10 08:27:37', '2025-02-18 18:58:36'),
(5, '4', 'فيِ السُّوق', 'Bab ini berisikan teks bacaan tentang apa yang ada di pasar dalam bahasa arab dan dilengkapi dengan rekaman bacaan teks tersebut', '/storage/thumbnails/1739201479_pasar.jpg', 'pasar tradisional, pasar modern', '2025-02-10 08:31:19', '2025-02-18 18:59:26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekaman_soal_cerita`
--

CREATE TABLE `tb_rekaman_soal_cerita` (
  `id` int NOT NULL,
  `id_soal_cerita` int NOT NULL,
  `lokasi_audio` text NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekaman_soal_percakapan`
--

CREATE TABLE `tb_rekaman_soal_percakapan` (
  `id` int NOT NULL,
  `id_soal_percakapan` int NOT NULL,
  `lokasi_audio` varchar(255) NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_rekaman_soal_percakapan`
--

INSERT INTO `tb_rekaman_soal_percakapan` (`id`, `id_soal_percakapan`, `lokasi_audio`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 1, '1740802451_1_percakapan.mp3', 5, '2025-02-28 21:14:11', '2025-02-28 21:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_benar_salah`
--

CREATE TABLE `tb_soal_benar_salah` (
  `id` bigint UNSIGNED NOT NULL,
  `id_latihan` bigint UNSIGNED NOT NULL,
  `pertanyaan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor` int NOT NULL,
  `benar` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_soal_benar_salah`
--

INSERT INTO `tb_soal_benar_salah` (`id`, `id_latihan`, `pertanyaan`, `gambar`, `nomor`, `benar`, `created_at`, `updated_at`) VALUES
(90, 5, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا.          الْأُسْتَاذَةُ عَزِيزَةُ هِيَ مُعَلِّمَةُ اللُّغَةِ الْعَرَبِيَّةِ.()', NULL, 1, 1, '2025-03-12 12:33:16', '2025-03-12 12:33:16'),
(91, 5, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا.         الْأُسْتَاذَةُ عَزِيزَةُ تَسْكُنُ بَعِيدًا عَنِ الْمَدْرَسَةِ.()', NULL, 2, 0, '2025-03-12 12:33:16', '2025-03-12 12:33:16'),
(92, 5, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا.    الْأُسْتَاذَةُ عَزِيزَةُ تُدَرِّسُ بِصَبْرٍ وَنِظَامٍ () ', NULL, 3, 1, '2025-03-12 12:33:16', '2025-03-12 12:33:16'),
(93, 5, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا.               الْأُسْتَاذَةُ عَزِيزَةُ تُدَرِّسُ بِطَرِيقَةٍ مُمِلَّةٍ. ()', NULL, 4, 0, '2025-03-12 12:33:16', '2025-03-12 12:33:16'),
(94, 5, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\r\n 	هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا.                  الْأُسْتَاذَةُ عَزِيزَةُ تَبْدَأُ الدَّرْسَ دَائِمًا بِقِصَّةٍ وَصُورَةٍ () ', NULL, 5, 1, '2025-03-12 12:33:16', '2025-03-12 12:33:16'),
(95, 7, 'الأَعيَادُ عِندَ المُسلِمِينَ \r\nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \r\n عِيدُ الْفِطْرِ وَعِيدُ الْأَضْحَى هُمَا عِيدَانِ لِلْمُسْلِمِينَ ()', NULL, 1, 1, '2025-03-12 12:50:26', '2025-03-12 12:50:26'),
(96, 7, ' الأَعيَادُ عِندَ المُسلِمِينَ \r\nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \r\nفِي يَوْمِ عِيدِ الْفِطْرِ، لَا يُسَلِّمُ الْمُسْلِمُونَ عَلَى وَالِدَيْهِمْ. ()', NULL, 2, 0, '2025-03-12 12:50:26', '2025-03-12 12:50:26'),
(97, 7, ' الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \n يَقَعُ عِيدُ الْفِطْرِ فِي الْيَوْمِ الْأَوَّلِ مِنْ شَوَّالٍ بَعْدَ أَنْ يُؤَدِّيَ الْمُسْلِمُونَ الصِّيَامَ. ()', NULL, 3, 1, '2025-03-12 12:50:26', '2025-03-12 12:50:26'),
(98, 7, ' الأَعيَادُ عِندَ المُسلِمِينَ \r\nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \r\n بَعْدَ عِيدِ الْأَضْحَى، لَا يَزُورُ الْمُسْلِمُونَ أَقَارِبَهُمْ أَوْ أَصْدِقَاءَهُمْ أَوْ جِيرَانَهُمْ.()', NULL, 4, 0, '2025-03-12 12:50:26', '2025-03-12 12:50:26'),
(99, 7, ' الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \n يُؤَدِّي الْمُسْلِمُونَ الذِّكْرَ فِي لَيْلَةِ عِيدِ الْفِطْرِ حَتَّى صَلَاةِ عِيدِ الْفِطْرِ وَيَسْتَمِرُّونَ حَتَّى الْيَوْمِ الرَّابِعِ مِنْ عِيدِ الْأَضْحَى. ()', NULL, 5, 1, '2025-03-12 12:50:26', '2025-03-12 12:50:26'),
(100, 8, 'في السُّوقِ\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\n\nفَاطِمَةُ ذَهَبَتْ إِلَى السُّوقِ وَدَخَلَتْ إِلَى الْمَطْعَمِ', NULL, 1, 0, '2025-03-12 12:51:37', '2025-03-12 12:51:37'),
(101, 8, 'في السُّوقِ\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\n\n فَاطِمَةُ اشْتَرَتْ سَمَكًا وَلَحْمًا وَدَجَاجًا وَسُكَّرًا وَشَايًّا', NULL, 2, 1, '2025-03-12 12:51:37', '2025-03-12 12:51:37'),
(102, 8, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nفَاطِمَةُ دَفَعَتْ مُسْتَلَزَمَاتِهَا بِطَاقَةِ الاِئْتِمَانِ', NULL, 3, 0, '2025-03-12 12:51:37', '2025-03-12 12:51:37'),
(103, 8, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nفَاطِمَةُ خَرَجَتْ مِنَ الدُّكَّانِ فَرِحَةً بَعْدَ التَّسَوُّقِ', NULL, 4, 1, '2025-03-12 12:51:37', '2025-03-12 12:51:37'),
(104, 8, ' في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nفَاطِمَةُ عَادَتْ مِنَ السُّوقِ مَاشِيَةً', NULL, 5, 1, '2025-03-12 12:51:37', '2025-03-12 12:51:37'),
(105, 6, 'فِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .                              فِي ٱلْمَاضِيِّ، كَانَ النَّاسُ يُسَافِرُونَ بِوَسَائِلِ النَّقْلِ ٱلْمُحَرَّكَةِ. ()     ', NULL, 1, 0, '2025-03-12 12:52:32', '2025-03-12 12:52:32'),
(106, 6, 'فِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .                               ٱلْحَيَوَانَاتُ ٱلْمُحَمَّلَةُ مِثْلُ ٱلْخَيْلِ وَٱلْحَمِيرِ كَانَتْ تُسْتَعْمَلُ لِحَمْلِ ٱلْبَضَائِعِ فِي ٱلْمَاضِيِّ ()      ', NULL, 2, 1, '2025-03-12 12:52:32', '2025-03-12 12:52:32'),
(107, 6, ' السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ\r\nالسُّفُنُ أَنْفَعُ فِي نَقْلِ البَضَائِعِ الخَفِيفَةِ ()', NULL, 3, 0, '2025-03-12 12:52:32', '2025-03-12 12:52:32'),
(108, 6, 'السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ\n السَّيَّارَةُ وَٱلْقِطَارُ أَكْثَرُ مُنَاسَبَةً لِلسَّفَرِ لِمَسَافَاتٍ قَرِيبَةٍ ()', NULL, 4, 1, '2025-03-12 12:52:32', '2025-03-12 12:52:32'),
(109, 6, 'السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ\r\n ٱلطَّائِرَةُ هِيَ وَسِيلَةُ ٱلنَّقْلِ السُرْعَى وَتُسَاعِدُ فِي نَقْلِ كَثِيرٍ مِنَ ٱلْمُسَافِرِينَ ()', NULL, 5, 1, '2025-03-12 12:52:32', '2025-03-12 12:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_cerita`
--

CREATE TABLE `tb_soal_cerita` (
  `id` int NOT NULL,
  `id_latihan_kalam` int NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `cerita` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_soal_cerita`
--

INSERT INTO `tb_soal_cerita` (`id`, `id_latihan_kalam`, `gambar`, `cerita`, `created_at`, `updated_at`) VALUES
(8, 1, '/storage/soal_cerita/PqZpTrlvQrXIaH85RjsWLECfbgs9xAE2HKUb9Tig.jpg', '<p>ما هو الطبيب الذي يساعدك على معرفة هذا الأمر؟<br />ما هو الطبيب الذي يساعدك على معرفة هذا الأمر؟<br />ما هو الطبيب الذي يساعدك على معرفة هذا الأمر؟</p>', '2025-03-04 22:09:40', '2025-03-04 22:09:40'),
(11, 5, '/storage/soal_cerita/CrQEjaF6aQrcEgHT7Z9iODZJrWKNRZhSZfYDr5en.jpg', '<p>&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا اسْمُ الأَدَاةِ الَّتِي يَسْتَخْدِمُهَا الطَّبِيبُ لِسَمَاعِ دَقَّاتِ قَلْبِ الْمَرِيضِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">أَيْنَ يَعْمَلُ الطَّبِيبُ عَادَةً؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا يَفْعَلُ الطَّبِيبُ إِذَا الْمَرِضَ المَرِيضُ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يُعْتَبَرُ الطَّبِيبُ مُهِمًّا لِجَمَاعَةِ النَّاسِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-25cc9f6e-7fff-eaf0-22a1-89e8f7cd4e0b\"><span style=\"font-size: 18pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">مَاذَا يَجِبُ عَلَى الْمَرِيضِ أَنْ يَفْعَلَ قَبْلَ لِقَائِهِ بِالطَّبِيبِ؟</span></span></span></p>', '2025-03-12 10:30:11', '2025-03-12 10:30:11'),
(12, 5, '/storage/soal_cerita/xkwR2lHoZCZDpPMpAogJtWBo3TmBzP0k2rZEtC9q.jpg', '<p>&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا يُدَرِّسُ ٱلْمُعَلِّمُ عَلَى ٱلْسَّبُّورَةِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-51220b79-7fff-fbae-83d5-938ca9a060d7\"><span style=\"font-size: 18pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">مَاذَا يَسْتَخْدِمُ ٱلْمُعَلِّمُ لِلْكِتَابَةِ عَلَى ٱلْسَّبُّورَةِ؟</span></span></span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-e07aca48-7fff-9e0a-dd55-0cc5daaf51a9\"><span style=\"font-size: 18pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">لِمَاذَا يُعْتَبَرُ ٱلْمُعَلِّمُ مُهِمًۭا لِلطُّلَّابِ؟</span></span></span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">أَيْنَ يَعْمَلُ ٱلْمُعَلِّمُ كُلَّ يَوْمٍ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا يَجِبُ عَلَى ٱلطُّلَّابِ أَنْ يَفْعَلُوا۟ عِندَ تَدْرِيسِ ٱلْمُعَلِّمِ؟</span></p>', '2025-03-12 10:32:35', '2025-03-12 10:32:35'),
(13, 5, '/storage/soal_cerita/6pn4rbxLcPmCYP9GHEyRAFXlp0yUOvKyacnTqS48.jpg', '<p>&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">ماذا يَفْعَلُ الفَلَّاحُ فِي الْمَزْرَعَةِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-de72e1f0-7fff-6e75-924c-226b87311203\"><span style=\"font-size: 18pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">مَا هُوَ مَحْصُولُ الفَلَّاحِ الرَّئِيسِيُّ فِي هَذِهِ الصُّورَةِ؟</span></span></span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-6c079858-7fff-9c0a-7ce6-75eb976abbbd\"><span style=\"font-size: 18pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">لِمَاذَا يُعْتَبَرُ الفَلَّاحُ مُهِمًۭا لِحَيَاتِنَا؟</span></span></span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا هِيَ ٱلْأَدَواتُ الَّتِي يَسْتَخْدِمُهَا الفَلَّاحُ فِي هَذِهِ الصُّورَةِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">ماذا يَحْدُثُ إِذَا لَمْ يَكُنْ فَلَّاحٌ؟</span></p>', '2025-03-12 10:34:50', '2025-03-12 10:34:50'),
(14, 5, '/storage/soal_cerita/LT4we8cHIYKot0k2n7bRYmY8oLGFdh8BmhP7Usmf.jpg', '<p>&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 18pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا وَظِيفَةُ ٱلطَّيَّارِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 18pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-20571eda-7fff-a89f-160c-08a8de6430bf\"><span style=\"font-size: 18pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">مَا الَّذِي يَفْعَلُهُ ٱلطَّيَّارُ قَبْلَ رَفْعِ ٱلطَّائِرَةِ؟</span></span></span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 18pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 18pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">أَيْنَ يَعْمَلُ ٱلطَّيَّارُ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 18pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 18pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يَجِبُ عَلَى ٱلطَّيَّارِ أَنْ يَكُونَ مُرَكِّزًا عِندَ عَمَلِهِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 18pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 18pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا الَّذِي يَفْعَلُهُ ٱلرُّكَّابُ قَبْلَ إِقْلَاعِ ٱلطَّائِرَةِ؟</span></p>', '2025-03-12 10:37:18', '2025-03-12 10:37:18'),
(15, 5, '/storage/soal_cerita/t3w1xb5trDHmHCjlzgGDO5CJkJwlMdyzlyh5uZRj.jpg', '<p>&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">ماذا يَفْعَلُ ٱلْمُهَنْدِسُ فِي مَشْرُوعِ ٱلْبِنَاءِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-55e46a12-7fff-8b41-33bc-f9da592b2068\"><span style=\"font-size: 18pt; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;\">مَا هِيَ أَدَواتُ ٱلْحِمَايَةِ الَّتِي يَسْتَخْدِمُهَا ٱلْمُهَنْدِسُ فِي هَذِهِ ٱلصُّورَةِ؟</span></span></span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يُعْتَبَرُ ٱلْمُهَنْدِسُ مُهِمًۭا فِي ٱلْبِنَاءِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا الَّذِي يَجِبُ عَلَى ٱلْمُهَنْدِسِ أَنْ يَحْتَرِسَ مِنهُ عِندَ عَمَلِهِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">اذْكُرْ نَوْعًۭا وَاحِدًۭا مِنَ ٱلْمَبَانِي ٱلَّتِي يَبْنِيهَا ٱلْمُهَنْدِسُ!</span></p>', '2025-03-12 10:40:05', '2025-03-12 10:40:05'),
(16, 6, '/storage/soal_cerita/MUFDFGocLUqlMWXRWNJfpH1AAha8FCfHtQ75XOcx.jpg', '<p style=\"text-align: right;\"><span id=\"docs-internal-guid-e5d32ac9-7fff-b458-fcf3-3350b0aa2a27\"><br /><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا تَرَى فِي هَذِهِ ٱلصُّورَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا تُسْتَخْدَمُ هَٰذِهِ الدَّرَّاجَةُ النَّارِيَةُ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">أَيْنَ يَسْتَخْدِمُ ٱلنَّاسُ دَرَّاجَةً نَارِيَةً عَادَةً؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يُفَضِّلُ ٱلنَّاسُ اسْتِخْدَامَ دَرَّاجَةٍ نَارِيَةٍ ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">فِي أَيِّ عُمُرٍ يُمْكِنُ ٱلشَّخْصُ أَنْ يَسْتَخْدِمَ دَرَّاجَةً نَارِيَةً ؟</span></span></p>', '2025-03-12 11:37:13', '2025-03-12 11:37:13'),
(18, 6, '/storage/soal_cerita/56iuX1bqPCWpzYCDcUAkRd98GCABKtKUU5QOrnRS.jpg', '<p style=\"text-align: right;\"><span id=\"docs-internal-guid-363a7831-7fff-b734-140e-662577d0638b\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">ماذا يُوجَدُ فِي هَذِهِ ٱلصُّورَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا تُسْتَخْدَمُ ٱلطَّائِرَةُ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">كَيْفَ تَطْيِيْرُ ٱلطَّائِرَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا تَشْعُرُ عِندَ رُكُوبِ ٱلطَّائِرَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا تَسْتَطِيعُ ٱلطَّائِرَةُ نَقْلَ عَدَدٍ كَبِيرٍ مِنَ ٱلرُّكَّابِ؟</span></span></p>', '2025-03-12 11:39:11', '2025-03-12 11:39:11'),
(19, 6, '/storage/soal_cerita/KjvvkKwowwT4KC0zybEe5xzc7kkEcxP8w26izZun.jpg', '<p style=\"text-align: right;\"><span id=\"docs-internal-guid-2231a0a3-7fff-cabc-8f65-2c426702c943\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا تَرَى فِيْ هَذِهِ الصُّوْرَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا تُسْتَخْدَمُ ٱلْسَّيَّارَةُ عَادَةً؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَا هِيَ أَنْوَاعُ ٱلسَّيَّارَاتِ ٱلَّتِي تَعْرِفُهَا؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَنْ هُمُ ٱلَّذِينَ يَسْتَخْدِمُونَ ٱلسَّيَّارَةَ غَالِبًا؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَا ٱلَّذِي يُمَيِّزُ ٱلسَّيَّارَةَ عَنْ وَسَائِلِ ٱلنَّقْلِ ٱلْأُخْرَىٰ مِثْلَ دَرَّاجَةٍ نَارِيَةٍ ؟</span></span></p>', '2025-03-12 11:40:02', '2025-03-12 11:40:02'),
(21, 6, '/storage/soal_cerita/dXjQ0JRTloF6uzUr0IwftANewtG4oiPHW0MDxTnG.jpg', '<p style=\"text-align: right;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">ماذا يُرَى فِي هَذِهِ ٱلصُّورَةِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: justify;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا تُسْتَخْدَمُ هَذِهِ ٱلسَّفِينَةُ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">كَيْفَ تَتَحَرَّكُ ٱلسَّفِينَةُ فَوْقَ ٱلْمَاءِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَنْ هُمُ ٱلَّذِينَ يَسْتَخْدِمُونَ ٱلسَّفِينَةَ عَادَةً؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا تَكُونُ ٱلسَّفِينَةُ أَكْثَرَ مُلَاءَمَةً لِرَحَلَاتِ ٱلْمُحِيطِ أوِ الْبَحْرِ؟</span></p>', '2025-03-12 11:42:22', '2025-03-12 11:42:22'),
(22, 6, '/storage/soal_cerita/EIPoycfbJBUa8cQRBDm9abdjZ0VmAqxJ5L15hiRu.jpg', '<p style=\"text-align: right;\"><span id=\"docs-internal-guid-273f7fc4-7fff-c14f-348c-038ea6ad56b7\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا تَرَى فِيْ هَذِهِ الصُّوْرَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يُسْتَخْدَمُ ٱلْمَرْفَأُ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">أَيْنَ يُسْتَخْدَمُ هَذَا ٱلْمَرْفَأُ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَا ٱلَّذِي يُمَيِّزُ ٱلْمَرْفَأُ عَنِ ٱلسَّفِينَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">كَيْفَ يَتَحَرَّكُ ٱلْمَرْفَأُ فَوْقَ ٱلْمَاءِ؟</span></span></p>', '2025-03-12 11:43:38', '2025-03-12 11:43:38'),
(23, 7, '/storage/soal_cerita/PvUt2EnIrZBhtocLmQX98h7JSasFngWoQkUIeLNy.jpg', '<p style=\"text-align: right;\"><span id=\"docs-internal-guid-f4e8c724-7fff-0f20-4bdf-1acb1157fbc2\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا يَفْعَلُ الطِّفْلُ فِي هَذِهِ الصُّورَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يَنْتَظِرُ الطِّفْلُ وَقْتَ الإِفْطَارِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا يُعَدُّ عَادَةً لِلإِفْطَارِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يُؤَدِّي الْمُسْلِمُونَ الصِّيَامَ فِي شَهْرِ رَمَضَانَ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا تَشْعُرُ عِنْدَمَا تَنْتَظِرُ وَقْتَ الإِفْطَارِ؟</span></span></p>', '2025-03-12 11:45:48', '2025-03-12 11:45:48'),
(24, 7, '/storage/soal_cerita/JY51ZoAQtdB3aCYoNRwPrVbnOJi8nVuWFdKIxUBp.jpg', '<p style=\"text-align: right;\"><span id=\"docs-internal-guid-67b99794-7fff-0c3d-ca99-453cd4c2a6eb\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا يَفْعَلُ النَّاسُ فِي هَذِهِ الصُّورَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يُرَدِّدُونَ التَّكْبِيرَ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَا مَعْنَى التَّكْبِيرِ فِي احْتِفَالِ الْعِيدِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَتَى يُؤَدَّى التَّكْبِيرُ عَادَةً؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا تَشْعُرُ عِنْدَمَا تَسْمَعُ التَّكْبِيرَ؟</span></span></p>', '2025-03-12 11:46:50', '2025-03-12 11:46:50'),
(25, 7, '/storage/soal_cerita/E46WLpb4naBktT4HII8sliUbxJ7Mq9ITZxWUb0iA.jpg', '<p style=\"text-align: right;\"><span id=\"docs-internal-guid-238224da-7fff-c956-06ef-f9463af4a2b4\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا يَفْعَلُ الرَّجُلُ فِي هَذِهِ الصُّورَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يُفْرَضُ عَلَى الإِنْسَانِ أَنْ يُؤَدِّيَ الزَّكَاةَ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَا هَدَفُ الزَّكَاةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَنْ هُمُ الَّذِينَ يَسْتَحِقُّونَ الزَّكَاةَ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَا فَوَائِدُ الزَّكَاةِ لِلْمُجْتَمَعِ؟</span></span></p>', '2025-03-12 11:47:43', '2025-03-12 11:47:43'),
(26, 7, '/storage/soal_cerita/5yIIY9d6QDruFNE5zvOS22tPrFWi5Cwu3Ieo76zG.jpg', '<p style=\"text-align: right;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 72pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا تُقَدِّمُ الْأُمُّ فِي هَذِهِ الصُّورَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا نَوْعُ الْحَلَوِيَّاتِ الَّتِي تَجِدُهَا عَادَةً فِي لَيْلَةِ الْعِيدِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا تَكُونُ الْحَلَوِيَّاتُ مِنَ الَّذِي يُقَدَّمُ فِي عِيدِ الْفِطْرِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">هَلْ تُحِبُّ الْحَلَوِيَّاتِ؟ وَلِمَاذَا؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا الَّذِي تَشْعُرُ بِهِ عِندَ تَذَوُّقِ الْحَلَوِيَّاتِ فِي عِيدِ الْفِطْرِ؟</span></p>', '2025-03-12 11:49:10', '2025-03-12 11:49:10'),
(27, 7, '/storage/soal_cerita/Yf3uuWDw0XZF68bqB4v3GKNOPslkMcGccKEKeayW.jpg', '<p style=\"text-align: left;\">&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.3800000000000001; margin-right: 72pt; text-align: right; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا يَفْعَلُ النَّاسُ فِي هَذِهِ الصُّورَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">لِمَاذَا يَجِبُ عَلَيْنَا التَّصَافُحُ وَالْمُعَاذَرَةُ مَعَ الْجِيرَانِ فِي عِيدِ الْفِطْرِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا أَهَمِّيَّةُ حِفْظِ عَلاَقَاتٍ جَيِّدَةٍ مَعَ الْجِيرَانِ فِي عِيدِ الْفِطْرِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا الَّذِي تَفْعَلُهُ لِمُدَارَاةِ جِيرَانِكَ فِي عِيدِ الْفِطْرِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">كَيْفَ تُظْهِرُ شُكْرَكَ لِجِيرَانِكَ فِي عِيدِ الْفِطْرِ؟</span></p>', '2025-03-12 11:51:33', '2025-03-12 11:51:33'),
(31, 8, '/storage/soal_cerita/NLplf78VRGYv6WkFKoSmTcSeo2HpmQdUn2UoiLJW.jpg', '<p>&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">ماذا يُمكِنُكَ أَنْ تَجِدَ فِي هَذَا دُكَّانِ السُّوقِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">اذْكُرْ اثْنَيْنِ مِنَ الأَشْيَاءِ الَّتِي فِي هَذَا الدُّكَّانِ!</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَنِ الَّذِي يَعْمَلُ فِي هَذَا الدُّكَّانِ ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">هَلْ يَبِيعُ هَذَا الدُّكَّانُ الطَّعَامَ أَمْ أَشْيَاءَ أُخْرَى؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">أَيْنَ يَقَعُ هَذَا الدُّكَّانُ فِي السُّوقِ؟</span></p>', '2025-03-12 11:56:35', '2025-03-12 11:56:35'),
(32, 8, '/storage/soal_cerita/Sn5lxjZ0s8Kit4XgxmTp9o7n052dQfic8jClI6lk.jpg', '<p style=\"text-align: right;\"><span id=\"docs-internal-guid-0004a65c-7fff-f4d4-788e-a482e4f9114c\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَاذَا عَنْ أَنْوَاعِ الفَوَاكِهَةِ الَّتِي تَظْهَرُ فِي هَذِهِ الصُّورَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">أَيُّ فَاكِهَةٍ تُبَاعُ كَثِيْرَةً فِي هَذَا السُّوقِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">مَنِ الَّذِي يَشْتَرِي الْفَاكِهَةَ فِي هَذَا السُّوقِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">هَلْ تُمَارِسُ الْفَاكِهَةُ فِي سِلَالٍ أَمْ عَلَى طَاوِلَةٍ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">كَيْفَ يَخْتَارُ النَّاسُ الْفَاكِهَةَ الَّتِي يُرِيدُونَ شِرَاءَها؟</span></span></p>', '2025-03-12 11:58:11', '2025-03-12 11:58:11'),
(33, 8, '/storage/soal_cerita/Cwg0QPgjOi2fgBRYRUPZl0uwxuHOIh4ko5VMMlMO.jpg', '<p>&nbsp;</p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا هِيَ أَنْوَاعُ الخُضَارِ الَّتِي تَظْهَرُ فِي هَذَا السُّوقِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">فِي هَذَا السُّوقِ، هَلْ تُشْتَرَى الخُضَارُ بِالْكِيلُو أَمْ بِالْرُّطَبَاتِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">هَلْ هُنَاكَ خُضَارٌ يَشْتَرِيهَا النَّاسُ بِالْكَثَارَةِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">كَيْفَ يَتَمَكَّنُ النَّاسُ مِنْ اِخْتِيَارِ خُضَارٍ طَازَجَةٍ فِي السُّوقِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَنْ الَّذِي يَشْتَرِي الخُضَارَ فِي السُّوقِ عَادَةً؟</span></p>', '2025-03-12 11:58:49', '2025-03-12 11:58:49');
INSERT INTO `tb_soal_cerita` (`id`, `id_latihan_kalam`, `gambar`, `cerita`, `created_at`, `updated_at`) VALUES
(34, 8, '/storage/soal_cerita/R46pgsaOmMOY0dSLbzRtOacdLqWAbu7fvuzykRVR.jpg', '<p><strong id=\"docs-internal-guid-b78952a2-7fff-c5f4-d599-aa72468f2d54\" style=\"font-weight: normal;\">&nbsp;</strong></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا هِيَ أَنْوَاعُ السَّمَكِ الَّتِي تَظْهَرُ فِي هَذَا السُّوقِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">أَيْنَ تُحْفَظُ السَّمَكُ فِي هَذَا السُّوقِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">هَلْ السَّمَكُ الَّذِي يُبَاعُ فِي هَذَا السُّوقِ طَازَجٌ أَمْ مَعَالَجٌ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَنْ الَّذِي يَشْتَرِي السَّمَكَ فِي هَذَا السُّوقِ؟</span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"><br /></span><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">كَيْفَ يَحْتَفِظُ التَّاجِرُونَ بِسَجَادَةِ السَّمَكِ لِيَحْتَفِظُوا بِهَا طَازَجَةً؟</span></p>\r\n<p style=\"text-align: right;\">&nbsp;</p>', '2025-03-12 11:59:52', '2025-03-12 11:59:52'),
(35, 8, '/storage/soal_cerita/yervBqFQKtAsHyXTJflOaehfx8uQwqOWhpUJIQ69.jpg', '<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا هِيَ أَنْوَاعُ السُّكَّرِ الَّتِي تَظْهَرُ فِي هَذَا السُّوقِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">كَيْفَ يَشْتَرِي النَّاسُ السُّكَّرَ فِي هَذَا السُّوقِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">هَلْ يُشْتَرَى السُّكَّرُ فِي هَذَا السُّوقِ بِالْكَمِّيَّاتِ الْكَبِيرَةِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَنْ الَّذِي يَشْتَرِي السُّكَّرَ فِي هَذَا السُّوقِ؟</span></p>\r\n<p dir=\"rtl\" style=\"line-height: 1.38; margin-right: 36pt; margin-top: 0pt; margin-bottom: 0pt; text-align: right;\"><span style=\"font-size: 18pt; font-family: \'Arabic Typesetting\'; color: #000000; background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">مَا الَّذِي يَجْعَلُ السُّكَّرَ فِي هَذَا السُّوقِ مُخْتَلِفًا عَنْ السُّكَّرِ الَّذِي فِي الْمَحَلِّ؟</span></p>\r\n<p>&nbsp;</p>', '2025-03-12 12:00:47', '2025-03-12 12:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_cerita_user`
--

CREATE TABLE `tb_soal_cerita_user` (
  `id` int NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_latihan_kalam_user` int DEFAULT NULL,
  `id_soal_cerita` int NOT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci,
  `audio_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_latihan`
--

CREATE TABLE `tb_soal_latihan` (
  `id` bigint UNSIGNED NOT NULL,
  `id_latihan` bigint UNSIGNED NOT NULL,
  `nomor` int NOT NULL,
  `pertanyaan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_soal_latihan`
--

INSERT INTO `tb_soal_latihan` (`id`, `id_latihan`, `nomor`, `pertanyaan`, `created_at`, `updated_at`) VALUES
(452, 6, 1, ' ا                                                                                                                                                                                                                       \nآلاَتُ المُوَصَلَاتِ                                                                \nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .                            \n\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\n\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ    الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ                                                                                                                                                                                                                                           \n بِنَاءً عَلَى النّصِّ السّابِقُ، مَا هِيَ ٱلْحَيَوَانَاتُ ٱلَّتِي ٱسْتُخْدِمَتْ لِمُسَاعَدَةِ ٱلْإِنْسَانِ لِلسَّفَرِ فِي ٱلْمَاضِي؟  ', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(453, 6, 2, 'آلاَتُ المُوَصَلَاتِ                                                                                                                   \nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \n\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\n\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ.                                                                                                                                                                                                                              \n   مَا هِيَ وَسِيلَةُ ٱلنَّقْلِ ٱلْمُنَاسِبَةُ لِلسَّفَرِ ٱلْبَعِيدِ حَسَبَ ٱلنَّصِّ؟\n', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(454, 6, 3, 'آلاَتُ المُوَصَلَاتِ                                                                          \nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \n\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ                                                                                                                                                                                                                              \n   مَا ٱلَّذِي يُمَيِّزُ وَسَائِلَ ٱلنَّقْلِ فِي ٱلْمَاضِيِّ عَنِ ٱلْيَوْمِ حَسَبَ ٱلنَّصِّ؟', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(455, 6, 4, '     آلاَتُ المُوَصَلَاتِ                                                                                                       \r\nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \r\n\r\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\r\n\r\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ.\r\n   مَا الَّذِي يَحْتَاجُهُ ٱلسَّائِحُ لِلسَّفَرِ بَيْنَ ٱلدُّوَلِ فِي ٱلْوَقْتِ ٱلْحَاضِرِ؟', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(456, 6, 5, '   آلاَتُ المُوَصَلَاتِ  \r\nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \r\n\r\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\r\n\r\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ\r\n    بِنَاءً عَلَى النَّصِّ، ٱلْسَّفِينَةُ أَكْثَرُ فَائِدَةً لِـ', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(457, 6, 6, '        آلاَتُ المُوَصَلَاتِ  \nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \n\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\n\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ\n  مَا هِيَ ٱلْفِكْرَةُ ٱلرَّئِيسِيَّةُ فِي الفِقرَةُ الأُولى؟', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(458, 6, 7, '           آلاَتُ المُوَصَلَاتِ  \nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \n\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\n\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ\n  مُرَادِفُ كَلِمَةِ \"السَّفَرِ\" فِي ٱلنَّصِّ هُوَ...', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(459, 6, 8, '  آلاَتُ المُوَصَلَاتِ  \nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \n\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\n\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ\n    مُرَادِفُ كَلِمَةِ \"ٱلْحَدّ\" فِي ٱلنَّصِّ هُوَ...\n', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(460, 6, 9, '    آلاَتُ المُوَصَلَاتِ  \r\nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \r\n\r\nوَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\r\n\r\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ\r\n   ضِدُّ كَلِمَةِ \"قَرِيبَةٍ\" فِي ٱلْجُمَلَةِ \"السَّيَّارَةُ وَٱلْقِطَارُ مُنَاسِبَانِ لِلسَّفَرِ لِمَسَافَاتٍ قَرِيبَةٍ\" هُوَ...', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(461, 6, 10, '                آلاَتُ المُوَصَلَاتِ  \nفِي الزَّمَانِ الْمَاضِي كَانَ النَّاسُ سَافَرُوا مِنْ مَكَانٍ إِلَى مَكَانٍ آخَرَ مَاشِينَ عَلَى الْأَقْدَامِ، حَمَلُوا بَضَائِعَهُمْ عَلَى ظُهُورِهِمْ ثُمَّ رَكِبُوا الدَّوابَ كَالخَيلِ وَالْبِغَالِ وَالْحَمِيرِ والجَمَالِ. أَمَّا الْيَوْمَ فَآلَاتُ الْمُواصَلاتِ كَثِيرَةٌ مِنْهاَ: السَّيَّارَاتُ وَالْقِطَارَاتُ وَالسُّفْنُ وَالطَّائِرَات .  \n     وَفِي الزَّمَانِ الْمَاضِي كَانَ الْإِنْسَانُ حُرًّا، يَنتَقِلُ مِنْ بَلَدٍ إِلَى بَلَدٍ فِي الْوَقْتِ الَّذِي يَختَارُهُ مِنْ غَيْرِ قُيُودٍ تَحَوَّلَ بَيْنَهُ وَبَيْنَ السَّفَرِ، بَلْ كَانَ عَلَيْهِ أَنْ يُعِدَّ بَعْضَ الْمَالِ وَالطَّعَامِ. أَمَّا الْيَوْمَ فَقَدْ وُضِعَتْ قُيُودٌ كَثِيرَةٌ عَلَى السَّفَرِ فَالْمُسَافِرُ مِنْ دَوْلَةٍ إِلَى دَولَةٍ أُخرَى  يَحتَاجُ اِلَى التَّأشِيرَةٍ وجَوازٍ السِّفر.\n\n السَّيَّارَاتُ وَالْقِطَارَاتُ صَلُحَتْ لِلسَّفَرِ الْقَرِيبِ وَالسُّفُنُ وَالطَّائِرَاتُ صَلُحَتْ لِسَّفَرِ الْبَعِيدِ. وَالسُّفُنُ أَنْفَعَتْ فِي نَقْلِ الْبَضَائِعِ التَّقِيلَةِ، وَأَمَّا الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ, فَقَدْ قَرَّبَتْ الْمَسَافَاتُ بَيْنَ الدُّوَلِ حَتَّى اسْتَطاَعَ الْإِنْسَانُ أَنْ يُسَافِرَ إِلَى أَقْصَى الْبِلادِ فِي سَاعَةٍ مَحْدُودَةٍ.  وَقَدْ تَطَوَّرَتْ صِنَاعَةُ الطَّائِرَاتِ اليَومَ حَتَّى أَصبَحَت الطَّائرَةُ الوَاحِدَة تَحْمِلْ عَدَدًا كَبِيرًا مِنَ الْمُسَافِرِينَ وَمِنَ الْبَضَائِعِ                                                                                                                           \n     مُتَضَادُّ كَلِمَةِ \"أَسرَعُ\" فِي ٱلْجُمَلَةِ \" الطَّائِرَاتُ فَهِيَ أَسْرَعُ آلَاتِ الْمُوَاصَلَاتِ\" هُوَ...             ', '2025-03-19 12:08:38', '2025-03-19 12:08:38'),
(462, 5, 1, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا.  مَا الْمَادَّةُ الَّتِي تُدَرِّسُهَا الْأُسْتَاذَةُ عَزِيزَةُ؟\n', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(463, 5, 2, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا . كَيْفَ تَبْدَأُ الأُسْتَاذَةُ عَزِيزَةُ دَرْسَ اللُّغَةِ الْعَرَبِيَّةِ عَادَةً؟\n\n', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(464, 5, 3, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا .   بِنَاءً عَلَى النَّصِ السّابِقِ ، مَاذَا قَدْ يَشْعُرُ التَّلَامِيذُ تُجَاهَ الأُسْتَاذَةِ عَزِيزَةَ إِلَى جَانِبِ الْمَحَبَّةِ؟\n  ', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(465, 5, 4, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا.    مَاذَا يُمْكِنُنَا أَنْ نَسْتَنْتِجَ عَنْ أُسْلُوبِ التَّدْرِيسِ لَدَى الأُسْتَاذَةِ عَزِيزَةِ؟', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(466, 5, 5, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا . مَا الْقِيَمُ الَّتِي يُرِيدُ الْكَاتِبُ إِيصَالَهَا مِنْ خِلَالِ هَذَا النَّصِّ؟\n', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(467, 5, 6, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا. مَا الْفِكْرَةُ الرَّئِيسِيَّةُ فِي النَّصِّ أَعْلَاهُ؟\n\n', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(468, 5, 7, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ  حُبًا كَثيرًا. مُرَادِفُ كَلِمَةِ \"مُجْتَهِدٍ\" فِي النَّصِّ هُو...', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(469, 5, 8, '   أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا. مُرَادِفُ كَلِمَةِ \"صَبُورٌ\" فِي جُمْلَةِ \"إِنَّهُ مُعَلِّمٌ صَبُورٌ\" هُوَ\n', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(470, 5, 9, '        أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا .ضِدُّ كَلِمَةِ \"سَهْلَةٍ\" فِي جُمْلَةِ \"وَعِنْدَمَا نَكُونُ مُرَكِّزِينَ وَمُسْتَعِدِّينَ لِلْمَوَادِّ التَّالِيَةِ، تُقَدِّمُهَا الْمُعَلِّمَةُ بِطَرِيقَةٍ وَاضِحَةٍ وَمُبَاشِرَةٍ وَسَهْلَةٍ لِلْفَهْمِ\" هُوَ', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(471, 5, 10, 'أُسْتَاذَتِي الْمَحْبُوْبَةُ\n         هَذِهِ مَدْرَسَتي, فِي مَدْرَسَتِي أَسْتادَةٌ، اِسمُهَا أُسْتَادَةُ عَزِيزةٍ، عُمْرُهَا ثَلَاثُونَ سَنَةً تَقْرِيبًا.  بَيْتُهاَ قَريبٌ مِنَ الْمَدْرَسَةِ.  هِيَِ تُدَرِّسُ لِمَادَّةَ اللُّغَةِ العَرَبِيةِ.  تُدَرِّسُ الطَلَبَةَ بِالْجدِّ وَالْاجْتِهَادِ.  هِيَ مُدَرِّسَةٌ وَثِيقَةٌ وَمُنْتَظِمَةٌ فِي التَّعْلِيمِ، رِقَّةُ الْقَلْبِ وَِاهْتِمَامُهَا كَبِيرٌ بِشُؤُونِ طُلَّبِهَا الْمُخْتَلِفَةِ. تُقَدَّمُ عَادَةً فِي تَدْرِيسِ مَادَّةِ اللُّغَةِ العَرَبِيَة بِقِصَّةٌ  وَحَثٌّ جَاذِبٌ مُنَاسِبٌ بِمَادَةٍ سَتُدَرِّسُهَا، وَتَنْصَحُ دَائِمًا بِتَقوَى اللَّهِ وَمُحافَظَةٍ عَلىَ الصَّلَواَتِ الخَمِسَةِ. وَ كُنَّا مُرَكِّزِيْنَ وَمُسْتَعِدِّينَ عَلَى الْمَادَّةِ الْمُسْتَقْبَلَةِ الَّتي تَنْقُلُهَا الْأَسْتاذَةُ بِطَرِيقَةٍ وَاضِحَةٍ ومُبَاشَرَةٍ وَسَهْلَةٍ لِلْفَهمِ. ِلذَا أُحِبهُّاَ حُبًا كَثيرًا. ضِدُّ كَلِمَةِ \"مُمْتِعَةٍ\" فِي جُمْلَةِ \"تَعْتَادُ عَلَى بَدْءِ دَرْسِ اللُّغَةِ الْعَرَبِيَّةِ بِقِصَّةٍ وَصُورَةٍ مُمْتِعَةٍ وَفْقًا لِمَوَادِّ الدَّرْسِ\" هِيَ', '2025-03-19 12:10:06', '2025-03-19 12:10:06'),
(472, 7, 1, ' الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \nمتى يُحْتَفَلُ بِعِيدُ الْأَضْحَى؟', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(473, 7, 2, ' الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \n  مَا هِيَ العَادَةُ الَّتِي يَفْعَلُهَا الْمُسْلِمُونَ بَعْدَ صَلاَةِ عِيدِ الْفِطْرِ؟\n', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(474, 7, 3, ' الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \nمَاذَا تَعْنِي جُمْلَةُ:”قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ؟', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(475, 7, 4, '\n الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \n  مَا الْمَعْنَى الْخَفِيِّ لِجُمْلَةَ ” ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. ؟', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(476, 7, 5, '  الأَعيَادُ عِندَ المُسلِمِينَ \r\nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \r\n  مَا هُوَ الْمَعْنى النَّصِ العِامِ الأَعيادُ عِندَ المُسلِمِينَ؟ \n', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(477, 7, 6, ' الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \n مَا هِيَ الْفِكْرَةُ الرَّئِيسِيَّةُ لِهَذِهِ الْفَقْرَةِ؟\n', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(478, 7, 7, ' الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \n مَا هُوَ مُرَادِفُ كَلِمَةِ \"يُقِيمُ\" فِي النَّصِّ؟\n', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(479, 7, 8, ' الأَعيَادُ عِندَ المُسلِمِينَ \nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \nمَا هُوَ مُرَادِفُ كَلِمَةِ \"الأَقَارِبِ\" فِي النَّصِّ ؟', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(480, 7, 9, ' الأَعيَادُ عِندَ المُسلِمِينَ \r\nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \r\n مَا هُوَ ضِدُّ كَلِمَةِ \"مُمْتَلِئٍ\" فِي النَّصِّ ؟\n', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(481, 7, 10, 'الأَعيَادُ عِندَ المُسلِمِينَ \r\nالْعِيدَانُ عِندَ المُسلِمينَ هُماَ عِيدُ الفِطرِ وَ عِيدُ الأضحَى. فَعِيدُ الفِطرِ يَكُونُ فِي أَوَّلِ شَوَّالٍ بَعْدَ أَنْ صَامَ الْمُسْلِمُونَ رَمَضَانَ شَهْرًا كَامِلًا وَعِيدُ الأَضْحَى فِي الْعَاشِرِ مِنْ ذِي الحِجَّةِ. إِنَّ المُسلِمِينَ يُكَبِّرُونَ لَيلَةَ العِيدِ حَتَّى صَلَاةِ عِيدِ الفِطْرِ فِي الصَّبَاحِ وَيُوَاصِلُونَهُ حَتَّى يَومِ الرَّابِعِ فِي عِيدِ الأَضحَى. قَد اَعتَادَ المُسلمُ أَن يَصَافَحَ الْوَالِدَيْنِ وَيَطْلُبُ مِنْهُمَا الْعَفْوَ وَالسَّمَاحَةَ عَلَى الأخطَاءَِ ، ثُمَّ يَزُورُونَ الأَقَارِبَ وَالأَصْدِقَاءَ وَالجِيرَانَ وَيَتَمَتَّعُونَ بِوَاجِبَاتِ     المَأ كُولَاتِ والحُلوِيَاتِ. \r\n مَا هُوَ ضِدُّ كَلِمَةِ \"العَفْوِ\" فِي النَّصِّ ؟\n', '2025-03-19 12:11:15', '2025-03-19 12:11:15'),
(482, 8, 1, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nمَا الَّذِي اشْتَرَتْهُ فَاطِمَةُ فِي الدُّكَّانِ؟', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(483, 8, 2, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nمَا هُوَ السِّعْرُ الْإِجْمَالي لِمُتَسَوِّقَاتِ فَاطِمَةَ؟\n', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(484, 8, 3, ' في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nمَا الَّذِي يُمْكِنُ اسْتِنْتَاجُهُ عَنْ فَاطِمَةَ مِنْ طَرِيقَتِهَا فِي التَّسَوُّقِ؟\n', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(485, 8, 4, ' في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\n  لِمَاذَا تَبْدُو فَاطِمَةُ فَرِحَةً عِندَ خُرُوجِهَا مِنَ الدُّكَّانِ؟\n', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(486, 8, 5, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nكَيْفَ تَذْهَبُ فَاطِمَةٌ إِلَى السُّوقِ وَتَعَوُّدٍ مِنْهُ ؟ \n', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(487, 8, 6, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nمَا هِيَ الْفِكْرَةُ الرَّئِيسِيَّةُ فِي نَصِّ \"فِي السُّوقِ\"؟\n', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(488, 8, 7, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nمَا هُوَ مُرَادِفُ كَلِمَةِ \"سَعِيد\" الَّتِي وَرَدَتْ فِي النَّصِّ؟\n', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(489, 8, 8, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\nمَا هُوَ مُرَادِفُ كَلِمَةِ \"أَهْلًا وَسَهْلًا\" الَّتِي وَرَدَتْ فِي النَّصِّ؟\n', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(490, 8, 9, ' في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\n مَا هُوَ ضِدُّ كَلِمَةِ \"كَافٍ\" الَّتِي وَرَدَتْ فِي النَّصِّ؟\n', '2025-03-19 12:12:16', '2025-03-19 12:12:16'),
(491, 8, 10, 'في السُّوقِ\r\nذَهَبَت فَاطِمَة إِلىَ السُّوقِ وَدَخَلَت إِلىَ أَحَدِ المَتجَرِ. مَرحَبًا، أَيُّ خِدْمَةٍ؟ أَفَضِّلُ سَمَكًا وَالحَمًا وَدَجّاَجًا، تَفَضَّلِي السَّمَكَ وَاللَّحْمَ وَالدَّجَّاجَ، وَمَاذَا تُفَصَّلِيْنَ أَيْضًا؟  أَفَضِّلُ سُكَّرًا وَشَايًا. هَلْ تُفَضّلِينَ شَيْئًا آخَرَ؟ شُكْرًا، كَفَيْتُ هَذَا الشرَاءَ. الْمَطْلُوبُ خَمْسُونَ رُوبِيَةً. هَل سَبَقَ لَكَ أن تُعْطِيَنِي الْمَكْتَوْبَ ؟ طَبعًا، هَا هُوَ الْمَكْتُوبُ لَكِ.  دَفَعَتْ فَاطِمَةُ الشِّرَاءَ وَخَرَجَتْ فَاطِمَةُ مِنَ الْمَتجَرِ سَعِيدَةً، عَادَتْ فَاطِمَةُ مِنَ السُّوْقِ مَاشِيَةً.\r\n\r\n مَا هُوَ ضِدُّ كَلِمَةِ \"دَخَلَ\" الَّتِي وَرَدَتْ فِي النَّصِّ؟\n', '2025-03-19 12:12:16', '2025-03-19 12:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_percakapan`
--

CREATE TABLE `tb_soal_percakapan` (
  `id` int NOT NULL,
  `id_latihan_kalam` int NOT NULL,
  `nomor` int NOT NULL,
  `percakapan` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_soal_percakapan`
--

INSERT INTO `tb_soal_percakapan` (`id`, `id_latihan_kalam`, `nomor`, `percakapan`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'tes', 'tes', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 1, 'tes', '/storage/soal_percakapan/755ozSVt2Hfl64falvZ43Ny02UkUfyW55ym2WElv.png', '2025-03-03 01:43:14', '2025-03-03 01:43:14'),
(4, 5, 1, 'Obat- resep- apotik  ( دَوَاء  - وَصْفَة  -صَيدَلِيَّة)', '/storage/soal_percakapan/6unSKMJFnrSuJJrWbF0AEYOOpyc8Wfv9wtlN4lbE.jpg', '2025-03-12 10:43:24', '2025-03-12 10:43:24'),
(5, 5, 2, 'Kamera- mikrofon- jurnalis ( كَامِيرَا  - ميكروفون  - صَحَفِيٌّ)', '/storage/soal_percakapan/5hxxL8AVP0JrXYpr9lKcUgwpMNxDWEOjmneiuEnc.jpg', '2025-03-12 10:44:36', '2025-03-12 10:44:36'),
(6, 5, 3, 'Perawat- pasien- ruang rawat inap ( مُمَرّشضٌلا - مَرِيض  - الحُجرَة با المُستَشفَى)', '/storage/soal_percakapan/APRWNya41v2lgH3rcTh4iNpG0lFzpc4oo3CrITFF.jpg', '2025-03-12 10:45:28', '2025-03-12 10:45:28'),
(7, 5, 4, 'Polisi- jalan- lalu lintas ( شُرطِيٌّ  - الشّارِع -حَرَكَة المُرُور)', '/storage/soal_percakapan/Nb6EL1Nq4SbebZWjZjc8abhQj5ecrb4w2f76v0FG.jpg', '2025-03-12 10:46:19', '2025-03-12 10:46:19'),
(8, 5, 5, 'Tentara - senjata- markas ( جُندِيٌّ - سِلاَح - مَقَرٌ)', '/storage/soal_percakapan/KE09A2Ah03W0i07JFHJL6zsUrbAhY3Hjy8ofHkIX.jpg', '2025-03-12 10:47:05', '2025-03-12 10:47:05'),
(9, 6, 1, 'Sepeda - Jalan- Pengendara ( جَوّالَةٌ - شَارِع -  سَوَّاق)', '/storage/soal_percakapan/AIRmF455hrCy0gMQZUEyud27rMp8N7bdbLl3X2BP.jpg', '2025-03-12 10:51:58', '2025-03-12 10:51:58'),
(10, 6, 2, 'Kereta - Stasiun- Perjalanan ( قِطَارٌ  - مَحَطَّةُ القِطَار   - رحلَة)', '/storage/soal_percakapan/8FjUk5xazLEhmlUpw2Jcpt7QCSHhW49qF9Kyt8Ue.jpg', '2025-03-12 10:54:00', '2025-03-12 10:54:00'),
(11, 6, 3, 'Bis - Halte- Penumpang ( حَافِلَةٌ  - مَوْقِفُ الْحَافِلَاتِ  - رَاكِبٌ', '/storage/soal_percakapan/3zJBczrSAuJKLnGDbOhumKXbTFsBFns6q2eyMKxk.jpg', '2025-03-12 10:55:27', '2025-03-12 10:55:27'),
(12, 6, 4, 'Dokar- kuda- desa ( عُربَةٌ  - حِصَان  - قَريَة)', '/storage/soal_percakapan/3t3sgKROHlmbTVJsh6UpzECipIPVEqaWDCswY5rb.jpg', '2025-03-12 10:56:18', '2025-03-12 10:56:18'),
(13, 6, 5, 'Becak - Kota-pasar  ( بِيشَاكٌ  - مَدِينَة - سُوقٍ)', '/storage/soal_percakapan/JoUqGTBsGSiGzmnz0LDHMNdvWW7mX37DMlv2SPBp.jpg', '2025-03-12 10:57:12', '2025-03-12 10:57:12'),
(14, 7, 1, 'Shalat - lapangan - muslim ( الصَّلاَة   - المَيدان - المُسلِم)', '/storage/soal_percakapan/VLeG0BOAW9jhf1e4uk71wnYGOhTwu1FKM79pJMAj.jpg', '2025-03-12 11:00:38', '2025-03-12 11:00:38'),
(15, 7, 2, 'Bersalaman - rasa syukur- suasana hangat ( صَافَحَ  يُصَافِحُ - الأَمتِنَان  - أَجوَاء دَافِئَة)', '/storage/soal_percakapan/IYbA1f2aQUOld429FBuvogUMW0MdENNghPxA9GmL.jpg', '2025-03-12 11:01:52', '2025-03-12 11:01:52'),
(16, 7, 3, 'Baju - gembira - tradisi ( ثَوبٌ  - سَعِيدٌ  - عُرفٌ)', '/storage/soal_percakapan/g5ydTB9oS5HOVDsNxDtYTjAS863GHr6Sl3H8VXnl.jpg', '2025-03-12 11:03:05', '2025-03-12 11:03:05'),
(17, 7, 4, 'Ziarah- kuburan/makam- doa (ِزيَارَة  - المَقبَرَةُ  - الدُّعاَء)', '/storage/soal_percakapan/UJW8agckxExadMb8EZwOYXgI0JraHNR6Oef8yeou.jpg', '2025-03-12 11:05:10', '2025-03-12 11:05:10'),
(18, 7, 5, 'Bepergian- kampung halaman - keluarga (سَفَرَ  - القَريَة   -عَائِلَة )', '/storage/soal_percakapan/vFi0pdkfBVBaxyHJDy6fP9282lDnyhqH06lbf40P.jpg', '2025-03-12 11:07:20', '2025-03-12 11:07:20'),
(19, 8, 1, 'Minuman - jus - pasar ( مَشرُوبَات  - عَصِير - فِي السُّوقٍ)', '/storage/soal_percakapan/EpcBGYBiih1nBLKh6wNIy3HsgqxYXq3xXh23WuNw.jpg', '2025-03-12 11:11:00', '2025-03-12 11:11:00'),
(20, 8, 2, 'Daging – tukang daging - segar ( لَحمٌ   - جزَّار - طَازَج)', '/storage/soal_percakapan/n2uPWKU7Oj25PIJFVaMfCXxALiuDFIG3bHfKBPp5.jpg', '2025-03-12 11:13:29', '2025-03-12 11:13:29'),
(21, 8, 3, 'Telur - jenis - harga ( بَيضَةٌ - نَوعُ - السِعرِ)', '/storage/soal_percakapan/2tkqUJNFwIc2mvk0TUvskcjXOAuU5firTFcPetf4.jpg', '2025-03-12 11:15:29', '2025-03-12 11:15:29'),
(22, 8, 4, 'Ayam - penjual - pasar ( دَجاجٌ - البائِعُ - في السُّق)', '/storage/soal_percakapan/dO0IIJhLF8W45WGB5ui6UqWdNVmWT7UpehXsdDgD.jpg', '2025-03-12 11:17:12', '2025-03-12 11:17:12'),
(23, 8, 5, 'Garam - dapur - masak ( مِلحٌ  - مَطبَخ - طَبخٌ)', '/storage/soal_percakapan/cy79vAtmzPiQkI7sKw0PhiAvsD3IZ0GT9mJhWxMf.jpg', '2025-03-12 11:18:10', '2025-03-12 11:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_percakapan_user`
--

CREATE TABLE `tb_soal_percakapan_user` (
  `id` int NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_latihan_kalam_user` int NOT NULL,
  `id_soal_percakapan` int NOT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci,
  `audio_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gauth_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gauth_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `isAdmin`, `password`, `remember_token`, `created_at`, `updated_at`, `gauth_id`, `gauth_type`) VALUES
(3, 'Kurniawan Rizki', 'krizki.work@gmail.com', NULL, 0, '$2y$12$swfoPJY2cfQxYYxcSLzRlOhzmnPhVXfYkUvRYKPcMwHJJofaT5fXO', NULL, '2025-01-04 12:10:11', '2025-01-04 12:10:11', '111559588763822650299', 'google'),
(4, 'Rana', 'rana@gmail.com', NULL, 1, '$2y$12$QVyAg7XnOD9gISpaUn.Nq.JRIyF6wz9BK0Xi5FP6OWYNBhehV6/Fi', NULL, '2025-01-09 00:46:21', '2025-01-09 00:46:21', NULL, NULL),
(5, 'Kurniawan Rizky', 'kurniawanrz205@gmail.com', NULL, 0, '$2y$12$..37mDGdXzoyfhUvB/7CleFLdJFVXsOTq3xH.RzMkFkO.MGfm1prW', NULL, '2025-01-15 00:15:02', '2025-01-15 00:15:02', '103343301980560015899', 'google'),
(6, 'KURNIAWAN RIZKI TRINANTA SEMBIRING (230535607266_B)', 'kurniawan.rizki.2305356@students.um.ac.id', NULL, 0, '$2y$12$0X2b/SKkAO9P80/H6DV2duAKncPx0v/Xi9rdWPtdgZpP/ut5edXfu', NULL, '2025-02-14 09:17:40', '2025-02-14 09:17:40', '111523738588982668692', 'google'),
(7, 'IZDIHAR RANA', 'izdihar.rana.2102316@students.um.ac.id', NULL, 0, '$2y$12$p0krdzHUqvZkFEfHKHavL.m6pMg.DPMrWDaloeNS1wXTWUv8PPTSO', NULL, '2025-03-04 20:27:14', '2025-03-04 20:27:14', '112199266806340810026', 'google');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tb_benar_salah`
--
ALTER TABLE `tb_benar_salah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_hasil_mufrodat`
--
ALTER TABLE `tb_hasil_mufrodat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_attempt_qiraah_id_konten_qiraah_foreign` (`id_konten_mufrodat`),
  ADD KEY `tb_attempt_qiraah_id_user_foreign` (`id_user`);

--
-- Indexes for table `tb_hasil_soal_benar_salah`
--
ALTER TABLE `tb_hasil_soal_benar_salah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_hasil_soal_benar_salah_user_id_foreign` (`user_id`),
  ADD KEY `tb_hasil_soal_benar_salah_latihan_id_foreign` (`latihan_id`),
  ADD KEY `tb_hasil_soal_benar_salah_soal_benar_salah_id_foreign` (`soal_benar_salah_id`);

--
-- Indexes for table `tb_hasil_soal_latihan`
--
ALTER TABLE `tb_hasil_soal_latihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_hasil_soal_latihan_user_id_foreign` (`user_id`),
  ADD KEY `tb_hasil_soal_latihan_latihan_id_foreign` (`latihan_id`),
  ADD KEY `tb_hasil_soal_latihan_soal_latihan_id_foreign` (`soal_latihan_id`),
  ADD KEY `tb_hasil_soal_latihan_jawaban_latihan_id_foreign` (`jawaban_latihan_id`);

--
-- Indexes for table `tb_isi_kalam`
--
ALTER TABLE `tb_isi_kalam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kalam` (`id_kalam`);

--
-- Indexes for table `tb_isi_konten_mufrodat`
--
ALTER TABLE `tb_isi_konten_mufrodat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_isi_konten_qiraah_id_konten_qiraah_foreign` (`id_mufrodat`);

--
-- Indexes for table `tb_isi_qiraah`
--
ALTER TABLE `tb_isi_qiraah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_qiraah` (`id_qiraah`);

--
-- Indexes for table `tb_jawaban_soal_benar_salah`
--
ALTER TABLE `tb_jawaban_soal_benar_salah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_jawaban_soal_benar_salah_id_soal_benar_salah_foreign` (`id_soal_benar_salah`);

--
-- Indexes for table `tb_jawaban_soal_latihan`
--
ALTER TABLE `tb_jawaban_soal_latihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_jawaban_soal_latihan_id_soal_latihan_foreign` (`id_soal_latihan`);

--
-- Indexes for table `tb_kalam`
--
ALTER TABLE `tb_kalam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_konten_mufrodat`
--
ALTER TABLE `tb_konten_mufrodat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_konten_qiraah_id_qiraah_foreign` (`id_mufrodat`);

--
-- Indexes for table `tb_latihan_kalam`
--
ALTER TABLE `tb_latihan_kalam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_latihan_kalam_user`
--
ALTER TABLE `tb_latihan_kalam_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_latihan_kalam_user_id_user_id_latihan_kalam_unique` (`id_user`,`id_latihan_kalam`),
  ADD KEY `tb_latihan_kalam_user_id_latihan_kalam_foreign` (`id_latihan_kalam`);

--
-- Indexes for table `tb_latihan_qiraah`
--
ALTER TABLE `tb_latihan_qiraah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mufrodat`
--
ALTER TABLE `tb_mufrodat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pertanyaan_soal_cerita`
--
ALTER TABLE `tb_pertanyaan_soal_cerita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_soal_cerita` (`id_soal_cerita`);

--
-- Indexes for table `tb_qiraah`
--
ALTER TABLE `tb_qiraah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_rekaman_soal_cerita`
--
ALTER TABLE `tb_rekaman_soal_cerita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_soal_cerita` (`id_soal_cerita`),
  ADD KEY `user_id` (`id_user`);

--
-- Indexes for table `tb_rekaman_soal_percakapan`
--
ALTER TABLE `tb_rekaman_soal_percakapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_soal_percakapan` (`id_soal_percakapan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_soal_benar_salah`
--
ALTER TABLE `tb_soal_benar_salah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_soal_benar_salah_id_latihan_foreign` (`id_latihan`);

--
-- Indexes for table `tb_soal_cerita`
--
ALTER TABLE `tb_soal_cerita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_latihan_kalam` (`id_latihan_kalam`);

--
-- Indexes for table `tb_soal_cerita_user`
--
ALTER TABLE `tb_soal_cerita_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_soal_cerita_user_id_user_foreign` (`id_user`),
  ADD KEY `tb_soal_cerita_user_id_latihan_kalam_user_foreign` (`id_latihan_kalam_user`),
  ADD KEY `tb_soal_cerita_user_id_soal_cerita_foreign` (`id_soal_cerita`);

--
-- Indexes for table `tb_soal_latihan`
--
ALTER TABLE `tb_soal_latihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_soal_latihan_id_latihan_foreign` (`id_latihan`);

--
-- Indexes for table `tb_soal_percakapan`
--
ALTER TABLE `tb_soal_percakapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_latihan_kalam` (`id_latihan_kalam`);

--
-- Indexes for table `tb_soal_percakapan_user`
--
ALTER TABLE `tb_soal_percakapan_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_soal_percakapan_user_id_user_foreign` (`id_user`),
  ADD KEY `tb_soal_percakapan_user_id_latihan_kalam_user_foreign` (`id_latihan_kalam_user`),
  ADD KEY `tb_soal_percakapan_user_id_soal_percakapan_foreign` (`id_soal_percakapan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_benar_salah`
--
ALTER TABLE `tb_benar_salah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_hasil_mufrodat`
--
ALTER TABLE `tb_hasil_mufrodat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_hasil_soal_benar_salah`
--
ALTER TABLE `tb_hasil_soal_benar_salah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tb_hasil_soal_latihan`
--
ALTER TABLE `tb_hasil_soal_latihan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `tb_isi_kalam`
--
ALTER TABLE `tb_isi_kalam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_isi_konten_mufrodat`
--
ALTER TABLE `tb_isi_konten_mufrodat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `tb_isi_qiraah`
--
ALTER TABLE `tb_isi_qiraah`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_jawaban_soal_benar_salah`
--
ALTER TABLE `tb_jawaban_soal_benar_salah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_jawaban_soal_latihan`
--
ALTER TABLE `tb_jawaban_soal_latihan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1971;

--
-- AUTO_INCREMENT for table `tb_kalam`
--
ALTER TABLE `tb_kalam`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_konten_mufrodat`
--
ALTER TABLE `tb_konten_mufrodat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_latihan_kalam`
--
ALTER TABLE `tb_latihan_kalam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_latihan_kalam_user`
--
ALTER TABLE `tb_latihan_kalam_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_latihan_qiraah`
--
ALTER TABLE `tb_latihan_qiraah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_mufrodat`
--
ALTER TABLE `tb_mufrodat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_pertanyaan_soal_cerita`
--
ALTER TABLE `tb_pertanyaan_soal_cerita`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_qiraah`
--
ALTER TABLE `tb_qiraah`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_rekaman_soal_cerita`
--
ALTER TABLE `tb_rekaman_soal_cerita`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_rekaman_soal_percakapan`
--
ALTER TABLE `tb_rekaman_soal_percakapan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_soal_benar_salah`
--
ALTER TABLE `tb_soal_benar_salah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `tb_soal_cerita`
--
ALTER TABLE `tb_soal_cerita`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_soal_cerita_user`
--
ALTER TABLE `tb_soal_cerita_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_soal_latihan`
--
ALTER TABLE `tb_soal_latihan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT for table `tb_soal_percakapan`
--
ALTER TABLE `tb_soal_percakapan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_soal_percakapan_user`
--
ALTER TABLE `tb_soal_percakapan_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_hasil_mufrodat`
--
ALTER TABLE `tb_hasil_mufrodat`
  ADD CONSTRAINT `tb_attempt_qiraah_id_konten_qiraah_foreign` FOREIGN KEY (`id_konten_mufrodat`) REFERENCES `tb_konten_mufrodat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_attempt_qiraah_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_hasil_soal_benar_salah`
--
ALTER TABLE `tb_hasil_soal_benar_salah`
  ADD CONSTRAINT `tb_hasil_soal_benar_salah_latihan_id_foreign` FOREIGN KEY (`latihan_id`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_hasil_soal_benar_salah_soal_benar_salah_id_foreign` FOREIGN KEY (`soal_benar_salah_id`) REFERENCES `tb_soal_benar_salah` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_hasil_soal_benar_salah_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_hasil_soal_latihan`
--
ALTER TABLE `tb_hasil_soal_latihan`
  ADD CONSTRAINT `tb_hasil_soal_latihan_jawaban_latihan_id_foreign` FOREIGN KEY (`jawaban_latihan_id`) REFERENCES `tb_jawaban_soal_latihan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_hasil_soal_latihan_latihan_id_foreign` FOREIGN KEY (`latihan_id`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_hasil_soal_latihan_soal_latihan_id_foreign` FOREIGN KEY (`soal_latihan_id`) REFERENCES `tb_soal_latihan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_hasil_soal_latihan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_isi_kalam`
--
ALTER TABLE `tb_isi_kalam`
  ADD CONSTRAINT `id_kalam` FOREIGN KEY (`id_kalam`) REFERENCES `tb_kalam` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `tb_isi_konten_mufrodat`
--
ALTER TABLE `tb_isi_konten_mufrodat`
  ADD CONSTRAINT `tb_isi_konten_qiraah_id_konten_qiraah_foreign` FOREIGN KEY (`id_mufrodat`) REFERENCES `tb_mufrodat` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `tb_isi_qiraah`
--
ALTER TABLE `tb_isi_qiraah`
  ADD CONSTRAINT `id_qiraah` FOREIGN KEY (`id_qiraah`) REFERENCES `tb_qiraah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_jawaban_soal_benar_salah`
--
ALTER TABLE `tb_jawaban_soal_benar_salah`
  ADD CONSTRAINT `tb_jawaban_soal_benar_salah_id_soal_benar_salah_foreign` FOREIGN KEY (`id_soal_benar_salah`) REFERENCES `tb_soal_benar_salah` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_jawaban_soal_latihan`
--
ALTER TABLE `tb_jawaban_soal_latihan`
  ADD CONSTRAINT `tb_jawaban_soal_latihan_id_soal_latihan_foreign` FOREIGN KEY (`id_soal_latihan`) REFERENCES `tb_soal_latihan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_konten_mufrodat`
--
ALTER TABLE `tb_konten_mufrodat`
  ADD CONSTRAINT `tb_konten_qiraah_id_qiraah_foreign` FOREIGN KEY (`id_mufrodat`) REFERENCES `tb_mufrodat` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_latihan_kalam_user`
--
ALTER TABLE `tb_latihan_kalam_user`
  ADD CONSTRAINT `tb_latihan_kalam_user_id_latihan_kalam_foreign` FOREIGN KEY (`id_latihan_kalam`) REFERENCES `tb_latihan_kalam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_latihan_kalam_user_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_rekaman_soal_cerita`
--
ALTER TABLE `tb_rekaman_soal_cerita`
  ADD CONSTRAINT `fk_id_soal_cerita` FOREIGN KEY (`id_soal_cerita`) REFERENCES `tb_soal_cerita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rekaman_soal_percakapan`
--
ALTER TABLE `tb_rekaman_soal_percakapan`
  ADD CONSTRAINT `id_percakapan` FOREIGN KEY (`id_soal_percakapan`) REFERENCES `tb_soal_percakapan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_user_fk_user_id` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_soal_benar_salah`
--
ALTER TABLE `tb_soal_benar_salah`
  ADD CONSTRAINT `tb_soal_benar_salah_id_latihan_foreign` FOREIGN KEY (`id_latihan`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_soal_cerita`
--
ALTER TABLE `tb_soal_cerita`
  ADD CONSTRAINT `id_latihan_kalam` FOREIGN KEY (`id_latihan_kalam`) REFERENCES `tb_latihan_kalam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_soal_cerita_user`
--
ALTER TABLE `tb_soal_cerita_user`
  ADD CONSTRAINT `tb_soal_cerita_user_id_latihan_kalam_user_foreign` FOREIGN KEY (`id_latihan_kalam_user`) REFERENCES `tb_latihan_kalam_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_soal_cerita_user_id_soal_cerita_foreign` FOREIGN KEY (`id_soal_cerita`) REFERENCES `tb_soal_cerita` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_soal_cerita_user_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_soal_latihan`
--
ALTER TABLE `tb_soal_latihan`
  ADD CONSTRAINT `tb_soal_latihan_id_latihan_foreign` FOREIGN KEY (`id_latihan`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_soal_percakapan`
--
ALTER TABLE `tb_soal_percakapan`
  ADD CONSTRAINT `latihan_kalam` FOREIGN KEY (`id_latihan_kalam`) REFERENCES `tb_latihan_kalam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_soal_percakapan_user`
--
ALTER TABLE `tb_soal_percakapan_user`
  ADD CONSTRAINT `tb_soal_percakapan_user_id_latihan_kalam_user_foreign` FOREIGN KEY (`id_latihan_kalam_user`) REFERENCES `tb_latihan_kalam_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_soal_percakapan_user_id_soal_percakapan_foreign` FOREIGN KEY (`id_soal_percakapan`) REFERENCES `tb_soal_percakapan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_soal_percakapan_user_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
