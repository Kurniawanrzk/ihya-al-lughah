-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2025 at 10:24 AM
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
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2024_12_23_175133_create_tb_qiraah_table', 1),
(13, '2024_12_23_175504_create_tb_konten_qiraah_table', 1),
(14, '2024_12_23_175735_create_tb_isi_konten_qiraah_table', 1),
(15, '2024_12_23_182347_create_tb_attempt_qiraah_table', 2),
(16, '2024_12_27_182243_create_tb_latihan_table', 3),
(17, '2024_12_27_183026_create_tb_soal_latihan_table', 3),
(18, '2024_12_27_183227_create_tb_jawaban_soal_latihan_table', 3),
(19, '2024_12_27_183411_create_tb_hasil_soal_latihan_table', 3),
(24, '2024_12_28_103841_create_tb_benar_salah_table', 4),
(25, '2024_12_28_103849_create_tb_soal_benar_salah_table', 4),
(26, '2024_12_28_103859_create_tb_jawaban_soal_benar_salah_table', 4),
(27, '2024_12_28_103904_create_tb_hasil_soal_benar_salah_table', 4),
(28, '2025_01_04_182548_google_social_auth_id', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(21, 'guest_677974b854a80', NULL, 1, 1, 1, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(22, 'guest_677974b854a80', NULL, 1, 2, 1, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(23, 'guest_677974b854a80', NULL, 1, 3, 1, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(24, 'guest_677974b854a80', NULL, 1, 4, 1, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(25, 'guest_677974b854a80', NULL, 1, 5, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59');

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
(61, 'guest_6772c6bf0525c', NULL, 1, 1, 3, 0, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(62, 'guest_6772c6bf0525c', NULL, 1, 2, 6, 1, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(63, 'guest_6772c6bf0525c', NULL, 1, 3, 13, 0, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(64, 'guest_6772c6bf0525c', NULL, 1, 4, 16, 1, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(65, 'guest_6772c6bf0525c', NULL, 1, 5, 21, 1, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(66, 'guest_6772c6bf0525c', NULL, 1, 6, 27, 0, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(67, 'guest_6772c6bf0525c', NULL, 1, 7, 32, 0, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(68, 'guest_6772c6bf0525c', NULL, 1, 8, 38, 0, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(69, 'guest_6772c6bf0525c', NULL, 1, 9, 41, 1, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(70, 'guest_6772c6bf0525c', NULL, 1, 10, 46, 1, '2024-12-30 13:23:39', '2024-12-30 13:23:39'),
(71, 'guest_677974b854a80', NULL, 1, 1, 3, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(72, 'guest_677974b854a80', NULL, 1, 2, 7, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(73, 'guest_677974b854a80', NULL, 1, 3, 13, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(74, 'guest_677974b854a80', NULL, 1, 4, 16, 1, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(75, 'guest_677974b854a80', NULL, 1, 5, 22, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(76, 'guest_677974b854a80', NULL, 1, 6, 28, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(77, 'guest_677974b854a80', NULL, 1, 7, 35, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(78, 'guest_677974b854a80', NULL, 1, 8, 37, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(79, 'guest_677974b854a80', NULL, 1, 9, 43, 0, '2025-01-04 10:53:59', '2025-01-04 10:53:59'),
(80, 'guest_677974b854a80', NULL, 1, 10, 46, 1, '2025-01-04 10:53:59', '2025-01-04 10:53:59');

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
(1, '/storage/video/1736965056_videoplayback.mp4', '<p style=\"text-align: center;\"><strong>BAB I</strong></p>\r\n<p style=\"text-align: center;\"><strong>Pekerjaan dan Profesi</strong></p>\r\n<h3><strong>Pendahuluan</strong></h3>\r\n<p>Pekerjaan adalah aktivitas yang dilakukan seseorang untuk memenuhi kebutuhan hidup dan mencapai cita-cita. Dalam kehidupan sehari-hari, pekerjaan memiliki peran penting karena tidak hanya memberi penghasilan, tetapi juga membangun masyarakat. Dalam bahasa Arab, pekerjaan disebut <em>(ʿamal/عَمَل)</em>, yang artinya usaha atau aktivitas yang menghasilkan sesuatu.</p>\r\n<p>Setiap pekerjaan memiliki tugas dan tanggung jawab masing-masing. Pada bab ini, kita akan mempelajari berbagai jenis profesi, peranannya, dan istilahnya dalam bahasa Arab.</p>\r\n<hr />\r\n<h3><strong>Beragam Profesi dan Peranannya</strong></h3>\r\n<h4>1. <strong>Dokter (طَبِيب)</strong></h4>\r\n<p>Dokter bertugas merawat pasien dan menyembuhkan penyakit. Mereka bekerja di rumah sakit atau klinik. Profesi ini membutuhkan pendidikan dan pelatihan yang panjang. Dalam bahasa Arab, dokter disebut <em>(ṭabīb/طَبِيب)</em>.</p>\r\n<p><strong>Contoh Kalimat dalam Bahasa Arab:</strong></p>\r\n<ul>\r\n<li><em>الطَّبِيبُ يُعَالِجُ الْمَرْضَى.</em><br /><em>(Aṭ-ṭabību yuʿāliju al-marḍā.)</em><br />Artinya: Dokter merawat pasien.</li>\r\n</ul>\r\n<h4>2. <strong>Guru (مُعَلِّم)</strong></h4>\r\n<p>Guru memiliki tugas untuk mengajarkan ilmu pengetahuan dan nilai-nilai kehidupan. Dalam bahasa Arab, guru disebut <em>(muʿallim/مُعَلِّم)</em>. Profesi ini sangat penting karena membentuk generasi penerus bangsa.</p>\r\n<p><strong>Contoh Kalimat dalam Bahasa Arab:</strong></p>\r\n<ul>\r\n<li><em>الْمُعَلِّمُ يُعَلِّمُ التَّلَامِيذَ.</em><br /><em>(Al-muʿallimu yuʿallimu at-talāmīḏa.)</em><br />Artinya: Guru mengajarkan siswa.</li>\r\n</ul>\r\n<h4>3. <strong>Insinyur (مُهَنْدِس)</strong></h4>\r\n<p>Insinyur adalah orang yang merancang dan menciptakan teknologi serta infrastruktur. Dalam bahasa Arab, insinyur disebut <em>(muhandis/مُهَنْدِس)</em>. Mereka bekerja di bidang konstruksi, teknologi, hingga informatika.</p>\r\n<p><strong>Contoh Kalimat dalam Bahasa Arab:</strong></p>\r\n<ul>\r\n<li><em>الْمُهَنْدِسُ يَبْنِي الْمَبَانِي.</em><br /><em>(Al-muhandisu yabnī al-mabānī.)</em><br />Artinya: Insinyur membangun gedung.</li>\r\n</ul>\r\n<h4>4. <strong>Petani (فَلَّاح)</strong></h4>\r\n<p>Petani memiliki tugas menanam tanaman dan menghasilkan bahan pangan. Dalam bahasa Arab, petani disebut <em>(fallāḥ/فَلَّاح)</em>. Mereka adalah bagian penting dari masyarakat karena memastikan ketersediaan makanan.</p>\r\n<p><strong>Contoh Kalimat dalam Bahasa Arab:</strong></p>\r\n<ul>\r\n<li><em>الْفَلَّاحُ يَزْرَعُ الْأَرْضَ.</em><br /><em>(Al-fallāḥu yazraʿu al-arḍa.)</em><br />Artinya: Petani menanam di tanah.</li>\r\n</ul>\r\n<hr />\r\n<h3><strong>Profesi Lain yang Perlu Diketahui</strong></h3>\r\n<ul>\r\n<li><strong>Pengacara (مُحَامِي):</strong> Membantu menyelesaikan masalah hukum dan membela hak-hak klien di pengadilan.</li>\r\n<li><strong>Pengusaha (تَاجِر):</strong> Membuka usaha, menciptakan lapangan kerja, dan menggerakkan ekonomi.</li>\r\n<li><strong>Programmer (مُبَرْمِج):</strong> Membuat perangkat lunak dan aplikasi yang membantu kehidupan sehari-hari.</li>\r\n</ul>\r\n<hr />\r\n<h3><strong>Nilai Pekerjaan dalam Kehidupan</strong></h3>\r\n<p>Pekerjaan tidak hanya penting untuk menghasilkan uang, tetapi juga memberikan makna dalam hidup seseorang. Dalam Islam, bekerja dianggap sebagai ibadah jika dilakukan dengan niat yang baik. Nabi Muhammad SAW bersabda:</p>\r\n<blockquote>\r\n<p><em>(Al-kāsib ḥabībullāh/الكَاسِبُ حَبِيبُ اللَّهِ)</em><br />\"Orang yang bekerja mencari nafkah adalah kekasih Allah.\"</p>\r\n</blockquote>\r\n<p>Oleh karena itu, apapun profesi yang kita pilih, kita harus melakukannya dengan tekun dan penuh tanggung jawab.</p>\r\n<hr />\r\n<h3><strong>Latihan Soal</strong></h3>\r\n<ol>\r\n<li>Sebutkan 3 profesi yang disebutkan dalam teks ini beserta istilahnya dalam bahasa Arab!</li>\r\n<li>Buatlah kalimat sederhana menggunakan kata berikut dalam bahasa Arab: <em>(طَبِيب، مُعَلِّم، فَلَّاح)</em>.</li>\r\n<li>Jelaskan pentingnya bekerja menurut pandangan Islam!</li>\r\n</ol>\r\n<hr />\r\n<h3><strong>Kesimpulan</strong></h3>\r\n<p>Setiap pekerjaan memiliki peran yang sangat penting dalam kehidupan. Melalui berbagai profesi seperti dokter, guru, insinyur, petani, dan lainnya, masyarakat dapat bekerja sama membangun peradaban yang lebih baik. Apapun profesi yang kita pilih, jadikan pekerjaan sebagai cara untuk mengabdi kepada Tuhan dan membantu sesama.</p>', NULL, 1, '2025-01-15 11:17:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_isi_konten_mufrodat`
--

CREATE TABLE `tb_isi_konten_mufrodat` (
  `id` bigint UNSIGNED NOT NULL,
  `id_mufrodat` bigint UNSIGNED NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kosakata` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_isi_konten_mufrodat`
--

INSERT INTO `tb_isi_konten_mufrodat` (`id`, `id_mufrodat`, `gambar`, `kosakata`, `created_at`, `updated_at`) VALUES
(20, 21, '1736874186_kayu.jpg', 'نَجَّارٌ', '2025-01-14 10:03:06', '2025-01-14 10:03:06'),
(21, 21, '1736874186_dokter.jpg', 'طَبِيبٌ', '2025-01-14 10:03:06', '2025-01-14 10:03:06'),
(22, 21, '1736874186_pengacara.jpeg', 'مُحَامٍ', '2025-01-14 10:03:06', '2025-01-14 10:03:06'),
(23, 21, '1736874186_pedagang.webp', 'َاجِرٌ', '2025-01-14 10:03:06', '2025-01-14 10:03:06'),
(24, 22, '1736965749_Screenshot 2025-01-16 012620.png', 'أَرْنَب', '2025-01-15 11:29:09', '2025-01-15 11:29:09'),
(25, 22, '1736965749_Screenshot 2025-01-16 012608.png', 'كَلْب', '2025-01-15 11:29:09', '2025-01-15 11:29:09'),
(26, 22, '1736965749_Screenshot 2025-01-16 012528.png', 'قِطَّة', '2025-01-15 11:29:09', '2025-01-15 11:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `tb_isi_qiraah`
--

CREATE TABLE `tb_isi_qiraah` (
  `id` int NOT NULL,
  `id_qiraah` int NOT NULL,
  `teks_bacaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_isi_qiraah`
--

INSERT INTO `tb_isi_qiraah` (`id`, `id_qiraah`, `teks_bacaan`, `updated_at`, `created_at`) VALUES
(1, 2, NULL, '2025-01-16 03:18:55', '2025-01-14 09:35:43');

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
(1, 1, 'هوايتي لعب الكرة', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(2, 1, 'أنا ألعب كرة السلة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(3, 1, 'هوايتي السباحة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(4, 1, 'أنا أدرس اللغة العربية', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(5, 1, 'أنا أحب القراءة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(6, 2, 'أنا أدرس في المكتبة', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(7, 2, 'هو يدرس في البيت', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(8, 2, 'نحن نلعب في الملعب', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(9, 2, 'هم يكتبون في الكتاب', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(10, 2, 'أنت تقرأ في المدرسة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(11, 3, 'هم يسكنون في المدينة الكبيرة', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(12, 3, 'نحن نسكن في القرية', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(13, 3, 'هو يسكن في المدينة الصغيرة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(14, 3, 'أنا أسكن في الحي الجديد', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(15, 3, 'أنتم تسكنون في الشارع الرئيسي', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(16, 4, 'أنا أحب أكل الخبز', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(17, 4, 'هو يحب أكل الفاكهة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(18, 4, 'نحن نحب شرب الماء', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(19, 4, 'أنت تحب قراءة الكتاب', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(20, 4, 'هم يحبون الذهاب إلى الحديقة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(21, 5, 'هو يذهب إلى المسجد كل صباح', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(22, 5, 'أنا أذهب إلى السوق', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(23, 5, 'نحن نذهب إلى المدرسة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(24, 5, 'هم يذهبون إلى المكتبة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(25, 5, 'أنت تذهب إلى الملعب', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(26, 6, 'نحن نقرأ كتابا', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(27, 6, 'أنا أكتب رسالة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(28, 6, 'هو يفتح الباب', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(29, 6, 'أنتم تقرأون الجريدة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(30, 6, 'هم يشاهدون التلفاز', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(31, 7, 'بيتي كبير ومريح', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(32, 7, 'هو بيت صغير', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(33, 7, 'المنزل قديم جدا', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(34, 7, 'بيتنا في الطابق الثاني', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(35, 7, 'البيت في القرية', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(36, 8, 'هم يلعبون في الحديقة', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(37, 8, 'أنا ألعب في المدرسة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(38, 8, 'نحن نلعب في البيت', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(39, 8, 'هو يلعب في الساحة', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(40, 8, 'أنت تلعب في الحي', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(41, 9, 'أنا أشتري طعاما من السوق', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(42, 9, 'نحن نأكل في المطعم', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(43, 9, 'هو يشتري ملابس', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(44, 9, 'أنت تشتري كتابا', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(45, 9, 'هم يبيعون الخضروات', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(46, 10, 'هو يكتب رسالة إلى صديقه', 1, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(47, 10, 'أنا أكتب في الدفتر', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(48, 10, 'نحن نكتب في اللوح', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(49, 10, 'أنت تكتب بالقلم', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18'),
(50, 10, 'هم يكتبون على الحاسوب', 0, '2024-12-27 18:46:18', '2024-12-27 18:46:18');

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
(1, 'I', '/storage/thumbnails/1736964383_dokter.jpg', 'PROFESI-PROFESI DALAM BAHASA ARAB', 'Bab ini berisikan tentang materi profesi dalam bahasa arab', 'pekerjaan, dokter, guru', '0000-00-00 00:00:00', '2025-01-15 11:06:23');

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
-- Table structure for table `tb_latihan_qiraah`
--

CREATE TABLE `tb_latihan_qiraah` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_latihan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan_bab` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_latihan_qiraah`
--

INSERT INTO `tb_latihan_qiraah` (`id`, `nama_latihan`, `thumbnail`, `urutan_bab`, `deskripsi`, `keys`, `created_at`, `updated_at`) VALUES
(1, 'Latihan 1', '/storage/thumbnails/1737021239_polisi.jpeg', 'I', 'Latihan bahasa arab 1', 'pekerjaan, negara, hobi', '2024-12-27 18:40:22', '2025-01-16 02:53:59');

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
(21, 'KOSAKATA PROFESI', 'I', 'Bab ini akan memberikan kosakata tentang profesi-profesi dalam bahasa arab', '/storage/thumbnails/1736874109_6350beaeeafc7.jpg', 'dokter, polisi', '2025-01-14 10:01:49', '2025-01-14 10:01:49'),
(22, 'KOSAKATA TENTANG HEWAN', 'II', 'Bab ini akan berisikan tentang hewan dalam bahasa arab', '/storage/thumbnails/1736965628_Screenshot 2025-01-16 012620.png', 'hewan, kucing, anjing', '2025-01-15 11:27:08', '2025-01-15 11:27:08');

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
(2, 'I', 'MATERI QIRAAH', 'Tentang Qiraah', '/storage/thumbnails/1737022727_dokter.jpg', 'dokter, guru', '2025-01-14 09:25:23', '2025-01-16 03:18:47');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_benar_salah`
--

CREATE TABLE `tb_soal_benar_salah` (
  `id` bigint UNSIGNED NOT NULL,
  `id_latihan` bigint UNSIGNED NOT NULL,
  `pertanyaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 1, 'Manakah dari kedua kosakata ini yang berarti makan?', NULL, 1, 1, '2024-12-28 10:53:22', '2024-12-28 10:53:22'),
(2, 1, 'Apa arti dari kata \"مدرسة\" dalam bahasa Indonesia?', NULL, 2, 1, '2024-12-30 08:45:07', '2024-12-30 08:45:07'),
(3, 1, 'Bagaimana cara menulis kalimat \"Saya belajar bahasa Arab\" dalam huruf Arab?', NULL, 3, 0, '2024-12-30 08:45:07', '2024-12-30 08:45:07'),
(4, 1, 'Apa huruf pertama dalam abjad Arab?', NULL, 4, 0, '2024-12-30 08:45:07', '2024-12-30 08:45:07'),
(5, 1, 'Bagaimana cara mengucapkan \"جزاك الله خيرا\" dengan benar?', NULL, 5, 0, '2024-12-30 08:45:07', '2024-12-30 08:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal_latihan`
--

CREATE TABLE `tb_soal_latihan` (
  `id` bigint UNSIGNED NOT NULL,
  `id_latihan` bigint UNSIGNED NOT NULL,
  `nomor` int NOT NULL,
  `pertanyaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_soal_latihan`
--

INSERT INTO `tb_soal_latihan` (`id`, `id_latihan`, `nomor`, `pertanyaan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Apa bahasa arab nya hobi saya bermain bola?', NULL, NULL),
(2, 1, 2, 'Apa bahasa arab nya saya sedang belajar di perpustakaan?', NULL, NULL),
(3, 1, 3, 'Apa bahasa arab nya mereka tinggal di kota besar?', NULL, NULL),
(4, 1, 4, 'Apa bahasa arab nya saya suka makan roti?', NULL, NULL),
(5, 1, 5, 'Apa bahasa arab nya dia pergi ke masjid setiap pagi?', NULL, NULL),
(6, 1, 6, 'Apa bahasa arab nya kami sedang membaca buku?', NULL, NULL),
(7, 1, 7, 'Apa bahasa arab nya rumah saya besar dan nyaman?', NULL, NULL),
(8, 1, 8, 'Apa bahasa arab nya mereka sedang bermain di taman?', NULL, NULL),
(9, 1, 9, 'Apa bahasa arab nya saya membeli makanan di pasar?', NULL, NULL),
(10, 1, 10, 'Apa bahasa arab nya dia sedang menulis surat kepada temannya?', NULL, NULL);

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
(5, 'Kurniawan Rizky', 'kurniawanrz205@gmail.com', NULL, 0, '$2y$12$..37mDGdXzoyfhUvB/7CleFLdJFVXsOTq3xH.RzMkFkO.MGfm1prW', NULL, '2025-01-15 00:15:02', '2025-01-15 00:15:02', '103343301980560015899', 'google');

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
-- Indexes for table `tb_qiraah`
--
ALTER TABLE `tb_qiraah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_soal_benar_salah`
--
ALTER TABLE `tb_soal_benar_salah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_soal_benar_salah_id_latihan_foreign` (`id_latihan`);

--
-- Indexes for table `tb_soal_latihan`
--
ALTER TABLE `tb_soal_latihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_soal_latihan_id_latihan_foreign` (`id_latihan`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_hasil_soal_latihan`
--
ALTER TABLE `tb_hasil_soal_latihan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `tb_isi_kalam`
--
ALTER TABLE `tb_isi_kalam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_isi_konten_mufrodat`
--
ALTER TABLE `tb_isi_konten_mufrodat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_isi_qiraah`
--
ALTER TABLE `tb_isi_qiraah`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_jawaban_soal_benar_salah`
--
ALTER TABLE `tb_jawaban_soal_benar_salah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_jawaban_soal_latihan`
--
ALTER TABLE `tb_jawaban_soal_latihan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `tb_kalam`
--
ALTER TABLE `tb_kalam`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_konten_mufrodat`
--
ALTER TABLE `tb_konten_mufrodat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_latihan_qiraah`
--
ALTER TABLE `tb_latihan_qiraah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_mufrodat`
--
ALTER TABLE `tb_mufrodat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_qiraah`
--
ALTER TABLE `tb_qiraah`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_soal_benar_salah`
--
ALTER TABLE `tb_soal_benar_salah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_soal_latihan`
--
ALTER TABLE `tb_soal_latihan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `tb_soal_benar_salah`
--
ALTER TABLE `tb_soal_benar_salah`
  ADD CONSTRAINT `tb_soal_benar_salah_id_latihan_foreign` FOREIGN KEY (`id_latihan`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_soal_latihan`
--
ALTER TABLE `tb_soal_latihan`
  ADD CONSTRAINT `tb_soal_latihan_id_latihan_foreign` FOREIGN KEY (`id_latihan`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
