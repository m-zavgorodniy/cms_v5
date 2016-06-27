-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июн 27 2016 г., 01:04
-- Версия сервера: 5.5.8-CoreSeek
-- Версия PHP: 5.3.13

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `delovoy2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_lang_id` varchar(40) NOT NULL DEFAULT '',
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `section_id` int(11) NOT NULL,
  `article_type_id` varchar(16) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `body` text,
  `body_en` text,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `article_section_id_idx` (`section_id`),
  KEY `article_type_id_idx` (`article_type_id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `article`
--

INSERT INTO `article` (`id`, `meta_site_lang_id`, `meta_site_id`, `section_id`, `article_type_id`, `title`, `title_en`, `body`, `body_en`, `sort_num`, `published`) VALUES
(1, '', '', 5, '', 'Услуги', '', '<table width="100%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="50%" valign="top">\r\n            <p>Сеть центров «Деловой» создает удобство для малого предпринимательства через расширение инфраструктуры в современных Бизнес центрах с малыми офисами, отдельными рабочими местами, переговорными, виртуальным офисом — почта, телефон и секретарь. К нам можно быстро налегке войти, гибко поменять услуги в стиле «больше-меньше» и также легко выйти без вложений и затрат.</p>\r\n            </td>\r\n            <td width="30"> </td>\r\n            <td width="50%" valign="top">\r\n            <p>Секретари, системные администраторы, курьеры, юрисконсульты обязательно должны быть в каждой компании. Но нужно ли принимать этих специалистов в штат?</p>\r\n            <p>Теперь — необязательно. Эту нужную и важную работу примут на себя специалисты офисного центра «Деловой». И выполнят ее с высочайшим профессионализмом.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p class="editor-align-center"><big>Качественный офис в престижном деловом центре — это комфорт для ведения бизнеса и важная составляющая имиджа Вашей компании. Офисный центр «Деловой» предложит Вам оптимальное сочетание цены и качества</big></p>', NULL, 10, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `article_type`
--

DROP TABLE IF EXISTS `article_type`;
CREATE TABLE IF NOT EXISTS `article_type` (
  `id` varchar(16) NOT NULL DEFAULT '',
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `article_type`
--

INSERT INTO `article_type` (`id`, `meta_site_id`, `name`, `sort_num`) VALUES
('', '', 'Основная статья раздела', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_type_id` varchar(16) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `body` text,
  `body_en` text,
  `img_src` varchar(255) DEFAULT NULL,
  `img_src_en` varchar(255) DEFAULT NULL,
  `flash_src` varchar(255) DEFAULT NULL,
  `flash_src_en` varchar(255) DEFAULT NULL,
  `img_src_big` varchar(255) DEFAULT NULL,
  `img_src_big_en` varchar(255) DEFAULT NULL,
  `video_src` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `url_title` varchar(255) DEFAULT NULL,
  `url_title_en` varchar(255) DEFAULT NULL,
  `bg_color` varchar(16) DEFAULT NULL,
  `color_scheme_id` varchar(16) NOT NULL DEFAULT '',
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `banner_type_id_idx` (`banner_type_id`),
  KEY `color_scheme_id` (`color_scheme_id`),
  KEY `color_scheme_id_2` (`color_scheme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `banner`
--

INSERT INTO `banner` (`id`, `banner_type_id`, `title`, `title_en`, `body`, `body_en`, `img_src`, `img_src_en`, `flash_src`, `flash_src_en`, `img_src_big`, `img_src_big_en`, `video_src`, `url`, `url_title`, `url_title_en`, `bg_color`, `color_scheme_id`, `sort_num`, `published`) VALUES
(6, 'main', 'Sample', '', NULL, NULL, '/uploads/images/banners/sample.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '#', NULL, NULL, NULL, '', 10, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `banner2section`
--

DROP TABLE IF EXISTS `banner2section`;
CREATE TABLE IF NOT EXISTS `banner2section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `banner_id` (`banner_id`,`section_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `banner_type`
--

DROP TABLE IF EXISTS `banner_type`;
CREATE TABLE IF NOT EXISTS `banner_type` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `w` int(4) NOT NULL,
  `h` int(4) NOT NULL,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `banner_type`
--

INSERT INTO `banner_type` (`id`, `name`, `w`, `h`, `sort_num`) VALUES
('main', 'На главной странице', 960, 300, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `banner_type2section`
--

DROP TABLE IF EXISTS `banner_type2section`;
CREATE TABLE IF NOT EXISTS `banner_type2section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `banner_type_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_id` (`section_id`,`banner_type_id`),
  KEY `banner_type_id` (`banner_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_center_id` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_email` varchar(255) NOT NULL,
  `client_phone` varchar(255) NOT NULL,
  `comment` text,
  `comment_hotel` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `seats_num_total` int(3) NOT NULL,
  `acc_date_from` date DEFAULT NULL,
  `acc_date_to` date DEFAULT NULL,
  `acc_num_total` int(3) DEFAULT NULL,
  `price_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `approved` int(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `office_center_id` (`office_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `booking_room`
--

DROP TABLE IF EXISTS `booking_room`;
CREATE TABLE IF NOT EXISTS `booking_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_table_id` varchar(40) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `office_center_room_id` int(11) NOT NULL,
  `seats_num` int(3) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `booking_room_ibfk_1` (`office_center_room_id`),
  KEY `booking_room_ibfk_2` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `title`, `title_en`, `sort_num`) VALUES
(1, 'Москва', 'Moscow', 10),
(2, 'Роза Хутор', 'Rosa Khutor', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `color_scheme`
--

DROP TABLE IF EXISTS `color_scheme`;
CREATE TABLE IF NOT EXISTS `color_scheme` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `color_scheme`
--

INSERT INTO `color_scheme` (`id`, `name`) VALUES
('', 'По умолчанию'),
('coworking', 'Синий - Коворкинг'),
('meeting', 'Зеленый - Переговорная'),
('office', 'Красный - Аренда офисов'),
('virtual', 'Фиолетовый - Виртуальный офис');

-- --------------------------------------------------------

--
-- Структура таблицы `container`
--

DROP TABLE IF EXISTS `container`;
CREATE TABLE IF NOT EXISTS `container` (
  `id` varchar(16) NOT NULL DEFAULT '',
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `container`
--

INSERT INTO `container` (`id`, `meta_site_id`, `name`, `sort_num`) VALUES
('main', '', 'Главное меню', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `id` varchar(16) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `rate` float NOT NULL DEFAULT '0',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `title`, `title_en`, `rate`, `sort_num`) VALUES
('', 'руб.', 'rub', 1, 10),
('eur', '€', '€', 60.87, 30),
('usd', '$', '$', 53.37, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `doc`
--

DROP TABLE IF EXISTS `doc`;
CREATE TABLE IF NOT EXISTS `doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `doc_folder_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `annotation` text,
  `annotation_en` text,
  `doc_src` varchar(255) NOT NULL DEFAULT '',
  `img_src` varchar(255) DEFAULT NULL,
  `sort_num` int(5) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `doc_folder_id` (`doc_folder_id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `doc`
--

INSERT INTO `doc` (`id`, `meta_site_id`, `doc_folder_id`, `title`, `title_en`, `annotation`, `annotation_en`, `doc_src`, `img_src`, `sort_num`, `published`) VALUES
(1, '', 1, 'Рабочее место', '', NULL, NULL, '', '/images/svg/service-workplace.svg', 0, 1),
(2, '', 1, 'Исторический центр', '', NULL, NULL, '', '/images/svg/service-building.svg', 0, 1),
(3, '', 1, 'Инфраструктура', '', NULL, NULL, '', '/images/svg/service-infrastructure.svg', 0, 1),
(4, '', 1, 'Расположение', '', NULL, NULL, '', '/images/svg/service-infrastructure.svg', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `doc_folder`
--

DROP TABLE IF EXISTS `doc_folder`;
CREATE TABLE IF NOT EXISTS `doc_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `published` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `doc_folder`
--

INSERT INTO `doc_folder` (`id`, `meta_site_id`, `name`, `published`) VALUES
(1, '', 'Иконки', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `doc_folder2section`
--

DROP TABLE IF EXISTS `doc_folder2section`;
CREATE TABLE IF NOT EXISTS `doc_folder2section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `doc_folder_id` int(11) NOT NULL DEFAULT '0',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_id` (`section_id`,`doc_folder_id`),
  KEY `doc_folder2section_doc_folder_id_idx` (`doc_folder_id`),
  KEY `doc_folder2section_section_id_idx` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `meta_site`
--

DROP TABLE IF EXISTS `meta_site`;
CREATE TABLE IF NOT EXISTS `meta_site` (
  `id` varchar(16) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `path_files` varchar(255) DEFAULT NULL,
  `own_domain` int(1) NOT NULL DEFAULT '0',
  `domain` varchar(255) DEFAULT NULL,
  `lang_title` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `meta_site`
--

INSERT INTO `meta_site` (`id`, `title`, `path`, `path_files`, `own_domain`, `domain`, `lang_title`, `locale`) VALUES
('', 'Деловой', '', NULL, 1, NULL, 'Рус', 'ru_RU');

-- --------------------------------------------------------

--
-- Структура таблицы `meta_site_lang`
--

DROP TABLE IF EXISTS `meta_site_lang`;
CREATE TABLE IF NOT EXISTS `meta_site_lang` (
  `id` varchar(2) NOT NULL DEFAULT '',
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `locale` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `meta_table`
--

DROP TABLE IF EXISTS `meta_table`;
CREATE TABLE IF NOT EXISTS `meta_table` (
  `id` varchar(40) NOT NULL,
  `table_name` varchar(40) DEFAULT NULL,
  `depends_on_site` int(1) NOT NULL DEFAULT '0',
  `filter_data_by_meta_table` int(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sortable` int(1) NOT NULL DEFAULT '0',
  `editable` int(1) NOT NULL DEFAULT '0',
  `deletable` int(1) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '0',
  `multi_lang` int(1) NOT NULL DEFAULT '0',
  `is_in_site_tree` int(1) NOT NULL DEFAULT '0',
  `is_in_extras` int(1) NOT NULL DEFAULT '0',
  `is_many2many` int(1) NOT NULL DEFAULT '0',
  `sql_filter` varchar(255) DEFAULT NULL,
  `title_list` varchar(255) DEFAULT NULL,
  `title_addnew` varchar(255) DEFAULT NULL,
  `title_in_delete_confirm` varchar(255) DEFAULT NULL,
  `is_system` int(1) NOT NULL DEFAULT '0',
  `frontend_passthrough` int(1) NOT NULL DEFAULT '0',
  `frontend_onpage_num` int(3) DEFAULT NULL,
  `frontend_act_param_name` varchar(40) DEFAULT NULL,
  `frontend_id_param_name` varchar(40) DEFAULT NULL,
  `frontend_on_all_pages` int(1) NOT NULL DEFAULT '0',
  `frontend_sql_filter` varchar(4000) DEFAULT NULL,
  `frontend_sql_order` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `frontend_id_param_name` (`frontend_id_param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `meta_table`
--

INSERT INTO `meta_table` (`id`, `table_name`, `depends_on_site`, `filter_data_by_meta_table`, `title`, `sortable`, `editable`, `deletable`, `searchable`, `multi_lang`, `is_in_site_tree`, `is_in_extras`, `is_many2many`, `sql_filter`, `title_list`, `title_addnew`, `title_in_delete_confirm`, `is_system`, `frontend_passthrough`, `frontend_onpage_num`, `frontend_act_param_name`, `frontend_id_param_name`, `frontend_on_all_pages`, `frontend_sql_filter`, `frontend_sql_order`) VALUES
('article', 'article', 1, 0, 'Статья', 1, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, 'статью', 1, 1, NULL, NULL, NULL, 1, 'article.published', NULL),
('article_type', 'article_type', 0, 0, 'Тип статьи', 1, 1, 1, 0, 0, 0, 0, 0, NULL, 'Типы статей', 'Новый тип статьи', NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('banner', 'banner', 0, 0, 'Баннер', 1, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 0, 'banner.published', NULL),
('banner_type', 'banner_type', 0, 0, 'Тип баннера', 1, 1, 1, 0, 0, 0, 0, 0, NULL, 'Типы баннеров', 'Новый тип баннера', NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('booking', 'booking', 0, 0, 'Бронирование', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Бронирование', 'Новое бронирование', NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('booking_office', 'booking_room', 0, 0, 'Бронирование, офисы', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Офис', 'Добавить офис', 'бронирование офиса', 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('booking_room', 'booking_room', 0, 0, 'Бронирование, номера', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Номер', 'Добавить номер', 'бронирование номера', 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('city', 'city', 0, 0, 'Город', 1, 1, 1, 0, 0, 0, 1, 0, NULL, 'Города', 'Добавить город', NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('color_scheme', 'color_scheme', 0, 0, 'Цветовая схема', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('container', 'container', 0, 0, 'Меню', 1, 1, 1, 0, 0, 1, 0, 0, NULL, 'Меню', 'Новое меню', NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('currency', 'currency', 0, 0, 'Валюта', 0, 1, 1, 0, 0, 0, 1, 0, NULL, 'Валюты', 'Новая валюта', 'валюту', 1, 1, NULL, NULL, NULL, 0, NULL, NULL),
('doc', 'doc', 1, 0, 'Документ', 1, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 0, 'doc.published', NULL),
('doc_folder', 'doc_folder', 1, 0, 'Группа документов', 0, 1, 1, 0, 0, 1, 0, 0, NULL, 'Группы документов', 'Новая группа документов', 'группу документов', 1, 1, NULL, NULL, NULL, 0, 'doc_folder.published', NULL),
('doc_folder2section', 'doc_folder2section', 0, 0, 'Связь группы документов с разделом', 1, 1, 1, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('lang', 'meta_site_lang', 0, 0, 'Язык', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Языки сайта', 'Добавить язык', 'язык сайта', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('menu', 'section2container', 1, 0, 'Пункт меню', 1, 1, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('meta_copy', 'meta_table', 0, 0, 'Копирование мета таблицы', 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('meta_field', 'meta_table_field', 0, 0, 'Поле', 1, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('meta_table', 'meta_table', 0, 0, 'Таблица', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Таблицы', 'Новая таблица', 'таблицу', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('meta_table2section_type', 'meta_table2section_type', 0, 0, 'Связь таблицы с типом раздела', 0, 1, 1, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('meta_table2table', 'meta_table2table', 0, 0, 'Связь между таблицами', 1, 1, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('meta_table_field_group', 'meta_table_field_group', 0, 0, 'Группа полей', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Группы полейединица измерения', 'Новая группа полей', 'группу полей', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('meta_table_field_option', 'meta_table_field_option', 0, 0, 'Опция выбора', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Опции выбора', 'Новая опция', 'опцию', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('metro', 'metro', 0, 0, 'Метро', 1, 1, 1, 0, 0, 0, 0, 0, NULL, 'Метро', 'Новая станция метро', 'станцию метро', 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('metro_line', 'metro_line', 0, 0, 'Линия метро', 1, 1, 1, 0, 0, 0, 0, 0, NULL, 'Линии метро', 'Новая линия', 'линию', 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('news', 'news', 1, 1, 'Новость', 1, 1, 1, 0, 1, 0, 0, 0, NULL, 'Новости', 'Добавить новость', 'новость', 1, 1, 10, NULL, NULL, 0, 'news.published AND [news_tag_id = {news_tag}]', NULL),
('news_folder', 'news_folder', 1, 0, 'Группа новостей', 0, 1, 1, 0, 0, 1, 1, 0, NULL, 'Группы новостей', 'Новая группа новостей', 'группу новостей', 1, 1, 10, NULL, 'news', 0, 'news_folder.published', NULL),
('news_folder2section', 'news_folder2section', 0, 0, 'Связь группы новостей с разделом', 1, 1, 1, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('news_tag', 'news_tag', 0, 0, 'Тег новости', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Теги новостей', 'Новый тег', NULL, 1, 1, NULL, NULL, NULL, 0, NULL, NULL),
('news_tag2news', 'news_tag2news', 0, 0, 'Связь тега с новостью', 0, 1, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('office_center', 'office_center', 0, 0, 'Офисный центр', 1, 1, 1, 0, 0, 0, 1, 0, NULL, 'Офисные центры', 'Новый офисный центр', NULL, 0, 1, NULL, NULL, NULL, 0, 'office_center.published', NULL),
('office_center2service_group', 'service_group2office_center', 0, 0, 'Услуга в офисном центре', 1, 1, 1, 0, 0, 1, 1, 1, NULL, 'Услуги в офисных центрах', 'Добавить услугу', 'Услугу в офисном центре', 0, 1, NULL, 'center,service', NULL, 0, '[service_group2office_center.office_center_id = {center}] AND [service_group2office_center.service_group_id = {service}] AND service_group2office_center.published', 'm2.sort_num'),
('office_center_detail', 'office_center_detail', 0, 0, 'Офисный центр: Описание', 1, 1, 1, 0, 0, 0, 0, 0, NULL, 'Описания', 'Добавить описание', NULL, 0, 1, NULL, NULL, NULL, 0, 'office_center_detail.published AND office_center_detail.office_center_id = {center}', NULL),
('office_center_detail_type', 'office_center_detail_type', 0, 0, 'Тип описания офисного центра', 1, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('office_center_room', 'office_center_room', 0, 0, 'Объект заказа', 1, 1, 1, 0, 0, 0, 0, 0, NULL, 'Объекты заказа', 'Добавить объект заказа', NULL, 0, 1, NULL, NULL, NULL, 0, 'office_center_room.published <> 0 AND office_center_room.office_center_id = {center} AND office_center_room.service_group_id = {service}', NULL),
('office_center_room_type', 'office_center_room_type', 0, 0, 'Объект заказа: Тип', 1, 1, 1, 0, 1, 0, 0, 0, NULL, 'Типы объектов заказа', NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('password', 'user', 0, 0, 'Смена пароля', 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('password_generate', 'user', 0, 0, 'Генерация нового пароля', 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('section', 'section', 1, 0, 'Раздел', 1, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('section_type', 'section_type', 0, 0, 'Тип раздела', 0, 1, 1, 0, 0, 0, 0, 0, NULL, NULL, 'Новый тип раздела', NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('seo_parameter', 'seo_parameter', 0, 0, 'Параметр ЧПУ', 1, 1, 1, 0, 0, 0, 0, 0, NULL, 'Параметры ЧПУ', 'Новый параметр', NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('seo_parameter2section_type', 'seo_parameter2section_type', 0, 0, 'Связь параметра ЧПУ с типом раздела', 1, 1, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('seo_parameter_gen', 'seo_parameter', 0, 0, 'Формирование значений параметра ЧПУ', 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('seo_url_data', 'seo_url_data', 0, 0, 'Данные SEO', 0, 1, 1, 0, 0, 1, 1, 0, NULL, 'Данные SEO', 'Новый URL', 'Данные SEO', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('service', 'service', 0, 0, 'Дополнительный сервис', 1, 1, 1, 0, 0, 0, 1, 0, NULL, 'Сервисы', 'Новый сервис', 'сервис', 0, 1, NULL, NULL, NULL, 0, 'service.published', NULL),
('service2service_group', 'service2service_group', 0, 0, 'Связь дополнительного сервиса с услугой', 1, 1, 1, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 0, 1, NULL, 'service,center', NULL, 0, '[service_group_id = {service}]', NULL),
('service_group', 'service_group', 0, 0, 'Услуга', 1, 1, 1, 0, 0, 0, 1, 0, NULL, 'Услуги', 'Новая услуга', 'услугу', 0, 1, NULL, NULL, 'service', 0, 'service_group.published', NULL),
('service_group2office_center', 'service_group2office_center', 0, 0, 'Связь услуги с офисным центром', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL),
('setting', 'setting', 0, 0, 'Настройки', 0, 1, 0, 0, 0, 0, 1, 0, NULL, 'Настройки', NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('setting_admin', 'setting', 0, 0, 'Настройки сайта', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Настройки', 'Новая настройка', 'настройку', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('site', 'meta_site', 0, 0, 'Сайт', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Сайты', 'Добавить сайт', 'сайт', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('top_section', 'section', 1, 0, 'Сайт', 0, 1, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('unit', 'unit', 0, 0, 'Единица измерения', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Единицы измерения', 'Новая единица измерения', 'единицу измерения', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('user', 'user', 0, 0, 'Пользователь', 0, 1, 1, 0, 0, 0, 0, 0, NULL, 'Пользователи', 'Новый пользователь', 'пользователя', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('user2users_group', 'user2users_group', 0, 0, 'Связь пользователя с группой пользователей', 0, 1, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('users_group', 'users_group', 0, 0, 'Группа пользователей', 0, 1, 1, 0, 0, 1, 0, 0, NULL, 'Группы пользователей', 'Новая группа пользователей', 'группу пользователей', 1, 0, NULL, NULL, NULL, 0, NULL, NULL),
('users_group2users', 'user2users_group', 0, 0, 'Связь группы пользователей c пользователем', 0, 1, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `meta_table2section_type`
--

DROP TABLE IF EXISTS `meta_table2section_type`;
CREATE TABLE IF NOT EXISTS `meta_table2section_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_table_id` varchar(40) NOT NULL,
  `section_type_id` varchar(16) NOT NULL,
  `is_in_site_tree` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `meta_table_id` (`meta_table_id`,`section_type_id`),
  KEY `section_type_id` (`section_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Дамп данных таблицы `meta_table2section_type`
--

INSERT INTO `meta_table2section_type` (`id`, `meta_table_id`, `section_type_id`, `is_in_site_tree`) VALUES
(4, 'banner', 'index', 0),
(12, 'news_folder', 'index', 1),
(33, 'service_group', 'services', 1),
(34, 'service_group', 'office_centers', 0),
(36, 'office_center_detail', 'office_centers', 0),
(39, 'service2service_group', 'services', 0),
(40, 'service2service_group', 'office_centers', 0),
(41, 'service', 'index', 0),
(42, 'service', 'office_centers', 0),
(43, 'service', 'services', 1),
(44, 'office_center2service_group', 'office_centers', 1),
(45, 'office_center2service_group', 'services', 0),
(46, 'office_center', 'office_centers', 1),
(47, 'office_center', 'services', 0),
(48, 'office_center_room', 'office_centers', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `meta_table2table`
--

DROP TABLE IF EXISTS `meta_table2table`;
CREATE TABLE IF NOT EXISTS `meta_table2table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_table_id` varchar(40) NOT NULL,
  `detail_meta_table_id` varchar(40) NOT NULL DEFAULT '0',
  `many2many_meta_table_id` varchar(40) DEFAULT NULL,
  `sort_num` int(1) NOT NULL DEFAULT '0',
  `title_subquery` varchar(255) DEFAULT NULL,
  `title_addnew` varchar(255) DEFAULT NULL,
  `is_bookmark` int(1) NOT NULL,
  `locked` int(1) NOT NULL DEFAULT '0',
  `condition_field` varchar(255) DEFAULT NULL,
  `condition_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meta_table_id` (`meta_table_id`,`detail_meta_table_id`),
  KEY `meta_table_id_2` (`meta_table_id`),
  KEY `meta_table_id_link` (`detail_meta_table_id`),
  KEY `many2many_meta_table_id` (`many2many_meta_table_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Дамп данных таблицы `meta_table2table`
--

INSERT INTO `meta_table2table` (`id`, `meta_table_id`, `detail_meta_table_id`, `many2many_meta_table_id`, `sort_num`, `title_subquery`, `title_addnew`, `is_bookmark`, `locked`, `condition_field`, `condition_value`) VALUES
(1, 'section', 'section', NULL, 20, 'Подразделы', 'Новый подраздел', 0, 1, NULL, NULL),
(2, 'section', 'article', NULL, 30, 'Статьи', 'Новая статья', 0, 1, NULL, NULL),
(3, 'top_section', 'section', NULL, 1, 'Разделы', 'Новый раздел', 0, 1, NULL, NULL),
(4, 'container', 'menu', 'section', 1, 'Пункты меню', 'Добавить раздел в меню', 0, 1, NULL, NULL),
(5, 'meta_table', 'meta_field', NULL, 1, 'Поля', 'Новое поле', 0, 1, NULL, NULL),
(6, 'meta_table', 'meta_table2table', 'meta_table', 2, 'Связанные таблицы', 'Связанная таблица', 0, 1, NULL, NULL),
(7, 'news_folder', 'news', NULL, 10, 'Новости', 'Добавить новость', 0, 0, NULL, NULL),
(8, 'user', 'user2users_group', 'users_group', 10, 'Принадлежит к группам', 'Включить пользователя в группу', 0, 0, NULL, NULL),
(9, 'users_group', 'users_group2users', 'user', 10, 'Пользователи в группе', 'Включить в группу пользователя', 0, 0, NULL, NULL),
(10, 'section', 'news_folder2section', 'news_folder', 40, 'Группы новостей', 'Группа новостей', 0, 0, NULL, NULL),
(11, 'meta_field', 'meta_table_field_option', NULL, 10, 'Опции выбора', 'Новая опция выбора', 0, 0, 'type_extra', 'lookup_custom,lookup_multi'),
(12, 'doc_folder', 'doc', NULL, 10, 'Документы', 'Новый документ', 0, 0, NULL, NULL),
(13, 'section', 'doc_folder2section', 'doc_folder', 50, 'Группы документов', 'Группа документов', 0, 0, NULL, NULL),
(14, 'site', 'lang', NULL, 10, 'Дополнительные языки', 'Добавить язык', 0, 0, NULL, NULL),
(15, 'section_type', 'meta_table2section_type', 'meta_table', 10, 'Данные', 'Данные', 0, 0, NULL, NULL),
(16, 'section_type', 'seo_parameter2section_type', 'seo_parameter', 20, 'Параметры ЧПУ', 'Параметры ЧПУ', 0, 0, NULL, NULL),
(17, 'banner_type', 'banner', NULL, 10, 'Баннеры', 'Новый баннер', 0, 0, NULL, NULL),
(62, 'service_group', 'office_center2service_group', 'office_center', 10, 'Предоставляется в офисных центрах', 'Предоставляется в офисном центре', 1, 0, NULL, NULL),
(63, 'metro_line', 'metro', NULL, 10, 'Станции метро', 'Новая станция метро', 0, 0, NULL, NULL),
(64, 'city', 'metro_line', NULL, 40, 'Линии метро', 'Новая линия метро', 1, 0, NULL, NULL),
(65, 'city', 'metro', NULL, 50, 'Станции метро', 'Новая станция метро', 1, 0, NULL, NULL),
(67, 'office_center', 'office_center_detail', NULL, 10, 'Описания офисного центра', 'Добавить описание', 1, 0, NULL, NULL),
(76, 'service_group', 'service2service_group', 'service', 20, 'Дополнительные сервисы', 'Дополнительный сервис', 1, 0, NULL, NULL),
(77, 'office_center', 'office_center_room', NULL, 30, 'Объекты заказа (офисы, переговорные, тарифы)', 'Новый объект заказа (офис, переговорная, тариф)', 1, 0, NULL, NULL),
(78, 'office_center', 'office_center2service_group', NULL, 20, 'Услуги в офисном центре', 'Добавить услугу', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `meta_table_field`
--

DROP TABLE IF EXISTS `meta_table_field`;
CREATE TABLE IF NOT EXISTS `meta_table_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(32) NOT NULL DEFAULT '',
  `meta_table_id` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `meta_table_field_group_id` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(16) NOT NULL DEFAULT '',
  `type_extra` varchar(16) DEFAULT NULL,
  `nullable` int(1) NOT NULL DEFAULT '0',
  `lookup_external_meta_table_id` varchar(40) DEFAULT NULL,
  `lookup_meta_table_field_id` int(11) DEFAULT NULL,
  `lookup_multi` int(1) NOT NULL DEFAULT '0',
  `lookup_filter` varchar(255) DEFAULT NULL,
  `lookup_quick_add` int(1) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `comment_en` text,
  `default_value` varchar(255) DEFAULT NULL,
  `unit_id` varchar(16) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `readonly` int(1) NOT NULL DEFAULT '0',
  `is_title` int(1) NOT NULL DEFAULT '0',
  `is_in_subquery` int(1) NOT NULL DEFAULT '0',
  `in_subquery_wide` int(1) NOT NULL DEFAULT '0',
  `default_order_num` int(2) DEFAULT NULL,
  `in_subquery_colnum` int(2) DEFAULT NULL,
  `in_subquery_title` varchar(255) DEFAULT NULL,
  `locked` int(1) NOT NULL DEFAULT '0',
  `editable` int(1) NOT NULL DEFAULT '0',
  `multi_lang` int(1) NOT NULL DEFAULT '0',
  `sql_value` varchar(255) DEFAULT NULL,
  `group_title` varchar(255) DEFAULT NULL,
  `group_title_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field` (`field`,`meta_table_id`),
  KEY `meta_table_id_idx` (`meta_table_id`),
  KEY `meta_table_field_id_link_idx` (`lookup_meta_table_field_id`),
  KEY `unit_id` (`unit_id`),
  KEY `lookup_external_meta_table_id` (`lookup_external_meta_table_id`),
  KEY `meta_table_field_group_id` (`meta_table_field_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3943 ;

--
-- Дамп данных таблицы `meta_table_field`
--

INSERT INTO `meta_table_field` (`id`, `field`, `meta_table_id`, `title`, `title_en`, `meta_table_field_group_id`, `type`, `type_extra`, `nullable`, `lookup_external_meta_table_id`, `lookup_meta_table_field_id`, `lookup_multi`, `lookup_filter`, `lookup_quick_add`, `required`, `sort_num`, `comment`, `comment_en`, `default_value`, `unit_id`, `published`, `readonly`, `is_title`, `is_in_subquery`, `in_subquery_wide`, `default_order_num`, `in_subquery_colnum`, `in_subquery_title`, `locked`, `editable`, `multi_lang`, `sql_value`, `group_title`, `group_title_en`) VALUES
(1, 'article_type_id', 'article', 'Тип', '', '', 'varchar(16)', 'lookup', 0, NULL, 21, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 1, 4, NULL, 0, 1, 0, NULL, NULL, NULL),
(2, 'body', 'article', 'Текст', '', '', 'mediumtext', 'html', 0, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, NULL),
(3, 'dir', 'section', 'Директория', '', '', 'varchar(64)', NULL, 1, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 4, NULL, 0, 1, 0, NULL, NULL, NULL),
(5, 'meta_description', 'section', 'Мета description', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 140, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, NULL),
(6, 'name', 'news_folder', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 1, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(7, 'name', 'section_type', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(8, 'path', 'section', 'Путь', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(9, 'published', 'article', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 80, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 1, 0, NULL, NULL, NULL),
(10, 'published', 'news_folder', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 2, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 1, 0, NULL, NULL, NULL),
(11, 'published', 'section', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 120, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 1, 0, NULL, NULL, NULL),
(12, 'section_id', 'article', 'Раздел', '', '', 'int(11)', 'lookup', 0, NULL, 19, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(13, 'section_id', 'section', 'Родительский раздел', '', '', 'int(11)', 'lookup', 1, NULL, 19, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(14, 'section_type_id', 'section', 'Тип', '', '', 'varchar(16)', 'lookup', 0, NULL, 7, 0, 'published<>0', 0, 1, 60, NULL, NULL, 'article', NULL, 1, 0, 0, 1, 0, NULL, 5, NULL, 0, 1, 0, NULL, NULL, NULL),
(15, 'sort_num', 'article', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 70, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 2, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(16, 'sort_num', 'section', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 100, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(17, 'target_blank', 'section', 'В новом окне', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 80, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(18, 'title', 'article', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 3, NULL, 0, 1, 1, NULL, NULL, NULL),
(19, 'title', 'section', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 2, 2, NULL, 0, 1, 1, NULL, NULL, NULL),
(20, 'url', 'section', 'Ссылка', '', '', 'varchar(255)', 'url', 1, NULL, NULL, 0, NULL, 0, 0, 70, 'Для разделов типа ''Ссылка''', NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(21, 'name', 'article_type', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 10, NULL, 0, 1, 0, NULL, NULL, NULL),
(22, 'name', 'container', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 1, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(23, 'meta_title', 'top_section', 'Заголовок окна', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, NULL, NULL, 0, 1, 1, NULL, NULL, NULL),
(24, 'news_folder_id', 'news_folder2section', 'Группа публикаций', '', '', 'int(11)', 'lookup', 0, NULL, 6, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 1, 2, 'Наименование', 0, 1, 0, NULL, NULL, NULL),
(26, 'container_id', 'menu', 'Меню', '', '', 'int(11)', 'lookup', 0, NULL, 22, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(27, 'section_id', 'menu', 'Раздел', '', '', 'int(11)', 'lookup', 0, NULL, 19, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(28, 'sort_num', 'menu', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(29, 'title', 'menu', 'Наименование в меню', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, NULL, 0, 1, 1, NULL, NULL, NULL),
(30, 'name', 'setting', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, NULL, 1, NULL, 0, 1, 0, NULL, NULL, NULL),
(31, 'value', 'setting', 'Значение', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(32, 'type', 'setting', 'Тип', '', '', 'varchar(8)', 'hidden', 0, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(33, 'id', 'meta_table', 'Мета-таблица', '', '', 'varchar(32)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 3, NULL, 0, 1, 0, NULL, NULL, NULL),
(34, 'table_name', 'meta_table', 'Таблица в БД', '', '', 'varchar(32)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 4, NULL, 0, 1, 0, NULL, NULL, NULL),
(35, 'depends_on_site', 'meta_table', 'Свои данные для сайта', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(36, 'title', 'meta_table', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 1, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(37, 'sortable', 'meta_table', 'Сортируется', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 80, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(38, 'editable', 'meta_table', 'Редактируется', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 70, NULL, NULL, '1', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(39, 'deletable', 'meta_table', 'Добавляется/Удаляется', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(40, 'is_in_site_tree', 'meta_table', 'В дереве сайта', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 90, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(41, 'is_many2many', 'meta_table', 'Многие ко многим', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(42, 'title_list', 'meta_table', 'Заголовок в списке', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 110, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(43, 'title_addnew', 'meta_table', 'На кнопке добавления', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 120, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(44, 'title_in_delete_confirm', 'meta_table', 'В запросе на удаление', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 130, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(45, 'meta_table_id', 'meta_table2table', 'Мастер таблица', '', '', 'varchar(32)', 'lookup', 0, NULL, 36, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(46, 'detail_meta_table_id', 'meta_table2table', 'Таблица', '', '', 'varchar(32)', 'lookup', 0, NULL, 36, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(47, 'many2many_meta_table_id', 'meta_table2table', 'Таблица многие ко многим', '', '', 'varchar(32)', 'lookup', 1, NULL, 36, 0, NULL, 0, 0, 3, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(48, 'sort_num', 'meta_table2table', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 2, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(49, 'field', 'meta_field', 'Имя поля', '', '', 'varchar(32)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(50, 'meta_table_id', 'meta_field', 'Мета таблица', '', '', 'varchar(32)', 'hidden', 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(51, 'title', 'meta_field', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(52, 'sort_num', 'meta_field', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 200, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 2, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(53, 'type', 'meta_field', 'Тип поля', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, 'varchar(255)', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(54, 'type_extra', 'meta_field', 'Тип в системе', '', '', 'varchar(16)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 4, 'Тип', 0, 1, 0, NULL, NULL, NULL),
(55, 'nullable', 'meta_field', 'Может быть NULL', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 80, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(56, 'lookup_meta_table_field_id', 'meta_field', 'Поле для lookup', '', '', 'int(11)', 'lookup', 0, NULL, 51, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(57, 'required', 'meta_field', 'Обязательное поле', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 90, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(58, 'comment', 'meta_field', 'Комментарий к полю', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 130, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(59, 'default_value', 'meta_field', 'Значение по умолчанию', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 120, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(60, 'published', 'meta_field', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 210, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 1, 0, NULL, NULL, NULL),
(61, 'readonly', 'meta_field', 'Только для чтения', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 140, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(62, 'is_title', 'meta_field', 'Является заголовком', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 100, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(63, 'is_in_subquery', 'meta_field', 'Показывать в списке', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 150, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(64, 'in_subquery_wide', 'meta_field', 'В списке: широкий', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 160, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(65, 'in_subquery_colnum', 'meta_field', 'В списке: столбец номер', '', '', 'int(2)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 170, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(66, 'in_subquery_title', 'meta_field', 'В списке: наименование', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 180, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(67, 'default_order_num', 'meta_field', 'В списке: упорядочивать', '', '', 'int(2)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 190, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(68, 'news_folder_id', 'news', 'Группа публикаций', '', '', 'int(11)', 'lookup', 0, NULL, 6, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(69, 'title', 'news', 'Заголовок', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 4, NULL, 0, 1, 1, NULL, NULL, NULL),
(70, 'produced', 'news', 'Дата', '', '', 'datetime', 'date', 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL),
(71, 'annotation', 'news', 'Краткий текст', '', '', 'varchar(255)', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 70, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, NULL),
(72, 'body', 'news', 'Текст', '', '', 'mediumtext', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 80, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, NULL),
(73, 'published', 'news', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 100, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 1, 0, NULL, NULL, NULL),
(74, 'img_src', 'section', 'Картинка с названием', '', '', 'varchar(255)', 'image', 0, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(81, 'title_subquery', 'meta_table2table', 'Заголовок списка', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 1, 4, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(82, 'title_addnew', 'meta_table2table', 'На кнопке добавления', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 1, 5, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(98, 'title', 'users_group', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 1, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(99, 'name', 'users_group', 'Системное имя', '', '', 'varchar(32)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(101, 'login', 'user', 'Логин', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(103, 'middlename', 'user', 'Отчество', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(104, 'surname', 'user', 'Фамилия', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 3, NULL, 0, 1, 0, NULL, NULL, NULL),
(105, 'enabled', 'user', 'Разрешен доступ', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 90, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 0, 'Доступ', 0, 1, 0, NULL, NULL, NULL),
(106, 'email', 'user', 'E-mail', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 5, NULL, 0, 1, 0, NULL, NULL, NULL),
(107, 'name', 'user', 'Имя', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 4, NULL, 0, 1, 0, NULL, NULL, NULL),
(108, 'user_id', 'user2users_group', 'Пользователь', '', '', 'int(11)', 'lookup', 0, NULL, 101, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(109, 'users_group_id', 'user2users_group', 'Группа пользователей', '', '', 'int(11)', 'lookup', 0, NULL, 98, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(110, 'user_id', 'users_group2users', 'Пользователь', '', '', 'int(11)', 'lookup', 0, NULL, 101, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(111, 'users_group_id', 'users_group2users', 'Группа пользователей', '', '', 'int(11)', 'lookup', 0, NULL, 98, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(112, 'protected', 'section', 'Личный раздел', '', '', 'int(11)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 110, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(124, 'phone', 'user', 'Контактный телефон', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 6, 'Телефон', 0, 1, 0, NULL, NULL, NULL),
(134, 'login', 'password', 'Логин', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(135, 'surname', 'password', 'Фамилия', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 20, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(136, 'name', 'password', 'Имя', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(140, 'email', 'password_generate', 'E-mail', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(141, 'surname', 'password_generate', 'Фамилия', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 20, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(142, 'name', 'password_generate', 'Имя', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(150, 'title', 'meta_copy', 'Таблица', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(159, 'img_src', 'menu', 'Иконка', '', '', 'varchar(255)', 'image', 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(223, 'title', 'site', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, NULL, 1, NULL, 0, 1, 0, NULL, NULL, NULL),
(224, 'path', 'site', 'Путь', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(226, 'path_files', 'site', 'Путь к файлам сайта', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(227, 'id', 'site', 'Идентификатор', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 3, NULL, 0, 1, 0, NULL, NULL, NULL),
(262, 'is_bookmark', 'meta_table2table', 'Оформить закладкой', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(275, 'id', 'section_type', 'Идентификатор', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 1, 0, NULL, NULL, NULL),
(311, 'img_src', 'news', 'Картинка (218х205)', '', '', 'varchar(255)', 'image_preview', 1, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(313, 'id', 'container', 'Идентификатор', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 3, NULL, 0, 1, 0, NULL, NULL, NULL),
(356, 'name', 'setting_admin', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 1, NULL, 0, 1, 0, NULL, NULL, NULL),
(358, 'type', 'setting_admin', 'Тип', '', '', 'varchar(8)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(359, 'id', 'setting_admin', 'Иденитификатор', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 3, NULL, 0, 1, 0, NULL, NULL, NULL),
(435, 'title', 'unit', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 1, 0, NULL, NULL, NULL),
(436, 'sort_num', 'unit', 'Порядок следования', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, '10', NULL, 0, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(440, 'id', 'unit', 'Идентификатор', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 1, 0, NULL, NULL, NULL),
(466, 'title', 'meta_table_field_option', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 3, 4, NULL, 0, 1, 1, NULL, NULL, NULL),
(468, 'sort_num', 'meta_table_field_option', 'Порядок следования', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(470, 'published', 'meta_table_field_option', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 60, NULL, NULL, '1', NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 1, 0, NULL, NULL, NULL),
(667, 'sql_filter', 'meta_table', 'Фильтр записей (SQL)', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 140, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(676, 'multi_lang', 'meta_field', 'На разных языках', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 110, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(687, 'img_src', 'meta_table_field_option', 'Иконка', '', '', 'varchar(255)', 'image', 1, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(839, 'domain', 'site', 'Домены', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 50, 'Список доменов через пробел', NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(840, 'locale', 'site', 'Локаль', '', '', 'varchar(8)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 20, NULL, 0, 0, 0, NULL, NULL, NULL),
(881, 'lookup_multi', 'meta_field', 'Множественный выбор', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 70, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(883, 'is_group_title', 'meta_table_field_option', 'Название группы опций', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, '0', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(1382, 'lookup_filter', 'meta_field', 'Фильтр записей lookup (SQL)', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 65, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(1532, 'company', 'user', 'Организация', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 70, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 7, NULL, 0, 0, 0, NULL, NULL, NULL),
(1533, 'position', 'user', 'Должность', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 80, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(2385, 'created', 'user', 'Дата регистрации', '', '', 'datetime', 'datetime', 0, NULL, NULL, 0, NULL, 0, 1, 85, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 1, 1, 'Регистрация', 0, 0, 0, NULL, NULL, NULL),
(2386, 'unit_id', 'meta_field', 'Единица измерения', '', '', 'varchar(16)', 'lookup', 1, NULL, 435, 0, NULL, 0, 0, 135, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(2390, 'title', 'currency', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 1, 1, NULL, NULL, NULL),
(2391, 'sort_num', 'currency', 'Порядок следования', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(2392, 'id', 'currency', 'Идентификатор', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, '', 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 1, 0, NULL, NULL, NULL),
(2393, 'rate', 'currency', 'Курс', '', '', 'float', 'float', 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 3, NULL, 0, 0, 0, NULL, NULL, NULL),
(2421, 'admin_access', 'users_group', 'Доступ только к', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 30, 'Идентификаторы мета-таблиц, через запятую', NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(2468, 'doc_folder_id', 'doc', 'Группа документов', '', '', 'int(11)', 'lookup', 0, NULL, 2475, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(2469, 'title', 'doc', 'Заголовок', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 3, NULL, 0, 0, 1, NULL, NULL, NULL),
(2473, 'published', 'doc', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, 2, 'Публ.', 0, 0, 0, NULL, NULL, NULL),
(2474, 'doc_src', 'doc', 'Файл', '', '', 'varchar(255)', 'doc', 1, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(2475, 'name', 'doc_folder', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, '', 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 1, 2, NULL, 0, 0, 0, NULL, NULL, NULL),
(2476, 'published', 'doc_folder', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, '', 0, 1, 2, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 0, 0, NULL, NULL, NULL),
(2477, 'doc_folder_id', 'doc_folder2section', 'Группа документов', '', '', 'int(11)', 'lookup', 0, NULL, 2475, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 2, 2, 'Наименование', 0, 0, 0, NULL, NULL, NULL),
(2480, 'sort_num', 'doc', 'Порядок следования', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(2819, 'id', 'seo_parameter', 'Имя параметра в ЧПУ', '', '', 'varchar(40)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(2820, 'sort_num', 'seo_parameter', 'Порядок следования', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(2821, 'real_name', 'seo_parameter', 'Имя GET-параметра', '', '', 'varchar(40)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 20, NULL, 0, 0, 0, NULL, NULL, NULL),
(2822, 'meta_table_field_id', 'seo_parameter', 'Текстовое значение взять в поле', '', '', 'int(11)', 'lookup', 1, NULL, 51, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(2823, 'is_multi_value', 'seo_parameter', 'Может иметь несколько значений', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, 5, 'Множ.', 0, 0, 0, NULL, NULL, NULL),
(2824, 'id', 'seo_parameter_gen', 'Имя параметра в ЧПУ', '', '', 'varchar(40)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(2826, 'real_name', 'seo_parameter_gen', 'Имя GET-параметра', '', '', 'varchar(40)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 20, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 20, NULL, 0, 0, 0, NULL, NULL, NULL),
(2827, 'meta_table_field_id', 'seo_parameter_gen', 'Где искать ID для передачи в GET', '', '', 'int(11)', 'lookup', 0, NULL, 51, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(2829, 'published', 'seo_parameter', 'Включить', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 60, NULL, NULL, '1', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(2918, 'lookup_external_meta_table_id', 'meta_field', 'Таблица связи для lookup', '', '', 'varchar(40)', 'lookup', 0, NULL, 36, 0, 'is_many2many<>0', 0, 0, 61, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(2921, 'img_src_big', 'news', 'Картинка', '', '', 'varchar(255)', 'image_big', 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3085, 'sql_value', 'meta_field', 'Вычисляемое значение (SQL)', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 67, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3086, 'activated__real', 'seo_parameter', 'Активен', '', '', 'varchar(255)', 'calc_boolean', 0, NULL, NULL, 0, NULL, 0, 0, 70, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, 'Актив.', 0, 0, 0, 'seo_parameter.published AND (seo_parameter.activated OR seo_parameter.type_id <> '''' OR meta_table_field_id IS NULL)', NULL, NULL),
(3094, 'type_id', 'seo_parameter', 'Тип', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 25, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 30, NULL, 0, 0, 0, NULL, NULL, NULL),
(3095, 'activated', 'seo_parameter', 'Текстовые значения сформированы', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 0, 65, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3097, 'title', 'seo_parameter', 'Текст в заголовке окна (title)', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 35, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3135, 'url', 'seo_url_data', 'URL', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, NULL, 2, NULL, 0, 0, 0, NULL, NULL, NULL),
(3136, 'title', 'seo_url_data', 'TITLE', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3137, 'meta_keywords', 'seo_url_data', 'META Keywords', '', '', 'varchar(255)', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3138, 'meta_description', 'seo_url_data', 'META Description', '', '', 'varchar(255)', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3139, 'body', 'seo_url_data', 'SEO-текст', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3140, 'published', 'seo_url_data', 'Публиковать', '', '', 'varchar(255)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 70, NULL, NULL, '1', NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 0, 0, NULL, NULL, NULL),
(3141, 'meta_description', 'top_section', 'Meta description', '', '', 'varchar(255)', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 20, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3154, 'own_domain', 'site', 'Свой домен', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 0, 45, NULL, NULL, '0', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3167, 'title', 'lang', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, '', 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, NULL, 1, NULL, 0, 1, 0, NULL, NULL, NULL),
(3170, 'id', 'lang', 'Идентификатор', '', '', 'varchar(2)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 3, NULL, 0, 1, 0, NULL, NULL, NULL),
(3172, 'locale', 'lang', 'Локаль', '', '', 'varchar(8)', NULL, 1, NULL, NULL, 0, '', 0, 0, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 20, NULL, 0, 0, 0, NULL, NULL, NULL),
(3174, 'domain', 'lang', 'Домен', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3175, 'meta_title', 'section', 'Meta title', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 130, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3176, 'hidden', 'section', 'Не показывать в меню', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 115, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3177, 'meta_table_id', 'section_type', 'Данные из таблиц', '', '', 'varchar(40)', 'lookup_external', 1, 'meta_table2section_type', 36, 1, 'frontend_passthrough', 0, 0, 40, 'Передать в шаблон данные из указанных таблиц в массиве $_DATA', NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3179, 'id', 'article_type', 'Идентификатор', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 1, 20, NULL, 0, 0, 0, NULL, NULL, NULL),
(3180, 'published', 'section_type', 'Активен', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, '1', NULL, 1, 0, 0, 1, 0, NULL, 1, 'Акт.', 0, 0, 0, NULL, NULL, NULL),
(3185, 'published', 'news_folder2section', 'Публиковать', '', '', 'int(1)', 'calc_boolean', 0, NULL, NULL, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 0, 0, 'SELECT published FROM news_folder WHERE news_folder.id=news_folder_id', NULL, NULL),
(3186, 'published', 'doc_folder2section', 'Публиковать', '', '', 'int(1)', 'calc_boolean', 0, NULL, NULL, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 0, 0, 'SELECT published FROM doc_folder WHERE doc_folder.id=doc_folder_id', NULL, NULL),
(3187, 'frontend_passthrough', 'meta_table', 'Сайт: передавать данные', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 150, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Сайт', 0, 0, 0, NULL, NULL, NULL),
(3188, 'frontend_onpage_num', 'meta_table', 'Сайт: записей на странице', '', '', 'int(3)', 'number', 1, NULL, NULL, 0, NULL, 0, 0, 180, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3189, 'frontend_sql_filter', 'meta_table', 'Сайт: SQL фильтр', '', '', 'varchar(255)', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 210, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3190, 'title', 'office_center', 'Название', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 10, NULL, 0, 0, 1, NULL, NULL, NULL),
(3191, 'ext_img_src', 'office_center', 'Картинка большая', '', '', 'varchar(255)', 'image_big', 0, NULL, NULL, 0, NULL, 0, 1, 70, NULL, NULL, 'office_centers', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3192, 'int_img_src', 'office_center', 'Картинка в списке (585x280)', '', '', 'varchar(255)', 'image_preview', 0, NULL, NULL, 0, NULL, 0, 1, 80, NULL, NULL, 'office_centers', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3193, 'annotation', 'office_center', 'Краткий текст', '', '', 'text', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 50, 'В списке офисных центров', NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3194, 'address', 'office_center', 'Адрес', '', '', 'varchar(255)', 'textarea', 1, NULL, NULL, 0, NULL, 0, 1, 90, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3196, 'phone', 'office_center', 'Телефон', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 110, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3197, 'google_map', 'office_center', 'Координаты Google', '', '', 'varchar(255)', 'google_map', 1, NULL, NULL, 0, NULL, 0, 0, 130, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3198, 'sort_num', 'office_center', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 150, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(3199, 'published', 'office_center', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 160, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 0, 0, NULL, NULL, NULL),
(3202, 'title', 'service_group', 'Название', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, '', 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 10, NULL, 0, 0, 1, NULL, NULL, NULL),
(3203, 'icon_img_src', 'service_group', 'Иконка', '', '', 'varchar(255)', 'image', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3204, 'icon_big_img_src', 'service_group', 'Иконка большая', '', '', 'varchar(255)', 'image', 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3205, 'annotation', 'service_group', 'Краткий текст', '', '', 'text', 'textarea', 1, NULL, NULL, 0, NULL, 0, 1, 50, 'На странице услуги, рядом с большой иконкой', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3209, 'sort_num', 'service_group', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, '', 0, 1, 110, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(3210, 'published', 'service_group', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, '', 0, 1, 120, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 0, 0, NULL, NULL, NULL),
(3213, 'headline', 'service_group', 'Подзаголовок, на главной', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3214, 'css_signature', 'service_group', 'Цветовое оформление', '', '', 'varchar(16)', 'lookup', 0, NULL, 3362, 0, NULL, 0, 1, 100, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3215, 'title', 'service', 'Название', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, '', 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 10, NULL, 0, 0, 1, NULL, '', ''),
(3216, 'icon_img_src', 'service', 'Иконка', '', '', 'varchar(255)', 'image', 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, 'icons/svg', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, '', ''),
(3218, 'headline', 'service', 'Подзаголовок, в списке', '', '', 'text', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, '', ''),
(3219, 'sort_num', 'service', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, '', 0, 1, 70, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, '', ''),
(3220, 'published', 'service', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, '', 0, 1, 80, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 0, 0, NULL, '', ''),
(3223, 'service_group_id', 'service_group2office_center', 'Основная услуга', '', '', 'int(11)', 'lookup', 0, NULL, 3202, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 2, 2, 'Наименование', 0, 0, 0, NULL, NULL, NULL),
(3225, 'service_id', 'service2service_group', 'Дополнительный сервис', '', '', 'int(11)', 'lookup', 0, NULL, 3215, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 2, 2, 'Наименование', 0, 0, 0, NULL, '', ''),
(3226, 'service_group', 'office_center', 'Основные услуги', '', '', 'varchar(255)', 'lookup_external', 0, 'service_group2office_center', 3202, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3228, 'office_center', 'service_group', 'Офисные центры', '', '', 'varchar(255)', 'lookup_external', 0, 'office_center2service_group', 3190, 0, 'service_group2office_center.published', 0, 0, 90, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3229, 'name', 'banner_type', 'Название', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 1, 2, NULL, 0, 0, 0, NULL, NULL, NULL),
(3230, 'sort_num', 'banner_type', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, '10', NULL, 0, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(3233, 'banner_type_id', 'banner', 'Тип баннера', '', '', 'varchar(40)', 'hidden', 0, NULL, 3229, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3234, 'title', 'banner', 'Заголовок', '', '', 'varchar(30)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 3, NULL, 0, 0, 0, NULL, NULL, NULL),
(3235, 'published', 'banner', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, '', 0, 1, 120, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 0, 0, '', NULL, NULL),
(3236, 'img_src', 'banner', 'Картинка', '', '', 'varchar(255)', 'image_preview', 1, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, 'banners', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3237, 'sort_num', 'banner', 'Порядок следования', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 0, 110, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(3238, 'body', 'banner', 'Текст', '', '', 'text', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3239, 'url', 'banner', 'Cсылка', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 70, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3240, 'url_title', 'banner', 'Надпись на ссылке', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 1, 80, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3241, 'id', 'banner_type', 'Идентификатор', '', '', 'varchar(40)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3243, 'frontend_id_param_name', 'meta_table', 'Сайт: имя параметра с id', '', '', 'varchar(40)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 200, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3244, 'frontend_on_all_pages', 'meta_table', 'Сайт: на все страницы', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 160, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3245, 'meta_table_id', 'meta_table2section_type', 'Таблица', '', '', 'varchar(40)', 'lookup', 0, 'meta_table2section_type', 36, 0, 'meta_table.frontend_passthrough <> 0', 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 2, 2, 'Название', 0, 0, 0, NULL, NULL, NULL),
(3246, 'section_type_id', 'meta_table', 'Сайт: на страницы типов', '', '', 'varchar(16)', 'lookup_external', 1, 'meta_table2section_type', 7, 1, 'section_type.is_system = 0', 0, 0, 170, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3247, 'is_system', 'section_type', 'Системный', '', '', 'int(1)', 'hidden', 0, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3260, 'is_in_extras', 'meta_table', 'В настройках', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 100, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3272, 'sort_num', 'doc_folder2section', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 5, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(3273, 'sort_num', 'news_folder2section', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 5, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(3275, 'annotation', 'doc', 'Описание', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3276, 'img_src', 'doc', 'Иконка', '', '', 'varchar(255)', 'image', 1, NULL, NULL, 0, NULL, 0, 0, 35, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3277, 'body', 'service_group', 'Описание', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 60, 'На странице услуги, под иконкой и кратким текстом. В списке услуг', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3278, 'lang_title', 'site', 'Язык', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 55, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 19, 'Язык', 0, 0, 0, NULL, NULL, NULL),
(3279, 'body2', 'service_group', 'Описание, внизу', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 70, 'На странице услуги, в самом низу', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3281, 'office_center_id', 'service_group2office_center', 'Офисный центр', '', '', 'int(11)', 'lookup', 0, NULL, 3190, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3282, 'is_in_site_tree', 'meta_table2section_type', 'В дереве сайта', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, '1', NULL, 1, 0, 0, 1, 0, NULL, 1, 'В дереве', 0, 0, 0, NULL, NULL, NULL),
(3283, 'service_group_id', 'office_center2service_group', 'Основная услуга', '', '', 'int(11)', 'lookup', 0, NULL, 3202, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 3, NULL, 0, 0, 0, NULL, NULL, NULL),
(3284, 'price', 'office_center2service_group', 'Стоимость услуги', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 60, NULL, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `meta_table_field` (`id`, `field`, `meta_table_id`, `title`, `title_en`, `meta_table_field_group_id`, `type`, `type_extra`, `nullable`, `lookup_external_meta_table_id`, `lookup_meta_table_field_id`, `lookup_multi`, `lookup_filter`, `lookup_quick_add`, `required`, `sort_num`, `comment`, `comment_en`, `default_value`, `unit_id`, `published`, `readonly`, `is_title`, `is_in_subquery`, `in_subquery_wide`, `default_order_num`, `in_subquery_colnum`, `in_subquery_title`, `locked`, `editable`, `multi_lang`, `sql_value`, `group_title`, `group_title_en`) VALUES
(3285, 'office_center_id', 'office_center2service_group', 'Офисный центр', '', '', 'int(11)', 'lookup', 0, NULL, 3190, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 2, 2, NULL, 0, 0, 0, NULL, NULL, NULL),
(3288, 'sort_num', 'seo_parameter2section_type', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(3291, 'title', 'office_center2service_group', 'Заголовок страницы', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, 30, NULL, 0, 0, 1, NULL, NULL, NULL),
(3292, 'annotation', 'office_center2service_group', 'Краткий текст', '', '', 'text', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 90, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 40, NULL, 0, 0, 1, NULL, NULL, NULL),
(3315, 'body', 'office_center2service_group', 'Полное описание', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 100, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3322, 'price_term', 'service_group', 'Период цены', '', '', 'varchar(64)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 75, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3323, 'floor_space_min', 'office_center2service_group', 'Площади от', '', '', 'int(11)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 45, NULL, 0, 0, 0, NULL, NULL, NULL),
(3325, 'body', 'office_center', 'Описание', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 100, 'На странице офисного центра', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3358, 'published', 'office_center2service_group', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 110, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 0, 0, NULL, NULL, NULL),
(3362, 'name', 'color_scheme', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, '', 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 10, NULL, 0, 1, 0, '', NULL, NULL),
(3363, 'id', 'color_scheme', 'Идентификатор CSS', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 1, 20, NULL, 0, 0, 0, NULL, NULL, NULL),
(3364, 'color_scheme_id', 'banner', 'Цветовое оформление', '', '', 'varchar(16)', 'lookup', 0, NULL, 3362, 0, NULL, 0, 1, 90, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3365, 'img_src_big', 'banner', 'Картинка исходная', '', '', 'varchar(255)', 'image_big', 1, NULL, NULL, 0, NULL, 0, 0, 20, NULL, NULL, 'banners', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3372, 'w', 'banner_type', 'Ширина', '', '', 'int(4)', 'number', 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3373, 'h', 'banner_type', 'Высота', '', '', 'int(4)', 'number', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3374, 'title', 'banner_type', 'Заголовок', '', '', 'varchar(255)', 'calc', 0, NULL, NULL, 0, NULL, 0, 0, 25, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 1, NULL, 0, 0, 0, 'CONCAT(banner_type.name,'' ('',banner_type.w,''x'',banner_type.h,'')'')', NULL, NULL),
(3375, 'bg_color', 'banner', 'Цвет фона', '', '', 'varchar(16)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 100, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3378, 'flash_src', 'banner', 'Флэш', '', '', 'varchar(255)', 'flash', 1, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3379, 'price_max', 'office_center2service_group', 'Цена до', '', '', 'int(11)', 'number', 1, NULL, NULL, 0, NULL, 0, 0, 70, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 70, NULL, 0, 0, 0, NULL, NULL, NULL),
(3380, 'currency_id', 'office_center2service_group', 'Валюта', '', '', 'varchar(16)', 'lookup', 0, NULL, 2390, 0, NULL, 0, 0, 80, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 70, NULL, 0, 0, 0, NULL, NULL, NULL),
(3381, 'floor_space_max', 'office_center2service_group', 'Площади до', '', '', 'int(11)', 'number', 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 47, NULL, 0, 0, 0, NULL, NULL, NULL),
(3384, 'body', 'service', 'Описание', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3425, 'email_request', 'office_center', 'E-mail для заявок', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 120, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3429, 'redirect_url', 'seo_url_data', 'Redirect 301', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 20, NULL, 0, 0, 0, NULL, NULL, NULL),
(3430, 'title', 'news_tag', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 10, 2, NULL, 0, 1, 1, NULL, NULL, NULL),
(3431, 'news_tag_id', 'news_tag2news', 'Тег', '', '', 'int(11)', 'lookup', 0, NULL, 3430, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 10, 1, NULL, 0, 1, 0, NULL, NULL, NULL),
(3432, 'news_id', 'news_tag2news', 'Публикация', '', '', 'int(11)', 'lookup', 0, NULL, 69, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL),
(3433, 'news_tag_id', 'news', 'Тег', '', '', 'varchar(255)', 'lookup_external', 0, 'news_tag2news', 3430, 1, NULL, 0, 0, 90, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(3461, 'seo_parameter_id', 'seo_parameter2section_type', 'Параметр ЧПУ', '', '', 'varchar(40)', 'lookup', 0, NULL, 2819, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 2, 2, 'Имя параметра', 0, 0, 0, NULL, NULL, NULL),
(3474, 'frontend_act_param_name', 'meta_table', 'Сайт: имя параметра активации', '', '', 'varchar(40)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 190, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3506, 'img_src_detail', 'news', 'Картинка (545х375)', '', '', 'varchar(255)', 'image_preview', 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3508, 'title', 'city', 'Название', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 0, 1, NULL, NULL, NULL),
(3509, 'sort_num', 'city', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, NULL, NULL, NULL),
(3510, 'id', 'city', 'Идентификатор', '', '', 'varchar(40)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3511, 'city_id', 'office_center', 'Город', '', '', 'int(11)', 'lookup', 0, NULL, 3508, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3535, 'title', 'meta_table_field_group', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, '', 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 1, 0, '', NULL, NULL),
(3536, 'sort_num', 'meta_table_field_group', 'Порядок следования', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 1, 0, NULL, NULL, NULL),
(3537, 'id', 'meta_table_field_group', 'Идентификатор', '', '', 'varchar(16)', NULL, 0, NULL, NULL, 0, '', 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 1, 0, '', NULL, NULL),
(3539, 'meta_table_field_group_id', 'meta_field', 'Группа', '', '', 'varchar(20)', 'lookup', 0, NULL, 3535, 0, NULL, 0, 0, 69, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 1, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3566, 'searchable', 'meta_table', 'С поиском', '', '', 'varchar(255)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 0, 85, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3581, 'multi_lang', 'meta_table', 'На разных языках', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 75, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3583, 'meta_site_lang_id', 'news', 'Язык', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 0, 2, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(3585, 'multi_lang', 'setting_admin', 'На разных языках', '', '', 'int(0)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3586, 'multi_lang', 'setting', 'На разных языках', '', '', 'int(1)', 'hidden', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3629, 'title', 'metro_line', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 2, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3630, 'sort_num', 'metro_line', 'Порядок', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 100, NULL, NULL, '10', NULL, 0, 0, 0, 1, 0, 1, 1, NULL, 0, 0, 0, NULL, NULL, NULL),
(3631, 'published', 'metro_line', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, '', 0, 1, 110, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 0, 0, '', NULL, NULL),
(3632, 'city_id', 'metro_line', 'Город', '', '', 'int(5)', 'lookup', 0, NULL, 3508, 0, '', 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, '', NULL, NULL),
(3633, 'color', 'metro_line', 'Цвет', '', '', 'varchar(40)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3634, 'title', 'metro', 'Наименование', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 2, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3635, 'sort_num', 'metro', 'Порядок', '', '', 'int(5)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, '10', NULL, 0, 0, 0, 1, 0, 1, 1, NULL, 0, 0, 0, NULL, NULL, NULL),
(3636, 'published', 'metro', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, '', 0, 1, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Публ.', 0, 0, 0, '', NULL, NULL),
(3637, 'city_id', 'metro', 'Город', '', '', 'int(5)', 'lookup', 0, NULL, 3508, 0, '', 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, '', NULL, NULL),
(3638, 'metro_line_id', 'metro', 'Линия метро', '', '', 'int(5)', 'lookup', 0, NULL, 3629, 1, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 20, NULL, 0, 0, 0, NULL, NULL, NULL),
(3786, 'filter_data_by_meta_table', 'meta_table', 'Свои данные для мета-таблицы', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 45, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3862, 'lookup_quick_add', 'meta_field', 'Быстрое добавление', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 0, 68, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3869, 'video_src', 'banner', 'Видео', '', '', 'varchar(255)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 45, 'Ссылка на видео на YouTube, Vimeo и т.д.', NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3870, 'metro_id', 'office_center', 'Метро', '', '', 'int(5)', 'lookup', 1, NULL, 3634, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3871, 'metro_color', 'office_center', 'Цвет ветки метро', '', '', 'varchar(255)', 'calc_view', 0, NULL, NULL, 0, NULL, 0, 0, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, 'SELECT color FROM metro_line WHERE id = m2.metro_line_id', NULL, NULL),
(3872, 'color', 'office_center', 'Цвет', '', '', 'varchar(40)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 140, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3873, 'client_name', 'booking', 'Клиент', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 20, NULL, 0, 0, 0, NULL, '', ''),
(3874, 'created', 'booking', 'Дата создания', '', '', 'datetime', 'datetime', 0, NULL, NULL, 0, NULL, 0, 1, 110, NULL, NULL, '10', NULL, 1, 1, 1, 1, 0, 1, 2, 'Создано', 0, 0, 0, NULL, '', ''),
(3875, 'approved', 'booking', 'Подтверждено', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 120, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, 'Подтв.', 0, 0, 0, NULL, '', ''),
(3876, 'comment', 'booking', 'Комментарий', '', '', 'text', 'textarea', 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 26, NULL, 0, 0, 0, NULL, '', ''),
(3877, 'office_center_id', 'booking', 'Офисный центр', '', '', 'int(11)', 'lookup', 0, NULL, 3190, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 10, NULL, 0, 0, 0, NULL, '', ''),
(3878, 'client_email', 'booking', 'Email', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 10, 22, NULL, 0, 0, 0, NULL, '', ''),
(3879, 'client_phone', 'booking', 'Телефон', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 24, NULL, 0, 0, 0, NULL, '', ''),
(3880, 'price_total', 'booking', 'Стоимость', '', '', 'int(12)', 'number', 0, NULL, NULL, 0, NULL, 0, 0, 100, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, NULL, 90, NULL, 0, 0, 0, NULL, '', ''),
(3881, 'date_from', 'booking', 'Дата с', '', '', 'date', 'date', 0, NULL, NULL, 0, NULL, 0, 1, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 30, NULL, 0, 0, 0, NULL, NULL, NULL),
(3882, 'date_to', 'booking', 'Дата по', '', '', 'date', 'date', 0, NULL, NULL, 0, NULL, 0, 1, 70, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 40, NULL, 0, 0, 0, NULL, NULL, NULL),
(3883, 'days_count', 'booking', 'Дней', '', '', 'int(3)', 'calc', 0, NULL, NULL, 0, NULL, 0, 0, 80, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 50, NULL, 0, 0, 0, 'DATEDIFF(date_to, date_from) + 1', NULL, NULL),
(3884, 'seats_num_total', 'booking', 'Мест в офисе', '', '', 'int(3)', 'number', 0, NULL, NULL, 0, NULL, 0, 1, 90, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 60, 'Мест', 0, 0, 0, NULL, NULL, NULL),
(3885, 'comment_hotel', 'booking', 'Мест размещения', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 95, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, 80, 'Размещ. мест', 0, 0, 0, NULL, NULL, NULL),
(3886, 'acc_date_to', 'booking', 'Размещение по', '', '', 'date', 'date', 1, NULL, NULL, 0, NULL, 0, 0, 93, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 70, 'Размещ. по', 0, 0, 0, NULL, NULL, NULL),
(3887, 'acc_date_from', 'booking', 'Размещение с', '', '', 'date', 'date', 1, NULL, NULL, 0, NULL, 0, 0, 92, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 60, 'Размещ. с', 0, 0, 0, NULL, NULL, NULL),
(3888, 'nights_count', 'booking', 'Ночей', '', '', 'int(3)', 'calc', 0, NULL, NULL, 0, NULL, 0, 0, 94, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 90, NULL, 0, 0, 0, 'DATEDIFF(acc_date_to, acc_date_from)', NULL, NULL),
(3894, 'office_center_room_id', 'booking_office', 'Офис', '', '', 'int(11)', 'lookup', 0, NULL, NULL, 0, 'office_center_room.office_center_room_type_id = ''''', 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 10, NULL, 0, 0, 0, NULL, '', ''),
(3895, 'sort_num', 'booking_office', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, '', 0, 1, 40, NULL, NULL, '10', NULL, 0, 0, 0, 1, 0, 2, 1, 'Порядок', 0, 0, 0, '', '', ''),
(3896, 'published', 'booking_office', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, '', 0, 1, 50, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 0, 0, '', '', ''),
(3897, 'seats_num', 'booking_office', 'Кол-во мест', '', '', 'int(3)', 'number', 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 30, NULL, 0, 0, 0, NULL, '', ''),
(3898, 'booking_id', 'booking_office', 'Бронирование', '', '', 'int(11)', 'lookup', 0, NULL, 3873, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, '', ''),
(3899, 'office_center_room_id', 'booking_room', 'Номер', '', '', 'int(11)', 'lookup', 0, NULL, NULL, 0, 'office_center_room.office_center_room_type_id <> ''''', 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 10, NULL, 0, 0, 0, NULL, '', ''),
(3900, 'sort_num', 'booking_room', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, '10', NULL, 0, 0, 0, 1, 0, 2, 1, 'Порядок', 0, 0, 0, NULL, '', ''),
(3901, 'published', 'booking_room', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 0, 0, NULL, '', ''),
(3902, 'seats_num', 'booking_room', 'Кол-во номеров', '', '', 'int(3)', 'number', 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 30, NULL, 0, 0, 0, NULL, '', ''),
(3903, 'booking_id', 'booking_room', 'Бронирование', '', '', 'int(11)', 'lookup', 0, NULL, 3873, 0, NULL, 0, 0, 10, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, '', ''),
(3904, 'name', 'office_center_detail_type', 'Название', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, '', 0, 1, 2, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 0, 0, '', '', ''),
(3905, 'sort_num', 'office_center_detail_type', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, '', 0, 1, 20, NULL, NULL, '10', NULL, 0, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, '', '', ''),
(3906, 'id', 'office_center_detail_type', 'Идентификатор', '', '', 'varchar(40)', NULL, 0, NULL, NULL, 0, '', 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 0, 0, '', '', ''),
(3915, 'title', 'office_center_detail', 'Название закладки', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 0, NULL, 10, NULL, 0, 0, 1, NULL, '', ''),
(3916, 'sort_num', 'office_center_detail', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, '', 0, 1, 60, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 2, 1, 'Порядок', 0, 0, 0, '', '', ''),
(3917, 'published', 'office_center_detail', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, '', 0, 1, 70, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 0, 0, '', '', ''),
(3918, 'body', 'office_center_detail', 'Текст', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 1, 50, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 20, NULL, 0, 0, 1, NULL, '', ''),
(3919, 'office_center_id', 'office_center_detail', 'Офисный центр', '', '', 'int(11)', 'lookup', 0, NULL, 3190, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 20, NULL, 0, 0, 0, NULL, '', ''),
(3920, 'office_center_detail_type_id', 'office_center_detail', 'Тип', '', '', 'varchar(16)', 'lookup', 0, NULL, 3904, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 0, 0, NULL, NULL, NULL),
(3921, 'img_src', 'office_center_detail', 'Иконка', '', '', 'varchar(255)', 'image', 1, NULL, 2469, 0, NULL, 0, 0, 40, NULL, NULL, 'icons/svg', NULL, 1, 0, 0, 1, 0, NULL, 40, NULL, 0, 0, 0, NULL, NULL, NULL),
(3922, 'annotation', 'office_center_detail', 'Краткий текст', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 45, 'Справа от картинки', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3923, 'title', 'office_center_room_type', 'Название', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 2, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, NULL, 2, NULL, 0, 0, 0, NULL, '', ''),
(3924, 'sort_num', 'office_center_room_type', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, '', 0, 1, 20, NULL, NULL, '10', NULL, 0, 0, 0, 1, 0, 1, 1, 'Порядок', 0, 0, 0, '', '', ''),
(3925, 'id', 'office_center_room_type', 'Идентификатор', '', '', 'varchar(40)', NULL, 0, NULL, NULL, 0, '', 0, 1, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 10, NULL, 0, 0, 0, '', '', ''),
(3926, 'title', 'office_center_room', 'Название', '', '', 'varchar(255)', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 30, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 20, 10, NULL, 0, 0, 1, NULL, '', ''),
(3927, 'sort_num', 'office_center_room', 'Порядок следования', '', '', 'int(11)', 'sort', 0, NULL, NULL, 0, NULL, 0, 1, 80, NULL, NULL, '10', NULL, 1, 0, 0, 1, 0, 2, 1, 'Порядок', 0, 0, 0, NULL, '', ''),
(3928, 'published', 'office_center_room', 'Публиковать', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 1, 90, NULL, NULL, '1', NULL, 1, 0, 0, 1, 0, NULL, 2, 'Публ.', 0, 0, 0, NULL, '', ''),
(3929, 'floor_area_m2', 'office_center_room', 'Площадь (кв. м)', '', '', 'decimal(5,2)', 'float', 1, NULL, NULL, 0, NULL, 0, 0, 50, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 40, NULL, 0, 0, 0, NULL, '', ''),
(3930, 'office_center_id', 'office_center_room', 'Офисный центр', '', '', 'int(11)', 'lookup', 0, NULL, 3190, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 20, NULL, 0, 0, 0, NULL, '', ''),
(3931, 'service_group_id', 'office_center_room', 'Услуга', '', '', 'int(11)', 'lookup', 0, NULL, 3202, 0, NULL, 0, 1, 20, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 10, 5, NULL, 0, 0, 0, NULL, '', ''),
(3932, 'seats_num', 'office_center_room', 'Количество мест', '', '', 'int(3)', 'number', 1, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 50, 'Мест', 0, 0, 0, NULL, '', ''),
(3933, 'annotation', 'office_center_room', 'Описание', '', '', 'text', 'html', 1, NULL, NULL, 0, NULL, 0, 0, 70, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, '', ''),
(3934, 'is_inclusive', 'service2service_group', 'Входит в стоимость услуги', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 0, 30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 1, NULL, 0, 0, 0, NULL, NULL, NULL),
(3935, 'is_main', 'service', 'Показывать на главной', '', '', 'int(1)', 'boolean', 0, NULL, NULL, 0, NULL, 0, 0, 60, NULL, NULL, '0', NULL, 0, 0, 0, 1, 0, NULL, 3, 'Глав.', 0, 0, 0, NULL, NULL, NULL),
(3936, 'service_group_id', 'service2service_group', 'Услуга', '', '', 'int(11)', 'lookup', 0, NULL, 3202, 0, NULL, 0, 1, 10, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3937, 'frontend_sql_order', 'meta_table', 'Сайт: SQL order by', '', '', 'varchar(255)', '', 1, NULL, NULL, 0, NULL, 0, 0, 220, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3938, 'price', 'office_center_room', 'Цена (руб)', '', '', 'varchar(255)', 'number', 0, NULL, NULL, 0, NULL, 0, 1, 40, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, NULL, 30, NULL, 0, 0, 0, NULL, NULL, NULL),
(3939, 'price_for', 'office_center_room', 'Цена за', '', '', 'varchar(100)', 'lookup_custom', 1, NULL, NULL, 0, NULL, 0, 0, 41, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3940, 'price_bonus', 'office_center_room', 'Плюс в цене (бонус)', '', '', 'varchar(100)', NULL, 1, NULL, NULL, 0, NULL, 0, 0, 42, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(3941, 'img_src_big', 'office_center_room', 'Картинка', '', '', 'varchar(255)', 'image_big', 1, NULL, NULL, 0, NULL, 0, 0, 65, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL),
(3942, 'img_src', 'office_center_room', 'Картинка в списке (175x100)', '', '', 'varchar(255)', 'image_preview', 1, NULL, NULL, 0, NULL, 0, 0, 66, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `meta_table_field_group`
--

DROP TABLE IF EXISTS `meta_table_field_group`;
CREATE TABLE IF NOT EXISTS `meta_table_field_group` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `meta_table_field_group`
--

INSERT INTO `meta_table_field_group` (`id`, `title`, `sort_num`) VALUES
('', 'Основное', 10),
('seo', 'SEO', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `meta_table_field_option`
--

DROP TABLE IF EXISTS `meta_table_field_option`;
CREATE TABLE IF NOT EXISTS `meta_table_field_option` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `meta_table_field_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `img_src` varchar(255) DEFAULT NULL,
  `is_group_title` int(1) DEFAULT '0',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `title_seo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_sef` (`title_seo`),
  KEY `meta_table_field_id_idx` (`meta_table_field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `meta_table_field_option`
--

INSERT INTO `meta_table_field_option` (`id`, `meta_table_field_id`, `title`, `title_en`, `img_src`, `is_group_title`, `sort_num`, `published`, `title_seo`) VALUES
(1, 3675, 'На улицу', '', NULL, 0, 10, 1, NULL),
(2, 3675, 'Во двор', '', NULL, 0, 20, 1, NULL),
(3, 3715, 'Улица', '', NULL, 0, 10, 1, NULL),
(4, 3715, 'Двор', '', NULL, 0, 20, 1, NULL),
(5, 3834, 'На улицу', '', NULL, 0, 10, 1, NULL),
(6, 3834, 'Во двор', '', NULL, 0, 20, 1, NULL),
(7, 3939, 'р. место в месяц', '', NULL, 0, 10, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `metro`
--

DROP TABLE IF EXISTS `metro`;
CREATE TABLE IF NOT EXISTS `metro` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `city_id` int(5) NOT NULL,
  `metro_line_id` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `cian_id` int(11) DEFAULT NULL,
  `title_seo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `cian_id` (`cian_id`),
  UNIQUE KEY `title_seo` (`title_seo`),
  KEY `city_id` (`city_id`),
  KEY `metro_line_id` (`metro_line_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=610 ;

--
-- Дамп данных таблицы `metro`
--

INSERT INTO `metro` (`id`, `city_id`, `metro_line_id`, `title`, `title_en`, `sort_num`, `published`, `cian_id`, `title_seo`) VALUES
(1, 1, '1', 'Бульвар Рокоссовского', 'Bulvar Rokossovskogo', 10, 1, 40, 'bulvar-rokossovskogo'),
(2, 1, '1', 'Черкизовская', 'Cherkizovskaya', 20, 1, 39, 'cherkizovskaya'),
(3, 1, '1', 'Преображенская площадь', 'Preobrazhenskaya Ploshchad', 30, 1, 38, 'preobrazhenskaya-ploschad'),
(4, 1, '1', 'Сокольники', 'Sokolniki', 40, 1, 37, 'sokolniki'),
(5, 1, '1', 'Красносельская', 'Krasnoselskaya', 50, 1, 36, 'krasnoselskaya'),
(6, 1, '1,5', 'Комсомольская', 'Komsomolskaya', 60, 1, 35, 'komsomolskaya'),
(7, 1, '1', 'Красные ворота', 'Krasnye Vorota', 70, 1, 34, 'krasnye-vorota'),
(8, 1, '1', 'Чистые пруды', 'Chistye Prudy', 80, 1, 33, 'chistye-prudy'),
(9, 1, '1', 'Лубянка', 'Lubyanka', 90, 1, 32, 'lubyanka'),
(10, 1, '1', 'Охотный ряд', 'Okhotny Ryad', 100, 1, 31, 'ohotnyy-ryad'),
(11, 1, '1', 'Библиотека имени Ленина', 'Biblioteka Imeni Lenina', 110, 1, 30, 'biblioteka-imeni-lenina'),
(12, 1, '1', 'Кропоткинская', 'Kropotkinskaya', 120, 1, 29, 'kropotkinskaya'),
(13, 1, '1,5', 'Парк культуры', 'Park Kultury', 130, 1, 28, 'park-kultury'),
(14, 1, '1', 'Фрунзенская', 'Frunzenskaya', 140, 1, 27, 'frunzenskaya'),
(15, 1, '1', 'Спортивная', 'Sportivnaya', 150, 1, 26, 'sportivnaya'),
(16, 1, '1', 'Воробьёвы горы', 'Vorobyovy Gory', 160, 1, 157, 'vorobevy-gory'),
(17, 1, '1', 'Университет', 'Universitet', 170, 1, 25, 'universitet'),
(18, 1, '1', 'Проспект Вернадского', 'Prospekt Vernadskogo', 180, 1, 24, 'prospekt-vernadskogo'),
(19, 1, '1', 'Юго-Западная', 'Yugo-Zapadnaya', 190, 1, 23, 'yugo-zapadnaya'),
(20, 1, '1', 'Тропарёво', 'Troparyovo', 200, 1, 225, 'troparevo'),
(21, 1, '7', 'Планерная', 'Planernaya', 10, 1, 63, 'planernaya'),
(434, 1, '2', 'Речной вокзал', 'Rechnoy Vokzal', 10, 1, 1, 'rechnoy-vokzal'),
(435, 1, '2', 'Водный стадион', 'Vodny Stadion', 20, 1, 2, 'vodnyy-stadion'),
(436, 1, '2', 'Войковская', 'Voykovskaya', 30, 1, 3, 'voykovskaya'),
(437, 1, '2', 'Сокол', 'Sokol', 40, 1, 4, 'sokol'),
(438, 1, '2', 'Аэропорт', 'Aeroport', 50, 1, 5, 'aeroport'),
(439, 1, '2', 'Динамо', 'Dinamo', 60, 1, 6, 'dinamo'),
(440, 1, '2,5', 'Белорусская', 'Belorusskaya', 70, 1, 7, 'belorusskaya'),
(441, 1, '2', 'Маяковская', 'Mayakovskaya', 80, 1, 8, 'mayakovskaya'),
(442, 1, '2', 'Тверская', 'Tverskaya', 90, 1, 9, 'tverskaya'),
(443, 1, '2', 'Театральная', 'Teatralnaya', 100, 1, 10, 'teatralnaya'),
(444, 1, '2', 'Новокузнецкая', 'Novokuznetskaya', 110, 1, 11, 'novokuznetskaya'),
(445, 1, '2,5', 'Павелецкая', 'Paveletskaya', 120, 1, 12, 'paveletskaya'),
(446, 1, '2', 'Автозаводская', 'Avtozavodskaya', 130, 1, 13, 'avtozavodskaya'),
(447, 1, '2', 'Коломенская', 'Kolomenskaya', 140, 1, 14, 'kolomenskaya'),
(448, 1, '2,11', 'Каширская', 'Kashirskaya', 150, 1, 15, 'kashirskaya'),
(449, 1, '2', 'Кантемировская', 'Kantemirovskaya', 160, 1, 18, 'kantemirovskaya'),
(450, 1, '2', 'Царицыно', 'Tsaritsyno', 170, 1, 19, 'tsaritsyno'),
(451, 1, '2', 'Орехово', 'Orekhovo', 180, 1, 20, 'orehovo'),
(452, 1, '2', 'Домодедовская', 'Domodedovskaya', 190, 1, 21, 'domodedovskaya'),
(453, 1, '2', 'Красногвардейская', 'Krasnogvardeyskaya', 200, 1, 22, 'krasnogvardeyskaya'),
(454, 1, '2', 'Алма-Атинская', 'Alma-Atinskaya', 210, 1, 213, 'alma-atinskaya'),
(455, 1, '3', 'Пятницкое шоссе', 'Pyatnitskoye Shosse', 10, 1, 214, 'pyatnitskoe-shosse'),
(456, 1, '3', 'Митино', 'Mitino', 20, 1, 196, 'mitino'),
(457, 1, '3', 'Волоколамская', 'Volokolamskaya', 30, 1, 203, 'volokolamskaya'),
(458, 1, '3', 'Мякинино', 'Myakinino', 40, 1, 202, 'myakinino'),
(459, 1, '3', 'Строгино', 'Strogino', 50, 1, 200, 'strogino'),
(460, 1, '3', 'Крылатское', 'Krylatskoye', 60, 1, 62, 'krylatskoe'),
(461, 1, '3', 'Молодёжная', 'Molodyozhnaya', 70, 1, 61, 'molodezhnaya'),
(462, 1, '3,4', 'Кунцевская', 'Kuntsevskaya', 10, 1, 60, 'kuntsevskaya'),
(463, 1, '3', 'Славянский бульвар', 'Slavyansky Bulvar', 90, 1, 201, 'slavyanskiy-bulvar'),
(464, 1, '3,8', 'Парк Победы', 'Park Pobedy', 100, 1, 165, 'park-pobedy'),
(465, 1, '3,4,5', 'Киевская', 'Kiyevskaya', 100, 1, 52, 'kievskaya'),
(466, 1, '3,4', 'Смоленская', 'Smolenskaya', 110, 1, 51, 'smolenskaya'),
(467, 1, '3,4', 'Арбатская', 'Arbatskaya', 120, 1, 50, 'arbatskaya'),
(468, 1, '3', 'Площадь Революции', 'Ploshchad Revolyutsii', 140, 1, 49, 'ploschad-revolyutsii'),
(469, 1, '3,5', 'Курская', 'Kurskaya', 150, 1, 48, 'kurskaya'),
(470, 1, '3', 'Бауманская', 'Baumanskaya', 160, 1, 47, 'baumanskaya'),
(471, 1, '3', 'Электрозаводская', 'Elektrozavodskaya', 170, 1, 46, 'elektrozavodskaya'),
(472, 1, '3', 'Семёновская', 'Semyonovskaya', 180, 1, 45, 'semenovskaya'),
(473, 1, '3', 'Партизанская', 'Partizanskaya', 190, 1, 44, 'partizanskaya'),
(474, 1, '3', 'Измайловская', 'Izmaylovskaya', 200, 1, 43, 'izmaylovskaya'),
(475, 1, '3', 'Первомайская', 'Pervomayskaya', 210, 1, 42, 'pervomayskaya'),
(476, 1, '3', 'Щёлковская', 'Shchyolkovskaya', 220, 1, 41, 'schelkovskaya'),
(478, 1, '4', 'Пионерская', 'Pionerskaya', 20, 1, 59, 'pionerskaya'),
(479, 1, '4', 'Филёвский парк', 'Filyovsky Park', 30, 1, 58, 'filevskiy-park'),
(480, 1, '4', 'Багратионовская', 'Bagrationovskaya', 40, 1, 57, 'bagrationovskaya'),
(481, 1, '4', 'Фили', 'Fili', 50, 1, 56, 'fili'),
(482, 1, '4', 'Кутузовская', 'Kutuzovskaya', 60, 1, 55, 'kutuzovskaya'),
(483, 1, '4', 'Студенческая', 'Studencheskaya', 70, 1, 54, 'studencheskaya'),
(484, 1, '4', 'Международная', 'Mezhdunarodnaya', 80, 1, 197, 'mezhdunarodnaya'),
(485, 1, '4', 'Выставочная', 'Vystavochnaya', 90, 1, 198, 'vystavochnaya'),
(489, 1, '4', 'Александровский сад', 'Aleksandrovsky Sad', 130, 1, 53, 'aleksandrovskiy-sad'),
(491, 1, '5', 'Краснопресненская', 'Krasnopresnenskaya', 20, 1, 133, 'krasnopresnenskaya'),
(493, 1, '5', 'Новослободская', 'Novoslobodskaya', 40, 1, 134, 'novoslobodskaya'),
(494, 1, '5,6', 'Проспект Мира', 'Prospekt Mira', 50, 1, 136, 'prospekt-mira'),
(497, 1, '5,7', 'Таганская', 'Taganskaya', 80, 1, 75, 'taganskaya'),
(499, 1, '5', 'Добрынинская', 'Dobryninskaya', 100, 1, 132, 'dobryninskaya'),
(500, 1, '5,6', 'Октябрьская', 'Oktyabrskaya', 110, 1, 100, 'oktyabrskaya'),
(502, 1, '6', 'Медведково', 'Medvedkovo', 10, 1, 110, 'medvedkovo'),
(503, 1, '6', 'Бабушкинская', 'Babushkinskaya', 20, 1, 109, 'babushkinskaya'),
(504, 1, '6', 'Свиблово', 'Sviblovo', 30, 1, 108, 'sviblovo'),
(505, 1, '6', 'Ботанический сад', 'Botanichesky Sad', 40, 1, 107, 'botanicheskiy-sad'),
(506, 1, '6', 'ВДНХ', 'VDNKh', 50, 1, 106, 'vdnh'),
(507, 1, '6', 'Алексеевская', 'Alekseyevskaya', 60, 1, 105, 'alekseevskaya'),
(508, 1, '6', 'Рижская', 'Rizhskaya', 70, 1, 104, 'rizhskaya'),
(510, 1, '6', 'Сухаревская', 'Sukharevskaya', 90, 1, 102, 'suharevskaya'),
(511, 1, '6', 'Тургеневская', 'Turgenevskaya', 100, 1, 103, 'turgenevskaya'),
(512, 1, '6,7', 'Китай-город', 'Kitay-gorod', 110, 1, 74, 'kitay-gorod'),
(513, 1, '6,8', 'Третьяковская', 'Tretyakovskaya', 120, 1, 88, 'tretyakovskaya'),
(515, 1, '6', 'Шаболовская', 'Shabolovskaya', 140, 1, 99, 'shabolovskaya'),
(516, 1, '6', 'Ленинский проспект', 'Leninsky Prospekt', 150, 1, 98, 'leninskiy-prospekt'),
(517, 1, '6', 'Академическая', 'Akademicheskaya', 160, 1, 97, 'akademicheskaya'),
(518, 1, '6', 'Профсоюзная', 'Profsoyuznaya', 170, 1, 96, 'profsoyuznaya'),
(519, 1, '6', 'Новые Черёмушки', 'Novye Cheryomushki', 180, 1, 95, 'novye-cheremushki'),
(520, 1, '6', 'Калужская', 'Kaluzhskaya', 190, 1, 94, 'kaluzhskaya'),
(521, 1, '6', 'Беляево', 'Belyayevo', 200, 1, 93, 'belyaevo'),
(522, 1, '6', 'Коньково', 'Konkovo', 210, 1, 92, 'konkovo'),
(523, 1, '6', 'Тёплый Стан', 'Tyoply Stan', 220, 1, 91, 'teplyy-stan'),
(524, 1, '6', 'Ясенево', 'Yasenevo', 230, 1, 90, 'yasenevo'),
(525, 1, '6', 'Новоясеневская', 'Novoyasenevskaya', 240, 1, 89, 'novoyasenevskaya'),
(527, 1, '7', 'Сходненская', 'Skhodnenskaya', 20, 1, 64, 'shodnenskaya'),
(528, 1, '7', 'Тушинская', 'Tushinskaya', 30, 1, 65, 'tushinskaya'),
(529, 1, '7', 'Спартак', 'Spartak', 40, 1, 224, 'spartak'),
(530, 1, '7', 'Щукинская', 'Shchukinskaya', 50, 1, 66, 'schukinskaya'),
(531, 1, '7', 'Октябрьское поле', 'Oktyabrskoye Pole', 60, 1, 67, 'oktyabrskoe-pole'),
(532, 1, '7', 'Полежаевская', 'Polezhayevskaya', 70, 1, 68, 'polezhaevskaya'),
(533, 1, '7', 'Беговая', 'Begovaya', 80, 1, 69, 'begovaya'),
(534, 1, '7', 'Улица 1905 года', 'Ulitsa 1905 Goda', 90, 1, 70, 'ulitsa-1905-goda'),
(535, 1, '7', 'Баррикадная', 'Barrikadnaya', 100, 1, 71, 'barrikadnaya'),
(536, 1, '7', 'Пушкинская', 'Pushkinskaya', 110, 1, 72, 'pushkinskaya'),
(537, 1, '7', 'Кузнецкий мост', 'Kuznetsky Most', 120, 1, 73, 'kuznetskiy-most'),
(540, 1, '7', 'Пролетарская', 'Proletarskaya', 150, 1, 76, 'proletarskaya'),
(541, 1, '7', 'Волгоградский проспект', 'Volgogradsky Prospekt', 160, 1, 77, 'volgogradskiy-prospekt'),
(542, 1, '7', 'Текстильщики', 'Tekstilshchiki', 170, 1, 78, 'tekstilschiki'),
(543, 1, '7', 'Кузьминки', 'Kuzminki', 180, 1, 79, 'kuzminki'),
(544, 1, '7', 'Рязанский проспект', 'Ryazansky Prospekt', 190, 1, 80, 'ryazanskiy-prospekt'),
(545, 1, '7', 'Выхино', 'Vykhino', 200, 1, 81, 'vyhino'),
(546, 1, '7', 'Лермонтовский проспект', 'Lermontovsky Prospekt', 210, 1, 215, 'lermontovskiy-prospekt'),
(547, 1, '7', 'Жулебино', 'Zhulebino', 220, 1, 216, 'zhulebino'),
(549, 1, '8', 'Деловой центр', 'Delovoy Tsentr', 20, 1, 217, 'delovoy-tsentr'),
(551, 1, '8', 'Марксистская', 'Marksistskaya', 40, 1, 87, 'marksistskaya'),
(552, 1, '8', 'Площадь Ильича', 'Ploshchad Ilyicha', 50, 1, 86, 'ploschad-ilicha'),
(553, 1, '8', 'Авиамоторная', 'Aviamotornaya', 60, 1, 85, 'aviamotornaya'),
(554, 1, '8', 'Шоссе Энтузиастов', 'Shosse Entuziastov', 70, 1, 84, 'shosse-entuziastov'),
(555, 1, '8', 'Перово', 'Perovo', 80, 1, 83, 'perovo'),
(556, 1, '8', 'Новогиреево', 'Novogireyevo', 90, 1, 82, 'novogireevo'),
(557, 1, '8', 'Новокосино', 'Novokosino', 100, 1, 210, 'novokosino'),
(558, 1, '9', 'Алтуфьево', 'Altufyevo', 10, 1, 135, 'altufevo'),
(559, 1, '9', 'Бибирево', 'Bibirevo', 20, 1, 131, 'bibirevo'),
(560, 1, '9', 'Отрадное', 'Otradnoye', 30, 1, 111, 'otradnoe'),
(561, 1, '9', 'Владыкино', 'Vladykino', 40, 1, 112, 'vladykino'),
(562, 1, '9', 'Петровско-Разумовская', 'Petrovsko-Razumovskaya', 50, 1, 113, 'petrovsko-razumovskaya'),
(563, 1, '9', 'Тимирязевская', 'Timiryazevskaya', 60, 1, 114, 'timiryazevskaya'),
(564, 1, '9', 'Дмитровская', 'Dmitrovskaya', 70, 1, 115, 'dmitrovskaya'),
(565, 1, '9', 'Савёловская', 'Savyolovskaya', 80, 1, 116, 'savelovskaya'),
(566, 1, '9', 'Менделеевская', 'Mendeleyevskaya', 90, 1, 117, 'mendeleevskaya'),
(567, 1, '9', 'Цветной бульвар', 'Tsvetnoy Bulvar', 100, 1, 118, 'tsvetnoy-bulvar'),
(568, 1, '9', 'Чеховская', 'Chekhovskaya', 110, 1, 119, 'chehovskaya'),
(569, 1, '9', 'Боровицкая', 'Borovitskaya', 120, 1, 120, 'borovitskaya'),
(570, 1, '9', 'Полянка', 'Polyanka', 130, 1, 121, 'polyanka'),
(571, 1, '9', 'Серпуховская', 'Serpukhovskaya', 140, 1, 122, 'serpuhovskaya'),
(572, 1, '9', 'Тульская', 'Tulskaya', 150, 1, 123, 'tulskaya'),
(573, 1, '9', 'Нагатинская', 'Nagatinskaya', 160, 1, 124, 'nagatinskaya'),
(574, 1, '9', 'Нагорная', 'Nagornaya', 170, 1, 125, 'nagornaya'),
(575, 1, '9', 'Нахимовский проспект', 'Nakhimovsky Prospekt', 180, 1, 126, 'nahimovskiy-prospekt'),
(576, 1, '9', 'Севастопольская', 'Sevastopolskaya', 190, 1, 127, 'sevastopolskaya'),
(577, 1, '9', 'Чертановская', 'Chertanovskaya', 200, 1, 128, 'chertanovskaya'),
(578, 1, '9', 'Южная', 'Yuzhnaya', 210, 1, 129, 'yuzhnaya'),
(579, 1, '9', 'Пражская', 'Prazhskaya', 220, 1, 130, 'prazhskaya'),
(580, 1, '9', 'Улица академика Янгеля', 'Ulitsa Akademika Yangelya', 230, 1, 155, 'ulitsa-akademika-yangelya'),
(581, 1, '9', 'Аннино', 'Annino', 240, 1, 156, 'annino'),
(582, 1, '9', 'Бульвар Дмитрия Донского', 'Bulvar Dmitriya Donskogo', 250, 1, 164, 'bulvar-dmitriya-donskogo'),
(583, 1, '10', 'Марьина Роща', 'Maryina Roshcha', 10, 1, 204, 'marina-roscha'),
(584, 1, '10', 'Достоевская', 'Dostoyevskaya', 20, 1, 205, 'dostoevskaya'),
(585, 1, '10', 'Трубная', 'Trubnaya', 30, 1, 199, 'trubnaya'),
(586, 1, '10', 'Сретенский бульвар', 'Sretensky Bulvar', 40, 1, 206, 'sretenskiy-bulvar'),
(587, 1, '10', 'Чкаловская', 'Chkalovskaya', 50, 1, 137, 'chkalovskaya'),
(588, 1, '10', 'Римская', 'Rimskaya', 60, 1, 138, 'rimskaya'),
(589, 1, '10', 'Крестьянская застава', 'Krestyanskaya Zastava', 70, 1, 139, 'krestyanskaya-zastava'),
(590, 1, '10', 'Дубровка', 'Dubrovka', 80, 1, 140, 'dubrovka'),
(591, 1, '10', 'Кожуховская', 'Kozhukhovskaya', 90, 1, 144, 'kozhuhovskaya'),
(592, 1, '10', 'Печатники', 'Pechatniki', 100, 1, 141, 'pechatniki'),
(593, 1, '10', 'Волжская', 'Volzhskaya', 110, 1, 142, 'volzhskaya'),
(594, 1, '10', 'Люблино', 'Lyublino', 120, 1, 143, 'lyublino'),
(595, 1, '10', 'Братиславская', 'Bratislavskaya', 130, 1, 145, 'bratislavskaya'),
(596, 1, '10', 'Марьино', 'Maryino', 140, 1, 146, 'marino'),
(597, 1, '10', 'Борисово', 'Borisovo', 150, 1, 207, 'borisovo'),
(598, 1, '10', 'Шипиловская', 'Shipilovskaya', 160, 1, 208, 'shipilovskaya'),
(599, 1, '10', 'Зябликово', 'Zyablikovo', 170, 1, 209, 'zyablikovo'),
(601, 1, '11', 'Варшавская', 'Varshavskaya', 20, 1, 16, 'varshavskaya'),
(602, 1, '11', 'Каховская', 'Kakhovskaya', 30, 1, 17, 'kahovskaya'),
(603, 1, '12', 'Битцевский парк', 'Bittsevsky Park', 10, 1, 222, 'bittsevskiy-park'),
(604, 1, '12', 'Лесопарковая', 'Lesoparkovaya', 20, 1, 223, 'lesoparkovaya'),
(605, 1, '12', 'Улица Старокачаловская', 'Ulitsa Starokachalovskaya', 30, 1, 212, 'ulitsa-starokachalovskaya'),
(606, 1, '12', 'Улица Скобелевская', 'Ulitsa Skobelevskaya', 40, 1, 192, 'ulitsa-skobelevskaya'),
(607, 1, '12', 'Бульвар Адмирала Ушакова', 'Bulvar Admirala Ushakova', 50, 1, 193, 'bulvar-admirala-ushakova'),
(608, 1, '12', 'Улица Горчакова', 'Ulitsa Gorchakova', 60, 1, 194, 'ulitsa-gorchakova'),
(609, 1, '12', 'Бунинская аллея', 'Buninskaya Alleya', 70, 1, 195, 'buninskaya-alleya');

-- --------------------------------------------------------

--
-- Структура таблицы `metro_line`
--

DROP TABLE IF EXISTS `metro_line`;
CREATE TABLE IF NOT EXISTS `metro_line` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `city_id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(40) DEFAULT NULL,
  `sort_num` int(5) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `metro_line`
--

INSERT INTO `metro_line` (`id`, `city_id`, `title`, `title_en`, `color`, `sort_num`, `published`) VALUES
(1, 1, 'Сокольническая', 'Sokolnicheskaya', '#ed1b35', 10, 1),
(2, 1, 'Замоскворецкая', 'Zamoskvoretskaya', '#44b85c', 20, 1),
(3, 1, 'Арбатско-Покровская', 'Arbatsko-Pokrovskaya', '#0078bf', 30, 1),
(4, 1, 'Филёвская', 'Filyovskaya', '#19c1f3', 40, 1),
(5, 1, 'Кольцевая', 'Koltsevaya', '#894e35', 50, 1),
(6, 1, 'Калужско-Рижская', 'Kaluzhsko-Rizhskaya', '#f58631', 60, 1),
(7, 1, 'Таганско-Краснопресненская', 'Tagansko-Krasnopresnenskaya', '#8e479c', 70, 1),
(8, 1, 'Калининско-Солнцевская', 'Kalininsko-Solntsevskaya', '#ffcb31', 80, 1),
(9, 1, 'Серпуховско-Тимирязевская', 'Serpukhovsko-Timiryazevskaya', '#a1a2a3', 90, 1),
(10, 1, 'Люблинско-Дмитровская', 'Lyublinsko-Dmitrovskaya', '#b3d445', 100, 1),
(11, 1, 'Каховская', 'Kakhovskaya', '#79cdcd', 110, 1),
(12, 1, 'Бутовская', 'Butovskaya', '#acbfe1', 120, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_lang_id` varchar(40) NOT NULL DEFAULT '',
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `meta_table_id` varchar(40) NOT NULL,
  `news_folder_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `produced` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `annotation` text,
  `annotation_en` text,
  `body` text,
  `body_en` text,
  `sort_num` smallint(5) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `img_src` varchar(255) DEFAULT NULL,
  `img_src_detail` varchar(255) DEFAULT NULL,
  `img_src_big` varchar(255) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title_seo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_seo` (`title_seo`),
  KEY `news_folder_id` (`news_folder_id`,`produced`),
  KEY `meta_site_id` (`meta_site_id`),
  KEY `meta_table_id` (`meta_table_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `meta_site_lang_id`, `meta_site_id`, `meta_table_id`, `news_folder_id`, `title`, `title_en`, `produced`, `annotation`, `annotation_en`, `body`, `body_en`, `sort_num`, `published`, `img_src`, `img_src_detail`, `img_src_big`, `updated`, `title_seo`) VALUES
(3, '', '', 'news', 1, 'Получите скидку 10% на аренду офиса', '', '2015-03-09 00:00:00', '1 февраля – 29 апреля 2016', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '2016-06-07 03:00:49', 'nashi-tseny-na-vashey-storone-ved-my-zainteresovany-v-tom-chtoby-imenno-u-nas-vy-nashli-podhodyaschee-vam-predlozhenie'),
(6, '', '', 'news', 1, 'Виртуальный офис + 4 часа переговорных в подарок', '', '2015-03-08 00:00:00', '20 марта – 18 мая 2016', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '2016-06-07 03:01:24', 'spisok-nashih-obektov-nedvizhimosti-vklyuchaet-v-sebya-samye-novye-predlozheniya-i-postoyanno-obnovlyaetsya'),
(7, '', '', 'news', 1, 'Вы всегда можете обратиться к нам за советом или консультацией', '', '2015-03-07 00:00:00', '1 февраля – 29 апреля 2016', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '2016-06-07 03:01:45', 'vy-vsegda-mozhete-obratitsya-k-nam-za-sovetom-ili-konsultatsiey');

-- --------------------------------------------------------

--
-- Структура таблицы `news_folder`
--

DROP TABLE IF EXISTS `news_folder`;
CREATE TABLE IF NOT EXISTS `news_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `published` int(1) NOT NULL DEFAULT '0',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `news_folder`
--

INSERT INTO `news_folder` (`id`, `meta_site_id`, `name`, `published`, `sort_num`) VALUES
(1, '', 'Cпецпредложения', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `news_folder2section`
--

DROP TABLE IF EXISTS `news_folder2section`;
CREATE TABLE IF NOT EXISTS `news_folder2section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `news_folder_id` int(11) NOT NULL DEFAULT '0',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_id` (`section_id`,`news_folder_id`),
  KEY `news_folder2section_news_folder_id_idx` (`news_folder_id`),
  KEY `news_folder2section_section_id_idx` (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `news_folder2section`
--

INSERT INTO `news_folder2section` (`id`, `section_id`, `news_folder_id`, `sort_num`) VALUES
(3, 2, 1, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `news_tag`
--

DROP TABLE IF EXISTS `news_tag`;
CREATE TABLE IF NOT EXISTS `news_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  `title_sef` varchar(255) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title_seo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_sef` (`title_sef`),
  UNIQUE KEY `title_seo` (`title_seo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `news_tag2news`
--

DROP TABLE IF EXISTS `news_tag2news`;
CREATE TABLE IF NOT EXISTS `news_tag2news` (
  `news_id` int(11) NOT NULL DEFAULT '0',
  `news_tag_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`,`news_tag_id`),
  KEY `news_id` (`news_id`),
  KEY `news_tag_id` (`news_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `office_center`
--

DROP TABLE IF EXISTS `office_center`;
CREATE TABLE IF NOT EXISTS `office_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `city_id` int(11) NOT NULL,
  `metro_id` int(5) DEFAULT NULL,
  `ext_img_src` varchar(255) NOT NULL,
  `int_img_src` varchar(255) NOT NULL,
  `annotation` text,
  `annotation_en` text,
  `body` text,
  `body_en` text,
  `address` varchar(255) DEFAULT NULL,
  `address_en` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email_request` varchar(255) DEFAULT NULL,
  `google_map` varchar(255) DEFAULT NULL,
  `color` varchar(40) DEFAULT NULL,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `title_seo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_sef` (`title_seo`),
  KEY `city_id` (`city_id`),
  KEY `metro_id` (`metro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `office_center`
--

INSERT INTO `office_center` (`id`, `title`, `title_en`, `city_id`, `metro_id`, `ext_img_src`, `int_img_src`, `annotation`, `annotation_en`, `body`, `body_en`, `address`, `address_en`, `phone`, `email_request`, `google_map`, `color`, `sort_num`, `published`, `title_seo`) VALUES
(1, 'Алексеевская Башня', 'Alexeevskaya tower', 1, 507, '/uploads/images/office_centers/alekseevskaya/alekseevskaya.png', '/uploads/images/office_centers/alekseevskaya/alekseevskaya.png', 'Бизнес-центр «Алексеевская башня» является подлинным архитектурным украшением столицы — построен в парковой зоне по уникальному проекту в стиле урбанистического минимализма.', '<p>Office-center “Delovoy” offers you fully equipped office spaces in modern business-center “Alexeevskaya tower” (metro station VDNH), that are equipped with all that you need for work.</p>\r\n<p> </p>', NULL, '<b>"В+"-class office for rent in "Alexeevskaya tower" business-center.</b>', 'Ракетный бульвар, д. 16, этаж 7', 'B+ -Class business-center\r\nmetro: VDNH\r\nRaketniy boulevard, 16', '+7 (495) 988-07-34', 'tower@delovoy.su', '55.817487059711276, 37.655661558502175', '#008ccd', 10, 1, 'alekseevskaya-bashnya'),
(2, 'Омега Плаза', 'Omega plaza', 1, 446, '/uploads/images/office_centers/omega/omega.png', '/uploads/images/office_centers/omega/omega.png', 'Офисный центр «Деловой» предлагает в аренду готовые, полностью оборудованные «под ключ» офисы для малого бизнеса в современном Бизнес-центре «Омега Плаза»', '<p>Office-center “Delovoy” offers you readymade, fully equipped office spaces on a turn-key basis in modern business-center “Omega plaza” near Avtozavodskaya metro station, that are equipped with all that you need for work.</p>\r\n<p> </p>', '<p>Аренда офиса на Автозаводской в Бизнес-центре «Омега Плаза»</p>', '<p><strong>‘B+’-class office for rent in ‘Omega plaza’ Business-center</strong></p>', 'Бизнес-центр класса «В+»\r\nАвтозаводская\r\nул. Ленинская Cлобода, д.19', 'B+ Class business-center\r\nmetro: Avtozavodskaya\r\nLeninskaya Sloboda str.,19', '+7 (495) 988-07-32', 'omega@delovoy.su', '55.706934, 37.649076', '#e62e66', 40, 1, 'omega-plaza'),
(3, 'Гостиный Двор', 'Gostiniy dvor', 1, 468, '/uploads/images/office_centers/gostinyi/gd.png', '/uploads/images/office_centers/gostinyi/gd.png', 'Деловой предлагает провести переговоры, деловые встречи, видеоконференции с Вашими партнерами или клиентами в Гостином Дворе.', '<p>"Delovoy" offers you to lead a video-conference with your partners in Gostiny dvor</p>\r\n<p>2 minutes from Ploshad revolutsii metro station</p>', NULL, NULL, 'Бизнес-центр в Гостином Дворе\r\nПлощадь Революции, ул. Ильинка, д.4', 'Business-center in Gostiniy dvor\r\nmetro: Ploschad Revolutsii\r\nIl`inka str, 4', '+7 (495) 988-07-31', 'gd@delovoy.su', '55.754364,37.62511', '#91c73e', 30, 1, 'gostinyy-dvor'),
(5, 'Арма', 'ARMA', 1, 469, '/uploads/images/office_centers/arma/arma.png', '/uploads/images/office_centers/arma/arma.png', '«Арма» — это бизнес-квартал, в котором соединяются необычная архитектура зданий и все атрибуты делового центра с развитой инфраструктурой.', '<p>Arma is a business-district that combines unusual architecture and all elements of a business-center with developed infrastructure. This business-center satisfies the most modern requirements!</p>', '<p>Аренда офиса в ЦАО (метро Курская) — это очень легко с «Деловым»! Позвольте себе аренду офиса в Москве ЦАО в уникальном квартале.</p>\r\n<p>Мы предлагаем Вашему вниманию пакет услуг по аренде офиса в ЦАО по адресу: г. Москва, метро «Курская», Нижний Сусальный переулок, 5, Бизнес квартал «АРМА». Деловая инфраструктура района предельно развита, более того, поблизости находятся значимые объекты культуры и архитектуры — Курский вокзал, музей геодезии и картографии, музей уникальных кукол, множество храмов и церквей. Аренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным. К тому же, в каждое предложение входит ряд других услуг, которые помогут вам полностью сконцентрироваться на деловых вопросах и не отвлекаться на организационные и хозяйственные проблемы. Мы предлагаем аренду офиса от собственника без посредников, аренда офиса с ОЦ "Деловой", поэтому не стоит волноваться о дополнительных расходах.</p>\r\n<p>Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!</p>\r\n<p>Если у Вас имеются какие-либо вопросы по поводу аренды офиса в бизнес-центре ЦАО, то звоните по телефону +7 (495) 988-07-36 и наш менеджер будет рад Вам ответить!</p>', NULL, 'Нижний Сусальный переулок, 5, стр.19, этаж 3\r\nКурская, 5 минут пешком', NULL, '+7 (495) 988-07-36', 'arma@delovoy.su', '55.761158, 37.664563', '#8c278f', 20, 1, 'arma'),
(6, 'Горный деловой центр', 'Rosa Khutor', 2, NULL, '/uploads/images/office_centers/roza_hutor/roza.png', '/uploads/images/office_centers/roza_hutor/roza.png', 'Офисный центр «Деловой» предлагает в аренду готовые, полностью оборудованные «под ключ» офисы для малого бизнеса в современном Бизнес-центре «Омега Плаза»', '<p>New format — a combination of work and recreation. \r\nAll the features of the famous resort "Rosa Khutor" and office center "Delovoy"</p>', NULL, NULL, NULL, NULL, '+7 (495) 988-33-08', 'rosa@delovoy.su', '43.672067, 40.295939', '#24c7da', 50, 1, 'rosa-khutor');

-- --------------------------------------------------------

--
-- Структура таблицы `office_center_detail`
--

DROP TABLE IF EXISTS `office_center_detail`;
CREATE TABLE IF NOT EXISTS `office_center_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_center_id` int(11) NOT NULL,
  `office_center_detail_type_id` varchar(16) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `img_src` varchar(255) DEFAULT NULL,
  `annotation` text,
  `annotation_en` text,
  `body` text,
  `body_en` text,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `office_center_detail_type_id` (`office_center_detail_type_id`),
  KEY `office_center_id` (`office_center_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Дамп данных таблицы `office_center_detail`
--

INSERT INTO `office_center_detail` (`id`, `office_center_id`, `office_center_detail_type_id`, `title`, `title_en`, `img_src`, `annotation`, `annotation_en`, `body`, `body_en`, `sort_num`, `published`) VALUES
(27, 1, 'text', '', '', NULL, NULL, NULL, 'Деловая инфраструктура района предельно развита, более того, поблизости находятся значимые объекты культуры и архитектуры — Курский вокзал, музей геодезии и картографии, музей уникальных кукол, множество храмов и церквей.\r\nАренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.', NULL, 10, 1),
(28, 1, 'text', '', '', NULL, NULL, NULL, 'К тому же, в каждое предложение входит ряд других услуг, которые помогут вам полностью сконцентрироваться на деловых вопросах и не отвлекаться на организационные и хозяйственные проблемы. Мы предлагаем аренду офиса от собственника без посредников, аренда офиса с ОЦ «Деловой», поэтому не стоит волноваться о дополнительных расходах.', NULL, 30, 1),
(29, 1, 'text', '', '', NULL, NULL, NULL, 'Аренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.', NULL, 20, 1),
(30, 1, 'text', '', '', NULL, NULL, NULL, 'Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!', NULL, 40, 1),
(31, 2, 'text', '', '', NULL, NULL, NULL, 'Деловая инфраструктура района предельно развита, более того, поблизости находятся значимые объекты культуры и архитектуры — Курский вокзал, музей геодезии и картографии, музей уникальных кукол, множество храмов и церквей.\r\nАренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.', NULL, 10, 1),
(32, 2, 'text', '', '', NULL, NULL, NULL, 'К тому же, в каждое предложение входит ряд других услуг, которые помогут вам полностью сконцентрироваться на деловых вопросах и не отвлекаться на организационные и хозяйственные проблемы. Мы предлагаем аренду офиса от собственника без посредников, аренда офиса с ОЦ «Деловой», поэтому не стоит волноваться о дополнительных расходах.', NULL, 30, 1),
(33, 2, 'text', '', '', NULL, NULL, NULL, 'Аренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.', NULL, 20, 1),
(34, 2, 'text', '', '', NULL, NULL, NULL, 'Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!', NULL, 40, 1),
(35, 3, 'text', '', '', NULL, NULL, NULL, 'Деловая инфраструктура района предельно развита, более того, поблизости находятся значимые объекты культуры и архитектуры — Курский вокзал, музей геодезии и картографии, музей уникальных кукол, множество храмов и церквей.\r\nАренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.', NULL, 10, 1),
(36, 3, 'text', '', '', NULL, NULL, NULL, 'К тому же, в каждое предложение входит ряд других услуг, которые помогут вам полностью сконцентрироваться на деловых вопросах и не отвлекаться на организационные и хозяйственные проблемы. Мы предлагаем аренду офиса от собственника без посредников, аренда офиса с ОЦ «Деловой», поэтому не стоит волноваться о дополнительных расходах.', NULL, 30, 1),
(37, 3, 'text', '', '', NULL, NULL, NULL, 'Аренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.', NULL, 20, 1),
(38, 3, 'text', '', '', NULL, NULL, NULL, 'Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!', NULL, 40, 1),
(39, 5, 'text', '', '', '/uploads/images/icons/svg/historic.svg', NULL, NULL, '<p>Деловая инфраструктура района предельно развита, более того, поблизости находятся значимые объекты культуры и архитектуры — Курский вокзал, музей геодезии и картографии, музей уникальных кукол, множество храмов и церквей. Аренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.</p>', NULL, 10, 1),
(40, 5, 'text', '', '', '/uploads/images/icons/svg/infrastructure.svg', NULL, NULL, '<p>К тому же, в каждое предложение входит ряд других услуг, которые помогут вам полностью сконцентрироваться на деловых вопросах и не отвлекаться на организационные и хозяйственные проблемы. Мы предлагаем аренду офиса от собственника без посредников, аренда офиса с ОЦ «Деловой», поэтому не стоит волноваться о дополнительных расходах.</p>', NULL, 30, 1),
(41, 5, 'text', '', '', '/uploads/images/icons/svg/location.svg', NULL, NULL, '<p>Аренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.</p>', NULL, 20, 1),
(42, 5, 'text', '', '', '/uploads/images/icons/svg/workplace.svg', NULL, NULL, '<p>Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!</p>', NULL, 40, 1),
(43, 6, 'text', '', '', NULL, NULL, NULL, 'Деловая инфраструктура района предельно развита, более того, поблизости находятся значимые объекты культуры и архитектуры — Курский вокзал, музей геодезии и картографии, музей уникальных кукол, множество храмов и церквей.\r\nАренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.', NULL, 10, 1),
(44, 6, 'text', '', '', NULL, NULL, NULL, 'К тому же, в каждое предложение входит ряд других услуг, которые помогут вам полностью сконцентрироваться на деловых вопросах и не отвлекаться на организационные и хозяйственные проблемы. Мы предлагаем аренду офиса от собственника без посредников, аренда офиса с ОЦ «Деловой», поэтому не стоит волноваться о дополнительных расходах.', NULL, 30, 1),
(45, 6, 'text', '', '', NULL, NULL, NULL, 'Аренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.', NULL, 20, 1),
(46, 6, 'text', '', '', NULL, NULL, NULL, 'Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!', NULL, 40, 1),
(47, 5, 'gallery', '', '', NULL, NULL, NULL, '<p>\r\n<table cellspacing="0">\r\n    <tbody>\r\n        <tr>\r\n            <td class="fotoset fotoset-w500-h320-wh"><a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/01_19-10.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/01_19-10.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/02_MOR_2057.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/02_MOR_2057.447x299.jpg" width="447" height="299" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/03_MOR_6043.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/03_MOR_6043.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/04_MOR_5972-Edit.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/04_MOR_5972-Edit.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/05_MOR_2366.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/05_MOR_2366.jpg" width="299" height="448" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/06_MOR_5979.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/06_MOR_5979.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/07_MOR_5888-Edit.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/07_MOR_5888-Edit.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/08_MOR_2284.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/08_MOR_2284.447x299.jpg" width="447" height="299" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/09_MOR_5857.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/09_MOR_5857.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/10_MOR_2181.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/10_MOR_2181.447x299.jpg" width="447" height="299" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/11_MOR_5985-Edit-Edit.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/11_MOR_5985-Edit-Edit.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/12_MOR_6088.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/12_MOR_6088.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/13_MOR_5934_1.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/13_MOR_5934_1.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/14_MOR_5967.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/14_MOR_5967.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/15_MOR_2230.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/15_MOR_2230.jpg" width="299" height="448" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/16_MOR_5825.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/16_MOR_5825.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/17_Delovoy-Arma-052-Edit.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/17_Delovoy-Arma-052-Edit.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/18_MOR_5852.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/18_MOR_5852.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/19_MOR_5837.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/19_MOR_5837.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/20_MOR_5916-Edit.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/20_MOR_5916-Edit.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/21_MOR_5963.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/21_MOR_5963.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/22_MOR_5905.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/22_MOR_5905.500x320.jpg" width="500" height="320" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/23_MOR_1992.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/23_MOR_1992.447x299.jpg" width="447" height="299" alt=""></a> <a class="fotoset-item" title="" href="/uploads/images/office_centers/arma/gallery/24_MOR_6078.jpg" rel="fotoset56738"><img src="/uploads/images/office_centers/arma/gallery/.resize/24_MOR_6078.500x320.jpg" width="500" height="320" alt=""></a></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `office_center_detail_type`
--

DROP TABLE IF EXISTS `office_center_detail_type`;
CREATE TABLE IF NOT EXISTS `office_center_detail_type` (
  `id` varchar(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `office_center_detail_type`
--

INSERT INTO `office_center_detail_type` (`id`, `name`, `sort_num`) VALUES
('gallery', 'Галерея', 20),
('text', 'Описание', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `office_center_room`
--

DROP TABLE IF EXISTS `office_center_room`;
CREATE TABLE IF NOT EXISTS `office_center_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_table_id` varchar(40) NOT NULL,
  `office_center_id` int(11) NOT NULL,
  `service_group_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `number` int(3) NOT NULL,
  `seats_num` int(3) DEFAULT NULL,
  `floor_area_m2` decimal(5,2) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `price_for` varchar(100) DEFAULT NULL,
  `price_for_en` varchar(100) DEFAULT NULL,
  `price_bonus` varchar(100) DEFAULT NULL,
  `price_bonus_en` varchar(100) DEFAULT NULL,
  `img_src_big` varchar(255) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `annotation` text,
  `annotation_en` text,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `office_center_id` (`office_center_id`),
  KEY `service_group_id` (`service_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `office_center_room`
--

INSERT INTO `office_center_room` (`id`, `meta_table_id`, `office_center_id`, `service_group_id`, `title`, `title_en`, `number`, `seats_num`, `floor_area_m2`, `price`, `price_for`, `price_for_en`, `price_bonus`, `price_bonus_en`, `img_src_big`, `img_src`, `annotation`, `annotation_en`, `sort_num`, `published`) VALUES
(1, '', 5, 1, 'Офис №21', '', 0, 4, '21.00', 15990, '7', NULL, NULL, NULL, '/uploads/images/office_centers/arma/gallery/13_MOR_5934_1.jpg', '/uploads/images/office_centers/arma/gallery/.resize/13_MOR_5934_1.175x100.jpg', NULL, NULL, 10, 1),
(2, '', 5, 1, 'Офис №24', '', 0, 3, '15.00', 17990, '7', NULL, '+ 4 часа переговорных', NULL, '/uploads/images/office_centers/arma/gallery/11_MOR_5985-Edit-Edit.jpg', '/uploads/images/office_centers/arma/gallery/.resize/11_MOR_5985-Edit-Edit.175x100.jpg', NULL, NULL, 20, 1),
(3, '', 5, 1, 'Офис №13', '', 0, 8, '64.00', 9990, '7', NULL, NULL, NULL, '/uploads/images/office_centers/arma/gallery/06_MOR_5979.jpg', '/uploads/images/office_centers/arma/gallery/.resize/06_MOR_5979.175x100.jpg', NULL, NULL, 30, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `office_center_room_type`
--

DROP TABLE IF EXISTS `office_center_room_type`;
CREATE TABLE IF NOT EXISTS `office_center_room_type` (
  `id` varchar(16) NOT NULL,
  `meta_site_lang_id` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `office_center_room_type`
--

INSERT INTO `office_center_room_type` (`id`, `meta_site_lang_id`, `title`, `sort_num`) VALUES
('meeting', '', 'Переговорная', 20),
('office', '', 'Офис', 10),
('tariff', '', 'Тариф', 30);

-- --------------------------------------------------------

--
-- Структура таблицы `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_lang_id` varchar(40) NOT NULL DEFAULT '',
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `section_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `img_src` varchar(255) DEFAULT NULL,
  `dir` varchar(64) DEFAULT '',
  `path` varchar(255) DEFAULT NULL,
  `section_type_id` varchar(16) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `target_blank` int(1) NOT NULL DEFAULT '0',
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `protected` int(1) NOT NULL DEFAULT '0',
  `hidden` int(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_title_en` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_description_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`,`dir`,`meta_site_id`),
  KEY `section_section_id_idx` (`section_id`),
  KEY `section_section_type_id_idx` (`section_type_id`),
  KEY `meta_site_id_idx` (`meta_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`id`, `meta_site_lang_id`, `meta_site_id`, `section_id`, `title`, `title_en`, `img_src`, `dir`, `path`, `section_type_id`, `url`, `target_blank`, `sort_num`, `published`, `protected`, `hidden`, `meta_title`, `meta_title_en`, `meta_description`, `meta_description_en`) VALUES
(1, '', '', NULL, 'Разделы сайта', '', NULL, '', '', 'link', '/', 0, 0, 0, 0, 0, 'Деловой', 'Booclick', NULL, NULL),
(2, ',en', '', 1, 'Главная страница', 'Home', NULL, '', '/', 'index', NULL, 0, 10, 1, 0, 0, NULL, '', NULL, NULL),
(4, '', '', 1, 'Бизнес-центры', '', NULL, 'business-centers', '/', 'office_centers', NULL, 0, 40, 1, 0, 0, NULL, NULL, NULL, NULL),
(5, '', '', 1, 'Услуги', '', NULL, 'services', '/', 'services', NULL, 0, 30, 1, 0, 0, NULL, NULL, NULL, NULL),
(6, '', '', 1, 'О компании', '', NULL, 'company', '/', 'article', NULL, 0, 20, 1, 0, 0, NULL, NULL, NULL, NULL),
(7, '', '', 1, 'Контакты', '', NULL, 'contacts', '/', 'article', NULL, 0, 60, 1, 0, 0, NULL, NULL, NULL, NULL),
(21, '', '', 1, 'Блог', '', NULL, 'blog', '/', 'link', '/blog/', 1, 50, 1, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `section2container`
--

DROP TABLE IF EXISTS `section2container`;
CREATE TABLE IF NOT EXISTS `section2container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `container_id` varchar(16) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_id` (`section_id`,`container_id`),
  KEY `section2container_section_id_idx` (`section_id`),
  KEY `section2container_container_id_idx` (`container_id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `section2container`
--

INSERT INTO `section2container` (`id`, `meta_site_id`, `section_id`, `container_id`, `title`, `title_en`, `img_src`, `sort_num`) VALUES
(1, '', 4, 'main', NULL, NULL, NULL, 10),
(2, '', 5, 'main', NULL, NULL, NULL, 10),
(3, '', 6, 'main', NULL, NULL, NULL, 10),
(4, '', 7, 'main', NULL, NULL, NULL, 10),
(5, '', 21, 'main', NULL, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `section_type`
--

DROP TABLE IF EXISTS `section_type`;
CREATE TABLE IF NOT EXISTS `section_type` (
  `id` varchar(16) NOT NULL DEFAULT '',
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `is_system` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `section_type`
--

INSERT INTO `section_type` (`id`, `meta_site_id`, `name`, `published`, `is_system`) VALUES
('article', '', 'Текст', 1, 0),
('feedback', '', 'Обратная связь', 1, 0),
('index', '', 'Главная страница', 1, 0),
('link', '', 'Ссылка', 1, 1),
('menuitem', '', 'Пункт меню', 1, 1),
('office_centers', '', 'Офисные центры', 1, 0),
('services', '', 'Услуги', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `seo_parameter`
--

DROP TABLE IF EXISTS `seo_parameter`;
CREATE TABLE IF NOT EXISTS `seo_parameter` (
  `id` varchar(40) NOT NULL,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `real_name` varchar(40) NOT NULL,
  `type_id` varchar(16) NOT NULL DEFAULT '',
  `meta_table_field_id` int(11) DEFAULT NULL,
  `is_multi_value` int(1) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `real_name` (`real_name`),
  KEY `type_id` (`type_id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `seo_parameter2section_type`
--

DROP TABLE IF EXISTS `seo_parameter2section_type`;
CREATE TABLE IF NOT EXISTS `seo_parameter2section_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_parameter_id` varchar(40) NOT NULL,
  `section_type_id` varchar(16) NOT NULL,
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `seo_parameter_id` (`seo_parameter_id`,`section_type_id`),
  KEY `section_type_id` (`section_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `seo_url_data`
--

DROP TABLE IF EXISTS `seo_url_data`;
CREATE TABLE IF NOT EXISTS `seo_url_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `redirect_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `body` text,
  `published` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `icon_img_src` varchar(255) NOT NULL DEFAULT '',
  `icon_big_img_src` varchar(255) NOT NULL,
  `headline` text,
  `headline_en` text,
  `annotation` text,
  `annotation_en` text,
  `body` text,
  `body_en` text,
  `is_main` int(1) NOT NULL DEFAULT '0',
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `title_seo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_seo` (`title_seo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `service`
--

INSERT INTO `service` (`id`, `title`, `title_en`, `icon_img_src`, `icon_big_img_src`, `headline`, `headline_en`, `annotation`, `annotation_en`, `body`, `body_en`, `is_main`, `sort_num`, `published`, `title_seo`) VALUES
(1, 'Мебель', 'Furniture', '/uploads/images/icons/svg/office-chair.svg', '/uploads/images/icons/new-icons/icon_furniture_120.jpg', 'Весь ассортимент офисной мебели включен в стоимость аренды. Вам осталось только рассказать нам, как расставить мебель.', 'The whole office furniture assortment is included to the price of the rent. You just have to instruct us how to arrange the furniture.', 'Мы рады предложить Вам разнообразный ассортимент офисной мебели для того, чтобы работа была максимально комфортной. Шкафы, рабочие места, тумбочки и другая мебель уже включены в стоимость аренды. Вам осталось только рассказать нам, как расставить мебель.', 'We are glad to offer you different assortment of office furniture to make your work more comfortable. Cabinets, work desks, drawers and other furniture is included to the price of the rent. What is left to you - is to tell us how to arrange the furniture.', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td width="445" valign="top">\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">Мы рады предложить Вам разнообразный ассортимент офисной мебели для того, чтобы работа была максимально комфортной. Шкафы, рабочие места, стеллажи и другая мебель уже включены в стоимость аренды. Вам осталось только рассказать нам, как расставить мебель. </span></p>\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">В интерьерах офисов представлены коллекции от "ФРОНДА Мебель".</span></p>\r\n            <p class="MsoNormal"><span times="" new="" style="font-size: 12pt;">Мебель для руководителей </span><strong><span class="editor-red"><span times="" new="" style="font-size: 12pt;">«РЕНОМЕ»</span></span></strong></p>\r\n            <table width="470" cellspacing="0" border="0">\r\n                <tbody>\r\n                    <tr width="470">\r\n                        <td class="fotoset fotoset-w140-h100-wh"><a class="fotoset-item" title="" href="/uploads/images/mebeli/phenome/1.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/phenome/1.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/phenome/2.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/phenome/2.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/phenome/3.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/phenome/3.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/phenome/4.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/phenome/4.jpg" width="200" height="144" alt=""> 			</a></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">Мебель для персонала </span><strong><span class="editor-red"><span style="font-size:12.0pt;font-family:" times="" new="">«ФОРМА»</span></span></strong></p>\r\n            <table width="470" cellspacing="0" border="0">\r\n                <tbody>\r\n                    <tr width="470">\r\n                        <td class="fotoset fotoset-w140-h100-wh"><a class="fotoset-item" title="" href="/uploads/images/mebeli/forma/1.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/forma/1.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/forma/2.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/forma/2.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/forma/3.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/forma/3.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/forma/4.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/forma/4.jpg" width="200" height="144" alt=""> 			</a></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n            <td width="35"> </td>\r\n            <td width="445" valign="top">\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">Мы рады сообщить , что генеральным поставщиком офисной мебели во все центры "Деловой" является компания "ФРОНДА МЕБЕЛЬ"  ( <a href="http://www.fronda.ru/">www.fronda.ru</a> )</span></p>\r\n            <p class="MsoNormal"> <span style="font-size:12.0pt;font-family:" times="" new=""><br>\r\n            Деловой всегда готов обсудить с клиентами вопрос о предоставлении дополнительной мебели из  коллекций компании "ФРОНДА МЕБЕЛЬ".</span></p>\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">Мебель для персонала </span><strong><span class="editor-red"><span style="font-size:12.0pt;font-family:" times="" new="">«ТеМ»</span></span></strong></p>\r\n            <table width="470" cellspacing="0" border="0">\r\n                <tbody>\r\n                    <tr width="470">\r\n                        <td class="fotoset fotoset-w140-h100-wh"><a class="fotoset-item" title="" href="/uploads/images/mebeli/tem/1.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/tem/1.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/tem/2.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/tem/2.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/tem/3.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/tem/3.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/tem/4.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/tem/4.jpg" width="200" height="144" alt=""> 			</a></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td width="445" valign="top">\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">We are glad to offer you different assortment of office furniture to make your work more comfortable. Cabinets, work desks, drawers and other furniture is included to the price of the rent. What is left to you - is to tell us how to arrange the furniture.</span></p>\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">In the office interiors we use Fronda Mebel collections.</span></p>\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">Executive`s office</span><span times="" new="" style="font-size: 12pt;"> </span><strong><span class="editor-red"><span times="" new="" style="font-size: 12pt;">«RENOME»</span></span></strong></p>\r\n            <table width="470" cellspacing="0" border="0">\r\n                <tbody>\r\n                    <tr width="470">\r\n                        <td class="fotoset fotoset-w140-h100-wh"><a class="fotoset-item" title="" href="/uploads/images/mebeli/phenome/1.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/phenome/1.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/phenome/2.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/phenome/2.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/phenome/3.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/phenome/3.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/phenome/4.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/phenome/4.jpg" width="200" height="144" alt=""> 			</a></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">Furniture for employees </span><strong><span class="editor-red"><span style="font-size:12.0pt;font-family:" times="" new="">«FORMA»</span></span></strong></p>\r\n            <table width="470" cellspacing="0" border="0">\r\n                <tbody>\r\n                    <tr width="470">\r\n                        <td class="fotoset fotoset-w140-h100-wh"><a class="fotoset-item" title="" href="/uploads/images/mebeli/forma/1.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/forma/1.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/forma/2.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/forma/2.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/forma/3.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/forma/3.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/forma/4.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/forma/4.jpg" width="200" height="144" alt=""> 			</a></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n            <td width="35"> </td>\r\n            <td width="445" valign="top">\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">We are glad to inform you that our general supplier of furniture to all the "Delovoy" office-centers is Fronda Mebel ( <a href="http://www.fronda.ru/">www.fronda.ru</a> )</span></p>\r\n            <p class="MsoNormal"> <span style="font-size:12.0pt;font-family:" times="" new=""><br>\r\n            "Delovoy" is always ready to discuss with you the possibility of supply of additional furniture from Fronda Mebel collection.</span></p>\r\n            <p class="MsoNormal"><span style="font-size:12.0pt;font-family:" times="" new="">Furniture for the employees </span><strong><span class="editor-red"><span style="font-size:12.0pt;font-family:" times="" new="">«TeM»</span></span></strong></p>\r\n            <table width="470" cellspacing="0" border="0">\r\n                <tbody>\r\n                    <tr width="470">\r\n                        <td class="fotoset fotoset-w140-h100-wh"><a class="fotoset-item" title="" href="/uploads/images/mebeli/tem/1.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/tem/1.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/tem/2.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/tem/2.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/tem/3.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/tem/3.jpg" width="200" height="144" alt=""> 			</a>  			 						<a class="fotoset-item" title="" href="/uploads/images/mebeli/tem/4.jpg" rel="fotoset3654"> 				 						<img src="/uploads/images/mebeli/tem/4.jpg" width="200" height="144" alt=""> 			</a></td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', 1, 60, 1, 'mebel'),
(2, 'IT поддержка', 'IT-support', '/uploads/images/icons/svg/server.svg', '/uploads/images/icons/computers_big.png', 'Теперь Вам не нужен штатный системный администратор.', 'From now on you do not need a salaried system administrator.', 'Теперь Вам не нужен штатный системный администратор. Специалисты офисного центра «Деловой» будут следить за работоспособностью компьютерного парка Вашей компании.', 'From now on you do not need a salaried system administrator. "Delovoy" office-centers specialists will supervise your computers working capacity.', '<p><span style="font-size:10.0pt;mso-bidi-font-size:12.0pt;\r\nfont-family:">Теперь Вам не нужен штатный системный администратор. Специалисты офисного центра «Деловой» будут следить за работоспособностью компьютерного парка Вашей компании. Вы всегда можете рассчитывать на их помощь в следующих вопросах:</span></p>\r\n<table width="100%" border="0" cellpadding="1">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <ul>\r\n                <li>Поддержка работоспособности компьютерного парка</li>\r\n                <li>Проведение технического аудита</li>\r\n                <li>Оптимизация работы компьютеров</li>\r\n                <li>Проведение полной диагностики и профилактических работ</li>\r\n                <li>Проверка операционной системы на наличие системных ошибок</li>\r\n                <li>Установка и настройка программного обеспечения, находящегося в эксплуатации, а также вновь установленного на рабочих станциях</li>\r\n                <li>Рекомендации по улучшению и оптимизации работы компьютерной техники</li>\r\n                <li>Удаленное администрирование</li>\r\n            </ul>\r\n            </td>\r\n            <td width="4%" valign="top"> </td>\r\n            <td width="48" valign="top">\r\n            <ul>\r\n                <li>Подбор и поиск драйверов</li>\r\n                <li>Лечение и удаление вирусов</li>\r\n                <li>Обновление антивирусных программ</li>\r\n                <li>Установка, замена компьютерных комплектующих</li>\r\n                <li>Установка, замена периферийных устройств</li>\r\n                <li>Обслуживание локальной сети</li>\r\n                <li>Настройка активного сетевого оборудования</li>\r\n                <li>Подключение и настройка компьютерной техники</li>\r\n                <li>Настройка операционных систем для получения доступа в Internet</li>\r\n                <li>Установка и настройка почтовых программ </li>\r\n            </ul>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', '<p><span style="font-size:10.0pt;mso-bidi-font-size:12.0pt;\r\nfont-family:">From now on you do not need a salaried system administrator. "Delovoy" office-centers specialists will supervise your computers working capacity. You can always count on them with following problems:</span></p>\r\n<table width="100%" border="0" cellpadding="1">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <ul>\r\n                <li>Support of your computer`s working capacity</li>\r\n                <li>Technical health check</li>\r\n                <li>Optimization of your computer`s work</li>\r\n                <li>Full diagnostic and maintenance</li>\r\n                <li>System error check of your operation system</li>\r\n                <li>Installation and adjustment of soft-ware that you are using and also the newly installed programs</li>\r\n                <li>Recommendations on improvement and optimization of your computers</li>\r\n                <li>Remote administration</li>\r\n                <li>Selection and search of drivers</li>\r\n            </ul>\r\n            </td>\r\n            <td width="4%" valign="top"> </td>\r\n            <td width="48" valign="top">\r\n            <ul>\r\n                <li>Treatment and deleting of viruses</li>\r\n                <li>Updating of the antivirus programs</li>\r\n                <li>Installation, change of computer details</li>\r\n                <li>Installation, change of external devices</li>\r\n                <li>Maintenance of local networks</li>\r\n                <li>Adjustment of active network equipment</li>\r\n                <li>Connection and adjustment of computer technique</li>\r\n                <li>Operation systems adjustment to get Internet connection</li>\r\n                <li>Installation and adjustment of mailing programs</li>\r\n            </ul>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', 1, 20, 1, 'kompyutery'),
(3, 'Интернет', 'Internet', '/uploads/images/icons/svg/wifi.svg', '/uploads/images/icons/new-icons/icon_internet_120.jpg', 'Интернет подведен к каждому рабочему месту. Вы можете прийти и сразу работать. Конверт с персональным паролем для Вашего офиса уже готов.', 'Internet is lead to all work places. You can come and start working. The envelope with a personal password for your office is ready.', 'Все офисы оснащены качественным высокоскоростным доступом в интернет. При этом часть трафика (от 3 до 5 Гб) входит в ежемесячную арендную плату. Также возможно подключение безлимитного интернета.', 'All offices are equipped with high quality high-velocity Internet connection. A month rent includes part of traffic (from 3 to 5 Gb) and you can get unlimited Internet connection.', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="48%">\r\n            <p><strong>Интернет для пакета </strong><span class="editor-red"><strong>«Офис Плюс»</strong></span><o:p></o:p></p>\r\n            <ul>\r\n                <li>Предоставление безлимитного доступа в интернет</li>\r\n                <li>Бесплатный интернет в переговорной комнате</li>\r\n                <li>Возможность самостоятельного контроля расхода интернет-трафика<o:p></o:p></li>\r\n            </ul>\r\n            <p><strong>Интернет для пакета </strong><span class="editor-red"><strong>«Стандарт»</strong></span><o:p></o:p></p>\r\n            <ul>\r\n                <li>Доступ в интернет до 5 Гб/мес.</li>\r\n                <li>Возможность подключения безлимитного интернета</li>\r\n                <li>Бесплатный интернет в переговорной комнате</li>\r\n                <li>Возможность самостоятельного контроля расхода интернет-трафика</li>\r\n            </ul>\r\n            <p> </p>\r\n            <p> </p>\r\n            <br>\r\n            <p class="editor-align-center"><strong>При этом технический  персонал "Делового" отвечает за качественную работу интернета и оперативно реагирует на любые нештатные ситуации.</strong></p>\r\n            <p class="editor-align-center"><strong>Это наша работа!</strong></p>\r\n            <p> </p>\r\n            <p> </p>\r\n            </td>\r\n            <td width="4%">\r\n            <p> </p>\r\n            <p> </p>\r\n            </td>\r\n</tr>\r\n    </tbody> \r\n</table>\r\n<p> </p>', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="48%">\r\n            <p><strong>Internet for <span class="editor-red">«Office Plus»</span> package</strong></p>\r\n            <ul>\r\n                <li>Unlimited internet connection.</li>\r\n                <li>Free internet connection in the meeting room</li>\r\n                <li>The possibility to control the internet traffic by yourself.</li>\r\n            </ul>\r\n            <p class="MsoNormal"><strong>Internet for <span class="editor-red">«Srandard»</span> package</strong></p>\r\n            <ul>\r\n                <li>Internet connection until 5 Gb per month</li>\r\n                <li>The possibility of unlimited internet connection</li>\r\n                <li>Free internet connection in the meeting room</li>\r\n                <li>The possibility to control the internet traffic by yourself.</li>\r\n             </ul>\r\n            <p> </p>\r\n            <p> </p>\r\n            <br>\r\n            <p class="editor-align-center"><strong>The  technical staff of "Delovoy" office-center is in charge of quality internet connection and they react without delay in any off-nominal situation.</strong></p>\r\n            <p class="editor-align-center"><strong>It''s our work!</strong></p>\r\n            <p> </p>\r\n            <p> </p>\r\n            </td>\r\n            <td width="4%">\r\n            <p> </p>\r\n            <p> </p>\r\n            </td>\r\n</tr>\r\n    </tbody> \r\n</table>\r\n<p> </p>', 1, 50, 1, 'internet');
INSERT INTO `service` (`id`, `title`, `title_en`, `icon_img_src`, `icon_big_img_src`, `headline`, `headline_en`, `annotation`, `annotation_en`, `body`, `body_en`, `is_main`, `sort_num`, `published`, `title_seo`) VALUES
(4, 'Секретарь', 'Secretary', '/uploads/images/icons/svg/secretary.svg', '/uploads/images/icons/new-icons/icon_secretary_120.jpg', 'Мы предложим пакет услуг секретаря, полностью удовлетворяющий все нужды Вашей компании.', 'We will offer you a full package of secretary services that is completely on a par with your requirements.', 'Вежливый и внимательный секретарь офисного центра «Деловой» примет входящие звонки от имени Вашей компании и предоставит звонящему всю необходимую информацию. Он передаст Вам все сообщения и соединит с нужным номером сотрудника.', 'Secretary as well as an accountant is needed in every company no matter what it does. But do you have to employ more people, even for a needed position?', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="445">\r\n            <p class="MsoNormal"><span style="font-size: 12pt; line-height: 115%; ">Секретарь, как и бухгалтер, необходим каждой компании, чем бы она ни занималась. Вот только нужно ли раздувать штат, пусть и за счет необходимого сотрудника? Качественное почтово-секретарское обслуживание можно получить и более выгодным путём!</span></p>\r\n            </td>\r\n            <td width="35"> </td>\r\n            <td valign="top" width="445">\r\n            <p class="MsoNormal"><span style="font-family: ''Times New Roman'', serif; font-size: 12pt; line-height: 115%; ">Нет, если Вы клиент офисного центра «Деловой». В зависимости от того, какими услугами Вы пользуетесь, мы предложим пакет услуг секретаря, полностью удовлетворяющий всем нуждам Вашей компании.</span></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>\r\n<table style="margin-left: 12.5pt; border: none; " border="1" cellpadding="0" cellspacing="0">\r\n    <tbody>\r\n        <tr style="height:31.2pt">\r\n            <th style="width:212.65pt;border:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="40%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"> <span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Наимено­вание   услуги</span></b></span></div>\r\n            </th>\r\n            <th style="width:92.1pt;border:solid windowtext 1.0pt;border-left:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="10%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"> <b><span style="font-size:12.0pt;Times New Roman">Аренда офиса</span></b></span></div>\r\n            </th>\r\n            <th style="width:134.7pt;border:solid windowtext 1.0pt;border-left:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="20%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"> <span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Аренда   перего­ворной комнаты</span></b></span></div>\r\n            </th>\r\n            <th style="width:120.5pt;border:solid windowtext 1.0pt;border-left:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="15%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"> <b><span style="font-size:12.0pt;Times New Roman">Видео­конферен­ция</span></b></span></div>\r\n            </th>\r\n            <th style="width:120.5pt;border:solid windowtext 1.0pt;border-left:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="15%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Виртуаль­ный офис</span></b></span></div>\r\n            </th>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Встреча   гостей</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Организация   кофе-брейка </span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Копирование,   сканирование, отправка факса, эл.почты, печать</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Заказ   канцтоваров</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Заказ   курьера</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Приём,   сортировка корреспонденции, уведомление о поступлении на эл. почту, пересылка   и хранение корреспонденции</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Проведение   предварительного  тестового звонка</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Приём,   обработка и переадресация звонков на городские и мобильные номера Москвы, РФ   и зарубежья</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">-<br>\r\n            </span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Передача   информации на мобильный телефон и по смс</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="48%">\r\n            <p>Secretary as well as an accountant is needed in every company no matter what it does. But do you have to employ more people, even for a needed position?</p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p class="MsoNormal">No, if you are a Client of  "Delovoy" office-center. Depending on what services you use we will offer you a package of secretary services that are completely in par with your requirements.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>\r\n<table style="margin-left: 12.5pt; border: none; " border="1" cellpadding="0" cellspacing="0" width="100%">\r\n    <tbody>\r\n        <tr style="height:31.2pt">\r\n            <th style="width:212.65pt;border:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" valign="middle" width="40%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"> <span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Service</span></b></span></div>\r\n            </th>\r\n            <th style="width:92.1pt;border:solid windowtext 1.0pt;border-left:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" valign="middle" width="15%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"> <span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Office rent</span></b></span></div>\r\n            </th>\r\n            <th style="width:134.7pt;border:solid windowtext 1.0pt;border-left:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" valign="middle" width="15%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"> <span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Meeting room rent</span></b></span></div>\r\n            </th>\r\n            <th style="width:120.5pt;border:solid windowtext 1.0pt;border-left:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" valign="middle" width="15%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"> <span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Video-conference</span></b></span></div>\r\n            </th>\r\n            <th style="width:120.5pt;border:solid windowtext 1.0pt;border-left:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" valign="middle" width="15%">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Virtual office</span></b></span></div>\r\n            </th>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Meeting of guests</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Coffee-break organization </span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Copying, scanning, sending of fax, e-mail, printing</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Order of office supplies</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Courrier</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Receiving, assortment of correspondence, notification of received e-mails, forwarding and storage of correspondence</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Preliminary test call</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Receiving, processing and forwarding of incoming calls to mobile and stationary numbers in Moscow, Russian Federation and foreign countries</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">-<br>\r\n            </span></b></span></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr style="height:31.2pt">\r\n            <td style="width:212.65pt;border:solid windowtext 1.0pt;border-top:\r\n            none;\r\n            padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="284">\r\n            <div style="margin-bottom: 0.0001pt; "><span style="font-size:12.0pt;Times New Roman">Information forwarding on a mobile phone or by sms</span></div>\r\n            </td>\r\n            <td style="width:92.1pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="123">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:134.7pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="180">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><b><span style="font-size:12.0pt;Times New Roman">-</span></b></div>\r\n            </td>\r\n            <td style="width:120.5pt;border-top:none;border-left:none;\r\n            border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="161">\r\n            <div style="margin-bottom: 0.0001pt; text-align: center; " align="center"><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">+</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', 1, 10, 1, 'sekretar');
INSERT INTO `service` (`id`, `title`, `title_en`, `icon_img_src`, `icon_big_img_src`, `headline`, `headline_en`, `annotation`, `annotation_en`, `body`, `body_en`, `is_main`, `sort_num`, `published`, `title_seo`) VALUES
(5, 'Курьер', 'Courier', '/uploads/images/icons/svg/delivery.svg', '/uploads/images/icons/courier_big.png', 'Содержать собственного курьера совсем необязательно.', 'You don''t have to employ your own courier', 'Услуги курьерской доставки помогут Вам оперативно обмениваться корреспонденцией с партнерами. Пунктуальность курьеров гарантируется.', 'Courier services will help you exchange documents with your partners. We guarantee the punctuality of our couriers.', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="48%">\r\n            <p class="MsoNormal"> Несмотря на мобильные телефоны, электронную почту и прочие современные средства коммуникации, курьерская почта продолжает оставаться жизненно важной для любой компании услугой. Финансовые документы и договора требуют подписи и печати, но отправлять к партнерам менеджеров неразумно: время, потраченное на поездку, можно провести с большей пользой для бизнеса.</p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p> Но и содержать собственного курьера совсем необязательно. Офисный центр «Деловой» вновь предлагает оптимизировать расходы Вашей компании, воспользовавшись специальными услугами.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table border="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td bordercolor="#FFF7FC" bgcolor="#FFF7FC" valign="top" width="48%">\r\n            <div style="margin-bottom: 0.0001pt; "><span class="editor-red"><b>Пакет «Ваш курьер»</b></span><b><span style="font-size:12.0pt;Times New Roman"> </span></b></div>\r\n            </td>\r\n            <td bordercolor="#FFF7FC" bgcolor="#FFF7FC" valign="top" width="4%"> </td>\r\n            <td bordercolor="#FFF7FC" bgcolor="#FFF7FC" valign="top" width="48%">\r\n            <div class="editor-align-center" style="margin-bottom: 0.0001pt; text-align: center; text-indent: 35.45pt; "><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Услуги курьера (по запросу)</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign="top" width="48%">\r\n            <p><strong>(курьерская доставка отправлений по Москве и Московской области)*</strong></p>\r\n            <p><span class="editor-red">Стоимость пакета — 2 000 руб./мес.</span></p>\r\n            <p>В стоимость включено:</p>\r\n            <ul>\r\n                <li>10 поездок в месяц (по Москве в пределах МКАД);</li>\r\n                <li>одна поездка за пределы МКАД до 10 км. = 3 поездки по Москве;</li>\r\n                <li>получение почтовых извещений = 2 поездки по Москве;</li>\r\n                <li>отправка писем = 2 поездки по Москве (не включая стоимости услуг Почты России)</li>\r\n                <li>Сдача отчетности – 1000 руб.</li>\r\n            </ul>\r\n            <p><em><strong>Услуга оказывается ежедневно с 10.00 до 19.00, кроме выходных и праздничных дней.</strong></em></p>\r\n            <p><em><strong>Доставка отправлений осуществляется в течение 24 часов.</strong></em></p>\r\n            <p><span class="editor-red">* вес отправления не должен превышать 1 кг. </span></p>\r\n            </td>\r\n            <td valign="top" width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p><b><span style="font-size:12.0pt;Times New Roman"> </span></b><strong>(курьерская доставка отправлений по Москве и Московской области)*</strong></p>\r\n            <p>Cтоимость :</p>\r\n            <ul>\r\n                <li>Поездка по Москве в пределах МКАД – 300 руб.;</li>\r\n                <li>Поездка за пределы МКАД до 10 км. – 700 руб.;</li>\r\n                <li>Получение писем по почтовым извещениям – 500 руб.;</li>\r\n                <li>Отправка писем – 500 руб. (не включая стоимости услуг Почты России)</li>\r\n                <li>Сдача отчетности в Пенсионный фонд, Фонд социального страхования – 1000 руб.</li>\r\n            </ul>\r\n            <p> <em><strong>Услуга оказывается ежедневно с 10.00 до 19.00, кроме выходных и праздничных дней.</strong></em></p>\r\n            <p><em><strong>Доставка отправлений осуществляется в течение 24 часов.</strong></em> </p>\r\n            <p><span class="editor-red">* вес отправления не должен превышать 1 кг. </span></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="48%">\r\n            <p class="MsoNormal"> Despite mobile phones, e-mails and other modern means of communication, courier post remains essential for every company. Financial documents and contracts require stamp and signature, but send them to partners with managers is not reasonable: the time spent on this journey can be spent more efficient for the company.</p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p> But to employ an own courier is not necessary. "Delovoy" office-center once again offers to optimize your expenses by using special services.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table border="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td bordercolor="#FFF7FC" bgcolor="#FFF7FC" valign="top" width="48%">\r\n            <div style="margin-bottom: 0.0001pt; "><span class="editor-red"><b>«Your courier» package</b></span></div>\r\n            </td>\r\n            <td bordercolor="#FFF7FC" bgcolor="#FFF7FC" valign="top" width="4%"> </td>\r\n            <td bordercolor="#FFF7FC" bgcolor="#FFF7FC" valign="top" width="48%">\r\n            <div class="editor-align-center" style="margin-bottom: 0.0001pt; text-align: center; text-indent: 35.45pt; "><span class="editor-red"><b><span style="font-size:12.0pt;Times New Roman">Courier services (on demand)</span></b></span></div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td valign="top" width="48%">\r\n            <p><strong>(courier delivery in Moscow and Moscow region)*</strong></p>\r\n            <p><span class="editor-red">Package price — 2 000 rub./month</span></p>\r\n            <p>The price includes:</p>\r\n            <ul>\r\n                <li>10 journeys a month (in Moscow within Moscow ring)</li>\r\n                <li>one journey out of Moscow ring = 3 journeys through Moscow</li>\r\n                <li>receiving of postal notification = 2 journeys through Moscow</li>\r\n                <li>Sending of letters = 2 journey through Moscow excluding the costs of Russian Post</li>\r\n            </ul>\r\n            <p><em><strong>This service is offered everyday from 10:00 till 19:00, excluding weekends and holidays.<br>\r\n            </strong></em></p>\r\n            <p><em><strong>The delivery is made within 24 hours.</strong></em></p>\r\n     <p><span class="editor-red">* weight of the package must not exceed 1 kg.</span></p>\r\n </td>\r\n            <td valign="top" width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p><b><span style="font-size:12.0pt;Times New Roman"> </span></b><strong>(courier delivery in Moscow and Moscow region)*</strong></p>\r\n            <p>Price:</p>\r\n            <ul>\r\n                <li>A journey in Moscow within Moscow ring - 300 rub.</li>\r\n                <li>one journey out of Moscow ring - 700 rub.</li>\r\n                <li>Receiving of postal notification - 500 rub.</li>\r\n                <li>Sending of letters - 500 rub. (1 journey through Moscow excluding the costs of Russian Post)</li>\r\n                <li>Report delivery to Pension Fund, Social Insurance Fund - 1000 rub.</li>\r\n            </ul>\r\n            <p> <em><strong>This service is offered everyday from 10:00 till 19:00, excluding weekends and holidays.</strong></em></p>\r\n            <p><em><strong>The delivery is made within 24 hours.</strong></em></p>\r\n            <p><span class="editor-red">* weight of the package must not exceed 1 kg.</span></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', 1, 30, 1, 'kurer'),
(7, 'Телефония', 'Telephony', '/uploads/images/icons/svg/telephone.svg', '/uploads/images/icons/new-icons/icon_telephony_120.jpg', 'Ваш новый офис обеспечен всеми услугами связи, при этом приобретать дорогостоящую офисную АТС не нужно.', 'Your new office will be equipped with all the communication services, and you don`t have to buy an expensive automatic telephone station.', 'Ваш новый офис обеспечен всеми услугами связи. Вы можете пользоваться многоканальными линиями с внутренней нумерацией, а разнообразные дополнительные услуги позволят оптимизировать работу с поступающими звонками.', 'Your new office will be equipped with all the communication services. You can use multichannel lines with internal numeration and different additional services can help you optimize the work with incoming calls.', '<div>Ваш новый офис обеспечен всеми услугами связи, при этом приобретать дорогостоящую офисную АТС не нужно. Вы можете пользоваться многоканальными линиями с внутренней нумерацией, а разнообразные дополнительные услуги позволят оптимизировать работу с поступающими звонками:  <br>\r\n </div>\r\n<table width="100%" border="0" cellpadding="1">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%">\r\n            <ul>\r\n                <li>Внутренние телефонные номера с возможностью перевода входящих вызовов по индивидуальному алгоритму</li>\r\n                <li>Переадресация входящих вызовов на мобильные и городские номера</li>\r\n                <li>Функция Автосекретарь: звонящий прослушивает предварительно записанное приветствие и самостоятельно набирает внутренний номер или получает ответ от оператора</li>\r\n                <li>Автоматическая или ручная запись разговоров для анализа ответов персонала и проведения тренингов.</li>\r\n                <li>Функция Автоответчик, позволяющая принимать и записывать голосовые сообщения с сохранением номера вызывающего абонента для каждого сообщения.</li>\r\n            </ul>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <ul>\r\n                <li>Функция Автоподсказчик, сообщающая о занятости вызываемого номера и времени, оставшемся до ответа сотрудника</li>\r\n                <li>Голосовая почта с возможностью создания и отправки персональных и широковещательных голосовых сообщений другим абонентам</li>\r\n                <li>Получение по электронной почте записанных голосовых сообщений</li>\r\n                <li>Текстовое телефонное меню, управление голосовыми почтовыми ящиками с возможностью просмотра, прослушивания и удаления голосовых сообщений при помощи системного телефона.</li>\r\n                <li>Запись звуковых фрагментов с последующим использованием при ожидании и переводе звонка.</li>\r\n            </ul>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p><span class="editor-red">Первые полтора месяца аренды офиса весь набор этих услуг предоставляется совершенно бесплатно, чтобы Вы могли попробовать и оценить функциональность каждой из них.</span></p>', '<div>Your new office will be equipped with all the communication services, and you don`t have to buy an expensive automatic telephone station. You can use multichannel lines with internal numeration and different additional services can help you optimize the work with incoming calls:<br>\r\n </div>\r\n<table width="100%" border="0" cellpadding="1">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <ul>\r\n                <li>Internal telephone numbers with possibility to forward your incoming calls according to the individual algorithm.</li>\r\n                <li>Incoming calls forwarding to the stationary and mobile numbers.</li>\r\n                <li>Autosecretary function: the calling party listens to the prewritten greeting and dials the internal number by itself or waits for the answer of an operator.</li>\r\n                <li>Automatic or manual recording of the conversation for employee`s answers analysis and leading of trainings.</li>\r\n                <li>Auto answer function that allows receiving and recording of voice mail with saving of every incoming number.</li>\r\n            </ul>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <ul>\r\n                <li>Auto prompt function that informs you of the business of the line and the remaining time  to the answer.</li>\r\n                <li>Voice mail with the possibility to create and send voice massages to other subscribers.</li>\r\n                <li>Receiving of recorded voice mail messages per e-mail</li>\r\n                <li>Text telephone menu, voice mail boxes control, listening through and deleting of voice messages with use of system telephone.</li>\r\n                <li>Recording of sound fragments and their use during waiting and forwarding of the calls.</li>\r\n            </ul>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p><span class="editor-red">The first one and a half month of the office rent all this services are offered for free so that you could try and consider the functionality of all of them. </span></p>', 1, 40, 1, 'telefoniya'),
(10, 'Почтовый адрес', 'Coworking', '/uploads/images/icons/svg/address.svg', '/uploads/images/icons/new-icons/icon-coworking-120.jpg', 'Коворкинг - английское современное слово, нашедшее сторонников и применение в Москве. В последнее время он стал довольно популярным видом деятельности.', NULL, 'Коворкинг - английское современное слово, нашедшее сторонников и применение в Москве. В последнее время он стал довольно популярным видом деятельности.', NULL, '<table border="0" cellpadding="1" width="100%">\r\n  <tbody>\r\n    <tr>\r\n      <td width="48%" valign="top">\r\n        <p>Под коворкингом подразумевается одновременная работа нескольких людей над каким-либо проектом в одном помещении офиса. Такое место, где работают совместно, называют коворкинг – центр. Помещения представляют собой офисы со свободным доступом к современной офисной технике, с возможностью работать в Интернете и комнатами общего пользования.</p>\r\n        <p>Требования к участнику коворкинга минимальные. В данном проекте могут работать люди разных специальностей и социального положения. Это могут быть и предприниматели, не снимающие себе офис.</p>\r\n        <p>Работа в коворкинг-центре дает возможность ежедневно общаться со своими единомышленниками, обмениваться опытом, расширять полезный круг знакомств. Рабочая обстановка центра помещения дает установку на работу, и в то же время, человек остается сам себе хозяином. Коворкинг аренда комнаты дарит уникальную возможность объединения нескольких людей или компанией для работы над одним проектом.</p>\r\n        <p>Оплата за работу в коворкинге производится с учетом места, где работает человек. Вполне очевидно, что личное рабочее место в помещении, где расположен офис оплачивается лучше, чем случайное.</p>\r\n      </td>\r\n      <td width="4%"> </td>\r\n      <td width="48%" valign="top">\r\n        <p>Компания «Деловой» предлагает услугу офисного коворкинга в рамках современного мультифункционального бизнес-центра. Если вы хотите сохранить свою независимость, но при этом работать в небольшом современном офисе в комфортных для вас условиях, офисный коворкинг в Москве – это оптимальный для Вас вариант.</p>\r\n        <p>К примеру, будучи фрилансером, программистом, дизайнером, вам намного удобнее будет подобрать хороший офисный Coworking центр, чем работать на дому. Ведь рабочая обстановка и комфорт, который предлагают коворкинг центры, существенно повышает эффективность труда и ликвидирует все отвлекающие факторы. Вы ни от кого не зависите, но имеете свое рабочее место в отдельном современном офисе и все условия для эффективного труда.</p>\r\n        <p>Не стоит забывать, что офисный коворкинг – это еще и благотворная социальная среда. Вы будете общаться с профессионалами и заводить новые деловые знакомства, что всегда полезна для бизнеса. Ведь рядом с Вами работают такие же небольшие, но уже состоявшиеся, компании. При этом полностью оборудованное рабочее место от компании «Деловой» стоит совсем недорого, но обеспечивает все потребности для эффективной работы.</p>\r\n        <p>Потому, если вы хотите работать в профессиональной среде среди единомышленников, офисный коворкинг центр в Москве – оптимальный для Вас выбор. Аренда рабочих мест имеет выгодную цену, при этом условия для работы создаются самые благоприятные. Аренда рабочего места в Москве с сохранением полной свободы и независимости – лучший выбор для креативных бизнесменов!</p>\r\n      </td>\r\n    </tr>\r\n  </tbody>\r\n</table>', '<p><!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--></p>\r\n<p class="MsoNormal" style="text-align:justify">C<span style="mso-ansi-language:EN-US" lang="EN-US">oworking is a modern English word that has found its supporters and use in Moscow. It has recently become a popular form of activity.</span><span style="mso-ansi-language:EN-US" lang="EN-US"> </span></p>\r\n<p class="MsoNormal" style="text-align:justify"><span style="mso-ansi-language:EN-US" lang="EN-US">By coworking they mean a concurrent project work of several people in one office. This place of concurrent work is called – coworking center. The working areas are offices with free access to modern office appliances, Internet connection and rooms for communal use. </span><span style="mso-ansi-language:EN-US" lang="EN-US"> </span></p>\r\n<p class="MsoNormal" style="text-align:justify"><span style="mso-ansi-language:EN-US" lang="EN-US">The requirements for a coworking participant are minimal. People of different professions and social standing can take part in this project. This can be also business-men who don`t rent an office.</span><span style="mso-ansi-language:EN-US" lang="EN-US"> </span></p>\r\n<p class="MsoNormal" style="text-align:justify"><span style="mso-ansi-language:EN-US" lang="EN-US">Work in a coworking-center gives you an opportunity to communicated with like-minded persons, share experience, extend your social circle. Working environment of the center makes a setting to work and in the meantime the person belongs only to himself. Coworking rent of a room gives you a unique opportunity to connect several people or companies to work on one project.</span><span style="mso-ansi-language:EN-US" lang="EN-US"> </span></p>\r\n<p class="MsoNormal" style="text-align:justify"><span style="mso-ansi-language:EN-US" lang="EN-US">The payment for coworking is made according to a place, where the person is working. This is obvious that a personal working place is paid better than an occasional one.</span></p>\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>RU</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Обычная таблица";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:"Times New Roman","serif";}\r\n</style>\r\n<![endif]-->\r\n<p> </p>', 0, 100, 1, 'kovorking');
INSERT INTO `service` (`id`, `title`, `title_en`, `icon_img_src`, `icon_big_img_src`, `headline`, `headline_en`, `annotation`, `annotation_en`, `body`, `body_en`, `is_main`, `sort_num`, `published`, `title_seo`) VALUES
(12, 'Юрист', 'Lawyer', '/uploads/images/icons/svg/law1.svg', '/uploads/images/icons/lawyer_120.png', NULL, NULL, 'Мы предусмотрели для Вас полный комплекс услуг, связанных с регистрацией юридических лиц и ИП, регистрацией изменений к учредительным документам любых компаний, а также реорганизацией и ликвидацией. Корпоративный юрист придет прямо к Вам в офис и проконсультирует по любым вопросам регистрации юридических лиц.', 'Мы предусмотрели для Вас полный комплекс услуг, связанных с регистрацией юридических лиц и ИП, регистрацией изменений к учредительным документам любых компаний, а также реорганизацией и ликвидацией. Корпоративный юрист придет прямо к Вам в офис и проконсультирует по любым вопросам регистрации юридических лиц.', '<p><style type="text/css">\r\n	.bold {\r\n		font-weight: bold;\r\n	}\r\n	.align {\r\n		text-align: center;\r\n	}\r\n.g-bordered{border-style: none!important;}\r\n	.g-bordered tr th {\r\n		color: #ffffff;\r\n		background: #cf004c;\r\n		padding: 5px;\r\n		font-size: 13px;\r\n		border-color: #cf004c!important;\r\n	}\r\n.g-bordered td{ border-width: 1px 0 1px;\r\nborder-style: solid;\r\nborder-color: #d1d1d1!important;\r\npadding: 5px!important;}\r\n\r\n</style></p>\r\n<p class="bold align">УСЛУГИ ЮРИСТА</p>\r\n<table class="g-bordered" width="100%">\r\n    <thead>\r\n        <tr>\r\n            <th colspan="2" class="bold align">Оказываемые услуги</th>\r\n            <th class="bold align">Срок оказания услуги</th>\r\n            <th class="bold align">Стоимость услуги</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td rowspan="3" class="bold align">Регистрация коммерческих организаций с российским капиталом</td>\r\n            <td>Общество с ограниченной ответственностью</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">8 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Закрытое акционерное общество</td>\r\n            <td class="align">15 рабочих дней</td>\r\n            <td class="align">10 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Открытое акционерное общество</td>\r\n            <td class="align">15 рабочих дней</td>\r\n            <td class="align">10 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Регистрация коммерческих организаций с иностранным капиталом (ООО, ЗАО, ОАО)</td>\r\n            <td class="align">15 рабочих дней</td>\r\n            <td class="align">10 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Открытие филиалов российских коммерческих организаций</td>\r\n            <td class="align">20 рабочих дней</td>\r\n            <td class="align">8 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Регистрация Индивидуальных предпринимателей</td>\r\n            <td class="align">15 рабочих дней</td>\r\n            <td class="align">5 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Регистрация некоммерческих организаций:<br>\r\n            Фонд; Некоммерческое партнерство; Автономная некоммерческая организация;<br>\r\n            Союз и Ассоциация</td>\r\n            <td class="align">20 рабочих дней</td>\r\n            <td class="align">15 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td rowspan="5" class="bold align">Реорганизация предприятий</td>\r\n            <td>Слияние</td>\r\n            <td rowspan="5" class="bold align">от 3-х месяцев</td>\r\n            <td rowspan="5" class="bold align">от 70 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Присоединение</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Выделение</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Разделение</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Преобразование</td>\r\n        </tr>\r\n        <tr>\r\n            <td rowspan="11" class="bold align">Регистрация изменений</td>\r\n            <td>Смена Руководителя</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 3 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Смена места нахождения</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 5 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Смена наименования</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 5 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Изменения состава участников и их долей</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Увеличение Уставного капитала</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Уменьшение Уставного капитала</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Приведение Устава Общества в соответствии с 312-ФЗ</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 3 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Внесение изменений в сведения об участниках и Генеральном директоре</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 3 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Простая продажа доли или акций юр. Лица</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Нотариальная продажа доли или акций</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Смена ОКВЭД</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">от 5 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td rowspan="2" class="bold align">Ликвидация</td>\r\n            <td>Юридическое лицо</td>\r\n            <td class="align">от 4-х месяцев</td>\r\n            <td class="align">40 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Индивидуальный предприниматель</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Аккредитация филиалов и представительств иностранных юридических лиц</td>\r\n            <td class="align">20 рабочих дней</td>\r\n            <td class="align">15 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Предоставление Выписки ЕГРЮЛ, ЕГРИП</td>\r\n            <td class="align">до 5-ти рабочих дней</td>\r\n            <td class="align">1 500</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Регистрация выпуска акций при учреждении ЗАО/ОАО в региональном ФСФР</td>\r\n            <td class="align">от 30-ти рабочих дней</td>\r\n            <td class="align">от 15 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Регистрация дополнительного выпуска акций ЗАО/ОАО в региональном ФСФР</td>\r\n            <td class="align">от 30-ти рабочих дней</td>\r\n            <td class="align">от 20 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Подготовка и сопровождение документов (уведомление и ходатайство) в ФАС России</td>\r\n            <td class="align">от 20-ти рабочих дней</td>\r\n            <td class="align">от 25 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Строительные лицензии, вступление в СРО</td>\r\n            <td class="align">от 20-ти рабочих дней</td>\r\n            <td class="align">от 550 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Изготовление печати</td>\r\n            <td class="align">от 3-х рабочих дней</td>\r\n            <td class="align">1 500</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<style type="text/css">\r\n  .bold {\r\n    font-weight: bold;\r\n  }\r\n  .align {\r\n    text-align: center;\r\n  }\r\n.g-bordered{border-style: none!important;}\r\n  .g-bordered tr th {\r\n    color: #ffffff;\r\n    background: #cf004c;\r\n    padding: 5px;\r\n    font-size: 13px;\r\n    border-color: #cf004c!important;\r\n  }\r\n.g-bordered td{ border-width: 1px 0 1px;\r\nborder-style: solid;\r\nborder-color: #d1d1d1!important;\r\npadding: 5px!important;}\r\n\r\n</style>\r\n<p class="bold align">LAWYER SERVICES</p>\r\n<table class="g-bordered" width="100%">\r\n    <thead>\r\n        <tr>\r\n            <th colspan="2" class="bold align">Services rendered</th>\r\n            <th class="bold align">Time of performance</th>\r\n            <th class="bold align">Price</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td rowspan="3" class="bold align">Registration of commercial organization with Russian capital </td>\r\n            <td>Limited liability company</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">8 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Closed joint stock company</td>\r\n            <td class="align">15 working days</td>\r\n            <td class="align">10 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Joint stock company</td>\r\n            <td class="align">15 working days</td>\r\n            <td class="align">10 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Registration of commercial organization with foreign capital (LLC, CJSC, JSC)</td>\r\n            <td class="align">15 working days</td>\r\n            <td class="align">10 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Opening of branches of Russian commercial organizations</td>\r\n            <td class="align">20 working days</td>\r\n            <td class="align">8 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Registration of Individual entrepreneurs</td>\r\n            <td class="align">15 working days</td>\r\n            <td class="align">5 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">\r\n              Registration of noncommercial organizations:<br>\r\n              Fund; Nonprofit partnership; Autonomous noncommercial organization;<br>\r\n              Union and Association\r\n            </td>\r\n            <td class="align">20 working days</td>\r\n            <td class="align">15 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td rowspan="5" class="bold align">Corporate restructuring</td>\r\n            <td>Merger</td>\r\n            <td rowspan="5" class="bold align">from 3 month</td>\r\n            <td rowspan="5" class="bold align">from 70 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Affiliation</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Company Spin-off</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Demerge</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Reconstruction</td>\r\n        </tr>\r\n        <tr>\r\n            <td rowspan="11" class="bold align">Registration of changes</td>\r\n            <td>Change of Manger</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 3 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Change of principal establishment</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 5 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Change of name</td>\r\n            <td class="align">10 рабочих дней</td>\r\n            <td class="align">from 5 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Change of members and their interests</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Increase of Share capital</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Capital reduction</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Formalization of Articles of Association in accordance with Federal Law 312-ФЗ</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 3 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Introduction of amendments to the data about the Partners or General manager</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 3 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Simple interest or stock sale of juridical person</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Notarial interest or stock sale</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Change of OKVED</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">from 5 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td rowspan="2" class="bold align">Liquidation</td>\r\n            <td>Juridical person</td>\r\n            <td class="align">from 4 month</td>\r\n            <td class="align">40 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Individual Entrepreneur</td>\r\n            <td class="align">10 working days</td>\r\n            <td class="align">7 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Accreditation of branches and representations of foreign juridical persons</td>\r\n            <td class="align">20 working days</td>\r\n            <td class="align">15 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Extract from the Unified State Register of Legal Entities, Uniform State Register of Individual Entrepreneurs</td>\r\n            <td class="align">Up to 5 working days</td>\r\n            <td class="align">1 500</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Registration of stock issue during the founding of CJSC/JSC in regional FFMS</td>\r\n            <td class="align">from 30 working days</td>\r\n            <td class="align">from 15 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Registration of additional stock issue of CJSC/JSC in regional FFMS</td>\r\n            <td class="align">from 30 working days</td>\r\n            <td class="align">from 20 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Preparing and document support (declaration and request) in FAS Russia </td>\r\n            <td class="align">from 20 working days</td>\r\n            <td class="align">from 25 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Building permit, entry to SRO</td>\r\n            <td class="align">from 20 working days</td>\r\n            <td class="align">from 550 000</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="2" class="bold align">Preparation of seal</td>\r\n            <td class="align">from 3 working days</td>\r\n            <td class="align">1 500</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', 1, 80, 1, 'yurist');
INSERT INTO `service` (`id`, `title`, `title_en`, `icon_img_src`, `icon_big_img_src`, `headline`, `headline_en`, `annotation`, `annotation_en`, `body`, `body_en`, `is_main`, `sort_num`, `published`, `title_seo`) VALUES
(13, 'Поиск персонала', 'Sourcing', '/uploads/images/icons/svg/hr.svg', '/uploads/images/icons/headhunt_120.png', NULL, NULL, 'Испытываете потребность обновить коллектив, но не хватает времени? Мы упростим процесс поиска и найдем кадры, которые решат всё. В Вашу пользу.', 'Испытываете потребность обновить коллектив, но не хватает времени? Мы упростим процесс поиска и найдем кадры, которые решат всё. В Вашу пользу.', '<p><span style="font-size:12.0pt;\r\nmso-bidi-font-size:11.0pt;line-height:115%;font-family:"Times New Roman","serif"">Каждый работодатель знает, что правильный подбор персонала – основа стратегии процветания. Хороший сотрудник удваивает эффективность компании, плохой уменьшает ее наполовину. </span></p>\r\n<p>\r\n</p><p style="text-align:justify" class="MsoNormal"><span style="font-size:12.0pt;\r\nmso-bidi-font-size:11.0pt;line-height:115%;font-family:"Times New Roman","serif"">Испытываете потребность обновить коллектив, но не хватает времени? Мы упростим процесс поиска и найдем кадры, которые решат всё. В вашу пользу.</span></p>\r\n<p style="text-align:justify" class="MsoNormal"><span style="font-size:12.0pt;\r\nmso-bidi-font-size:11.0pt;line-height:115%;font-family:"Times New Roman","serif"">Суть нашей </span><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;\r\nline-height:115%;font-family:"Times New Roman","serif";mso-ansi-language:EN-US" lang="EN-US">HR</span><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%;font-family:\r\n"Times New Roman","serif"">-услуги заключается в подготовке продуманного списка требований к кандидату на основании Ваших пожеланий, размещении вакансии на популярных интернет-ресурсах по подбору персонала (</span><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%;font-family:\r\n"Times New Roman","serif";mso-ansi-language:EN-US" lang="EN-US">superjob</span><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%;font-family:\r\n"Times New Roman","serif"">.</span><span style="font-size:12.0pt;\r\nmso-bidi-font-size:11.0pt;line-height:115%;font-family:"Times New Roman","serif";\r\nmso-ansi-language:EN-US" lang="EN-US">ru</span><span style="font-size:12.0pt;mso-bidi-font-size:\r\n11.0pt;line-height:115%;font-family:"Times New Roman","serif"">, </span><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%;\r\nfont-family:"Times New Roman","serif";mso-ansi-language:EN-US" lang="EN-US">hh</span><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%;font-family:\r\n"Times New Roman","serif"">.</span><span style="font-size:12.0pt;\r\nmso-bidi-font-size:11.0pt;line-height:115%;font-family:"Times New Roman","serif";\r\nmso-ansi-language:EN-US" lang="EN-US">ru</span><span style="font-size:12.0pt;mso-bidi-font-size:\r\n11.0pt;line-height:115%;font-family:"Times New Roman","serif"">) и отправке на Вашу электронную почту наиболее перспективных резюме. Вам останется только выбрать, кого пригласить на собеседование. </span></p>\r\n<p style="text-align:justify" class="MsoNormal"><span style="font-size:12.0pt;\r\nmso-bidi-font-size:11.0pt;line-height:115%;font-family:"Times New Roman","serif"">Стоимость опции демократична – всего 2 950 руб. в месяц за публикацию 1 предложения о работе и пересылку неограниченного количества откликов.</span></p>\r\n<!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Обычная таблица";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:"Calibri","sans-serif";}\r\n</style>\r\n<![endif]--><p></p>', '<p> <!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><br>\r\n<span style="mso-ansi-language:EN-US" lang="EN-US">Every employer knows that right choice of staff is the basis of success strategy. A good employee doubles the company’s effectiveness, a bad one lessens it by half.</span><span style="mso-ansi-language:EN-US" lang="EN-US"> </span></p>\r\n<p class="MsoNormal" style="text-align:justify"><span style="mso-ansi-language:EN-US" lang="EN-US">Do you need to renew your staff, but you don`t have time for it? We will make the search process easier and find you people who will solve everything. To your credit.</span><span style="mso-ansi-language:EN-US" lang="EN-US"> </span></p>\r\n<p class="MsoNormal" style="text-align:justify"><span style="mso-ansi-language:EN-US" lang="EN-US">The content of our HR-service is in preparation of a well-advised list of requirements according to your wishes, placing of a vacancy on popular sourcing Internet-sites (superjob.ru, hh.ru) and sending you e-mail with the most promising curriculum vitae. You just have to choose whom to invite for an interview. </span><span style="mso-ansi-language:EN-US" lang="EN-US"> </span></p>\r\n<p class="MsoNormal" style="text-align:justify"><span style="mso-ansi-language:EN-US" lang="EN-US">The price of this service is quite affordable – just 2 950 rub. per month for 1 job offer publication and forwarding of unlimited quantity of replies. </span></p>\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>RU</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Обычная таблица";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin:0cm;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:"Times New Roman","serif";}\r\n</style>\r\n<![endif]-->\r\n<p> </p>', 1, 70, 1, 'poisk-personala'),
(14, 'Юридический адрес ', '', '/uploads/images/icons/svg/law.svg', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 90, 1, NULL),
(15, 'Видео конференция', '', '/uploads/images/icons/svg/videoconf.svg', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 110, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `service2service_group`
--

DROP TABLE IF EXISTS `service2service_group`;
CREATE TABLE IF NOT EXISTS `service2service_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `service_group_id` int(11) NOT NULL,
  `is_inclusive` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_id` (`service_id`,`service_group_id`),
  KEY `service_group_id` (`service_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=273 ;

--
-- Дамп данных таблицы `service2service_group`
--

INSERT INTO `service2service_group` (`id`, `service_id`, `service_group_id`, `is_inclusive`) VALUES
(229, 4, 1, 1),
(230, 2, 1, 0),
(232, 5, 1, 0),
(233, 7, 1, 0),
(234, 3, 1, 1),
(235, 1, 1, 1),
(237, 13, 1, 0),
(238, 12, 1, 0),
(239, 10, 1, 1),
(241, 14, 1, 0),
(243, 4, 2, 1),
(244, 2, 2, 0),
(245, 5, 2, 0),
(246, 7, 2, 0),
(247, 3, 2, 1),
(248, 1, 2, 1),
(249, 13, 2, 0),
(250, 12, 2, 0),
(251, 10, 2, 1),
(252, 14, 2, 0),
(253, 4, 3, 1),
(254, 2, 3, 0),
(255, 5, 3, 0),
(256, 7, 3, 0),
(259, 13, 3, 0),
(260, 12, 3, 0),
(261, 10, 3, 0),
(262, 14, 3, 0),
(263, 4, 4, 1),
(264, 2, 4, 0),
(265, 5, 4, 0),
(266, 7, 4, 0),
(267, 3, 4, 1),
(268, 1, 4, 1),
(269, 13, 4, 0),
(270, 12, 4, 0),
(271, 15, 4, 0),
(272, 14, 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `service_group`
--

DROP TABLE IF EXISTS `service_group`;
CREATE TABLE IF NOT EXISTS `service_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `icon_img_src` varchar(255) NOT NULL DEFAULT '',
  `icon_big_img_src` varchar(255) NOT NULL DEFAULT '',
  `annotation` text,
  `annotation_en` text,
  `body` text,
  `body_en` text,
  `body2` text,
  `body2_en` text,
  `headline` varchar(255) DEFAULT NULL,
  `headline_en` varchar(255) DEFAULT NULL,
  `css_signature` varchar(16) NOT NULL,
  `price_term` varchar(64) DEFAULT NULL,
  `price_term_en` varchar(64) DEFAULT NULL,
  `sort_num` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `title_seo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_sef` (`title_seo`),
  KEY `css_signature` (`css_signature`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `service_group`
--

INSERT INTO `service_group` (`id`, `title`, `title_en`, `icon_img_src`, `icon_big_img_src`, `annotation`, `annotation_en`, `body`, `body_en`, `body2`, `body2_en`, `headline`, `headline_en`, `css_signature`, `price_term`, `price_term_en`, `sort_num`, `published`, `title_seo`) VALUES
(1, 'Аренда офисов', 'Offices for rent', '/uploads/images/icons/rent.png', '/uploads/images/icons/rent_big.gif', 'Сеть офисных центров «Деловой» самое пристальное  внимание уделяет как уровню профессиональной подготовки персонала, так и интерьеру офисных мест, переговорных комнат.', '“Delovoy” office-centers network pays attention to the professional level of staff as well as to the interior of office spaces and meeting rooms.', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="445">\r\n            <h3>Необходимо снять офис в Бизнес-центре рядом с метро и/или в центре города? Обращайтесь в «Деловой»!</h3>\r\n            </td>\r\n            <td width="35"> </td>\r\n            <td valign="top" width="445">\r\n            <h3>Аренда маленьких помещений<br>\r\n            Ищете офис? Получите больше!</h3>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="445">\r\n            <p>Обилие объявлений «Офисы в аренду» лишь создают впечатление того, что снять недорогой, но комфортабельный офис в Москве – проще простого. На деле поиск подходящего предложения по аренде офиса в БЦ может превратиться в настоящее приключение: даже когда подходящее помещение будет найдено, Вам предстоит ремонт, переезд, покупка оргтехники и другие заботы.</p>\r\n            </td>\r\n            <td width="35"> </td>\r\n            <td valign="top" width="445">\r\n            <p>Может, проще снять готовый офис? Например, готовый офис с компьютерной техникой, в котором можно начать работать хоть сегодня? На первый взгляд такой вариант может показаться более дорогим, но это впечатление обманчиво. Вы можете сэкономить не  только деньги, но и время.</p>\r\n            <p>«Деловой» предлагает аренду офисов в Москве от собственника — то есть максимально недорого, поскольку отсутствует добавленная  комиссия посредников. Мы можем предложить как маленькие офисы для небольших компаний, так и просторные помещения для  более крупных организаций. Также мы предоставляем услугу почасовой аренды офиса. Снять офис в Москве без посредников и, следовательно, без комиссии – это недорого и, безусловно, такое решение будет лучшим для Вашего бизнеса.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<div>\r\n  <h3>Ознакомьтесь с презентацией!</h3>\r\n  <div data-configid="7286163/6896997" style="width: 400px; height: 283px;" class="issuuembed"></div><script type="text/javascript" src="//e.issuu.com/embed.js" async="true"></script>\r\n</div>', '<h3>Search for an office? Get more!</h3>\r\n<table>\r\n    <tbody>\r\n        <tr>\r\n            <td width="445" valign="top">\r\n<p>The plentitude of announcements “Offices for rent” only create an impression that it is very easy to find a budget-priced and comfortable office in Moscow. But in practice the search of a suitable offer can become quite an adventure: even when the suitable space will be found, you have a renovation, moving, purchase of office appliances and other worries ahead of you.</p>\r\n            </td>\r\n            <td width="35"> </td>\r\n            <td width="445" valign="top">\r\n<p>May be it is easier to rent a ready-made office? A kind of office you can start to work in today? At first sight this solution can occur more expensive, but this is a false impression. You can save not only money, but also your time.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<h3>Бизнес-центр «Деловой» предлагает офисы «на всем готовом», которые позволят Вам не только приступить к делу немедленно, но и значительно сэкономить. Как и на чем – давайте разберемся.</h3>\r\n<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="450">\r\n            <table width="100%">\r\n                <tbody>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/personal.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Экономия на персонале</big></strong></h2>\r\n                        <p>Входящие звонки примут вежливые и профессиональные специалисты офисного центра «Деловой». Ни один звонок, сделанный в Ваш офис, не останется без ответа. Вам больше не нужен системный администратор. Ваши компьютеры и офисная сеть будут под присмотром специалистов офисного центра, абонентская плата за эту услугу – от 500 рублей в месяц.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/security.png" alt=""></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Экономия на охране</big></strong></h2>\r\n                        <p>Вам не понадобится устанавливать охранные системы и нанимать лишний персонал. Ваш офис в центре «Деловой» - под круглосуточным видеонаблюдением и защитой систем контроля доступа. В ночное время «Деловой» охраняется сотрудниками частного охранного предприятия.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/furniture.png" alt=""></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Экономия на мебели</big></strong></h2>\r\n                        <p>Забудьте о пустом офисе. Вся необходимая мебель – рабочие столы, шкафы, тумбочки, - будут предоставлены вам без дополнительной платы. Вам останется только придумать расположение мебели в офисе.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/internet.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Экономия на интернете</big></strong></h2>\r\n                        <p>До пяти гигабайт уже включены в стоимость аренды офиса. Если Вам нужен безлимитный интернет – мы сможем подключить и эту услугу .</p>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n            <td width="30"><br>\r\n             </td>\r\n            <td valign="top" width="480">\r\n            <table width="100%">\r\n                <tbody>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/meter.png" alt="" height="45" width="45">  </td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Экономия на квадратных метрах</big></strong></h2>\r\n                        <p>Чтобы всегда иметь под рукой комнату для переговоров или зал для проведения тренинга, не обязательно платить за это. Арендуйте переговорные комнаты в офисном центре «Деловой», оплачивая их по часам.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/technik.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Экономия на оргтехнике</big></strong></h2>\r\n                        <p>Зачем покупать компьютеры и копиры, когда их можно взять в аренду? Выгодные цены на эту услугу делают такое решение особенно привлекательным. Вам не придется брать на баланс и амортизировать то, что устареет всего через пару лет. Обслуживание техники входит в стоимость ее аренды, поэтому не беспокойтесь за ее работоспособность.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/phone.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Экономия на телефонии</big></strong></h2>\r\n                        <p>У вас уже есть офисная АТС. Как вы уже, наверное, догадались, покупать и настраивать ее не нужно. Вы можете в течение первых 1,5 месяцев бесплатно попробовать и оценить функциональные возможности каждой телекоммуникационной услуги.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/image.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Экономия на имидже</big></strong></h2>\r\n                        <p>Офисные центры «Деловой» расположены в престижных Бизнес-центрах. И внешний, и внутренний виды Вашего нового офиса будут работать на имидж и деловую репутацию.</p>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<h3>“Delovoy” office-center offers you offices on a turn-key basis that allow you not only to start working immediately, but also to save money. How and on what, let''s see.</h3>\r\n<table>\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="450">\r\n            <table width="100%">\r\n                <tbody>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/personal.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Saving on staff<br>\r\n                        </big></strong></h2>\r\n                        <p>All incoming calls will be answered by polite and professional specialist of “Delovoy” office center. Not one call will be left unanswered. You don`t need a system administrator any more, your computers and office network will be under control of office-center specialists, recurring fees for this service is 500 Rubles per month.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/security.png" alt=""></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Saving on security</big></strong></h2>\r\n                        <p>You don`t have to install security systems and employ additional staff. “Delovoy” office-centers are under twenty-four-hour video surveillance and access-control systems protection. At night “Delovoy” is guarded by officers of private security agency.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/furniture.png" alt=""></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Saving on furniture</big></strong></h2>\r\n                        <p>Forget about empty office. All required furniture – work desks, cabinets, drawer units – will be offered to you without additional payment. You will just have to think about the arrangement of furniture in your office.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/internet.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Saving on Internet</big></strong></h2>\r\n                        <p>Up to 5 Gigabytes are already included to the price of the rent. If you need unlimited Internet access – you can get it.</p>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n            <td width="30"><br>\r\n             </td>\r\n            <td valign="top" width="480">\r\n            <table width="100%">\r\n                <tbody>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/meter.png" alt="" height="45" width="45">  </td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Saving on square meters</big></strong></h2>\r\n                        <p>You don`t have to pay to always have a meeting room or a hall for training. Rent meeting rooms in “Delovoy” business-centers paying for them per hour.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/technik.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Saving on office appliances</big></strong></h2>\r\n                        <p>Why pay for computers and copiers when you can rent them? Favorable prices for this service make this solution more attractive. You don`t have to take in the books and depreciate something that will be out of date in a couple of years. Maintenance of the technic is included to the price of its rent, so don`t be worried about its performance.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/phone.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Saving on telephony</big></strong></h2>\r\n                        <p>You already have an office an automatic telephone station. As you, probably, already guessed, you don`t have to buy and install it. You can try and consider functional capabilities of every telecommunication service for free for first 1,5 month.</p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center" valign="top" width="120"><img src="/uploads/images/icons/office/image.png" alt="" height="45" width="45"></td>\r\n                        <td valign="top">\r\n                        <h2 style="color: black;"><strong><big>Saving on image</big></strong></h2>\r\n                        <p>“Delovoy” office-centers are located in prestige business-centers. Both exterior and interior looks of your new office will work for your business reputation.</p>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', 'в современных Бизнес-центрах', 'in modern business-centers', 'office', 'месяц', 'month', 10, 1, 'arenda-ofisov'),
(2, 'Коворкинг', 'Coworking', '/uploads/images/icons/office.png', '/uploads/images/icons/office_big.gif', 'Лучше один раз увидеть, чем 100 раз услышать!', 'Seeing once is better than hearing twice!', '<table>\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p>Современные технологии связи позволяют проводить переговоры и совещания между разными городами и странами, как если бы их участники находились за одним столом. Больше не нужно тратить время и деньги, ездить в командировки только для того, чтобы встретиться с коллегами и партнерами. Офисный центр «Деловой» предлагает услуги организации и проведения видеоконференций на базе самого современного оборудования. Видеоконференция — это технология, позволяющая видеть и слышать друг друга, обмениваться данными и совместно обрабатывать их в интерактивном режиме, максимально приближая общение на расстоянии к реальному живому общению.</p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td width="48%" valign="top">\r\n            <p>Организация видеоконференций, а также качественное проведение видеоконференций задача «Делового». Преимущества «Деловых» видеоконференций в Переговорных залах в Гостином Дворе:\r\nоборудование LifeSize\r\nсокращение временных и финансовых затрат на командировки сотрудников\r\nличное общение\r\nвысокое качество звука\r\nполноэкранное видео\r\nсвоевременный обмен необходимой информацией\r\nбыстрота согласования и принятия решений\r\nорганизация видеоконференций в кратчайшие сроки\r\nзал бизнес-класса до 20 человек.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<table width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p>Modern communication technology allows you to lead meetings and negotiations between different cities and countries, as if the participants were sitting at one table. You don`t have to spend time and money, go on business-trips only to meet your colleagues and partners.</p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td width="48%" valign="top">\r\n            <p>“Delovoy” office-center offers you a service of leading a video-conference with state of art equipment. Full screen high definition video and high quality volume create a complete presence effect. “Delovoy” office-center has two business class halls with a capacity of 6 and 20 participants.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', '<table width="100%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top"><span style="font-family: Arial, sans-serif; font-size: 13px; line-height: 14px;">Оборудование для видеоконференций производства компании Polycom обеспечивает многоточечную связь со всем миром. Популярность оборудования этой марки обеспечивает высокую степень совместимости и позволяет добиться высокого качества изображения и звука. Комфортность общения достигается качественным звуковым модулем с системой подавления эха и технологиями Polycom StereoSurround и Siren 14. </span></td>\r\n            <td width="4%" valign="top"> </td>\r\n            <td width="48%" valign="top">\r\n            <p><span style="font-family: Arial, sans-serif; font-size: 13px;">Также вы можете воспользоваться системой телеприсутствия Vidicor, которая позволяет  связываться с некоторыми российскими студиями и проводить Web-трансляции с помощью программы Adobe Flash Encoder.</span></p>\r\n            <p><span style="font-size: 10pt; font-family: Arial, sans-serif;">Стоимость видеоконференции в офисном центре «Деловой», расположенном в Гостином Дворе составляет </span><span style="font-size: 10pt; font-family: Arial, sans-serif;">6000 руб. в час, включая аренду зала. </span></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<table width="100%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top"><span style="font-size: 10pt; line-height: 115%; font-family: Arial, sans-serif; ">Modern communication technology allows you to lead meetings and negotiations between different cities and countries, as if the participants were sitting at one table. You don`t have to spend time and money, go on business-trips only to meet your colleagues and partners.</span></td>\r\n            <td width="4%" valign="top"> </td>\r\n            <td width="48%" valign="top"><span style="font-size: 10pt; line-height: 115%; font-family: Arial, sans-serif; ">Polycom video-conference equipment assures multipoint connection with whole world. The popularity of this equipment affords high level of compatibility and can assure high quality video and sound. Comfort of communication is attained by high-quality sound module with echo suppression system and Polycom StereoSound and Siren 14 technologies.</span></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table width="100%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p class="MsoNormal" style="margin-bottom: 0.0001pt; background-color: white; vertical-align: top; background-position: initial initial; background-repeat: initial initial; "><span style="font-size: 10pt; font-family: Arial, sans-serif; ">You can also use a Vidicor telepresence system that allows you to connect with some Russian studios and lead video-conferences with Adobe Flash Encoder.<o:p></o:p></span></p>\r\n            </td>\r\n            <td width="4%" valign="top"> </td>\r\n            <td width="48%" valign="top">\r\n            <p class="MsoNormal" style="margin-bottom: 0.0001pt; background-color: white; vertical-align: top; background-position: initial initial; background-repeat: initial initial; ">The price of video-conference in "Delovoy" office-center located in Gostiniy dvor is 6 000 Rubles per hour, including the rent of the room.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', 'качественная видеосвязь', 'high-quality video connection', 'coworking', 'час', 'hour', 20, 1, 'videokonferentsiya'),
(3, 'Виртуальный офис', 'Virtual office', '/uploads/images/icons/conference.png', '/uploads/images/icons/conference_big.gif', 'Виртуальный офис «Деловой» - это выгодное решение, позволяющее улучшить имидж компании.', '"Delovoy" virtual office is a profit making decision t at allows to improve your company`s image.', '<table width="100%" border="0" cellpadding="1" cellspacing="1">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p><big> <strong>Виртуальные офисы</strong></big><o:p></o:p></p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td width="48%" valign="top"><big><strong> Виртуальный секретарь</strong></big></td>\r\n        </tr>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p>Виртуальный офис «Деловой» – это отличное решение для индивидуальных предпринимателей и небольших компаний, которое позволяет не только наладить различные бизнес-процессы, но и создать благоприятный имидж.<o:p></o:p></p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td width="48%" valign="top">Мы поможем Вам сократить расходы на аренде офиса и заработной плате сотрудникам, предоставим престижный деловой адрес, телефонный номер с переадресацией вызова, а также услуги профессионального секретаря.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<h3>Ознакомьтесь с презентацией!</h3>\r\n<div data-configid="7286163/5981417" style="width: 400px; height: 283px;" class="issuuembed"></div><script type="text/javascript" src="//e.issuu.com/embed.js" async="true"></script>\r\n<p><style type="text/css">.issuuembed > div{width:410px!important;height:278px!important;}</style></p>', '<table width="100%" border="0" cellpadding="1" cellspacing="1">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p>Virtual office “Delovoy” – is a great solution for individual businessmen  and small companies, that allows you not only to coordinate different business processes, but also to create a positive image.<o:p></o:p></p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td width="48%" valign="top">We will help you lower your expenses for office rent and employee`s salary, we will offer you a prestige business address and telephone number with call forwarding and also the services of a professional secretary.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', '<p> </p>\r\n<table width="100%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%">\r\n            <p>В Виртуальном офисе «Деловой» Вы получите офисный адрес для вашей компании в любом Бизнес-центре Москвы, где располагаются офисные центры «Деловой». Мы будем получать и хранить корреспонденцию и факсы, поступившие на адрес Вашей компании. Профессиональные секретари примут звонки, поступающие на Ваш офисный номер телефона, разумеется, от имени Вашей компании. Если Вы захотите просто переадресовать поступающие звонки, то просто назовите телефонный номер, куда их следует направить. Также к Вашим услугам комфортабельные и оборудованные переговорные комнаты – как раз по адресу Вашей компании.</p>\r\n            <p>Для этого не нужно арендовать офис и нанимать персонал. Качественные услуги для бизнеса не должны стоить дорого.<br>\r\n            Вежливый секретарь и качественный офис в центре Москвы, пожалуй, являются основными признаками успешности бизнеса. Но эти символы престижа стоят денег. Для малого бизнеса и частных предпринимателей эти траты часто бывают неоправданными. Так что же, придется отказаться от этого? Совсем необязательно. Станьте владельцем офиса в самом центре столицы. Виртуального офиса.</p>\r\n            </td>\r\n            <td width="4"> </td>\r\n            <td width="48%" valign="top">\r\n            <p><span style="font-size: 13px; ">Теперь у Вашей компании есть почтовый адрес. И не где-нибудь на окраине, а в самых престижных Бизнес-центрах столицы.</span></p>\r\n            <p><span style="font-family: Arial, sans-serif; font-size: 13px; ">Вся корреспонденция, пришедшая на этот адрес, будет передана Вам. Также вы получите индивидуальный телефонный номер, по которому будет отвечать профессиональный секретарь. Он примет звонок от имени Вашей компании и ответит на вопросы звонящего, руководствуясь информацией, предоставленной Вами. Все оставленные сообщения будут зафиксированы и переданы Вам. При необходимости можно организовать переадресацию входящих звонков на любой другой номер, стационарный или мобильный.</span></p>\r\n            <p>Не важно, где Вы находитесь в данную минуту. Виртуальный офис в Москве «Деловой» поможет Вам всегда оставаться на связи, не пропустив ни одного звонка или сообщения.</p>\r\n            <p class="MsoBodyText"><o:p></o:p>Делайте дело, мы позаботимся о комфорте.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<table width="100%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p>In "Delovoy" office-center you will become an office address for your company in any business-center in Moscow, where "Delovoy" office-centers are located. We will receive and keep all the correspondence and faxes that will come to your company`s address. Professional secretaries will answer the calls that come to your company, in your company`s name of course. If you just want to forward the calls, just tell us the number  they should be forwarded to. Also to your service are comfortable and equipped meeting rooms - at your company`s address.</p>\r\n            <p>For that you don`t need to rent an office and employ personnel. Quality services for business must not be expensive.<br>\r\n            Polite secretary and comfortable office in the center of Moscow are maybe the essential attributes of a successful business. But this symbols of prestige are expensive. For small business and individual businessmen this expenses can be unreasonable. So what, do you have to decline? Not necessary. Become an owner of an office in the center of our capital. Virtual office</p>\r\n            </td>\r\n            <td width="4"> </td>\r\n            <td width="48%" valign="top">\r\n            <p><span style="font-size: 13px; ">From now on your company has a postal address. And not somewhere in the suburbs, but in the most prestigious business-centers of the capital.</span></p>\r\n            <p><span style="font-family: Arial, sans-serif; font-size: 13px; ">All the correspondence that comes to this address will be handed to you. You will also become an individual telephone number and all calls will be answered by a professional secretary. He will answer the calls on you company`s behalf and answer all questions based on the information that will be given by you. All left messages will be written down and handed to you. If you need we can organize incoming calls forwarding to any other number - stationary or mobile.</span></p>\r\n            <p>It does not matter where you are at the moment. "Delovoy" virtual office will help you always stay in touch and not miss any call or message.</p>\r\n            <p class="MsoBodyText"><o:p></o:p>Do you business and we will take care of comfort.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', 'Почта. Телефон. Секретарь.', 'Mail. Phone. Secretary.', 'virtual', 'месяц', 'month', 40, 1, 'virtualnyy-ofis'),
(4, 'Переговорная', 'Meeting room', '/uploads/images/icons/meeting.png', '/uploads/images/icons/meeting_big.gif', 'Аренда переговорного зала - это удобное место встречи, экономия расходов на содержание офиса, современное оборудование!', 'Meeting room for rent is a comfortable place, economy on office expenses and modern equipment.', '<table border="0" cellpadding="1" cellspacing="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="470">\r\n            <p>Назначьте деловую встречу в современном и стильном деловом офисе. Пригласите партнеров и будьте уверены, что переговоры сразу пойдут в нужной вам тональности! Для этого необязательно арендовать целый офис: переговорные комнаты с почасовой оплатой позволят вам получить максимум комфорта и престижа за свои деньги. </p>\r\n            </td>\r\n            <td width="20"> </td>\r\n            <td valign="top" width="470">\r\n            <p>Офисный центр «Деловой» предлагает не просто аренду переговорных комнат. К вашим услугам также мебель, оргтехника и персонал. Мы сделаем все, чтобы ваша встреча прошла на высшем уровне.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<h3>Ознакомьтесь с презентацией!</h3>\r\n<div data-configid="7286163/5981388" style="width: 400px; height: 283px;" class="issuuembed"></div><script type="text/javascript" src="//e.issuu.com/embed.js" async="true"></script>\r\n<p><style type="text/css">.issuuembed > div{width:410px!important;height:278px!important;}</style></p>', '<table border="0" cellpadding="1" cellspacing="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p>Fix a business meeting in modern and stylish office. Invite your partners and be sure that the negotiations will pass in the necessary mood. You don`t have to rent a hole office for this: meeting rooms with payment per hour will allow you to become maximum comfort and prestige for your money.</p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td width="48%" valign="top">\r\n            <p>"Delovoy" office-center offers you not only meeting rooms for rent. At your service are also furniture, office appliances and personnel. We will do our best so that your meeting would pass on a highest level.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', NULL, NULL, 'лучшие условия для встречи', 'best conditions for a meeting', 'meeting', 'час', 'hour', 30, 1, 'peregovornaya');

-- --------------------------------------------------------

--
-- Структура таблицы `service_group2office_center`
--

DROP TABLE IF EXISTS `service_group2office_center`;
CREATE TABLE IF NOT EXISTS `service_group2office_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_group_id` int(11) NOT NULL,
  `office_center_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `annotation` text,
  `annotation_en` text,
  `body` text,
  `body_en` text,
  `price` varchar(255) DEFAULT NULL,
  `price_min` int(11) DEFAULT NULL,
  `price_max` int(11) DEFAULT NULL,
  `currency_id` varchar(16) NOT NULL DEFAULT '',
  `floor_space_min` int(11) DEFAULT NULL,
  `floor_space_max` int(11) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_group_id` (`service_group_id`,`office_center_id`),
  KEY `office_center_id` (`office_center_id`),
  KEY `currency_id` (`currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Дамп данных таблицы `service_group2office_center`
--

INSERT INTO `service_group2office_center` (`id`, `service_group_id`, `office_center_id`, `title`, `title_en`, `annotation`, `annotation_en`, `body`, `body_en`, `price`, `price_min`, `price_max`, `currency_id`, `floor_space_min`, `floor_space_max`, `published`) VALUES
(80, 3, 1, 'Виртуальный офис', 'Virtual office', 'Мы предлагаем вам несколько вариантов набора услуг:', NULL, NULL, NULL, 'от 3 500 руб./мес', 3500, 8900, '', NULL, NULL, 1),
(81, 4, 1, NULL, NULL, 'Офисный центр «Деловой» предлагает компаниям и частным лицам воспользоваться Переговорной комнатой в новом Бизнес-центре класса А "Алексеевская Башня".', '"Delovoy" office-center offers to the companies and individual businessmen to use a meeting room in a new A-class business-center "Alexeevskaya tower".', '<table border="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td class="fotoset fotoset-w140-h100-wh" valign="top" width="48%">\r\n            <p>Переговорные комнаты в Бизнес-центре “Алексеевская Башня” расположены на 7 этаже.</p>\r\n            <p><strong>Удобная транспортная доступность:</strong></p>\r\n            <ul>\r\n                <li>10 минут пешком от м.ВДНХ</li>\r\n                <li>1 км от Проспекта Мира</li>\r\n            </ul>\r\n            <p><strong>Общая площадь</strong> - 25 кв. м <strong><br>\r\n            Вместимость</strong> - 15 человек<br>\r\n            <strong>Рабочее время - </strong>пн.-пт.10.00-19.00</p>\r\n            <a rel="fotoset62216" href="/uploads/images/office_centers/alekseevskaya/AB_new/_DSC1950.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/alekseevskaya/AB_new/.resize/_DSC1950.140x100.jpg" height="100" width="140"></a> <a rel="fotoset62216" href="/uploads/images/office_centers/alekseevskaya/AB_new/_DSC1954.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/alekseevskaya/AB_new/.resize/_DSC1954.140x100.jpg" height="100" width="140"></a> <a rel="fotoset62216" href="/uploads/images/office_centers/alekseevskaya/AB_new/_DSC1955.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/alekseevskaya/AB_new/.resize/_DSC1955.140x100.jpg" height="100" width="140"></a></td>\r\n            <td valign="top" width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p>Мы гарантируем комфорт и деловую обстановку, чтобы вы могли сконцентрироваться на самом главном.</p>\r\n            <p><strong>В переговорных:</strong></p>\r\n            <ul>\r\n                <li>флипчарт;</li>\r\n                <li>скоростной доступ в Интернет/ Wi-Fi;</li>\r\n                <li>кулер;</li>\r\n                <li>канцелярские принадлежности;</li>\r\n                <li>звуковое оборудование, проектор, экран.</li>\r\n            </ul>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<table border="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td class="fotoset fotoset-w140-h100-wh" valign="top" width="48%">\r\n            <p>Meeting rooms in "Alexeevkaya tower" are located on the 7th fool</p>\r\n            <p><strong>Convenient transport accessibility:</strong></p>\r\n            <ul>\r\n                <li>10 minutes walking from VDNH metro station</li>\r\n                <li>1 km from Prospekt mira</li>\r\n            </ul>\r\n            <p><strong>Floor area </strong>- 25 sq.m<br>\r\n            <strong>Capacity</strong> - 15 people<br>\r\n            <strong>Working hours</strong> - Mon.- Fr. 10:00-19:00</p>\r\n            <a rel="fotoset63925" href="/uploads/images/office_centers/alekseevskaya/AB_new/_DSC1950.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/alekseevskaya/AB_new/.resize/_DSC1950.140x100.jpg" height="100" width="140"></a> <a rel="fotoset63925" href="/uploads/images/office_centers/alekseevskaya/AB_new/_DSC1954.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/alekseevskaya/AB_new/.resize/_DSC1954.140x100.jpg" height="100" width="140"></a> <a rel="fotoset63925" href="/uploads/images/office_centers/alekseevskaya/AB_new/_DSC1955.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/alekseevskaya/AB_new/.resize/_DSC1955.140x100.jpg" height="100" width="140"></a></td>\r\n            <td valign="top" width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p>We guarantee comfort and business conditions so you could concentrate on the important things.</p>\r\n            <p><strong>In the meeting rooms:</strong></p>\r\n            <ul>\r\n                <li>flipchart;</li>\r\n                <li>high-velocity Internet/WiFi connection;</li>\r\n                <li>cooler;</li>\r\n                <li>office supplies;</li>\r\n                <li>projectors and sound equipment.</li>\r\n            </ul>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', 'от 520 руб./час', 700, NULL, '', 25, NULL, 1),
(84, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3500, 8900, '', NULL, NULL, 1),
(85, 4, 2, 'Переговорные в Омега Плаза', 'Переговорные в Омега Плаза', NULL, NULL, '<table border="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td class="fotoset fotoset-w140-h100-wh" valign="top" width="48%">\r\n            <p>Переговорные комнаты расположены на 4 и 5 этажах Бизнес-центра Омега Плаза.</p>\r\n            <p><strong>Удобная транспортная доступность:</strong></p>\r\n            <ul>\r\n                <li> 5 минут пешком от м.Автозаводская</li>\r\n                <li> 5 км от Кремля</li>\r\n                <li> 700 м от Третьего Транспортного Кольца</li>\r\n                <li>Удобный доступ со стороны Садового Кольца</li>\r\n            </ul>\r\n            <p><strong>Общая площадь</strong> - 18 кв. м  			<strong><br>\r\n            Вместимость</strong> - 10 человек<br>\r\n            <strong> Цена </strong> - 700 руб./час.</p>\r\n            <a rel="fotoset31509" href="/uploads/images/office_centers/omega/_DSC1539.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/omega/.resize/_DSC1539.140x100.jpg" height="100" width="140"></a> <a rel="fotoset31509" href="/uploads/images/office_centers/kalanchevkskaya/gallery/IMG_5319.JPG" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/kalanchevkskaya/gallery/.resize/IMG_5319.140x100.jpg" height="100" width="140"></a> <a rel="fotoset31509" href="/uploads/images/office_centers/omega/_DSC1546.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/omega/.resize/_DSC1546.140x100.jpg" height="100" width="140"></a></td>\r\n            <td valign="top" width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p>Мы гарантируем комфорт и деловую обстановку в нашем бизнес-центре Omega Plaza, чтобы Вы могли сконцентрироваться на самом главном.</p>\r\n            <p><strong>В переговорных:</strong></p>\r\n            <ul>\r\n                <li>флипчарт;</li>\r\n                <li>скоростной доступ в Интернет / Wi-Fi;</li>\r\n                <li>кулер;</li>\r\n                <li>канцелярские принадлежности.</li>\r\n            </ul>\r\n            <p><strong>Рабочее время - </strong>пн.-пт. 10.00-19.00*  Выходные дни:  суббота, воскресенье</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<table border="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td class="fotoset fotoset-w140-h100-wh" valign="top" width="48%">\r\n            <p>Meeting rooms in "Omega plaza" are located on the 4th and 5th fool</p>\r\n            <p><strong>Convenient transport accessibility:</strong></p>\r\n            <ul>\r\n                <li>5 minutes walking from Autozavodskaya metro station</li>\r\n                <li>1 km from Kremlin</li>\r\n                <li>700 m from Third Transport Ring</li>\r\n                <li>Easier access from Sadovoe ring</li>\r\n            </ul>\r\n            <p><strong>Floor area</strong> - 18 sq.m			<strong><br>\r\n            </strong><strong>Capacity</strong> - 10 persons<br>\r\n            <strong>Price</strong> - 700 rub./hour</p>\r\n            <a rel="fotoset78705" href="/uploads/images/office_centers/omega/_DSC1539.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/omega/.resize/_DSC1539.140x100.jpg" height="100" width="140"></a> <a rel="fotoset78705" href="/uploads/images/office_centers/kalanchevkskaya/gallery/IMG_5319.JPG" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/kalanchevkskaya/gallery/.resize/IMG_5319.140x100.jpg" height="100" width="140"></a> <a rel="fotoset78705" href="/uploads/images/office_centers/omega/_DSC1546.jpg" title="" class="fotoset-item"><img alt="" src="/uploads/images/office_centers/omega/.resize/_DSC1546.140x100.jpg" height="100" width="140"></a></td>\r\n            <td valign="top" width="4%"> </td>\r\n            <td valign="top" width="48%">\r\n            <p>We guarantee comfort and business conditions so you could concentrate on the important things.</p>\r\n            <p><strong>In the meeting rooms:</strong></p>\r\n            <ul>\r\n                <li>flipchart;</li>\r\n                <li>high-velocity Internet/WiFi connection;</li>\r\n                <li>cooler;</li>\r\n                <li>office supplies.</li>\r\n            </ul>\r\n            <p>Working hours - Mon.- Fr. 10:00-19:00 Weekends: Saturday, Sunday</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', NULL, 700, NULL, '', 18, NULL, 1),
(86, 2, 3, NULL, NULL, NULL, NULL, '<table width="100%" border="1" cellpadding="1" cellspacing="1" >\r\n    <tbody>\r\n        <tr>\r\n            <td width=45%>\r\n            <div><p> Офисный центр «Деловой» предлагает услугу проведения видеоконференций на базе самого современного оборудования. Видеоконференция — это технология, позволяющая видеть и слышать друг друга, обмениваться данными и совместно обрабатывать их в интерактивном режиме, максимально приближая общение на расстоянии к реальному живому общению. Организация видеоконференций, а также качественное проведение видеоконференций задача «Делового».</p></div>\r\n            </td>\r\n            <td width=10%> </td>\r\n            <td width=45%>\r\n            <div>Преимущества «Деловых» видеоконференций в Переговорных залах в Гостином Дворе:\r\nоборудование LifeSize; сокращение временных и финансовых затрат на командировки сотрудников\r\nличное общение\r\nвысокое качество звука\r\nполноэкранное видео\r\nсвоевременный обмен необходимой информацией\r\nбыстрота согласования и принятия решений\r\nорганизация видеоконференций в кратчайшие сроки\r\nзал бизнес-класса до 20 человек ..</div>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n            <div>Также вы можете воспользоваться системой телеприсутствия Vidicor, которая позволяет  связываться с некоторыми российскими студиями и проводить Web-трансляции с помощью программы Adobe Flash Encoder.\r\n			<br/>Стоимость видеоконференции в офисном центре «Деловой», расположенном в Гостином Дворе, составляет 6 000 руб. за первый час аренды, 3 000 руб. за каждый последующий час (аренда зала включена в стоимость). </div>\r\n            </td>\r\n            <td> </td>\r\n            <td>\r\n            <div>Видеоконференц связь с элементом телеприсутствия на базе LifeSize Passport, обеспечивающая видеосвязь с видеостудиями во всём мире, . LifeSize Passport использует прогрессивные стандарты видеокодирования - H.263, H.263+, H.264 (cовместимость с Polycom). Комфортность общения достигается высококачественным звуковым модулем с системой подавления эха. Решение LifeSize Passport поддерживает качество видео в формате True HD (720p30), а возможность подключения Passport к Skype многократно расширит ваш круг общения. </div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<table width="100%" border="1" cellpadding="1" cellspacing="1">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%">\r\n            <p> Modern communication technology allows you to lead meetings and negotiations between different cities and countries, as if the participants were sitting at one table. You don`t have to spend time and money, go on business-trips only to meet your colleagues and partners.</p>\r\n            </td>\r\n            <td width="4%"> </td>\r\n            <td width="48%">\r\n            <p>“Delovoy” office-center offers you a service of leading a video-conference with state of art equipment. Full screen high definition video and high quality volume create a complete presence effect. “Delovoy” office-center has two business class halls with a capacity of 6 and 20 participants.</p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n            <p>You can also use a Vidicor telepresence system that allows you to connect with some Russian studios and lead video-conferences with Adobe Flash Encoder.<br>\r\n            The price of video-conference in "Delovoy" office-center located in Gostiniy dvor is 6 000 Rubles per hour, including the rent of the room.<br>\r\n             </p>\r\n            </td>\r\n            <td> </td>\r\n            <td width="48%">\r\n            <p>Polycom video-conference equipment assures multipoint connection with whole world. The popularity of this equipment affords high level of compatibility and can assure high quality video and sound. Comfort of communication is attained by high-quality sound module with echo suppression system and Polycom StereoSound and Siren 14 technologies.</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', NULL, 6000, NULL, '', 38, NULL, 1),
(87, 3, 3, NULL, NULL, 'Мы предлагаем вам несколько вариантов набора услуг:', 'We offer you several variants of services:', NULL, NULL, NULL, 3500, 8900, '', NULL, NULL, 1),
(88, 4, 3, NULL, NULL, NULL, NULL, '<table width="100%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p>Мы предлагаем Вам уютную атмосферу Большого и Малого переговорных залов. Они оборудованы всем необходимым для удачного проведения Вашей встречи. Также переговорная может быть использована как помещение для тренингов и семинаров.</p>\r\n            <p><strong>Удобная транспортная доступность:</strong></p>\r\n            <ul>\r\n                <li> 1 минута пешком от Кремля</li>\r\n                <li> Удобный доступ из любой точки Москвы</li>\r\n            </ul>\r\n            </td>\r\n            <td width="4%" valign="top"> </td>\r\n            <td width="48%" valign="top">\r\n			<p> Ваших деловых партнеров встретит специалист офисного центра и окажет максимальное гостеприимство. Наши клиенты, заказывающие аренду залов для тренингов, также получают доступ к сопутствующим услугам — правке и печати документов, сканированию, отправке факсов.</p>\r\n            <p><strong>В переговорных:</strong></p>\r\n            <ul>\r\n                <li>флипчарт;</li>\r\n                <li>скоростной доступ в Интернет/ Wi-Fi;</li>\r\n                <li>плазменная панель/DVD;</li>\r\n                <li>компьютер;</li>\r\n                <li>кулер;</li>\r\n                <li>канцелярские принадлежности.</li>\r\n            </ul>\r\n	</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<table width="100%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="48%" valign="top">\r\n            <p>We offer you a comfort atmosphere of Small and Big conference halls. They are equipped with all that is required for successful leading of your meeting.</p>\r\n            <p><strong>Convenient transport accessibility:</strong></p>\r\n            <ul>\r\n                <li>1 minute from Kremlin</li>\r\n                <li>Easy access from any part of Moscow</li>\r\n            </ul>\r\n            </td>\r\n            <td width="4%" valign="top"> </td>\r\n            <td width="48%" valign="top">\r\n            <p>A specialist of our office-center will meet your guests and will show them maximum hospitality. If it is required we can offer you additional services – printing and correction of documents, scanning, sending of faxes.</p>\r\n            <p><strong>In the meeting rooms:</strong></p>\r\n            <ul>\r\n                <li>flipchart;</li>\r\n                <li>high-velocity Internet/WiFi connection;</li>\r\n               <li>computer;</li>\r\n               <li>plasma screen TV/DVD;</li>\r\n               <li>cooler;</li>\r\n               <li>office supplies.</li>\r\n            </ul>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', NULL, 875, 1750, '', 18, 38, 1),
(93, 1, 1, 'Аренда офисов в бизнес-центре "Алексеевская башня"', 'ALEXEEVSKAYA TOWER — A-CLASS OFFICES FOR RENT', 'Вашему вниманию предоставляются два пакета услуг по аренде офисов в ОЦ «Деловой»', 'We offer you two service packages on rent of work space in "Delovoy" office-center', '<p>Вставить текст про этаж/варианты площадей/переговорные/зоны входа/парковку и инфраструктуру.</p>\r\n<p>Ссылка на информацию о бизнес-центре</p>\r\n<p>Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!</p>', '<center><b>Dear Clients!</b></center>\r\n<p> </p>\r\n<p>We offer you two service packages on rent of work space in "Delovoy" office-center, that is located in: Moscow, VDNH metro station, Raketniy boulevard, 16, "Alexeevskaya tower" (A-class offices).</p>\r\n<h6><a href="/uploads/files/tumblr_m9i5jnOPVN1rx2r7uo1_400.gif" target="_blank"><span class="editor-red">Download presentation (pdf)</span></a></h6>', 'от 15 490 руб./мес', 36096, 154912, '', 13, 60, 1),
(94, 1, 2, NULL, NULL, 'Вашему вниманию предоставляются два пакета услуг по аренде офисов в Офисный центр «Деловой»', 'We offer you two service packages on rent of work space in "Delovoy" office-center', '<b><center>Уважаемые клиенты!</center></b>\r\n<p>Вашему вниманию предоставляются два пакета услуг по аренде офисов в офисном\r\nцентре «Деловой», расположенному по адресу: г. Москва, метро «Автозаводская», ул. Ленинская\r\nСлобода, дом 19, Бизнес-центр «Омега Плаза» (офисы класса В+).</p>', '<center><b>Dear Clients!</b></center>\r\n<p>We offer you two service packages on rent of work space in "Delovoy" office-center, that is located in: Moscow, Autozavodskaya metro station, Leninskaya sloboda str., 19, "Omega plaza" Business-center (B+-class offices).</p>', 'от 13 490 руб./мес', 42350, 104750, '', 15, 32, 1),
(102, 1, 6, NULL, NULL, '«Деловой» на курорте «Роза Хутор» предоставляет готовые решения для тех, кто планирует совмещать отдых и работу', NULL, '<p><strong>В стоимость включено: </strong></p>\r\n<table border="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td>Мебель (стол, тумбочка, кресло)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Безлимитный интернет</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Секретарь (прием-передача корреспонденции, встреча гостей, заказ канцтоваров)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Охрана (ЧОП)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Приточно-вытяжная вентиляция</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Локальное кондиционирование</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Эксплуатационные и коммунальные расходы</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Ежедневная уборка</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>\r\n<p><strong>Дополнительные опции:</strong></p>\r\n<table border="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td>Телефонный номер/линия</td>\r\n            <td class="td-right">1750 руб/мес</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>\r\n<p><strong>Для большего удобства:</strong></p>\r\n<table border="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td>Секретарь (обработка вх. звонков, копирование, сканирование, чай, кофе)</td>\r\n            <td> </td>\r\n        </tr>\r\n        <tr>\r\n            <td>Системный инженер</td>\r\n            <td> </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', '<p><strong><span class="hps">Included</span>: </strong></p>\r\n<table border="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td>Furniture (tables, underbench cabinets, chair)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Unlimited Internet</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Secretary (transmit-receive correspondence, meeting guests, ordering office supplies)</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Security</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Purge ventilation</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Local air-conditioning</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Operational and utility costs</td>\r\n        </tr>\r\n        <tr>\r\n            <td>Daily office cleaning</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>\r\n<p><strong>Additional options:</strong></p>\r\n<table border="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td>The phone number / line in</td>\r\n            <td class="td-right">1 750 rub/month</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>\r\n<p><strong>For greater convenience:</strong></p>\r\n<table border="1" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td>Secretary (processing Rin. Calls, copying, scanning, tea, coffee)</td>\r\n            <td> </td>\r\n        </tr>\r\n        <tr>\r\n            <td>System engineer</td>\r\n            <td> </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p> </p>', 'от 11 123 руб./мес', 15490, NULL, '', NULL, NULL, 1),
(103, 4, 6, NULL, NULL, '«Деловой» предлагает компаниям и частным лицам воспользоваться Переговорными комнатами в офисном центре на курорте Роза Хутор.', NULL, '<table border="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td class="fotoset fotoset-w140-h100-wh" valign="top" width="48%">\r\n            <p><b>Площадь</b> - 32 кв. м&nbsp;<strong><br>\r\n            Вместимость</strong>&nbsp;- до 15 человек<br>\r\n            <strong>Рабочее время -&nbsp;</strong>пн-пт 09.30-19.00 (возможна аренда в выходные дни и нерабочее время)</p>\r\n            <p>* Возврат ранее оплаченного бронирования переговорной комнаты возможен только при уведомлении об отказе бронирования не менее чем за 3 рабочих дня!</p>\r\n            Мы гарантируем комфорт и деловую обстановку, чтобы Вы могли сконцентрироваться на самом главном.</td>\r\n            <td valign="top" width="4%">&nbsp;</td>\r\n            <td valign="top" width="48%">\r\n            <p><strong>В стоимость включено:</strong></p>\r\n            <ul>\r\n                <li>встреча гостей</li>\r\n                <li>скоростной доступ в Интернет/ Wi-Fi</li>\r\n                <li>проектор, экран, звуковое оборудование</li>\r\n                <li>флипчарт</li>\r\n                <li>кулер</li>\r\n                <li>канцелярские принадлежности</li>\r\n                <li>плазменная панель</li>\r\n            </ul>\r\n            <p><strong>Дополнительные услуги:</strong></p>\r\n            <ul>\r\n                <li>подача напитков (чай,&nbsp;кофе,&nbsp;вода)</li>\r\n                <li>печать,&nbsp;копирование,&nbsp;сканирование, редактирование документов</li>\r\n                <li>отправка факса</li>\r\n            </ul>\r\n            <p>&nbsp;</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>&nbsp;</p>', '<table border="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td class="fotoset fotoset-w140-h100-wh" valign="top" width="48%">\r\n            <p><strong>Floor area&nbsp;</strong>-&nbsp;&nbsp;32 sq.m<br>\r\n            <strong>Capacity</strong> - up to 15 people<br>\r\n            <strong>Working hours</strong> - mon-fr &nbsp;09:30-19:00 (possible to rent on weekends and after hours)</p>\r\n            <p>* Return of earlier paid booking of a meeting room is possible only under booking''s refusal notification not less than in 3 working days!</p>\r\n            We guarantee comfort and business conditions so you could concentrate on the important things.</td>\r\n            <td valign="top" width="4%">&nbsp;</td>\r\n            <td valign="top" width="48%">\r\n            <p><strong>Included:</strong></p>\r\n            <ul>\r\n                <li><span class="hps">meeting</span>&nbsp;<span class="hps">your guests</span></li>\r\n                <li>Internet / WiFi connection</li>\r\n                <li>projectors and sound equipment</li>\r\n                <li>plasma display</li>\r\n                <li>flipchart</li>\r\n                <li>water cooler</li>\r\n                <li>office supplies</li>\r\n            </ul>\r\n            <p><strong><span class="hps">Additional</span><span class="hps">&nbsp;services</span><span>:</span></strong></p>\r\n            <ul>\r\n                <li><span class="hps">supply</span> <span class="hps">of drinks</span> <span class="hps">(tea, coffee</span><span>, water)</span></li>\r\n                <li><span class="hps">printing, copying</span><span>, scanning documents</span></li>\r\n                <li><span class="hps">sending a fax</span></li>\r\n            </ul>\r\n            <p>&nbsp;</p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>&nbsp;</p>', NULL, 700, NULL, '', NULL, NULL, 1),
(104, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(105, 2, 1, 'Коворкинг', NULL, NULL, NULL, NULL, NULL, 'от 12 490 руб./мес', NULL, NULL, '', NULL, NULL, 1),
(106, 1, 5, 'Аренда в "Арме"', NULL, NULL, NULL, NULL, NULL, 'от 12 490 руб./мес', NULL, NULL, '', NULL, NULL, 1),
(107, 4, 5, 'Переговорные в "Арме"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(108, 3, 5, 'Виртуальный офис в "Арме"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(109, 2, 5, 'Коворкинг в "Арме"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `value` text,
  `value_en` text,
  `type` varchar(8) DEFAULT NULL,
  `multi_lang` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`name`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`id`, `meta_site_id`, `name`, `value`, `value_en`, `type`, `multi_lang`) VALUES
('client_email_footer', '', 'Подпись "Делового" в уведомлениях сайта (подписка, заказ услуги)', 'С уважением к Вам и Вашему делу\r\nСеть офисных центров "Деловой"\r\nwww.delovoy.su\r\n\r\n+7 495 988 33 08', NULL, 'textarea', 0),
('client_email_footer_en', '', 'Подпись "Делового" в уведомлениях сайта (en)', 'With respect to you and your business\r\nDelovoy office-centers network (www.delovoy.su)\r\n\r\nKalanchevskaya plaza business-center  tel. +7 495 988 33 08\r\nOmega plaza business-center  tel. +7 495 988 33 08\r\nAlexeevskaya tower business-center  tel. +7 495 988 33 08\r\nGostiniy dvor  tel. +7 495 988 33 08', NULL, 'textarea', 0),
('copyright', '', 'Копирайт сайта', 'КЦ «Деловой». Аренда офиса без посредников Москва', NULL, 'text', 0),
('copyrighten', '', 'Копирайт сайта (en)', 'Delovoy', NULL, 'text', 0),
('email_feedback', '', 'Адрес e-mail для уведомлений о новых сообщениях обратной связи', 'info@delovoy.su', NULL, 'textarea', 0),
('email_request', '', 'Адрес e-mail по умолчанию для уведомлений о заказах услуг', 'info@delovoy.su', NULL, 'textarea', 0),
('phone_number', '', 'Телефон', '+7 (495) 988-07-36', NULL, 'text', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `id` varchar(16) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `sort_num` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit`
--

INSERT INTO `unit` (`id`, `title`, `title_en`, `sort_num`) VALUES
('are', 'сот.', 'ares', 20),
('m2', 'м²', 'm²', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `login` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL DEFAULT '*',
  `passkey` varchar(8) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `middlename` varchar(255) DEFAULT NULL,
  `surname` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `confirmation_code` varchar(32) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `meta_site_id`, `login`, `password`, `passkey`, `email`, `enabled`, `name`, `middlename`, `surname`, `phone`, `company`, `position`, `confirmation_code`, `created`) VALUES
(1, '', 'admin', '7b0d879b240a88d40954c40f4d5616cb', '>;Z<Qx*;', 'mx3@mail.ru', 1, 'Administrator', NULL, '.', '3', '1', '2', '2K5Njkm8TZ59msCabnfPcHCyNSIIHN', '2012-08-01 00:00:00'),
(2, '', 'agent', '7b0d879b240a88d40954c40f4d5616cb', '>;Z<Qx*;', 'agent@example.com', 1, '.', NULL, '.', NULL, NULL, NULL, NULL, '2015-07-15 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `user2users_group`
--

DROP TABLE IF EXISTS `user2users_group`;
CREATE TABLE IF NOT EXISTS `user2users_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `users_group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`users_group_id`),
  KEY `user2users_group_user_id_idx` (`user_id`),
  KEY `user2users_group_users_group_id_idx` (`users_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `user2users_group`
--

INSERT INTO `user2users_group` (`id`, `user_id`, `users_group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users_group`
--

DROP TABLE IF EXISTS `users_group`;
CREATE TABLE IF NOT EXISTS `users_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `admin_access` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `title` (`title`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `users_group`
--

INSERT INTO `users_group` (`id`, `meta_site_id`, `name`, `title`, `admin_access`) VALUES
(1, '', 'admin', 'Администраторы', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_session`
--

DROP TABLE IF EXISTS `user_session`;
CREATE TABLE IF NOT EXISTS `user_session` (
  `id` varchar(255) NOT NULL,
  `meta_site_id` varchar(16) NOT NULL DEFAULT '',
  `is_backoffice` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `meta_site_id` (`meta_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_session`
--

INSERT INTO `user_session` (`id`, `meta_site_id`, `is_backoffice`, `user_id`, `ip`, `created`, `updated`) VALUES
('djqr4phlki3prmkaeqobq87t51', '', 1, 1, '127.0.0.1', '2016-06-26 06:53:56', '2016-06-26 06:53:56');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`article_type_id`) REFERENCES `article_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `article_ibfk_3` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `article_type`
--
ALTER TABLE `article_type`
  ADD CONSTRAINT `article_type_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`banner_type_id`) REFERENCES `banner_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `banner_ibfk_2` FOREIGN KEY (`color_scheme_id`) REFERENCES `color_scheme` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `banner2section`
--
ALTER TABLE `banner2section`
  ADD CONSTRAINT `banner2section_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner2section_ibfk_2` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `banner_type2section`
--
ALTER TABLE `banner_type2section`
  ADD CONSTRAINT `banner_type2section_ibfk_1` FOREIGN KEY (`banner_type_id`) REFERENCES `banner_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banner_type2section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`office_center_id`) REFERENCES `office_center` (`id`);

--
-- Ограничения внешнего ключа таблицы `booking_room`
--
ALTER TABLE `booking_room`
  ADD CONSTRAINT `booking_room_ibfk_1` FOREIGN KEY (`office_center_room_id`) REFERENCES `office_center_room` (`id`),
  ADD CONSTRAINT `booking_room_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `container`
--
ALTER TABLE `container`
  ADD CONSTRAINT `container_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `doc`
--
ALTER TABLE `doc`
  ADD CONSTRAINT `doc_ibfk_1` FOREIGN KEY (`doc_folder_id`) REFERENCES `doc_folder` (`id`),
  ADD CONSTRAINT `doc_ibfk_2` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `doc_folder`
--
ALTER TABLE `doc_folder`
  ADD CONSTRAINT `doc_folder_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `doc_folder2section`
--
ALTER TABLE `doc_folder2section`
  ADD CONSTRAINT `doc_folder2section_ibfk_1` FOREIGN KEY (`doc_folder_id`) REFERENCES `doc_folder` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doc_folder2section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `meta_site_lang`
--
ALTER TABLE `meta_site_lang`
  ADD CONSTRAINT `meta_site_lang_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `meta_table2section_type`
--
ALTER TABLE `meta_table2section_type`
  ADD CONSTRAINT `meta_table2section_type_ibfk_1` FOREIGN KEY (`meta_table_id`) REFERENCES `meta_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `meta_table2section_type_ibfk_2` FOREIGN KEY (`section_type_id`) REFERENCES `section_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `meta_table2table`
--
ALTER TABLE `meta_table2table`
  ADD CONSTRAINT `meta_table2table_ibfk_4` FOREIGN KEY (`meta_table_id`) REFERENCES `meta_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `meta_table2table_ibfk_5` FOREIGN KEY (`detail_meta_table_id`) REFERENCES `meta_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `meta_table2table_ibfk_6` FOREIGN KEY (`many2many_meta_table_id`) REFERENCES `meta_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `meta_table_field`
--
ALTER TABLE `meta_table_field`
  ADD CONSTRAINT `meta_table_field_ibfk_1` FOREIGN KEY (`meta_table_id`) REFERENCES `meta_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `meta_table_field_ibfk_3` FOREIGN KEY (`lookup_meta_table_field_id`) REFERENCES `meta_table_field` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `meta_table_field_ibfk_4` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `meta_table_field_ibfk_5` FOREIGN KEY (`lookup_external_meta_table_id`) REFERENCES `meta_table` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `meta_table_field_ibfk_6` FOREIGN KEY (`meta_table_field_group_id`) REFERENCES `meta_table_field_group` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `metro`
--
ALTER TABLE `metro`
  ADD CONSTRAINT `metro_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Ограничения внешнего ключа таблицы `metro_line`
--
ALTER TABLE `metro_line`
  ADD CONSTRAINT `metro_line_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`news_folder_id`) REFERENCES `news_folder` (`id`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `news_ibfk_3` FOREIGN KEY (`meta_table_id`) REFERENCES `meta_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `news_folder`
--
ALTER TABLE `news_folder`
  ADD CONSTRAINT `news_folder_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `news_folder2section`
--
ALTER TABLE `news_folder2section`
  ADD CONSTRAINT `news_folder2section_ibfk_1` FOREIGN KEY (`news_folder_id`) REFERENCES `news_folder` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_folder2section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `news_tag2news`
--
ALTER TABLE `news_tag2news`
  ADD CONSTRAINT `news_tag2news_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_tag2news_ibfk_2` FOREIGN KEY (`news_tag_id`) REFERENCES `news_tag` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `office_center`
--
ALTER TABLE `office_center`
  ADD CONSTRAINT `office_center_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `office_center_ibfk_2` FOREIGN KEY (`metro_id`) REFERENCES `metro` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `office_center_detail`
--
ALTER TABLE `office_center_detail`
  ADD CONSTRAINT `office_center_detail_ibfk_1` FOREIGN KEY (`office_center_detail_type_id`) REFERENCES `office_center_detail_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `office_center_detail_ibfk_2` FOREIGN KEY (`office_center_id`) REFERENCES `office_center` (`id`);

--
-- Ограничения внешнего ключа таблицы `office_center_room`
--
ALTER TABLE `office_center_room`
  ADD CONSTRAINT `office_center_room_ibfk_2` FOREIGN KEY (`office_center_id`) REFERENCES `office_center` (`id`),
  ADD CONSTRAINT `office_center_room_ibfk_3` FOREIGN KEY (`service_group_id`) REFERENCES `service_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `section_ibfk_4` FOREIGN KEY (`section_type_id`) REFERENCES `section_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `section_ibfk_5` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `section2container`
--
ALTER TABLE `section2container`
  ADD CONSTRAINT `section2container_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `section2container_ibfk_2` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `section2container_ibfk_3` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `section_type`
--
ALTER TABLE `section_type`
  ADD CONSTRAINT `section_type_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `seo_parameter`
--
ALTER TABLE `seo_parameter`
  ADD CONSTRAINT `seo_parameter_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `seo_parameter2section_type`
--
ALTER TABLE `seo_parameter2section_type`
  ADD CONSTRAINT `seo_parameter2section_type_ibfk_1` FOREIGN KEY (`seo_parameter_id`) REFERENCES `seo_parameter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seo_parameter2section_type_ibfk_2` FOREIGN KEY (`section_type_id`) REFERENCES `section_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `seo_url_data`
--
ALTER TABLE `seo_url_data`
  ADD CONSTRAINT `seo_url_data_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `service2service_group`
--
ALTER TABLE `service2service_group`
  ADD CONSTRAINT `service2service_group_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service2service_group_ibfk_2` FOREIGN KEY (`service_group_id`) REFERENCES `service_group` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `service_group`
--
ALTER TABLE `service_group`
  ADD CONSTRAINT `service_group_ibfk_1` FOREIGN KEY (`css_signature`) REFERENCES `color_scheme` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `service_group2office_center`
--
ALTER TABLE `service_group2office_center`
  ADD CONSTRAINT `service_group2office_center_ibfk_2` FOREIGN KEY (`service_group_id`) REFERENCES `service_group` (`id`),
  ADD CONSTRAINT `service_group2office_center_ibfk_3` FOREIGN KEY (`office_center_id`) REFERENCES `office_center` (`id`),
  ADD CONSTRAINT `service_group2office_center_ibfk_4` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`);

--
-- Ограничения внешнего ключа таблицы `setting`
--
ALTER TABLE `setting`
  ADD CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user2users_group`
--
ALTER TABLE `user2users_group`
  ADD CONSTRAINT `user2users_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user2users_group_ibfk_2` FOREIGN KEY (`users_group_id`) REFERENCES `users_group` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_group`
--
ALTER TABLE `users_group`
  ADD CONSTRAINT `users_group_ibfk_1` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_session`
--
ALTER TABLE `user_session`
  ADD CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_session_ibfk_2` FOREIGN KEY (`meta_site_id`) REFERENCES `meta_site` (`id`) ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
