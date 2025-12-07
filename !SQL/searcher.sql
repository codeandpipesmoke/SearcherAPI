-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Dec 07. 11:04
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `searcher`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adcategories`
--

CREATE TABLE `adcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `icon_id` varchar(64) NOT NULL,
  `name` varchar(250) NOT NULL,
  `name_slug` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_slug` text NOT NULL,
  `keywords` varchar(2000) DEFAULT NULL,
  `keywords_slug` varchar(2000) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `visible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1000,
  `action` varchar(20) NOT NULL,
  `company_count` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci COMMENT='Categories table';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` enum('active','archived','deleted') DEFAULT 'active',
  `views_count` int(11) DEFAULT 0,
  `unique_views_count` int(11) DEFAULT 0,
  `favorite_count` int(11) DEFAULT 0,
  `contact_clicks_count` int(11) DEFAULT 0,
  `clicks_count` int(11) DEFAULT 0,
  `match_score` float DEFAULT 0,
  `activity_score` float DEFAULT 0,
  `score_popularity` float DEFAULT 0,
  `last_boost` datetime DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `featured_until` datetime DEFAULT NULL,
  `priority_level` int(11) DEFAULT 0,
  `admin_score_adjustment` int(11) DEFAULT 0,
  `is_banned` tinyint(1) DEFAULT 0,
  `reported_count` int(11) DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ads_1`
--

CREATE TABLE `ads_1` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon_id` varchar(64) DEFAULT NULL,
  `adcategory_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `name_slug` varchar(250) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `description_slug` varchar(1000) NOT NULL,
  `keywords` varchar(1000) NOT NULL,
  `keywords_slug` varchar(1000) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `web` varchar(250) DEFAULT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  `banner` varchar(250) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `views_count` int(10) UNSIGNED DEFAULT 0 COMMENT 'összes megtekintés',
  `unique_views_count` int(10) UNSIGNED DEFAULT 0 COMMENT 'IP/User alapján',
  `favorite_count` int(10) UNSIGNED DEFAULT 0 COMMENT 'hányan jelölték kedvencnek',
  `clicks_count` int(10) UNSIGNED DEFAULT 0 COMMENT 'ha van külső link',
  `contact_clicks_count` int(10) UNSIGNED DEFAULT 0 COMMENT 'telefon/email megnyitások',
  `score_popularity` int(10) UNSIGNED DEFAULT 0 COMMENT 'számolt érték – pl. súlyozott',
  `is_featured` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'fizetett kiemelés',
  `featured_until` datetime NOT NULL COMMENT 'mikor jár le',
  `priority_level` int(11) NOT NULL COMMENT '0 = normál, 1–5 = magasabb rangsor\r\nlejáratkor automatán visszaáll',
  `visible` tinyint(1) UNSIGNED NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 1000,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci COMMENT='advertisements';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon_id` varchar(64) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `name_slug` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_slug` text NOT NULL,
  `keywords` varchar(2000) DEFAULT NULL,
  `keywords_slug` varchar(2000) DEFAULT NULL,
  `visible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1000,
  `action` varchar(20) NOT NULL,
  `company_count` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci COMMENT='Categories table';

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `icon_id`, `name`, `name_slug`, `description`, `description_slug`, `keywords`, `keywords_slug`, `visible`, `pos`, `action`, `company_count`, `created`, `modified`) VALUES
(1, '', 'Kórházak', 'korhazak', 'Kórház orvos doki doktor nőgyógyász fogorvos', '', 'kórház orvos doki doktor nőgyógyász fogorvos', 'korhaz orvos doki doktor nogyogyasz fogorvos', 1, 1000, '', 0, '2025-10-30 16:23:50', '2025-10-30 16:23:50'),
(2, 'car.png', 'Autószerelők', 'autoszerelo', 'Autószerelő autójavítás', '', 'Autószerelő autójavítás', 'autoszerelo autojavitas', 1, 1000, '', 0, '2025-10-30 16:24:28', '2025-10-30 17:52:14'),
(3, 'paint.png', 'Szobafestők', 'szobafesto', 'Szobafestő mázoló', '', 'Szobafestő mázoló glettelő', 'szobafesto mazolo glettelo', 1, 1000, '', 0, '2025-10-30 16:25:14', '2025-10-30 17:52:45'),
(4, '', 'Orvosok', 'orvosok orvos doktor doki gyogyasz', 'Orvosok, nőgyógyászok, fogorvosok, sebészek', '', 'Orvosok, nőgyógyászok, fogorvosok, sebészek', 'Orvosok, nőgyógyászok, fogorvosok, sebészek', 1, 1000, '', 0, '2025-10-30 18:55:18', '2025-10-30 18:55:18');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `category_stats`
--

CREATE TABLE `category_stats` (
  `category_id` int(11) NOT NULL,
  `views_count` int(11) DEFAULT 0,
  `search_count` int(11) DEFAULT 0,
  `ad_count` int(11) DEFAULT 0,
  `popularity_score` float DEFAULT 0,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon_id` varchar(64) DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `name_slug` varchar(250) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `description_slug` varchar(2000) DEFAULT NULL,
  `keywords` varchar(2000) DEFAULT NULL,
  `keywords_slug` varchar(2000) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `maximum_distance` int(10) UNSIGNED NOT NULL DEFAULT 25,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `banner` varchar(250) DEFAULT NULL,
  `visible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1000,
  `action` varchar(20) NOT NULL,
  `person_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci COMMENT='SubCategories table';

