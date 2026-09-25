-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 14 2026 г., 12:36
-- Версия сервера: 10.11.6-MariaDB-0+deb12u1
-- Версия PHP: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gs348853`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `password` varchar(256) NOT NULL,
  `mail` varchar(32) NOT NULL,
  `promocode` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `skin` int(11) NOT NULL DEFAULT 14,
  `level` int(11) NOT NULL DEFAULT 1,
  `exp` int(11) NOT NULL,
  `cash` int(11) NOT NULL DEFAULT 200,
  `bank` int(11) NOT NULL,
  `donate` int(11) NOT NULL,
  `reg_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `ip` varchar(24) NOT NULL DEFAULT '127.0.0.1',
  `quest` int(11) NOT NULL,
  `quest_progress` int(11) NOT NULL,
  `home` int(11) NOT NULL,
  `spawn` int(11) NOT NULL,
  `jerk` int(11) NOT NULL,
  `leader` int(11) NOT NULL,
  `fraction` int(10) UNSIGNED NOT NULL,
  `fraction_skin` int(11) NOT NULL,
  `fraction_rank` tinyint(4) NOT NULL,
  `legality` int(11) NOT NULL DEFAULT 75,
  `wanted` int(11) NOT NULL,
  `drug_addiction` int(11) NOT NULL,
  `family` int(11) NOT NULL,
  `family_rang` int(11) NOT NULL,
  `porch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `mail`, `promocode`, `sex`, `skin`, `level`, `exp`, `cash`, `bank`, `donate`, `reg_ip`, `ip`, `quest`, `quest_progress`, `home`, `spawn`, `jerk`, `leader`, `fraction`, `fraction_skin`, `fraction_rank`, `legality`, `wanted`, `drug_addiction`, `family`, `family_rang`, `porch`) VALUES
(1, 'zenettany', '4297f44b13955235245b2497399d7a93', '', 0, 1, 62, 8, 0, 41998499, 0, 0, '84.201.255.198', 'e', 0, 0, 0, 0, 0, 5, 5, 14, 10, 75, 0, 0, 1, 5, 9),
(2, 'undefiend', '8d4646eb2d7067126eb08adb0672f7bb', '', 0, 1, 50, 8, 0, 1010999, 0, 0, '46.174.112.248', 'e', 0, 0, 0, 0, 0, 1, 1, 14, 10, 75, 0, 0, 0, 0, 0),
(3, 'Mikhail_Miller', '4297f44b13955235245b2497399d7a93', '', 0, 1, 20, 8, 2, 33500500, 0, 0, '46.138.3.121', 'e', 1, 100, 0, 0, 0, 2, 2, 10, 10, 75, 0, 0, 2, 5, 0),
(4, 'Kerry_King', '4297f44b13955235245b2497399d7a93', '', 0, 1, 20, 8, 0, 999, 0, 0, '', '212.164.175.102', 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` int(11) NOT NULL,
  `prefix` varchar(32) NOT NULL DEFAULT 'Администратор',
  `fullaccess` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `admin_id`, `password`, `level`, `prefix`, `fullaccess`) VALUES
(1, 1, '123123', 7, 'Разработчик', 1),
(2, 3, '123123', 7, 'Администратор', 1),
(3, 2, '123123', 7, 'Олух', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `color1` int(11) NOT NULL,
  `color2` int(11) NOT NULL,
  `fuel` int(11) NOT NULL,
  `strobs` int(11) NOT NULL,
  `number` varchar(12) NOT NULL DEFAULT 'Транзит',
  `region` varchar(3) NOT NULL,
  `number_type` int(11) NOT NULL,
  `neon` int(11) NOT NULL,
  `neon_color1` int(11) NOT NULL,
  `neon_color2` int(11) NOT NULL,
  `neon_color3` int(11) NOT NULL,
  `neon_alpha` int(11) NOT NULL,
  `mileage` int(11) NOT NULL,
  `audio_system` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `owner_id`, `model`, `color1`, `color2`, `fuel`, `strobs`, `number`, `region`, `number_type`, `neon`, `neon_color1`, `neon_color2`, `neon_color3`, `neon_alpha`, `mileage`, `audio_system`) VALUES
