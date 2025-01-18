-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-ubu2204-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interactions`
--

DROP TABLE IF EXISTS `interactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `liked` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `song_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interactions_user_id_foreign` (`user_id`),
  KEY `interactions_song_id_foreign` (`song_id`),
  CONSTRAINT `interactions_song_id_foreign` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `interactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interactions`
--

LOCK TABLES `interactions` WRITE;
/*!40000 ALTER TABLE `interactions` DISABLE KEYS */;
INSERT INTO `interactions` VALUES
(1,'Amazing piece! Love it.',1,2,1,'2025-01-17 00:26:30','2025-01-17 00:26:30'),
(2,'Great for beginners!',1,3,2,'2025-01-17 00:26:30','2025-01-17 00:26:30'),
(3,NULL,1,1,3,'2025-01-17 00:26:30','2025-01-17 00:26:30'),
(4,'yo',0,4,4,'2025-01-17 21:12:38','2025-01-17 21:12:38'),
(5,NULL,0,5,13,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(6,'Et maxime labore et commodi aperiam eligendi consequatur aut.',1,3,9,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(7,'Ut dolorem quo atque dolorem deleniti a.',1,5,2,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(8,'Adipisci est rerum sunt nostrum mollitia.',1,3,15,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(9,'Numquam vel dignissimos consequatur sint eum maiores eum iure.',1,4,15,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(10,'Est temporibus ratione ea.',1,1,3,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(11,'Id dolor inventore qui quia.',0,4,8,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(12,'Veniam rerum eos deserunt aut quisquam magni sed.',0,1,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(13,NULL,0,3,11,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(14,NULL,0,3,3,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(15,'Natus excepturi esse ipsam fuga autem et.',0,1,12,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(16,'Doloribus et maxime ut iste neque qui commodi.',1,2,7,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(17,NULL,1,5,10,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(18,NULL,0,2,1,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(19,NULL,0,6,13,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(20,NULL,1,4,11,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(21,NULL,1,5,12,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(22,'Debitis quasi dolores eos non neque.',1,6,12,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(23,'Adipisci tenetur rem voluptas.',1,5,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(24,NULL,0,4,2,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(25,'Laborum voluptatem fugit veritatis odit laboriosam similique.',1,1,1,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(26,NULL,0,5,8,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(27,NULL,0,4,15,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(28,'Maiores consequatur cum temporibus dicta sit voluptatem.',1,3,10,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(29,'Est dolor voluptas cupiditate quia nostrum.',0,3,11,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(30,NULL,0,1,1,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(31,NULL,1,6,12,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(32,NULL,1,5,3,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(33,NULL,0,2,3,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(34,NULL,1,3,9,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(35,NULL,0,2,11,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(36,'Nobis vitae fugit autem perspiciatis est deleniti voluptate.',1,6,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(37,'Maiores commodi assumenda odio voluptatem.',1,6,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(38,NULL,1,3,14,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(39,NULL,0,6,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(40,NULL,1,6,9,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(41,NULL,0,5,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(42,NULL,0,6,15,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(43,NULL,1,4,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(44,NULL,0,4,8,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(45,NULL,0,1,12,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(46,'Ratione aspernatur sed dolorem itaque.',0,5,5,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(47,'Aut sunt perspiciatis quisquam placeat.',1,1,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(48,'Ut ut quas dolores.',1,5,10,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(49,'Fugiat deserunt totam praesentium repellendus nihil et mollitia sit.',1,5,6,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(50,'Temporibus quidem qui ipsam sed commodi.',0,6,10,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(51,'Est consequatur expedita occaecati dolorem.',0,1,14,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(52,'Sit aperiam laboriosam blanditiis maiores mollitia.',1,3,4,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(53,NULL,1,6,9,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(54,NULL,1,3,5,'2025-01-17 23:20:50','2025-01-17 23:20:50'),
(55,'Voluptas beatae ad sit aut ut impedit.',0,6,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(56,NULL,1,3,14,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(57,'Dolorem fugiat rem perspiciatis veniam quibusdam.',0,2,4,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(58,'Et velit rerum et suscipit sit velit.',1,2,2,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(59,'Odit nostrum id consectetur reiciendis quis sint explicabo.',0,1,4,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(60,'Fuga excepturi delectus similique ut expedita enim nulla consequatur.',1,4,7,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(61,'Sit illum rerum sunt molestiae quo cum.',0,2,11,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(62,'Quae cum et culpa provident nihil.',0,1,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(63,'Iste omnis enim mollitia et nulla minima fugit sunt.',0,2,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(64,NULL,0,4,5,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(65,'Aut et saepe et.',1,3,14,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(66,'Quibusdam laboriosam aut sit optio aliquam eum inventore.',0,2,9,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(67,'Iure repudiandae quas id delectus libero.',1,3,7,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(68,NULL,1,3,7,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(69,NULL,1,6,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(70,'Qui et debitis id.',1,6,11,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(71,NULL,1,6,7,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(72,NULL,0,1,10,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(73,'Quam soluta rerum ipsam voluptatem provident necessitatibus.',1,1,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(74,NULL,1,5,8,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(75,NULL,0,6,3,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(76,NULL,1,6,15,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(77,'Animi deserunt quo voluptas est aut ad delectus eaque.',0,2,9,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(78,'Sint atque iure eius dolores.',1,5,2,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(79,NULL,1,1,1,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(80,NULL,1,5,1,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(81,NULL,0,3,9,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(82,'Eius impedit laboriosam molestiae ab.',1,5,4,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(83,NULL,1,2,14,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(84,NULL,1,5,15,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(85,'Reprehenderit impedit perspiciatis qui perferendis ut.',1,6,8,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(86,NULL,0,5,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(87,'Vitae sit sed enim aut.',1,1,13,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(88,'Voluptatem unde explicabo est vel deserunt quas.',0,6,1,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(89,NULL,1,1,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(90,NULL,1,2,10,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(91,NULL,1,1,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(92,'Debitis sed iure vel et.',1,2,11,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(93,NULL,1,5,11,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(94,'Quis quo quas inventore amet.',1,6,8,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(95,'Velit ipsa facilis magni expedita.',1,2,9,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(96,NULL,1,6,1,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(97,NULL,1,6,14,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(98,NULL,1,6,15,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(99,'Natus at qui est officia illo ipsam.',0,4,2,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(100,NULL,1,1,3,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(101,'Magni tenetur laborum eligendi ut accusamus non.',1,1,9,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(102,NULL,1,1,9,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(103,'Rerum sed dignissimos inventore.',1,6,6,'2025-01-17 23:21:23','2025-01-17 23:21:23'),
(104,'Recusandae eos dolores laudantium sequi quia similique sed.',1,1,1,'2025-01-17 23:21:23','2025-01-17 23:21:23');
/*!40000 ALTER TABLE `interactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(13,'0001_01_01_000000_create_users_table',1),
(14,'0001_01_01_000001_create_cache_table',1),
(15,'0001_01_01_000002_create_jobs_table',1),
(16,'2025_01_16_223310_create_songs_table',1),
(17,'2025_01_16_223836_create_interactions_table',2),
(18,'2025_01_17_121206_add_is_admin_to_users_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('oz7DTHrWoQUKrLSseaLR66ieJMOvdxztJdZc4qQE',7,'172.18.0.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWWFGQ3o2UGlWY0xBUEg3eHRVRXpTZzhJS3VxRW54bG9tWWJqakFibyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vbmljaGUtY29tbXVuaXR5LWRhcmlvbnNjcy5kZGV2LnNpdGUvYWRtaW4iO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjQ5OiJodHRwczovL25pY2hlLWNvbW11bml0eS1kYXJpb25zY3MuZGRldi5zaXRlL2FkbWluIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NztzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHFMS2JLeTNBVmwwclhEc3JIVkNEaU9wMlQ3LzNFckxYMzFuWHVnb0FjYnBMdGJ0YnlkQWpPIjt9',1737164322);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `artist` varchar(255) NOT NULL,
  `pdf_path` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `songs_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES
(1,'Fur Elise','A classic by Beethoven.','Ludwig van Beethoven','songs/fur_elise.pdf',1,'2025-01-17 00:26:30','2025-01-17 00:26:30'),
(2,'Clair de Lune','A beautiful piano piece.','Claude Debussy','songs/clair_de_lune.pdf',2,'2025-01-17 00:26:30','2025-01-17 00:26:30'),
(3,'Moonlight Sonata','One of Beethoven\'s masterpieces.','Ludwig van Beethoven','songs/moonlight_sonata.pdf',3,'2025-01-17 00:26:30','2025-01-17 00:26:30'),
(4,'dieter dieter dieter','dieter','dieter','songs/pdfs/01JHT7J4AN97ZPJFSFQHKKNJG7.pdf',5,'2025-01-17 13:34:38','2025-01-17 13:34:38'),
(5,'testtt','dit is een lied gemaakt voor dieter','dieter','songs/pdfs/DcCI0VYOgGU5zVwSJZeVkvJLVaVv1TtYOEC2Xt5u.pdf',4,'2025-01-17 22:09:33','2025-01-17 22:09:33'),
(6,'Qui cumque quasi.','Hic reprehenderit nulla quis quasi omnis ipsam. Cumque ut excepturi porro saepe laborum nesciunt qui.','Alicia Fadel','songs/blanditiis.pdf',5,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(7,'Nam voluptatem.','Iure repudiandae eveniet ut. Repudiandae illum non officia nemo asperiores est nam. Assumenda repudiandae eveniet fuga atque ut maxime nisi qui.','Prof. Cleo D\'Amore III','songs/incidunt.pdf',3,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(8,'Excepturi quam animi.','Temporibus vel porro et ea recusandae unde est. Perferendis voluptas natus aliquam alias ea impedit. Dolorem molestiae eos eligendi molestiae corrupti non.','Reina Becker MD','songs/provident.pdf',1,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(9,'Non tempora ut atque.','Qui occaecati magnam omnis qui sed rerum. Sed sapiente eligendi ut laudantium qui doloremque. Impedit voluptas est architecto.','Corene Metz','songs/delectus.pdf',6,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(10,'Nobis qui accusantium nobis.','Adipisci quo quia amet doloremque. Magni illum qui expedita vitae.','Mrs. Claudia Collins Sr.','songs/modi.pdf',4,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(11,'Corrupti ab labore.','Sed officiis aperiam tenetur provident laboriosam. Voluptas ducimus accusamus atque placeat consequatur assumenda. Facilis qui qui alias sit nihil.','Prof. Hillard O\'Keefe','songs/sapiente.pdf',1,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(12,'Qui quis earum.','Necessitatibus quam iusto porro placeat necessitatibus ea et. Adipisci optio et dignissimos et corrupti. Atque eos reprehenderit ratione molestiae beatae aspernatur dignissimos.','Dr. Toni Bartell','songs/tenetur.pdf',1,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(13,'Eos nihil in inventore.','Iusto aperiam ipsam aut eum inventore sed. Cumque dicta qui voluptatem minima. Quia necessitatibus fuga maiores eveniet ut sed.','Donald Pfannerstill','songs/libero.pdf',6,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(14,'Quas sint exercitationem.','Placeat ducimus pariatur nulla eaque est. Ducimus nam qui ut aperiam consequatur aperiam. Sit aut laboriosam quas enim id. Impedit corporis et modi eum consequatur qui quisquam. Quisquam ipsum quod sequi.','Marilou McGlynn','songs/laborum.pdf',2,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(15,'Eos libero consequatur incidunt.','Quibusdam nihil quas sit quidem ea. Consequatur quas laudantium nemo excepturi. Incidunt eos facilis ut voluptatem et. Quasi ad amet quos nihil doloremque.','Faye Anderson','songs/aliquid.pdf',2,'2025-01-17 23:17:38','2025-01-17 23:17:38'),
(16,'dzd','dzzd','dzzd','songs/pdfs/s9vxwpblQ1FoMF9XbwhSo2ZdinefgDrVE4H7wOGx.pdf',NULL,'2025-01-18 01:31:33','2025-01-18 01:31:33');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'John Doe','john@example.com',NULL,'$2y$12$IUnl3CbBbN9FG45OqAIvq./ucldNuPmQgkhKCpdDw21y6/3YnEbyi',NULL,'2025-01-17 00:26:29','2025-01-17 00:26:29',0),
(2,'Jane Smith','jane@example.com',NULL,'$2y$12$II46PMXsp1bY9SOjSVmjrubkEt7EXkqWK3f2cfB7jvRCZl.KW6V9C',NULL,'2025-01-17 00:26:29','2025-01-17 00:26:29',0),
(3,'Alice Brown','alice@example.com',NULL,'$2y$12$40601PkanzpyeMMsohOAqeiUqjCIW/2sT7Evjbv8dwfpYpN2Vq7yu',NULL,'2025-01-17 00:26:30','2025-01-17 00:26:30',0),
(4,'test','test@mail.be',NULL,'$2y$12$6vV653l.mMSZXu2OEvc1Iufxw/FCt8MblkaAe1uUThhC2orUNKtW6','0kzuzJuPjNV6zZtPhBggUFXK4WlzW4Pk1nVsCiT0GoYlcwu518iIuPGIYGy9','2025-01-17 00:36:12','2025-01-17 00:36:12',0),
(5,'Admin User','admin@example.com',NULL,'$2y$12$1LNs9TTsWTogKuFiB2.Cs.IjO7qjWQROgVyFf8Vyp5cAuxuirrfOm',NULL,'2025-01-17 12:15:14','2025-01-17 12:15:14',1),
(6,'teety','tetststst@mail.tt',NULL,'$2y$12$ZsROuhXR8xDu0UkN0n24Xuhs7E99V9PsVw8dfVbvc59WKNrBkJjY6',NULL,'2025-01-17 13:27:10','2025-01-17 13:27:10',0),
(7,'bart de wever','fernando@mail.com',NULL,'$2y$12$qLKbKy3AVl0rXDsrHVCDiOp2T7/3ErLX31nXugoAcbpLtbtbydAjO',NULL,'2025-01-18 01:33:43','2025-01-18 01:33:43',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-18  1:39:25