--
-- A tábla adatainak kiíratása `companies`
--

INSERT INTO `companies` (`id`, `icon_id`, `category_id`, `name`, `name_slug`, `description`, `description_slug`, `keywords`, `keywords_slug`, `longitude`, `latitude`, `maximum_distance`, `date_from`, `date_to`, `logo`, `banner`, `visible`, `pos`, `action`, `person_count`, `created`, `modified`) VALUES
(1, '', 2, 'Hering autószerelő műhely', 'hering autoszerelo mohacs', 'Hering autószerelő, Mohács', 'hering autoszerelo mohacs', 'autószerelő', 'autoszerelo', '11', '22', 25, NULL, NULL, '', NULL, 1, 1000, '', 0, '2025-10-30 16:37:39', '2025-10-30 18:15:28'),
(2, '', 2, 'Hunyadi János autószerelő műhely', 'autoszerelo', 'Hunyadi János a legjobb autószerelő', 'legjobb autoszerelo', 'Autószerelő autójavítás', 'autoszerelo autojavitas', '33', '16', 50, NULL, NULL, '', NULL, 1, 1000, '', 0, '2025-10-30 16:37:54', '2025-10-30 18:15:35'),
(3, '', 2, 'Szente Béla autószerelő műhely', 'autoszerelo', 'Kicsit bolondos', 'kicsit bolondos', 'Autószerelő autójavítás', 'autoszerelo autojavitas', '23', '32', 50, NULL, NULL, '', NULL, 1, 1000, '', 0, '2025-10-30 16:38:35', '2025-10-30 18:15:44'),
(4, '', 1, 'Mohácsi Kórház', 'mohacsi korhaz', 'Csizmadia Doktor', 'csizmadia doktor', 'kórház orvos doki doktor nőgyógyász fogorvos', 'korhaz orvos doki doktor nogyogyasz fogorvos', '123', '34', 100, NULL, NULL, '', NULL, 1, 1000, '', 0, '2025-10-30 16:39:07', '2025-10-30 17:59:04');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `events`
--

