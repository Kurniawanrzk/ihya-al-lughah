/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_benar_salah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_benar_salah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_benar_salah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_hasil_mufrodat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_hasil_mufrodat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_konten_mufrodat` bigint unsigned NOT NULL,
  `guest_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_attempt_qiraah_id_konten_qiraah_foreign` (`id_konten_mufrodat`),
  KEY `tb_attempt_qiraah_id_user_foreign` (`id_user`),
  CONSTRAINT `tb_attempt_qiraah_id_konten_qiraah_foreign` FOREIGN KEY (`id_konten_mufrodat`) REFERENCES `tb_konten_mufrodat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_attempt_qiraah_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_hasil_soal_benar_salah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_hasil_soal_benar_salah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `latihan_id` bigint unsigned NOT NULL,
  `soal_benar_salah_id` bigint unsigned NOT NULL,
  `benar` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_hasil_soal_benar_salah_user_id_foreign` (`user_id`),
  KEY `tb_hasil_soal_benar_salah_latihan_id_foreign` (`latihan_id`),
  KEY `tb_hasil_soal_benar_salah_soal_benar_salah_id_foreign` (`soal_benar_salah_id`),
  CONSTRAINT `tb_hasil_soal_benar_salah_latihan_id_foreign` FOREIGN KEY (`latihan_id`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_hasil_soal_benar_salah_soal_benar_salah_id_foreign` FOREIGN KEY (`soal_benar_salah_id`) REFERENCES `tb_soal_benar_salah` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tb_hasil_soal_benar_salah_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_hasil_soal_latihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_hasil_soal_latihan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `latihan_id` bigint unsigned NOT NULL,
  `soal_latihan_id` bigint unsigned NOT NULL,
  `jawaban_latihan_id` bigint unsigned NOT NULL,
  `benar` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_hasil_soal_latihan_user_id_foreign` (`user_id`),
  KEY `tb_hasil_soal_latihan_latihan_id_foreign` (`latihan_id`),
  KEY `tb_hasil_soal_latihan_soal_latihan_id_foreign` (`soal_latihan_id`),
  KEY `tb_hasil_soal_latihan_jawaban_latihan_id_foreign` (`jawaban_latihan_id`),
  CONSTRAINT `tb_hasil_soal_latihan_jawaban_latihan_id_foreign` FOREIGN KEY (`jawaban_latihan_id`) REFERENCES `tb_jawaban_soal_latihan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_hasil_soal_latihan_latihan_id_foreign` FOREIGN KEY (`latihan_id`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_hasil_soal_latihan_soal_latihan_id_foreign` FOREIGN KEY (`soal_latihan_id`) REFERENCES `tb_soal_latihan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_hasil_soal_latihan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_isi_kalam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_isi_kalam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `teks_percakapan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `suara_percakapan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_kalam` int unsigned NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kalam` (`id_kalam`),
  CONSTRAINT `id_kalam` FOREIGN KEY (`id_kalam`) REFERENCES `tb_kalam` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_isi_konten_mufrodat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_isi_konten_mufrodat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_mufrodat` bigint unsigned NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kosakata` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suara` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_isi_konten_qiraah_id_konten_qiraah_foreign` (`id_mufrodat`),
  CONSTRAINT `tb_isi_konten_qiraah_id_konten_qiraah_foreign` FOREIGN KEY (`id_mufrodat`) REFERENCES `tb_mufrodat` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_isi_qiraah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_isi_qiraah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_qiraah` int NOT NULL,
  `teks_bacaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `suara` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_qiraah` (`id_qiraah`),
  CONSTRAINT `id_qiraah` FOREIGN KEY (`id_qiraah`) REFERENCES `tb_qiraah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_jawaban_soal_benar_salah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_jawaban_soal_benar_salah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_soal_benar_salah` bigint unsigned NOT NULL,
  `jawaban` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `benar` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_jawaban_soal_benar_salah_id_soal_benar_salah_foreign` (`id_soal_benar_salah`),
  CONSTRAINT `tb_jawaban_soal_benar_salah_id_soal_benar_salah_foreign` FOREIGN KEY (`id_soal_benar_salah`) REFERENCES `tb_soal_benar_salah` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_jawaban_soal_latihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_jawaban_soal_latihan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_soal_latihan` bigint unsigned NOT NULL,
  `jawaban` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `benar` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_jawaban_soal_latihan_id_soal_latihan_foreign` (`id_soal_latihan`),
  CONSTRAINT `tb_jawaban_soal_latihan_id_soal_latihan_foreign` FOREIGN KEY (`id_soal_latihan`) REFERENCES `tb_soal_latihan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_kalam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_kalam` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `urutan_bab` char(3) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `nama_materi` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `keys` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_konten_mufrodat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_konten_mufrodat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_mufrodat` bigint unsigned NOT NULL,
  `nama_konten_mufrodat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_konten_qiraah_id_qiraah_foreign` (`id_mufrodat`),
  CONSTRAINT `tb_konten_qiraah_id_qiraah_foreign` FOREIGN KEY (`id_mufrodat`) REFERENCES `tb_mufrodat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_latihan_kalam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_latihan_kalam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_latihan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `urutan_bab` char(3) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `deskripsi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `keys` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_latihan_kalam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_latihan_kalam_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` bigint unsigned NOT NULL,
  `id_latihan_kalam` int NOT NULL,
  `status` enum('in_progress','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_progress',
  `score` decimal(5,2) DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_latihan_kalam_user_id_user_id_latihan_kalam_unique` (`id_user`,`id_latihan_kalam`),
  KEY `tb_latihan_kalam_user_id_latihan_kalam_foreign` (`id_latihan_kalam`),
  CONSTRAINT `tb_latihan_kalam_user_id_latihan_kalam_foreign` FOREIGN KEY (`id_latihan_kalam`) REFERENCES `tb_latihan_kalam` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_latihan_kalam_user_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_latihan_qiraah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_latihan_qiraah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_latihan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan_bab` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_mufrodat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_mufrodat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_materi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan_bab` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_pertanyaan_soal_cerita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pertanyaan_soal_cerita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_soal_cerita` int NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_soal_cerita` (`id_soal_cerita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_qiraah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_qiraah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `urutan_bab` char(4) NOT NULL,
  `nama_materi` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `keys` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_rekaman_soal_cerita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rekaman_soal_cerita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_soal_cerita` int NOT NULL,
  `lokasi_audio` text NOT NULL,
  `id_user` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_soal_cerita` (`id_soal_cerita`),
  KEY `user_id` (`id_user`),
  CONSTRAINT `fk_id_soal_cerita` FOREIGN KEY (`id_soal_cerita`) REFERENCES `tb_soal_cerita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_rekaman_soal_percakapan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rekaman_soal_percakapan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_soal_percakapan` int NOT NULL,
  `lokasi_audio` varchar(255) NOT NULL,
  `id_user` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_soal_percakapan` (`id_soal_percakapan`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `id_percakapan` FOREIGN KEY (`id_soal_percakapan`) REFERENCES `tb_soal_percakapan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_user_fk_user_id` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_soal_benar_salah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_soal_benar_salah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_latihan` bigint unsigned NOT NULL,
  `pertanyaan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor` int NOT NULL,
  `benar` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_soal_benar_salah_id_latihan_foreign` (`id_latihan`),
  CONSTRAINT `tb_soal_benar_salah_id_latihan_foreign` FOREIGN KEY (`id_latihan`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_soal_cerita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_soal_cerita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_latihan_kalam` int NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `cerita` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_latihan_kalam` (`id_latihan_kalam`),
  CONSTRAINT `id_latihan_kalam` FOREIGN KEY (`id_latihan_kalam`) REFERENCES `tb_latihan_kalam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_soal_cerita_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_soal_cerita_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` bigint unsigned NOT NULL,
  `id_latihan_kalam_user` int DEFAULT NULL,
  `id_soal_cerita` int NOT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci,
  `audio_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tb_soal_cerita_user_id_user_foreign` (`id_user`),
  KEY `tb_soal_cerita_user_id_latihan_kalam_user_foreign` (`id_latihan_kalam_user`),
  KEY `tb_soal_cerita_user_id_soal_cerita_foreign` (`id_soal_cerita`),
  CONSTRAINT `tb_soal_cerita_user_id_latihan_kalam_user_foreign` FOREIGN KEY (`id_latihan_kalam_user`) REFERENCES `tb_latihan_kalam_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_soal_cerita_user_id_soal_cerita_foreign` FOREIGN KEY (`id_soal_cerita`) REFERENCES `tb_soal_cerita` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_soal_cerita_user_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_soal_latihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_soal_latihan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_latihan` bigint unsigned NOT NULL,
  `nomor` int NOT NULL,
  `pertanyaan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_soal_latihan_id_latihan_foreign` (`id_latihan`),
  CONSTRAINT `tb_soal_latihan_id_latihan_foreign` FOREIGN KEY (`id_latihan`) REFERENCES `tb_latihan_qiraah` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_soal_percakapan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_soal_percakapan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_latihan_kalam` int NOT NULL,
  `nomor` int NOT NULL,
  `percakapan` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_latihan_kalam` (`id_latihan_kalam`),
  CONSTRAINT `latihan_kalam` FOREIGN KEY (`id_latihan_kalam`) REFERENCES `tb_latihan_kalam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tb_soal_percakapan_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_soal_percakapan_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` bigint unsigned NOT NULL,
  `id_latihan_kalam_user` int NOT NULL,
  `id_soal_percakapan` int NOT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci,
  `audio_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tb_soal_percakapan_user_id_user_foreign` (`id_user`),
  KEY `tb_soal_percakapan_user_id_latihan_kalam_user_foreign` (`id_latihan_kalam_user`),
  KEY `tb_soal_percakapan_user_id_soal_percakapan_foreign` (`id_soal_percakapan`),
  CONSTRAINT `tb_soal_percakapan_user_id_latihan_kalam_user_foreign` FOREIGN KEY (`id_latihan_kalam_user`) REFERENCES `tb_latihan_kalam_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_soal_percakapan_user_id_soal_percakapan_foreign` FOREIGN KEY (`id_soal_percakapan`) REFERENCES `tb_soal_percakapan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tb_soal_percakapan_user_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gauth_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gauth_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9,'2014_10_12_100000_create_password_reset_tokens_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11,'2019_12_14_000001_create_personal_access_tokens_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12,'2024_12_23_175133_create_tb_qiraah_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13,'2024_12_23_175504_create_tb_konten_qiraah_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14,'2024_12_23_175735_create_tb_isi_konten_qiraah_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15,'2024_12_23_182347_create_tb_attempt_qiraah_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16,'2024_12_27_182243_create_tb_latihan_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17,'2024_12_27_183026_create_tb_soal_latihan_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18,'2024_12_27_183227_create_tb_jawaban_soal_latihan_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (19,'2024_12_27_183411_create_tb_hasil_soal_latihan_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (24,'2024_12_28_103841_create_tb_benar_salah_table',4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25,'2024_12_28_103849_create_tb_soal_benar_salah_table',4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26,'2024_12_28_103859_create_tb_jawaban_soal_benar_salah_table',4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (27,'2024_12_28_103904_create_tb_hasil_soal_benar_salah_table',4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28,'2025_01_04_182548_google_social_auth_id',5);