(1, 1, 605, 1, 1, 84, 0, 'М555КА', '52', 1, 0, 0, 0, 0, 0, 72, 1),
(2, 14, 555, 4, 4, 50, 1, 'Т777ТТ', '52', 1, 0, 0, 0, 0, 0, 0, 0),
(3, 14, 431, 1, 1, 50, 1, '7777АА', 'АА', 2, 0, 0, 0, 0, 0, 0, 0),
(4, 4, 579, 0, 0, 50, 0, 'ТАНКСОФТ', 'ЛОХ', 2, 0, 0, 0, 0, 0, 0, 0),
(6, 1, 565, 0, 0, 46, 0, 'ТАНКСОФТ', 'ЛОХ', 1, 0, 0, 0, 0, 0, 4, 1),
(7, 1, 603, 78, 78, 50, 0, 'A777AA', '52', 1, 0, 0, 0, 0, 0, 0, 1),
(8, 24, 556, 1, 1, 50, 1, 'Транзит', '123', 0, 1, 255, 2, 5, 255, 144, 1),
(9, 24, 605, 96, 98, 50, 1, 'Транзит', '52', 0, 1, 255, 2, 5, 255, 144, 1),
(10, 29, 424, 0, 0, 50, 1, 'Транзит', '0', 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `create_objects`
--

CREATE TABLE `create_objects` (
  `Name` varchar(30) NOT NULL,
  `Model` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `RotX` float NOT NULL,
  `RotY` float NOT NULL,
  `RotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;

--
-- Дамп данных таблицы `create_objects`
--

INSERT INTO `create_objects` (`Name`, `Model`, `PosX`, `PosY`, `PosZ`, `RotX`, `RotY`, `RotZ`) VALUES
('1', 12549, 1489.78, 1698.42, 15.2939, -0.199999, 0.3, 94.8),
('2', 12549, 1486.84, 1712, 15.2966, 0, 0, 100.3),
('5', 5161, 452.181, 745.866, 16.1775, 0, 0, -17.6);

-- --------------------------------------------------------

--
-- Структура таблицы `family`
--

CREATE TABLE `family` (
  `id` int(11) NOT NULL,
  `family_name` varchar(32) NOT NULL DEFAULT 'Без названия',
  `leader` int(11) NOT NULL,
  `max_rang` int(11) NOT NULL DEFAULT 5,
  `rank1_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank2_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank3_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank4_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank5_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank6_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank7_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank8_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank9_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `rank10_name` varchar(32) NOT NULL DEFAULT 'Нет',
  `members_family` int(11) NOT NULL,
  `vouchers` int(11) NOT NULL,
  `house` int(11) NOT NULL DEFAULT -1,
  `bank` int(11) NOT NULL,
  `warn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `family`
--

INSERT INTO `family` (`id`, `family_name`, `leader`, `max_rang`, `rank1_name`, `rank2_name`, `rank3_name`, `rank4_name`, `rank5_name`, `rank6_name`, `rank7_name`, `rank8_name`, `rank9_name`, `rank10_name`, `members_family`, `vouchers`, `house`, `bank`, `warn`) VALUES
(1, 'qwerty', 1, 5, 'Нет', 'Нет', 'Нет', 'Нет', 'Лидер', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 1, 0, -1, 10420, 0),
(2, 'adminsTeam', 3, 5, 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 1, 0, -1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fractions`
--

CREATE TABLE `fractions` (
  `id` int(10) UNSIGNED NOT NULL,
  `fraction_name` varchar(32) NOT NULL,
  `fraction_type` int(11) NOT NULL DEFAULT 0,
  `fraction_ranks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `fractions`
--

INSERT INTO `fractions` (`id`, `fraction_name`, `fraction_type`, `fraction_ranks`) VALUES
(0, 'Нет', 0, 0),
(1, 'Правительство области', 1, 10),
(2, 'Федеральная служба безопасности', 2, 10),
(3, 'Дорожно-патрульная служба', 3, 11),
(4, 'Патрульно-постовая служба', 4, 12),
(5, 'Единая служба спасения', 5, 10),
(6, 'Воинская часть', 6, 12),
(7, 'Байкеры', 7, 6),
(8, 'Скинхеды', 8, 6),
(9, 'Русская мафия', 9, 10),
(10, 'Кавказская мафия', 10, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `fractions_coords`
--

CREATE TABLE `fractions_coords` (
  `fraction_id` int(10) UNSIGNED NOT NULL,
  `fraction_spawn_X` float NOT NULL DEFAULT -1,
  `fraction_spawn_Y` float NOT NULL DEFAULT -1,
  `fraction_spawn_Z` float NOT NULL DEFAULT -1,
  `fraction_spawn_A` float NOT NULL DEFAULT -1,
  `fraction_dress_X` float NOT NULL DEFAULT -1,
  `fraction_dress_Y` float NOT NULL DEFAULT -1,
  `fraction_dress_Z` float NOT NULL DEFAULT -1,
  `fraction_dress_pickup_model` int(6) NOT NULL DEFAULT 1275,
  `fraction_armoury_X` float NOT NULL DEFAULT -1,
  `fraction_armoury_Y` float NOT NULL DEFAULT -1,
  `fraction_armoury_Z` float NOT NULL DEFAULT -1,
  `fraction_armoury_pickup_model` float NOT NULL DEFAULT 11093
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Координаты во фракциях';

--
-- Дамп данных таблицы `fractions_coords`
--

INSERT INTO `fractions_coords` (`fraction_id`, `fraction_spawn_X`, `fraction_spawn_Y`, `fraction_spawn_Z`, `fraction_spawn_A`, `fraction_dress_X`, `fraction_dress_Y`, `fraction_dress_Z`, `fraction_dress_pickup_model`, `fraction_armoury_X`, `fraction_armoury_Y`, `fraction_armoury_Z`, `fraction_armoury_pickup_model`) VALUES
(1, -1617.49, -2172.22, 2604.83, 268.216, -1599.8, -2177.54, 2604.83, 1275, -1, -1, -1, 11093),
(2, -1, -1, -1, -1, 1633.37, 1191.64, 1664.02, 1275, -1, -1, -1, 11093),
(3, -1617.49, -2172.22, 2604.83, 268.216, 1579.8, 819.023, 1901.24, 1275, -1, -1, -1, 11093),
(4, -1, -1, -1, -1, -1, -1, -1, 1275, -1, -1, -1, 11093),
(5, -1, -1, -1, -1, -1, -1, -1, 1275, -1, -1, -1, 11093),
(6, -1, -1, -1, -1, -1, -1, -1, 1275, -1, -1, -1, 11093),
(7, -1, -1, -1, -1, -1, -1, -1, 1275, -1, -1, -1, 11093),
(8, -1, -1, -1, -1, -1, -1, -1, 1275, -1, -1, -1, 11093),
(9, -1, -1, -1, -1, -1, -1, -1, 1275, -1, -1, -1, 11093),
(10, -1, -1, -1, -1, -1, -1, -1, 1275, -1, -1, -1, 11093);

-- --------------------------------------------------------

--
-- Структура таблицы `fractions_names`
--

CREATE TABLE `fractions_names` (
  `fraction_id` int(10) UNSIGNED NOT NULL,
  `rank1_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank2_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank3_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank4_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank5_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank6_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank7_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank8_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank9_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank10_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank11_name` varchar(24) NOT NULL DEFAULT 'Нет',
  `rank12_name` varchar(24) NOT NULL DEFAULT 'Нет'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `fractions_names`
--

INSERT INTO `fractions_names` (`fraction_id`, `rank1_name`, `rank2_name`, `rank3_name`, `rank4_name`, `rank5_name`, `rank6_name`, `rank7_name`, `rank8_name`, `rank9_name`, `rank10_name`, `rank11_name`, `rank12_name`) VALUES
(1, 'Охранник', 'Начальник охраны', 'Адвокат', 'Инспектор', 'Советник', 'Заместитель министра', 'Министр', 'Глава администрации', 'Вице-губернатор', 'Губернатор', 'Нет', 'Нет'),
(2, 'Стажер', 'Старший прапорщик', 'Младший лейтенант', 'Лейтенант', 'Старший лейтенант', 'Капитан', 'Майор', 'Подполковник', 'Полковник', 'Генерал-майор', 'Нет', 'Нет'),
(3, 'Рядовой', 'Младший сержант', 'Сержант', 'Старшина', 'Прапорщик', 'Младший лейтенант', 'Лейтенант', 'Капитан', 'Майор', 'Подполковник', 'Полковник', 'Нет'),
(4, 'Рядовой', 'Младший сержант', 'Сержант', 'Старшина', 'Прапорщик', 'Младший лейтенант', 'Лейтенант', 'Капитан', 'Майор', 'Подполковник', 'Полковник', 'Генерал полиции'),
(5, 'Водитель', 'Пожарный', 'Спасатель', 'Инспектор', 'Терапевт', 'Психолог', 'Нарколог', 'Хирург', 'Зам. начальника', 'Начальник департамента', 'Нет', 'Нет'),
(6, 'Рядовой', 'Ефрейтор', 'Младший сержант', 'Сержант', 'Старший сержант', 'Старшина', 'Прапорщик', 'Старший прапорщик', 'Майор', 'Подполковник', 'Полковник', 'Генерал армии'),
(7, 'Молокосос', 'Салага', 'Бритоголовый', 'Стрелок', 'Заведующий', 'Лидер движения', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет'),
(8, 'Молокосос', 'Салага', 'Бритоголовый', 'Стрелок', 'Заведующий', 'Лидер движения', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет', 'Нет'),
(9, 'Браток', 'Головорез', 'Головорез', 'Шпион', 'Координатор', 'Ветеран', 'Пахан', 'Сторожила', 'Аристократ', 'Авторитет', 'Нет', 'Нет'),
(10, 'Хоза', 'Муса', 'Юнус', 'Абу', 'Маджид', 'Турпал', 'Эмин', 'Султан', 'Вайнах', 'Нохчо', 'Нет', 'Нет');

-- --------------------------------------------------------

--
-- Структура таблицы `fractions_salaries`
--

CREATE TABLE `fractions_salaries` (
  `fraction_id` int(10) UNSIGNED NOT NULL,
  `salary_rank_1` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_2` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_3` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_4` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_5` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_6` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_7` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_8` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_9` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_10` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_11` int(11) NOT NULL DEFAULT 1000,
  `salary_rank_12` int(11) NOT NULL DEFAULT 1000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `fractions_salaries`
--

INSERT INTO `fractions_salaries` (`fraction_id`, `salary_rank_1`, `salary_rank_2`, `salary_rank_3`, `salary_rank_4`, `salary_rank_5`, `salary_rank_6`, `salary_rank_7`, `salary_rank_8`, `salary_rank_9`, `salary_rank_10`, `salary_rank_11`, `salary_rank_12`) VALUES
(1, 18000, 20000, 23000, 26000, 29000, 32000, 35000, 38000, 41000, 45000, 1000, 1000),
(2, 37000, 40000, 43000, 46000, 49000, 52000, 52000, 58000, 61000, 65000, 1000, 1000),
(3, 21000, 24000, 27000, 30000, 33000, 36000, 39000, 42000, 45000, 48000, 51000, 1000),
(4, 21000, 24000, 27000, 30000, 33000, 36000, 39000, 42000, 45000, 48000, 51000, 55000),
(5, 21000, 24500, 27000, 29500, 32000, 35000, 38000, 41000, 44000, 48000, 1000, 1000),
(6, 14000, 16500, 19000, 21500, 23500, 26500, 29000, 32000, 35000, 38000, 41000, 45000),
(7, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000),
(8, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000),
(9, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000),
(10, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `fractions_skins`
--

CREATE TABLE `fractions_skins` (
  `fraction_id` int(10) UNSIGNED NOT NULL,
  `fraction_skin_1` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_2` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_3` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_4` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_5` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_6` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_7` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_8` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_9` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_10` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_11` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_12` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_1` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_2` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_3` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_4` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_5` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_6` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_7` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_8` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_9` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_10` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_11` int(11) NOT NULL DEFAULT 14,
  `fraction_skin_female_12` int(11) NOT NULL DEFAULT 14
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `fractions_skins`
--

INSERT INTO `fractions_skins` (`fraction_id`, `fraction_skin_1`, `fraction_skin_2`, `fraction_skin_3`, `fraction_skin_4`, `fraction_skin_5`, `fraction_skin_6`, `fraction_skin_7`, `fraction_skin_8`, `fraction_skin_9`, `fraction_skin_10`, `fraction_skin_11`, `fraction_skin_12`, `fraction_skin_female_1`, `fraction_skin_female_2`, `fraction_skin_female_3`, `fraction_skin_female_4`, `fraction_skin_female_5`, `fraction_skin_female_6`, `fraction_skin_female_7`, `fraction_skin_female_8`, `fraction_skin_female_9`, `fraction_skin_female_10`, `fraction_skin_female_11`, `fraction_skin_female_12`) VALUES
(1, 29, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 77, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),
(2, 111, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),
(3, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 14),
(4, 111, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),
(5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),
(6, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),
(7, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),
(8, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),
(9, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14),
(10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `fractions_vehicles`
--

CREATE TABLE `fractions_vehicles` (
  `veh_id` int(11) NOT NULL,
  `fraction_id` int(10) UNSIGNED NOT NULL,
  `fraction_veh_spawn_X` float NOT NULL DEFAULT -1,
  `fraction_veh_spawn_Y` float NOT NULL DEFAULT -1,
  `fraction_veh_spawn_Z` float NOT NULL DEFAULT -1,
  `fraction_veh_spawn_A` float NOT NULL DEFAULT -1,
  `fraction_veh_color1` smallint(6) NOT NULL DEFAULT 0,
  `fraction_veh_color2` smallint(6) NOT NULL DEFAULT 0,
  `fraction_veh_model` int(11) NOT NULL,
  `fraction_veh_rank_avaiable` tinyint(4) NOT NULL DEFAULT 1,
  `fraction_veh_toning` tinyint(1) NOT NULL DEFAULT 0,
  `fraction_veh_toning_R` smallint(4) NOT NULL DEFAULT 255,
  `fraction_veh_toning_G` smallint(4) NOT NULL DEFAULT 255,
  `fraction_veh_toning_B` smallint(4) NOT NULL DEFAULT 255,
  `fraction_veh_toning_A` smallint(4) NOT NULL DEFAULT 255
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `fractions_vehicles`
--

INSERT INTO `fractions_vehicles` (`veh_id`, `fraction_id`, `fraction_veh_spawn_X`, `fraction_veh_spawn_Y`, `fraction_veh_spawn_Z`, `fraction_veh_spawn_A`, `fraction_veh_color1`, `fraction_veh_color2`, `fraction_veh_model`, `fraction_veh_rank_avaiable`, `fraction_veh_toning`, `fraction_veh_toning_R`, `fraction_veh_toning_G`, `fraction_veh_toning_B`, `fraction_veh_toning_A`) VALUES
(1, 2, -271.25, 555.633, 12.5223, 139.074, 0, 53, 621, 1, 1, 20, 20, 20, 255),
(2, 2, -266.313, 554.972, 12.5837, 136.81, 0, 53, 621, 1, 1, 20, 20, 20, 255),
(3, 2, -262.1, 553.91, 12.6157, 144.019, 0, 53, 621, 1, 1, 20, 20, 20, 255),
(4, 2, -251.74, 550.36, 12.8, 148.98, 0, 53, 579, 1, 1, 20, 20, 20, 255),
(5, 2, -256.18, 551.28, 12.55, 146.1, 0, 53, 579, 1, 1, 20, 20, 20, 255),
(6, 2, -215.21, 553.34, 12.62, 79.6, 0, 53, 482, 1, 1, 20, 20, 20, 255),
(7, 2, -214.45, 557.94, 12.4, 79.9, 0, 53, 482, 1, 1, 20, 20, 20, 255),
(8, 2, -243.42, 537.35, 12.83, 352.87, 0, 53, 418, 1, 1, 20, 20, 20, 255),
(9, 2, -247.66, 537.7, 12.83, 353.7, 0, 53, 418, 1, 1, 20, 20, 20, 255),
(10, 2, -241.86, 549.98, 12.9, 174.4, 0, 53, 601, 1, 1, 20, 20, 20, 255),
(11, 2, -246.52, 550.61, 12.92, 172.4, 0, 53, 601, 1, 1, 20, 20, 20, 255);

-- --------------------------------------------------------

--
-- Структура таблицы `fractions_warehouse_items`
--

CREATE TABLE `fractions_warehouse_items` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `fraction_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(24) NOT NULL,
  `item_server_id` int(11) NOT NULL DEFAULT -1,
  `item_count` int(11) NOT NULL DEFAULT 0,
  `item_max_amount` int(11) NOT NULL DEFAULT 1,
  `item_type` int(11) NOT NULL DEFAULT 0,
  `item_rank_access` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Предметы для складов во фракциях';

--
-- Дамп данных таблицы `fractions_warehouse_items`
--

INSERT INTO `fractions_warehouse_items` (`item_id`, `fraction_id`, `item_name`, `item_server_id`, `item_count`, `item_max_amount`, `item_type`, `item_rank_access`) VALUES
(1, 1, 'Дубинка', 3, 10000, 1, 1, 1),
(2, 2, 'Чмошная палочка', -1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `class` int(11) NOT NULL DEFAULT 1,
  `lock` int(11) NOT NULL,
  `hours` int(11) NOT NULL DEFAULT 32,
  `pay` int(11) NOT NULL DEFAULT 500,
  `vs_posx` float NOT NULL DEFAULT 0,
  `vs_posy` float NOT NULL DEFAULT 0,
  `vs_posz` float NOT NULL DEFAULT 0,
  `vs_posa` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `houses`
--

INSERT INTO `houses` (`id`, `owner_id`, `price`, `pos_x`, `pos_y`, `pos_z`, `class`, `lock`, `hours`, `pay`, `vs_posx`, `vs_posy`, `vs_posz`, `vs_posa`) VALUES
(1, 0, 15000000, 2155.54, -909.87, 2.09, 3, 0, 1, 15000, 2138.85, -907.83, 1.22, 1.8),
(2, 0, 12500000, 2201.08, -905.09, 2.13, 3, 0, 1, 12500, 2215.61, -910.21, 1.21, 358.88),
(3, 0, 5000000, 1991.16, -916.88, 2.12, 3, 0, 1, 2500, 1982, -920.3, 1.21, 196.45),
(4, 0, 15000000, 2291.62, 2210.5, 3.33, 1, 0, 1, 1500, 2288.47, 2195.55, 2.42, 269.07),
(5, 0, 15000, 2427.92, -1421.25, 81.23, 3, 0, 30, 15000, 2427.92, -1421.25, 81.23, 0),
(6, 0, 15000000, 2364.1, -1421.26, 81.62, 3, 0, 1, 15000, 2384.91, -1426.47, 80.33, 178.77),
(7, 0, 1111, 1886.16, 1769.83, 14.84, 2, 0, 32, 111, 1886.71, 1769.08, 14.65, 358.73);

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `item_owner_id` int(11) NOT NULL,
  `item_type` int(11) NOT NULL,
  `item_amount` int(11) NOT NULL,
  `item_slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`id`, `item_owner_id`, `item_type`, `item_amount`, `item_slot`) VALUES
(1, 1, 1, 111, 1),
(2, 1, 2, 333, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `owner_id` int(10) NOT NULL,
  `text` varchar(256) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `logs`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `recipient_id` int(24) NOT NULL,
  `text` varchar(256) NOT NULL,
  `important` int(11) NOT NULL,
  `message_read` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `header` text NOT NULL DEFAULT 'Сообщение'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `recipient_id`, `text`, `important`, `message_read`, `date`, `header`) VALUES
(36, 32, 'Вы были назначены на должность администратора 0 уровня игроком nazik_squad. Ваш админ пароль: ptMUXaj', 1, 0, '2025-08-02', 'Сообщение'),
(37, 45, 'Вы были назначены на должность администратора 7 уровня игроком nazik_squad. Ваш админ пароль: GDyiN1J', 1, 1, '2025-08-03', 'Сообщение'),
(38, 45, 'Вы были назначены на должность администратора 7 уровня игроком nazik_squad. Ваш админ пароль: 56uVWDg', 1, 1, '2025-08-03', 'Сообщение');

-- --------------------------------------------------------

--
-- Структура таблицы `porch`
--

CREATE TABLE `porch` (
  `id` int(11) NOT NULL,
  `pEnterX` float NOT NULL,
  `pEnterY` float NOT NULL,
  `pEnterZ` float NOT NULL,
  `vxod_x` float NOT NULL,
  `vxod_y` float NOT NULL,
  `vxod_z` float NOT NULL,
  `vxod_fa` float NOT NULL,
  `pCarX` float NOT NULL,
  `pCarY` float NOT NULL,
  `pCarZ` float NOT NULL,
  `pCarA` float NOT NULL,
  `pFirstFlat` int(11) NOT NULL,
  `pType` int(11) NOT NULL,
  `pMaxPorch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `porch`
--

INSERT INTO `porch` (`id`, `pEnterX`, `pEnterY`, `pEnterZ`, `vxod_x`, `vxod_y`, `vxod_z`, `vxod_fa`, `pCarX`, `pCarY`, `pCarZ`, `pCarA`, `pFirstFlat`, `pType`, `pMaxPorch`) VALUES
(1, 1933.03, 2158.85, 16.0708, 602.276, 554.173, 1501.24, 360, 1928.91, 2159.17, 15.6119, 0, 1, 1, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `porch_house`
--

CREATE TABLE `porch_house` (
  `id` int(11) NOT NULL,
  `hEntrx` float NOT NULL DEFAULT 0,
  `hEntry` float NOT NULL DEFAULT 0,
  `hEntrz` float NOT NULL DEFAULT 0,
  `hEntrFa` float NOT NULL DEFAULT 0,
  `hSpawn_X` float NOT NULL DEFAULT 0,
  `hSpawn_Y` float NOT NULL DEFAULT 0,
  `hSpawn_Z` float NOT NULL DEFAULT 0,
  `hSpawn_Fa` float NOT NULL DEFAULT 0,
  `hOwner` varchar(24) NOT NULL DEFAULT '',
  `hOwnerID` int(11) NOT NULL DEFAULT 0,
  `hPrice` int(11) NOT NULL DEFAULT 0,
  `hDays` int(11) NOT NULL DEFAULT 0,
  `hPorch` int(11) NOT NULL DEFAULT 0,
  `hLock` int(11) NOT NULL DEFAULT 0,
  `hClass` int(11) NOT NULL DEFAULT 0,
  `hPay` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `porch_house`
--

INSERT INTO `porch_house` (`id`, `hEntrx`, `hEntry`, `hEntrz`, `hEntrFa`, `hSpawn_X`, `hSpawn_Y`, `hSpawn_Z`, `hSpawn_Fa`, `hOwner`, `hOwnerID`, `hPrice`, `hDays`, `hPorch`, `hLock`, `hClass`, `hPay`) VALUES
(1, 595.278, 561.384, 1502.44, 262.239, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 800000, 0, 1, 1, 1, 7000),
(2, 599.319, 564.047, 1502.44, 182.964, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 500000, 0, 1, 1, 1, 3000),
(3, 606.399, 563.994, 1502.45, 172.311, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 800000, 0, 1, 1, 1, 7000),
(4, 608.888, 561.468, 1502.45, 88.9398, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 500000, 0, 1, 1, 1, 3000),
(5, 606.38, 558.587, 1502.45, 4.0261, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 800000, 0, 1, 0, 1, 7000),
(6, 595.138, 561.269, 1506.82, 258.119, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 500000, 0, 1, 1, 1, 3000),
(7, 599.203, 563.929, 1506.82, 185.111, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 800000, 0, 1, 1, 1, 7000),
(8, 606.331, 563.951, 1506.82, 183.857, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 500000, 0, 1, 1, 1, 3000),
(9, 608.853, 561.461, 1506.82, 90.1692, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 800000, 0, 1, 1, 1, 7000),
(10, 606.471, 558.565, 1506.82, 352.409, -1568.08, 1993.3, 2204.83, 152.33, 'None', 0, 800000, 0, 1, 1, 1, 7000);

-- --------------------------------------------------------

--
-- Структура таблицы `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(11) NOT NULL,
  `promocode_name` varchar(32) NOT NULL,
  `promocode_owner_id` int(11) NOT NULL,
  `promocode_uses` int(11) NOT NULL,
  `promocode_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `promocodes`
--

INSERT INTO `promocodes` (`id`, `promocode_name`, `promocode_owner_id`, `promocode_uses`, `promocode_created`) VALUES
(1, '#nazikshow', 1, 7, '2025-07-27 11:20:18'),
(2, '0', 0, 0, '2025-07-24 17:59:49');

-- --------------------------------------------------------

--
-- Структура таблицы `safe_zones`
--

CREATE TABLE `safe_zones` (
  `szID` int(10) UNSIGNED NOT NULL,
  `szPos_x` float NOT NULL,
  `szPos_y` float NOT NULL,
  `szPos_z` float NOT NULL,
  `szSize` float NOT NULL,
  `szWorld` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `safe_zones`
--

INSERT INTO `safe_zones` (`szID`, `szPos_x`, `szPos_y`, `szPos_z`, `szSize`, `szWorld`) VALUES
(1, 480.634, 1675.4, 12.2031, 75, -1),
(2, 1911.34, 2098.37, 15.875, 75, -1);

-- --------------------------------------------------------

--
-- Структура таблицы `server_config`
--

CREATE TABLE `server_config` (
  `id` int(11) NOT NULL,
  `server_site` varchar(56) NOT NULL,
  `server_name` varchar(32) NOT NULL,
  `server_version` varchar(8) NOT NULL,
  `server_bonus_money` int(10) NOT NULL,
  `server_bonus_lvl` int(10) NOT NULL,
  `referal_5_lvl_bonus` int(10) NOT NULL,
  `referal_10_lvl_bonus` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `server_config`
--

INSERT INTO `server_config` (`id`, `server_site`, `server_name`, `server_version`, `server_bonus_money`, `server_bonus_lvl`, `referal_5_lvl_bonus`, `referal_10_lvl_bonus`) VALUES
(1, 'zenettany', 'ACRIL', '3.7.6', 999, 8, 150000, 300000);

-- --------------------------------------------------------

--
-- Структура таблицы `teleport_pickups`
--

CREATE TABLE `teleport_pickups` (
  `teleport` int(11) NOT NULL,
  `teleport_name` varchar(32) NOT NULL,
  `teleport_is_name_shown` int(11) NOT NULL DEFAULT 0,
  `teleport_pickup_id` int(11) NOT NULL DEFAULT 11778,
  `teleport_pickup_pos_x` float NOT NULL,
  `teleport_pickup_pos_y` float NOT NULL,
  `teleport_pickup_pos_z` float NOT NULL,
  `teleport_pickup_vw` int(11) NOT NULL DEFAULT 0,
  `teleport_pos_x` float NOT NULL,
  `teleport_pos_y` float NOT NULL,
  `teleport_pos_z` float NOT NULL,
  `teleport_pos_a` float NOT NULL,
  `teleport_interior` int(11) NOT NULL DEFAULT 0,
  `teleport_vw` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `teleport_pickups`
--

INSERT INTO `teleport_pickups` (`teleport`, `teleport_name`, `teleport_is_name_shown`, `teleport_pickup_id`, `teleport_pickup_pos_x`, `teleport_pickup_pos_y`, `teleport_pickup_pos_z`, `teleport_pickup_vw`, `teleport_pos_x`, `teleport_pos_y`, `teleport_pos_z`, `teleport_pos_a`, `teleport_interior`, `teleport_vw`) VALUES
(1, '-- Спермбанк Вход', 0, 11778, 2310.49, -1926.22, 21.9639, 0, 497.781, 726.998, 1279.61, 263.638, 0, 1),
(2, '-- Спермбанк Выход', 0, 11778, 496.247, 726.726, 1279.61, 1, 2308.34, -1925.75, 21.8213, 88.8386, 0, 0),
(3, '-- Правительство вход', 0, 11778, 1822.46, 2140.55, 15.8494, 0, -1577.15, -1577.15, 2604.83, 360, 0, 1),
(4, '-- Правительство выход', 0, 11778, -1577.47, -2187.73, 2604.83, 1, 1825.98, 2140.91, 15.8416, 270, 0, 0),
(5, '-- ФСБ Вход', 0, 11778, -315.341, 710.432, 12.215, 0, 1598.71, 1194.95, 1664.03, 0, 0, 1),
(6, '-- ФСБ Выход', 0, 11778, 1598.72, 1192.62, 1664.03, 1, -315.371, 708.545, 12.215, 0, 0, 0),
(7, '-- Русская мафия Вход', 0, 11778, 470.54, 1210.58, 12.9182, 0, -558.497, 263.473, 1729.65, 178.081, 0, 1),
(8, '-- Русская мафия Выход', 0, 11778, -557.964, 261.779, 1729.65, 1, 470.385, 1209.3, 12.9123, 0, 0, 0),
(9, '-- Кавказская мафия Вход', 0, 11778, 1929.38, 2817.54, 12.5209, 0, 425.971, -670.747, 1713.93, 0, 0, 1),
(10, '-- Кавказская мафия Выход', 0, 11778, 425.875, -672.366, 1713.93, 1, 1927.54, 2817.41, 12.2968, 0, 0, 0),
(11, '-- Скинхеды Вход', 0, 11778, -515.213, 1015.59, 13.0633, 0, -377.449, -1048.26, 3104.84, 0, 0, 1),
(12, '-- Скинхеды Выход', 0, 11778, -377.486, -1049.85, 3104.84, 1, -515.119, 1018.42, 12.162, 0, 0, 0),
(13, '-- Байкеры Вход', 0, 11778, -110.639, 1528.65, 13.7968, 0, -1875.74, -2390.02, 2604.83, 0, 0, 1),
(14, '-- Байкеры Выход', 0, 11778, -1875.85, -2391.69, 2604.83, 1, -108.955, 1527.98, 13.7968, 0, 0, 0),
(15, '-- ТРК Вход', 0, 11778, 2129.56, -1955.8, 20.2421, 0, -1279.8, -2496.93, 2501.23, 0, 0, 1),
(16, '-- ТРК Выход', 0, 11778, -1279.78, -2498.85, 2501.23, 1, 2130.07, -1954.28, 20.2421, 0, 0, 0),
(17, '-- Военкомат Вход №1', 0, 11778, 1894.09, 2378.56, 16.7939, 0, 1750.72, 299.551, 1501.24, 0, 0, 1),
(18, '-- Военкомат Выход №1', 0, 11778, 1750.69, 297.855, 1501.24, 1, 1891.38, 2376.71, 15.9062, 0, 0, 0),
(19, '-- Военкомат Вход №2', 0, 11778, 1907.69, 2387.34, 16.903, 0, 1752.56, 319.292, 1501.24, 0, 0, 1),
(20, '-- Военкомат Выход №2', 0, 11778, 1752.52, 321.872, 1501.24, 1, 1910.9, 2389.28, 15.9062, 0, 0, 0),
(21, '-- ППС Вход №1', 0, 11778, 2523.4, -2462.65, 21.9594, 0, 1750.72, 299.551, 1501.24, 0, 0, 1),
(22, '-- ППС Выход №1', 0, 11778, 1550.95, 799.335, 1901.24, 1, 2523.29, -2464.07, 21.9594, 0, 0, 0),
(23, '-- ППС Вход №2', 0, 11778, 1550.91, 801.248, 1901.24, 0, 1550.91, 801.248, 1901.24, 0, 0, 1),
(24, '-- ППС Выход №2', 0, 11778, 1550.95, 799.335, 1901.24, 1, 2523.38, -2442.95, 21.8428, 0, 0, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_id` (`admin_id`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_owner_id` (`owner_id`);

--
-- Индексы таблицы `create_objects`
--
ALTER TABLE `create_objects`
  ADD PRIMARY KEY (`Name`);

--
-- Индексы таблицы `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fractions`
--
ALTER TABLE `fractions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fractions_coords`
--
ALTER TABLE `fractions_coords`
  ADD PRIMARY KEY (`fraction_id`);

--
-- Индексы таблицы `fractions_names`
--
ALTER TABLE `fractions_names`
  ADD PRIMARY KEY (`fraction_id`);

--
-- Индексы таблицы `fractions_salaries`
--
ALTER TABLE `fractions_salaries`
  ADD PRIMARY KEY (`fraction_id`);

--
-- Индексы таблицы `fractions_skins`
--
ALTER TABLE `fractions_skins`
  ADD PRIMARY KEY (`fraction_id`);

--
-- Индексы таблицы `fractions_vehicles`
--
ALTER TABLE `fractions_vehicles`
  ADD PRIMARY KEY (`veh_id`),
  ADD KEY `fraction_id` (`fraction_id`);

--
-- Индексы таблицы `fractions_warehouse_items`
--
ALTER TABLE `fractions_warehouse_items`
  ADD PRIMARY KEY (`item_id`,`fraction_id`),
  ADD KEY `fraction_id` (`fraction_id`);

--
-- Индексы таблицы `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_slot_per_owner` (`item_owner_id`,`item_slot`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `porch`
--
ALTER TABLE `porch`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `porch_house`
--
ALTER TABLE `porch_house`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `safe_zones`
--
ALTER TABLE `safe_zones`
  ADD PRIMARY KEY (`szID`);

--
-- Индексы таблицы `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `teleport_pickups`
--
ALTER TABLE `teleport_pickups`
  ADD PRIMARY KEY (`teleport`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `family`
--
ALTER TABLE `family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `fractions`
--
ALTER TABLE `fractions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `fractions_coords`
--
ALTER TABLE `fractions_coords`
  MODIFY `fraction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `fractions_names`
--
ALTER TABLE `fractions_names`
  MODIFY `fraction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `fractions_salaries`
--
ALTER TABLE `fractions_salaries`
  MODIFY `fraction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `fractions_skins`
--
ALTER TABLE `fractions_skins`
  MODIFY `fraction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `fractions_vehicles`
--
ALTER TABLE `fractions_vehicles`
  MODIFY `veh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `fractions_warehouse_items`
--
ALTER TABLE `fractions_warehouse_items`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `porch`
--
ALTER TABLE `porch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `porch_house`
--
ALTER TABLE `porch_house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `safe_zones`
--
ALTER TABLE `safe_zones`
  MODIFY `szID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `server_config`
--
ALTER TABLE `server_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `teleport_pickups`
--
ALTER TABLE `teleport_pickups`
  MODIFY `teleport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
ext`, `date`) VALUES
(1, 1, 'Игрок nazik_squad (получил) ъ,Д8