CREATE TABLE `events` (
  `id` bigint(20) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_type` enum('view','unique_view','favorite','contact_click','share','click') NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `icons`
--

CREATE TABLE `icons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `visible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `pos` int(11) DEFAULT 1000,
  `last_used` datetime DEFAULT NULL,
  `adcategory_count` int(10) UNSIGNED DEFAULT 0,
  `ad_count` int(10) UNSIGNED DEFAULT 0,
  `category_count` int(10) UNSIGNED DEFAULT 0,
  `company_count` int(10) UNSIGNED DEFAULT 0,
  `person_count` int(10) UNSIGNED DEFAULT 0,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci COMMENT='Icons table';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `persons`
--

CREATE TABLE `persons` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon_id` varchar(64) DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `name_slug` varchar(200) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `keywoords` varchar(2000) DEFAULT NULL,
  `keywoords_slug` varchar(2000) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `phone3` varchar(20) DEFAULT NULL,
  `phone4` varchar(20) DEFAULT NULL,
  `phone5` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `banner` varchar(250) DEFAULT NULL,
  `visible` tinyint(1) UNSIGNED NOT NULL,
  `pos` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci COMMENT='Persons table of Companies';

--
-- A tábla adatainak kiíratása `persons`
--

INSERT INTO `persons` (`id`, `icon_id`, `company_id`, `name`, `name_slug`, `description`, `keywoords`, `keywoords_slug`, `phone`, `phone2`, `phone3`, `phone4`, `phone5`, `email`, `email2`, `web`, `facebook`, `youtube`, `logo`, `banner`, `visible`, `pos`, `action`, `created`, `modified`) VALUES
(1, NULL, 1, 'Hering Zoltán', 'hering zoltan', 'Autószerelő', 'hering autószerelő', 'hering autoszerelo', '+36203149644', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1, 1000, '', '2025-10-30 16:46:18', '2025-10-30 18:05:19'),
(2, NULL, 1, 'Másik autószerelő a Hering Zolikánál', 'sss', 'Melós szerelő', '1112', '222', '+36203149611', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', 1, 1000, '', '2025-10-30 18:06:23', '2025-10-30 18:06:23'),
(3, NULL, 2, 'Hunyadi János', 'hunyadi janos hunya', 'A legjobb autószerelő', 'www', 'eee', '+36301231231', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', 1, 1000, '', '2025-10-30 18:10:07', '2025-10-30 18:10:07');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `adcategories`
--
ALTER TABLE `adcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `visible` (`visible`),
  ADD KEY `icon_id` (`icon_id`),
  ADD KEY `parent_id` (`parent_id`);
ALTER TABLE `adcategories` ADD FULLTEXT KEY `name_slug` (`name_slug`);
ALTER TABLE `adcategories` ADD FULLTEXT KEY `name_slug_2` (`name_slug`);
ALTER TABLE `adcategories` ADD FULLTEXT KEY `description` (`description`);
ALTER TABLE `adcategories` ADD FULLTEXT KEY `description_slug` (`description_slug`);
ALTER TABLE `adcategories` ADD FULLTEXT KEY `keywords` (`keywords`);
ALTER TABLE `adcategories` ADD FULLTEXT KEY `keywords_slug` (`keywords_slug`);

--
-- A tábla indexei `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `is_featured` (`is_featured`,`priority_level`),
  ADD KEY `created_at` (`created_at`);
ALTER TABLE `ads` ADD FULLTEXT KEY `fulltext_search` (`title`,`description`);

--
-- A tábla indexei `ads_1`
--
ALTER TABLE `ads_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visible` (`visible`),
  ADD KEY `pos` (`pos`),
  ADD KEY `adcategory_id` (`adcategory_id`),
  ADD KEY `icon_id` (`icon_id`);
ALTER TABLE `ads_1` ADD FULLTEXT KEY `name_slug` (`name_slug`);
ALTER TABLE `ads_1` ADD FULLTEXT KEY `description` (`description`);
ALTER TABLE `ads_1` ADD FULLTEXT KEY `description_slug` (`description_slug`);
ALTER TABLE `ads_1` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `ads_1` ADD FULLTEXT KEY `keywords` (`keywords`);
ALTER TABLE `ads_1` ADD FULLTEXT KEY `keywords_slug` (`keywords_slug`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `visible` (`visible`),
  ADD KEY `pos` (`pos`),
  ADD KEY `action` (`action`);
ALTER TABLE `categories` ADD FULLTEXT KEY `meta` (`keywords`);
ALTER TABLE `categories` ADD FULLTEXT KEY `slug` (`keywords_slug`);

--
-- A tábla indexei `category_stats`
--
ALTER TABLE `category_stats`
  ADD PRIMARY KEY (`category_id`);

--
-- A tábla indexei `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `visible` (`visible`),
  ADD KEY `pos` (`pos`),
  ADD KEY `maximum_distance` (`maximum_distance`),
  ADD KEY `action` (`action`),
  ADD KEY `date_from` (`date_from`),
  ADD KEY `date_to` (`date_to`);
ALTER TABLE `companies` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `companies` ADD FULLTEXT KEY `name_slug` (`name_slug`);
ALTER TABLE `companies` ADD FULLTEXT KEY `keywords_slug` (`keywords_slug`);
ALTER TABLE `companies` ADD FULLTEXT KEY `keywords` (`keywords`);
ALTER TABLE `companies` ADD FULLTEXT KEY `description` (`description`);
ALTER TABLE `companies` ADD FULLTEXT KEY `description_slug` (`description_slug`);

--
-- A tábla indexei `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_id` (`ad_id`,`event_type`),
  ADD KEY `created_at` (`created_at`);

--
-- A tábla indexei `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `visible` (`visible`),
  ADD KEY `pos` (`pos`),
  ADD KEY `last_used` (`last_used`);

--
-- A tábla indexei `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visible` (`visible`),
  ADD KEY `pos` (`pos`),
  ADD KEY `category_id` (`company_id`),
  ADD KEY `action` (`action`),
  ADD KEY `icon_id` (`icon_id`);
ALTER TABLE `persons` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `persons` ADD FULLTEXT KEY `name_slug` (`name_slug`);
ALTER TABLE `persons` ADD FULLTEXT KEY `keywoords` (`keywoords`);
ALTER TABLE `persons` ADD FULLTEXT KEY `keywoords_slug` (`keywoords_slug`);
ALTER TABLE `persons` ADD FULLTEXT KEY `description` (`description`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `adcategories`
--
ALTER TABLE `adcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `icons`
--
ALTER TABLE `icons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `persons`
--
ALTER TABLE `persons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
