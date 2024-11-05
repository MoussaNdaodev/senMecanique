-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2024 at 11:03 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `senmecanique`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pièces Détachées Certifiées, Achetez en Confiance', 'pieces-detachees-certifiees-achetez-en-confiance', 'http://localhost:8000/storage/photos/1/Banner/photo-portrait-skilled-mechanic-working-car-engine-garage_763111-302853.jpg', '<p class=\"MsoNormal\"><b>: </b><span style=\"font-family: &quot;Segoe UI&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Nous\r\nvous proposons une large gamme de pièces certifiées et garanties pour assurer\r\nla longévité et la performance de vos véhicules. Que vous soyez un particulier\r\nou un professionnel, vous trouverez tout ce dont vous avez besoin pour vos\r\nréparations et entretiens. Notre plateforme vous permet de faire vos achats en\r\ntoute confiance, grâce à une sélection rigoureuse de pièces de qualité. Recevez\r\nvos produits rapidement, où que vous soyez au Sénégal, et bénéficiez de\r\nl\'assistance de notre service client disponible pour répondre à toutes vos\r\nquestions. Que ce soit pour des réparations urgentes ou des entretiens\r\nréguliers, nous avons tout ce qu\'il vous faut pour garantir votre sécurité et\r\ncelle de votre véhicule sur la route.</span><o:p></o:p></p>', 'active', '2024-10-21 08:38:30', '2024-10-21 09:15:31'),
(2, 'Trouvez un Garage Près de Chez Vous Rapidement', 'sjneoekke', 'http://localhost:8000/storage/photos/1/Banner/image4.jpg', '<p class=\"MsoNormal\"><span style=\"font-family: &quot;Segoe UI&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Besoin d\'une assistance rapide pour votre véhicule ?\r\nSenMécanique est là pour vous. Grâce à notre plateforme, vous pouvez localiser\r\net contacter les garages disponibles les plus proches en quelques minutes. Nos\r\npartenaires professionnels sont prêts à intervenir pour des réparations rapides\r\net efficaces, où que vous soyez. Réservez vos services en ligne, suivez\r\nl\'avancement des réparations en temps réel et bénéficiez d\'une transparence\r\ntotale des interventions. Que vous ayez une panne imprévue ou besoin d\'un\r\nentretien régulier, SenMécanique vous assure un service de qualité pour garder\r\nvotre véhicule en parfait état.</span><o:p></o:p></p>', 'active', '2024-10-21 09:04:50', '2024-10-21 09:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Peugeot', 'peugeot', 'active', '2024-10-21 09:29:30', '2024-10-21 09:29:30'),
(2, 'EcoCool', 'ecocool', 'active', '2024-10-21 09:32:51', '2024-10-21 09:32:51'),
(3, 'Toyota', 'toyota', 'active', '2024-10-21 09:37:31', '2024-10-21 09:37:31'),
(4, 'Nissan', 'nissan', 'active', '2024-10-21 09:40:00', '2024-10-21 09:40:00'),
(5, 'Renault', 'renault', 'active', '2024-10-21 09:42:41', '2024-10-21 09:42:41'),
(6, 'Universal', 'universal', 'active', '2024-10-21 09:54:22', '2024-10-21 09:54:22');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 10, NULL, 2, 31.28, 'new', 1, 31.28, '2024-10-21 17:55:46', '2024-10-21 17:55:46'),
(2, 8, NULL, 2, 102.60, 'new', 1, 102.60, '2024-10-21 17:55:53', '2024-10-21 17:55:53'),
(3, 11, NULL, 2, 151.68, 'new', 3, 467.68, '2024-11-02 09:32:41', '2024-11-02 12:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Accessoires', 'accessoires', NULL, 'http://localhost:8000/storage/photos/1/Category/Accessoires.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:20:37', '2024-10-21 09:20:37'),
(2, 'Batteries', 'batteries', NULL, 'http://localhost:8000/storage/photos/1/Category/Batteries.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:20:53', '2024-10-21 09:20:53'),
(3, 'Moteurs et Composants', 'moteurs-et-composants', NULL, 'http://localhost:8000/storage/photos/1/Category/Moteurs et Composants.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:21:14', '2024-10-21 09:21:14'),
(4, 'Pièces d\'occasion', 'pieces-doccasion', NULL, 'http://localhost:8000/storage/photos/1/Category/Pièces d\'occasion.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:21:34', '2024-10-21 09:21:34'),
(5, 'Pneus', 'pneus', NULL, 'http://localhost:8000/storage/photos/1/Category/Pneus.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:21:56', '2024-10-21 09:21:56'),
(6, 'Systèmes de refroidissement', 'systemes-de-refroidissement', NULL, 'http://localhost:8000/storage/photos/1/Category/Systèmes de refroidissement.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:22:14', '2024-10-21 09:22:14'),
(7, 'Climatisation', 'climatisation', NULL, 'http://localhost:8000/storage/photos/1/Category/climatisation.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:23:02', '2024-10-21 09:23:02'),
(8, 'Essuie-glaces', 'essuie-glaces', NULL, 'http://localhost:8000/storage/photos/1/Category/Essuie-glaces.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:23:20', '2024-10-21 09:23:20'),
(9, 'Freinage', 'freinage', NULL, 'http://localhost:8000/storage/photos/1/Category/freinage.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:23:42', '2024-10-21 09:23:42'),
(10, 'Habitacle', 'habitacle', NULL, 'http://localhost:8000/storage/photos/1/Category/Habitacle.jpg', 1, NULL, NULL, 'active', '2024-10-21 09:24:01', '2024-10-21 09:24:01'),
(11, 'Huile moteur', 'huile-moteur', NULL, 'http://localhost:8000/storage/photos/1/Category/Huile moteur.jpeg', 1, NULL, NULL, 'active', '2024-10-21 09:24:23', '2024-10-21 09:24:23'),
(12, 'Compresseurs de climatisation', 'compresseurs-de-climatisation', NULL, NULL, 0, 7, NULL, 'active', '2024-10-21 09:28:55', '2024-10-21 09:29:07'),
(13, 'Gaz réfrigérants', 'gaz-refrigerants', NULL, NULL, 0, 7, NULL, 'active', '2024-10-21 09:32:38', '2024-10-21 09:32:38'),
(14, 'Plaquettes de frein', 'plaquettes-de-frein', NULL, NULL, 0, 9, NULL, 'active', '2024-10-21 09:37:50', '2024-10-21 09:37:50'),
(15, 'Moteurs d\'occasion', 'moteurs-doccasion', NULL, NULL, 0, 4, NULL, 'active', '2024-10-21 09:42:30', '2024-10-21 09:42:30'),
(16, 'Pneus Tout-terrain', 'pneus-tout-terrain', NULL, NULL, 0, 5, NULL, 'active', '2024-10-21 09:51:33', '2024-10-21 09:51:33'),
(17, 'Tapis de voiture', 'tapis-de-voiture', NULL, NULL, 0, 1, NULL, 'active', '2024-10-21 09:52:37', '2024-10-21 09:52:37'),
(18, 'Housses de siège', 'housses-de-siege', NULL, NULL, 0, 1, NULL, 'active', '2024-10-21 09:54:10', '2024-10-21 09:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'senMecanique', 'fixed', '300.00', 'active', NULL, NULL),
(2, 'senMecanique2', 'percent', '10.00', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `demande__assistances`
--

CREATE TABLE `demande__assistances` (
  `id` bigint UNSIGNED NOT NULL,
  `description_probleme` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'En attente',
  `type_service` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `garage_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evaluation__garages`
--

CREATE TABLE `evaluation__garages` (
  `id` bigint UNSIGNED NOT NULL,
  `commentaire_evaluation` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_evaluation` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `garage_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evaluation__garages`
--

INSERT INTO `evaluation__garages` (`id`, `commentaire_evaluation`, `note_evaluation`, `user_id`, `garage_id`, `created_at`, `updated_at`) VALUES
(1, 'mo evaluation', 4, 2, 3, '2024-10-21 10:57:46', '2024-10-21 10:57:46'),
(2, 'ce garage est efficasse', 3, 2, 4, '2024-10-21 10:58:42', '2024-10-21 10:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `garages`
--

CREATE TABLE `garages` (
  `id` bigint UNSIGNED NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `jour_travail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_garage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone_garage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_mecanicien` int NOT NULL,
  `service_garage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `localisation_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `garages`
--

INSERT INTO `garages` (`id`, `logo`, `description`, `jour_travail`, `type_garage`, `telephone_garage`, `nombre_mecanicien`, `service_garage`, `created_at`, `updated_at`, `user_id`, `localisation_id`) VALUES
(2, 'frontend/img/assistance/garages/logos/mvqPuHP1FTpORzMpE27wQoRHv8MSlpbW5qoCIOJN.png', 'Spécialisé dans les réparations électriques et électroniques des véhicules. Notre garage est équipé des outils les plus récents pour diagnostiquer les problèmes complexes. Nous nous occupons de la réparation des systèmes de gestion moteur et des équipements électroniques. Nos mécaniciens sont formés pour traiter toutes les marques et modèles de voitures. En plus de la mécanique, nous offrons un service de diagnostic complet. La satisfaction de nos clients est notre objectif principal, et nous nous engageons à respecter les délais annoncés. Faites confiance à notre expertise pour tous vos besoins en électricité automobile.', 'Lundi au dimanche', 'Garage de réparation automobile', '784524596', 11, 'Services électriques (batteries, alternateurs)', '2024-10-21 10:46:12', '2024-10-21 10:46:12', 4, 2),
(3, 'frontend/img/assistance/garages/logos/HCTpMzLL46PxalZQD45OPMTVjJthjq1GhUxPAGz0.jpg', 'Garage offrant des services de carrosserie et de peinture automobile. Nous prenons en charge tous types de véhicules, y compris les voitures de luxe. Notre équipe est spécialisée dans la réparation de dommages esthétiques causés par des accidents. Nous utilisons des produits de peinture de haute qualité pour garantir un résultat impeccable. En plus de la peinture, nous proposons des services de polissage et de nettoyage. Nos clients peuvent bénéficier d\'un devis gratuit avant toute intervention. Chez Auto Services Dakar, la qualité et la transparence sont nos priorités.', 'Lundi au samedi', 'Garage spécialisé', '778015130', 8, 'Carrosserie (redressage, peinture)', '2024-10-21 10:50:47', '2024-10-21 10:50:47', 5, 3),
(4, 'frontend/img/assistance/garages/logos/u73JNZFtvFlTlqrQjW09vzQOkNjtQVIIaL3bbO6g.jpg', 'Garage spécialisé dans le contrôle technique des véhicules de luxe et services personnalisés. Nous nous concentrons sur l\'inspection complète de chaque véhicule pour garantir leur conformité. Notre équipe de mécaniciens qualifiés offre une attention particulière aux détails pour chaque contrôle technique. Nous utilisons des équipements modernes et des techniques éprouvées pour assurer la sécurité et la performance de votre véhicule. Chaque véhicule est traité avec le plus grand soin, et nous proposons des services sur mesure en fonction des besoins spécifiques de nos clients. Vous pouvez compter sur nous pour un service rapide et efficace. Au Garage des Professionnels, nous transformons chaque visite en une expérience agréable.', 'Lundi au vendredi', 'Garage spécialisé', '784524578', 13, 'Contrôle technique', '2024-10-21 10:54:52', '2024-10-21 10:54:52', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `image__garages`
--

CREATE TABLE `image__garages` (
  `id` bigint UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `garage_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image__garages`
--

INSERT INTO `image__garages` (`id`, `url`, `created_at`, `updated_at`, `garage_id`) VALUES
(3, 'frontend/img/assistance/garages/images/MKN47Gz2z6F2aTz9f4AivIUFir4CmaHDpimgUVV7.jpg', '2024-10-21 10:46:12', '2024-10-21 10:46:12', 2),
(4, 'frontend/img/assistance/garages/images/Z7E0TL9gCm6ILAidk5xT0JMDBLL1q0ix5tByi7ch.jpg', '2024-10-21 10:46:12', '2024-10-21 10:46:12', 2),
(5, 'frontend/img/assistance/garages/images/IqEpQPWusg29LwaxK30QhIIJ64pkHbu8Aw8p3O2F.jpg', '2024-10-21 10:50:47', '2024-10-21 10:50:47', 3),
(6, 'frontend/img/assistance/garages/images/BQXwj1KannO05A3DZQMdmmE2F4J1EbhGf5bP72di.jpg', '2024-10-21 10:54:52', '2024-10-21 10:54:52', 4),
(7, 'frontend/img/assistance/garages/images/3HKx7jmVakZpCsexfKebGto71dnjC30KGBXOun0K.jpg', '2024-10-21 10:54:52', '2024-10-21 10:54:52', 4),
(8, 'frontend/img/assistance/garages/images/dsMJkhpOyAbYOpi0zyb9eqFPcigfukQThjaXVqzp.jpg', '2024-10-21 10:54:52', '2024-10-21 10:54:52', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localisations`
--

CREATE TABLE `localisations` (
  `id` bigint UNSIGNED NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `localisations`
--

INSERT INTO `localisations` (`id`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, '14.798346798299677', '-16.90935604006376', '2024-10-21 10:42:42', '2024-10-21 10:42:42'),
(2, '14.797694333333332', '-16.909345833333333', '2024-10-21 10:46:12', '2024-10-21 10:46:12'),
(3, '14.8570112', '-15.8892032', '2024-10-21 10:50:47', '2024-10-21 10:50:47'),
(4, '14.8049522', '-16.9004587', '2024-10-21 10:54:52', '2024-10-21 10:54:52'),
(5, '14.797562819382684', '-16.909196979989535', '2024-11-01 22:19:07', '2024-11-01 22:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2023_06_21_164432_create_jobs_table', 1),
(23, '2024_09_18_120603_create_garages_table', 1),
(24, '2024_09_18_121233_create_localisations_table', 1),
(25, '2024_09_18_121403_create_image__garages_table', 1),
(26, '2024_09_23_123145_create_evaluation__garages_table', 1),
(27, '2024_09_23_123446_create_demande__assistances_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('ab4483d2-3488-48d0-8850-a2521c3eb531', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2024-11-02 12:40:32', '2024-11-02 12:40:32'),
('f7d4fd28-2c0a-4ace-af37-d1fe4f11317b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2024-10-21 17:57:29', '2024-10-21 17:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-0WXLOQI8ZN', 2, 133.88, NULL, NULL, 133.88, 2, 'paypal', 'paid', 'new', 'MOUSSA', 'NDAO', 'moussandaodevpro@gmail.com', '781751121', 'SN', '16000', 'Pikine rue 10 1715', NULL, '2024-10-21 17:57:28', '2024-10-21 17:57:28'),
(2, 'ORD-OQX3YSUAKG', 2, 601.56, NULL, NULL, 601.56, 5, 'paypal', 'paid', 'new', 'MOUSSA', 'NDAO', 'moussandaodevpro@gmail.com', '771247764', 'SN', '16000', 'Pikine rue 10 1715', NULL, '2024-11-02 12:40:30', '2024-11-02 12:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL DEFAULT '1',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Compresseur de climatisation Peugeot 207', 'compresseur-de-climatisation-peugeot-207', '<p><span id=\"docs-internal-guid-252f8a99-7fff-435a-e1fa-1cb624aa6357\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Compresseur haute performance pour le système de climatisation de Peugeot 207.</span></span></p>', '<p><span id=\"docs-internal-guid-e99b0cfd-7fff-6230-fc3e-8662db60ec9e\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Ce compresseur de climatisation pour Peugeot 207 est essentiel pour maintenir un confort optimal dans l’habitacle pendant les périodes de chaleur. Construit avec des matériaux de haute qualité, il garantit une longue durée de vie et une fiabilité accrue. La compatibilité avec les systèmes de climatisation de la 207 est assurée, grâce aux strictes normes de fabrication Peugeot. Ce modèle est reconnu pour sa capacité à refroidir rapidement l\'air et à maintenir une température stable dans la voiture, même lors de fortes chaleurs. Il est un excellent choix pour les conducteurs soucieux de leur confort pendant les longs trajets.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Compresseur de climatisation Peugeot 207.jpeg', 52, 'new', 'active', 332.00, 10.00, 0, 7, 12, 1, '2024-10-21 09:31:21', '2024-10-21 09:31:21'),
(2, 'Gaz réfrigérant R-134A', 'gaz-refrigerant-r-134a', '<p><span id=\"docs-internal-guid-c1437909-7fff-7030-0b0f-40dd45409462\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Gaz réfrigérant R-134A pour systèmes de climatisation automobile.</span></span></p>', '<p><span id=\"docs-internal-guid-1844b253-7fff-8b3a-1e15-19db789678ad\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Le gaz réfrigérant R-134A est conçu pour être utilisé dans les systèmes de climatisation automobile. Il offre une excellente efficacité de refroidissement tout en étant respectueux de l\'environnement. Ce produit est facile à utiliser et peut être rechargé dans les systèmes de climatisation existants. Son utilisation contribue à maintenir une température agréable dans l\'habitacle, même par temps chaud. Le R-134A est compatible avec une grande variété de véhicules, ce qui en fait un choix populaire pour les réparations et l\'entretien de la climatisation automobile.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Gaz réfrigérant R-134A.jpeg', 142, 'new', 'active', 22.00, 10.00, 1, 7, 13, 2, '2024-10-21 09:34:24', '2024-10-21 09:34:24'),
(3, 'Gaz réfrigérant R-1234YF', 'gaz-refrigerant-r-1234yf', '<p><span id=\"docs-internal-guid-2e26c49b-7fff-1f42-0c96-1b69cafdcebc\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Gaz réfrigérant R-1234YF pour les systèmes de climatisation de nouvelle génération.</span></span></p>', '<p><span id=\"docs-internal-guid-1edc3a2c-7fff-4199-250c-3cecee440aa1\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Le gaz réfrigérant R-1234YF est le choix idéal pour les véhicules modernes équipés de systèmes de climatisation de nouvelle génération. Respectueux de l\'environnement, il offre un potentiel de réchauffement planétaire réduit par rapport aux réfrigérants plus anciens. Son efficacité de refroidissement garantit une performance optimale du système de climatisation, assurant un confort à tous les occupants du véhicule. Ce gaz est compatible avec de nombreux modèles récents, faisant de lui un produit essentiel pour l\'entretien de la climatisation automobile moderne.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Gaz réfrigérant R-1234YF.jpeg', 538, 'default', 'active', 34.00, 7.00, 1, 7, 13, 2, '2024-10-21 09:36:08', '2024-10-21 09:36:08'),
(4, 'Plaquettes de frein Bosch pour Toyota Corolla', 'plaquettes-de-frein-bosch-pour-toyota-corolla', '<p><span id=\"docs-internal-guid-b9141724-7fff-0ea0-0588-ed81c51921c2\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Plaquettes de frein premium pour Toyota Corolla, offrant une sécurité maximale.</span></span></p>', '<p><span id=\"docs-internal-guid-a90181e3-7fff-2a23-ae1c-ae2a7f745576\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Les plaquettes de frein Bosch pour Toyota Corolla sont spécialement conçues pour garantir une puissance de freinage optimale et constante, même dans les conditions les plus exigeantes. Fabriquées avec des matériaux de première qualité, ces plaquettes assurent une faible usure et réduisent les bruits de freinage, ce qui en fait un choix confortable pour les trajets longs et urbains. Grâce à leur haute résistance à la chaleur, elles sont idéales pour les arrêts fréquents et les freinages brusques, garantissant la sécurité des passagers à tout moment. Bosch a conçu ces plaquettes pour une compatibilité parfaite avec les systèmes de freinage d\'origine de Toyota.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Plaquettes de frein Bosch pour Toyota Corolla.jpeg', 1492, 'hot', 'active', 75.00, 7.00, 1, 9, 14, 3, '2024-10-21 09:39:24', '2024-10-21 09:39:24'),
(5, 'Plaquettes de frein Brembo pour Nissan Qashqai', 'plaquettes-de-frein-brembo-pour-nissan-qashqai', '<p><span id=\"docs-internal-guid-5dd2ee8b-7fff-dfe5-3a28-a5263af5f64d\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Plaquettes de frein haute performance pour Nissan Qashqai.</span></span></p>', '<p><span id=\"docs-internal-guid-5bb0f675-7fff-fbe7-49a9-c3a84850c506\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Les plaquettes de frein Brembo pour Nissan Qashqai sont conçues pour offrir une excellente performance de freinage dans toutes les conditions. Que ce soit sur route sèche ou mouillée, ces plaquettes fournissent une puissance de freinage fiable et constante. La technologie avancée de Brembo réduit également le bruit et l\'usure, garantissant une durabilité accrue. Grâce à leur compatibilité avec le Nissan Qashqai, elles assurent une installation facile et rapide, offrant ainsi une solution de freinage de haute qualité pour tous les conducteurs soucieux de la sécurité.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Plaquettes de frein Brembo pour Nissan Qashqai.jpeg', 1500, 'hot', 'active', 67.00, 4.00, 1, 9, 14, 4, '2024-10-21 09:41:18', '2024-10-21 09:41:18'),
(6, 'Moteur d\'occasion pour Renault Clio', 'moteur-doccasion-pour-renault-clio', '<p><span id=\"docs-internal-guid-a8e993bc-7fff-5cd9-b727-bf7b73aa3ea7\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Moteur d\'occasion compatible avec Renault Clio.</span></span></p>', '<p><span id=\"docs-internal-guid-373f1427-7fff-71f4-07db-2d3474ff7a3c\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Ce moteur d\'occasion pour Renault Clio est testé et vérifié pour assurer un fonctionnement optimal. Il est conçu pour offrir une performance fiable et durable. Chaque moteur est livré avec une garantie et provient d\'un véhicule ayant subi un entretien régulier. Idéal pour les réparations et les remplacements, ce moteur permet de prolonger la vie de votre véhicule tout en maintenant des coûts abordables.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Moteur d\'occasion pour Renault Clio.jpeg', 449, 'hot', 'active', 494.00, 14.00, 1, 4, 15, 5, '2024-10-21 09:43:56', '2024-10-21 09:43:56'),
(7, 'Moteur d\'occasion pour Peugeot 208', 'moteur-doccasion-pour-peugeot-208', '<p><span id=\"docs-internal-guid-503ac816-7fff-ec2f-41ea-e381ea2133b9\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Moteur d\'occasion compatible avec Peugeot 208.</span></span></p>', '<p><span id=\"docs-internal-guid-17eacef3-7fff-0549-269f-f0cfb0baa7a9\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Ce moteur d\'occasion pour Peugeot 208 a été soigneusement inspecté et est prêt à être installé. Conçu pour offrir une performance comparable à celle d\'un moteur neuf, il est un choix judicieux pour ceux qui cherchent à remplacer leur moteur sans se ruiner. Avec un historique d\'entretien transparent, ce moteur garantit fiabilité et longévité.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Moteur d\'occasion pour Peugeot 208.jpeg', 649, 'new', 'active', 529.00, 10.00, 1, 4, 15, 1, '2024-10-21 09:46:00', '2024-10-21 09:46:00'),
(8, 'Pneu Michelin Latitude Sport 3 pour Nissan Juke', 'pneu-michelin-latitude-sport-3-pour-nissan-juke', '<p><span id=\"docs-internal-guid-950c4cfb-7fff-e95c-45f8-ece7566282a6\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Pneu haute performance pour Nissan Juke, conçu pour un usage tout-terrain.</span></span></p>', '<p><span id=\"docs-internal-guid-14b30ba8-7fff-109b-1d71-9826a57fcaf4\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Le pneu Michelin Latitude Sport 3 est conçu pour offrir une adhérence maximale et une résistance accrue pour les véhicules tels que le Nissan Juke. Avec sa structure renforcée et ses composés de gomme avancés, ce pneu offre des performances de conduite exceptionnelles sur routes et terrains difficiles. Il permet une maniabilité précise même en conditions humides et boueuses. De plus, sa conception est optimisée pour réduire les bruits de roulement et offrir un confort de conduite supérieur. Michelin garantit une durabilité accrue, offrant ainsi une longévité prolongée pour une utilisation tout-terrain régulière.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Pneu Michelin Latitude Sport 3 pour Nissan Juke.png', 5000, 'hot', 'active', 108.00, 5.00, 1, 5, 16, 4, '2024-10-21 09:48:00', '2024-10-21 09:51:54'),
(9, 'Tapis de voiture textile pour Toyota Corolla', 'tapis-de-voiture-textile-pour-toyota-corolla', '<p><span id=\"docs-internal-guid-da338155-7fff-3d82-0cd9-fda72fd98ace\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Tapis de sol en textile de qualité supérieure pour Toyota Corolla.</span></span></p>', '<p><span id=\"docs-internal-guid-69b241cd-7fff-851c-0ff4-b136ea8add6a\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Les tapis de sol en textile pour Toyota Corolla sont fabriqués à partir de matériaux de haute qualité pour offrir un confort et une protection accrus à l\'intérieur de votre véhicule. Ces tapis sont conçus pour s\'adapter parfaitement au plancher de la Corolla, assurant une couverture complète et une protection contre la poussière, la saleté et les éclaboussures. Leur surface douce et antidérapante améliore le confort des passagers, tandis que leur fond en caoutchouc empêche le tapis de glisser. Faciles à installer et à retirer pour le nettoyage, ces tapis sont une solution idéale pour protéger l\'intérieur de votre voiture tout en lui donnant une touche d\'élégance.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Tapis de voiture textile pour Toyota Corolla.jpeg', 1500, 'default', 'active', 42.00, 7.00, 1, 1, 17, 3, '2024-10-21 09:50:43', '2024-10-21 09:53:04'),
(10, 'Housse de siège universelle', 'housse-de-siege-universelle', '<p><span id=\"docs-internal-guid-da54ec5f-7fff-1b68-d05e-8ef8cba71d56\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Housse de siège universelle pour tous types de véhicules.</span></span></p>', '<p><span id=\"docs-internal-guid-a67d940b-7fff-37be-d80c-fb3a1b03f160\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Cette housse de siège universelle est conçue pour s\'adapter à la plupart des voitures, offrant une protection efficace contre l\'usure et les taches. Fabriquée à partir de matériaux de haute qualité, elle est résistante et facile à nettoyer. Son design élégant rehausse l\'intérieur de votre véhicule tout en offrant un confort optimal. Installation rapide et sans outils, elle transforme l\'apparence de votre habitacle en un clin d\'œil.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Housse de siège universelle.jpeg', 7858, 'default', 'active', 34.00, 8.00, 1, 1, 18, 6, '2024-10-21 09:55:56', '2024-10-21 09:55:56'),
(11, 'Pneu toutes saisons Peugeot 5008', 'pneu-toutes-saisons-peugeot-5008', '<p><span id=\"docs-internal-guid-4c44230c-7fff-b536-e20e-f07747dff5e4\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Pneu toutes saisons pour Peugeot 5008, offrant une tenue de route optimale.</span></span></p>', '<p><span id=\"docs-internal-guid-a756c76a-7fff-e735-1630-fd79391392ac\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Conçu pour la Peugeot 5008, ce pneu toutes saisons combine performance et sécurité pour répondre aux exigences des conducteurs tout au long de l\'année. Grâce à sa conception innovante, il assure une adhérence optimale sur les routes sèches, mouillées et légèrement enneigées. Les rainures profondes de sa bande de roulement favorisent une évacuation efficace de l\'eau, réduisant les risques d\'aquaplaning. Fabriqué à partir de matériaux résistants, il offre une excellente durabilité et une faible résistance au roulement, contribuant ainsi à une économie de carburant. Avec ce pneu, la conduite reste stable et confortable dans toutes les conditions climatiques.</span></span></p>', 'http://localhost:8000/storage/photos/1/Products/Pneu toutes saisons Peugeot 5008.jpg', 7999, 'hot', 'active', 158.00, 4.00, 1, 5, 16, 1, '2024-10-21 09:58:57', '2024-10-21 09:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'SenMecanique se fixe pour mission de réduire le taux de chômage des mécaniciens et de faciliter l\'accès des jeunes mécaniciens au marché du travail. Nous proposons une solution complète et innovante qui combine une plateforme d\'assistance en ligne et un site de e-commerce spécialisé dans les pièces détachées pour véhicules. Chez SenMecanique, trouvez rapidement un mécanicien qualifié proche de vous pour des réparations urgentes, ou explorez notre vaste catalogue de pièces détachées de qualité pour entretenir et réparer vos véhicules. Rejoignez-nous pour bénéficier d\'un service rapide, fiable et adapté aux besoins spécifiques des mécaniciens et des clients. Ensemble, contribuons à dynamiser le secteur de la mécanique au Sénégal.', 'SenMecanique : Réduire le chômage des mécaniciens et faciliter leur accès au marché. Trouvez des mécaniciens qualifiés et achetez des pièces détachées de qualité via notre plateforme complète d\'assistance en ligne et de e-commerce.', 'http://localhost:8000/storage/photos/1/logo/favicon.png', 'http://localhost:8000/storage/photos/1/image2.jpg', 'Pikine Rue 10 - Dakar - Sénégal', '+221 78 175 11 21 / +221 78 585 17 97', 'senmecanique@gmail.sn', NULL, '2024-10-21 10:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user','mecanicien','garage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Moussa Ndao', 'moussandaodevpro@gmail.com', NULL, '$2y$10$4wz2J0QrWFohNWCSIHOxBuhdJqVnHxSM9ZoivUreF.4D00.Olcx3S', 'http://localhost:8000/storage/photos/1/users/profil_image/moussa ndao.jpg', 'admin', NULL, NULL, 'active', NULL, NULL, '2024-10-21 09:15:02'),
(2, 'Matar', 'serignematarmbaye2000@gmail.com', NULL, '$2y$10$.H5G9tgA7qpDQaz7L7VQmO13q4K2xxhEEH58sCeToU4n.dawuju4y', NULL, 'user', NULL, NULL, 'active', NULL, NULL, NULL),
(4, 'Mécanique et Électricité Auto', 'meceletroauto@gmail.com', NULL, '$2y$10$3.L7no2f4nLsRUlhDcaPjuvEPsmGFKl.DTyInVx0M44cu68LHzTRu', NULL, 'user', NULL, NULL, 'active', NULL, '2024-10-21 10:45:04', '2024-10-21 10:45:04'),
(5, 'Mecanicien express', 'meca.express@gmail.com', NULL, '$2y$10$7TFUkmD8lXSnFcFOwqtehOnzctN0zLfy1.Qpf3m7ra6zcb3VllaY.', NULL, 'user', NULL, NULL, 'active', NULL, '2024-10-21 10:47:48', '2024-10-21 10:47:48'),
(6, 'Mecanicien Assist', 'meca.assist@gmail.com', NULL, '$2y$10$pb9jSF1D2wS5P.EHe4XDPOsdWN8YZLlh5AMw8rBjQulGQM8UA3AW2', NULL, 'user', NULL, NULL, 'active', NULL, '2024-10-21 10:52:33', '2024-10-21 10:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 11, NULL, 2, 151.68, 1, 151.68, '2024-11-02 10:03:32', '2024-11-02 10:03:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `demande__assistances`
--
ALTER TABLE `demande__assistances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `demande__assistances_user_id_foreign` (`user_id`),
  ADD KEY `demande__assistances_garage_id_foreign` (`garage_id`);

--
-- Indexes for table `evaluation__garages`
--
ALTER TABLE `evaluation__garages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation__garages_user_id_foreign` (`user_id`),
  ADD KEY `evaluation__garages_garage_id_foreign` (`garage_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `garages_user_id_foreign` (`user_id`),
  ADD KEY `garages_localisation_id_foreign` (`localisation_id`);

--
-- Indexes for table `image__garages`
--
ALTER TABLE `image__garages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image__garages_garage_id_foreign` (`garage_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `localisations`
--
ALTER TABLE `localisations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `demande__assistances`
--
ALTER TABLE `demande__assistances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluation__garages`
--
ALTER TABLE `evaluation__garages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `garages`
--
ALTER TABLE `garages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `image__garages`
--
ALTER TABLE `image__garages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localisations`
--
ALTER TABLE `localisations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `demande__assistances`
--
ALTER TABLE `demande__assistances`
  ADD CONSTRAINT `demande__assistances_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demande__assistances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evaluation__garages`
--
ALTER TABLE `evaluation__garages`
  ADD CONSTRAINT `evaluation__garages_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluation__garages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `garages`
--
ALTER TABLE `garages`
  ADD CONSTRAINT `garages_localisation_id_foreign` FOREIGN KEY (`localisation_id`) REFERENCES `localisations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `garages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image__garages`
--
ALTER TABLE `image__garages`
  ADD CONSTRAINT `image__garages_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
