-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.17-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dump della struttura di tabella paninoteca.carrello
DROP TABLE IF EXISTS `carrello`;
CREATE TABLE IF NOT EXISTS `carrello` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantita` int(11) DEFAULT NULL,
  `ordine_id` int(11) DEFAULT NULL,
  `prodotto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKinckh44i830i13f0gi1gp1iio` (`ordine_id`),
  KEY `FKpbmstnyba9j0y0spuneow4vj0` (`prodotto_id`),
  CONSTRAINT `FKinckh44i830i13f0gi1gp1iio` FOREIGN KEY (`ordine_id`) REFERENCES `ordine` (`id`),
  CONSTRAINT `FKpbmstnyba9j0y0spuneow4vj0` FOREIGN KEY (`prodotto_id`) REFERENCES `prodotto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella paninoteca.carrello: ~0 rows (circa)
DELETE FROM `carrello`;
/*!40000 ALTER TABLE `carrello` DISABLE KEYS */;
INSERT INTO `carrello` (`id`, `quantita`, `ordine_id`, `prodotto_id`) VALUES
	(13, 1, 1, 1),
	(14, 1, 2, 8);
/*!40000 ALTER TABLE `carrello` ENABLE KEYS */;

-- Dump della struttura di tabella paninoteca.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella paninoteca.categoria: ~3 rows (circa)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nome`) VALUES
	(1, 'PANINI'),
	(2, 'BIBITE'),
	(3, 'DOLCI');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Dump della struttura di tabella paninoteca.ingrediente
DROP TABLE IF EXISTS `ingrediente`;
CREATE TABLE IF NOT EXISTS `ingrediente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella paninoteca.ingrediente: ~19 rows (circa)
DELETE FROM `ingrediente`;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` (`id`, `descrizione`, `nome`) VALUES
	(1, 'Burger di Bovino', 'Burger di Bovino'),
	(2, 'Ketchup', 'Ketchup'),
	(3, 'Maionese', 'Maionese'),
	(4, 'Insalta', 'Insalta'),
	(5, 'Pomodoro', 'Pomodoro'),
	(6, 'Formaggio Filante', 'Formaggio Filante'),
	(7, 'Cipolla Rossa', 'Cipolla Rossa'),
	(8, 'Senape di Digione', 'Senape di Digione'),
	(9, 'Bacon Croccante', 'Bacon Croccante'),
	(10, 'Pane Senza Glutine', 'Pane Senza Glutine'),
	(11, 'Burger di Lenticchie', 'Burger di Lenticchie'),
	(12, 'Salsa Dressing', 'Salsa Dressing'),
	(13, 'Cioccolato', 'Cioccolato'),
	(14, 'Vaniglia', 'Vaniglia'),
	(15, 'Caffè', 'Caffè'),
	(16, 'Cassata', 'Cassata'),
	(17, 'Stracciatella', 'Stracciatella'),
	(18, 'Fior di Latte', 'Fior di Latte'),
	(19, 'Pistacchio', 'Pistacchio');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;

-- Dump della struttura di tabella paninoteca.ordine
DROP TABLE IF EXISTS `ordine`;
CREATE TABLE IF NOT EXISTS `ordine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codice` varchar(255) DEFAULT NULL,
  `orario` varchar(255) DEFAULT NULL,
  `ristorante_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsm2q9ssc11b11ppd0a3obp2qt` (`ristorante_id`),
  CONSTRAINT `FKsm2q9ssc11b11ppd0a3obp2qt` FOREIGN KEY (`ristorante_id`) REFERENCES `ristorante` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella paninoteca.ordine: ~1 rows (circa)
DELETE FROM `ordine`;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` (`id`, `codice`, `orario`, `ristorante_id`) VALUES
	(1, '5347', '16:30', 4),
	(2, '8067', '16:30', 3),
	(3, NULL, NULL, NULL);
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;

-- Dump della struttura di tabella paninoteca.prodotto
DROP TABLE IF EXISTS `prodotto`;
CREATE TABLE IF NOT EXISTS `prodotto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `prezzo` double NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp54y50a2i7pdiipduc60tttrw` (`categoria_id`),
  CONSTRAINT `FKp54y50a2i7pdiipduc60tttrw` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella paninoteca.prodotto: ~20 rows (circa)
DELETE FROM `prodotto`;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` (`id`, `descrizione`, `nome`, `prezzo`, `categoria_id`) VALUES
	(1, 'Panino con carne bovina 100% Italiana', 'Hamburger', 2.5, 1),
	(2, 'Tutto il gusto dei nostri hamburger raddoppiato', 'Double Burger', 4, 1),
	(3, 'Deliziosa Carne bovina 100% Italiana accompagnata dal più morbido formaggio prodotto nelle nostre Alpi', 'Cheeseburger', 3, 1),
	(4, 'Tutto il sapore del nostro cheeseburger raddoppiato!', 'Double Cheeseburger', 4.5, 1),
	(5, 'Carne bovina 100% Italiana accompagnata da succulente strisce di bacon!', 'Bacon Tasty', 6, 1),
	(6, 'Tutto il sapore dei nostri panini con carne 100% Italiana, ma senza glutine!', 'Gluten-Free Burger', 6, 1),
	(7, 'Hamburger con ingredienti vegetariani garantiti, il tutto possibile grazie ai nostri burghers di lenticchie!', 'Veggie Burger', 6, 1),
	(8, '', 'Coca-Cola 0.5L', 2.5, 2),
	(9, '', 'Fanta 0.5L', 2.5, 2),
	(10, '', 'Sprite 0.5L', 2.5, 2),
	(11, '', 'Tea 0.5L', 2.5, 2),
	(12, '', 'Acqua 0.5L', 0.5, 2),
	(13, '', 'Birra Kromabacher 0.33L', 3, 2),
	(14, NULL, 'Gelato', 2.5, 3),
	(15, NULL, 'Pancake e Sciroppo d\'Acero', 3, 3),
	(16, NULL, 'Cheesecake ai Frutti di Bosco', 3, 3),
	(17, NULL, 'Cheesecake al Cioccolato', 3, 3),
	(18, NULL, 'Muffin al Pistacchio', 3, 3),
	(19, NULL, 'Muffin al Cioccolato', 3, 3),
	(20, NULL, 'Ciambella Glassata', 2, 3);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;

-- Dump della struttura di tabella paninoteca.ricetta
DROP TABLE IF EXISTS `ricetta`;
CREATE TABLE IF NOT EXISTS `ricetta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingrediente_id` int(11) DEFAULT NULL,
  `prodotto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKta1x6ebkqakri829bhu0dw45v` (`ingrediente_id`),
  KEY `FKn99bocirwqnwjublgsott4kgw` (`prodotto_id`),
  CONSTRAINT `FKn99bocirwqnwjublgsott4kgw` FOREIGN KEY (`prodotto_id`) REFERENCES `prodotto` (`id`),
  CONSTRAINT `FKta1x6ebkqakri829bhu0dw45v` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingrediente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella paninoteca.ricetta: ~37 rows (circa)
DELETE FROM `ricetta`;
/*!40000 ALTER TABLE `ricetta` DISABLE KEYS */;
INSERT INTO `ricetta` (`id`, `ingrediente_id`, `prodotto_id`) VALUES
	(1, 1, 1),
	(2, 4, 1),
	(3, 5, 1),
	(4, 2, 1),
	(5, 3, 1),
	(6, 1, 2),
	(8, 4, 2),
	(10, 5, 2),
	(12, 2, 2),
	(14, 3, 2),
	(16, 1, 3),
	(17, 7, 3),
	(18, 6, 3),
	(19, 2, 3),
	(20, 8, 3),
	(22, 1, 4),
	(24, 7, 4),
	(26, 6, 4),
	(28, 2, 4),
	(30, 8, 4),
	(36, 1, 5),
	(37, 8, 5),
	(38, 9, 5),
	(39, 6, 5),
	(40, 10, 6),
	(41, 1, 6),
	(42, 6, 6),
	(43, 11, 7),
	(44, 4, 7),
	(45, 12, 7),
	(46, 13, 14),
	(47, 14, 14),
	(48, 15, 14),
	(49, 16, 14),
	(50, 17, 14),
	(51, 18, 14),
	(52, 19, 14);
/*!40000 ALTER TABLE `ricetta` ENABLE KEYS */;

-- Dump della struttura di tabella paninoteca.ristorante
DROP TABLE IF EXISTS `ristorante`;
CREATE TABLE IF NOT EXISTS `ristorante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apertura` varchar(255) DEFAULT NULL,
  `chiusura` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella paninoteca.ristorante: ~4 rows (circa)
DELETE FROM `ristorante`;
/*!40000 ALTER TABLE `ristorante` DISABLE KEYS */;
INSERT INTO `ristorante` (`id`, `apertura`, `chiusura`, `descrizione`, `nome`) VALUES
	(1, '08:00', '15:00', NULL, 'La Paninoteca - Bari (Poggiofranco)'),
	(2, '17:00', '22:00', NULL, 'La Paninoteca - Bari (Palese)'),
	(3, '15:00', '22:00', '', 'La Paninoteca - Bari (via Argiro)'),
	(4, '15:00', '22:00', '', 'La Paninoteca - Bari (Torre a mare)');
/*!40000 ALTER TABLE `ristorante` ENABLE KEYS */;

-- Dump della struttura di tabella paninoteca.spring_session
DROP TABLE IF EXISTS `spring_session`;
CREATE TABLE IF NOT EXISTS `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dump dei dati della tabella paninoteca.spring_session: ~0 rows (circa)
DELETE FROM `spring_session`;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- Dump della struttura di tabella paninoteca.spring_session_attributes
DROP TABLE IF EXISTS `spring_session_attributes`;
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dump dei dati della tabella paninoteca.spring_session_attributes: ~0 rows (circa)
DELETE FROM `spring_session_attributes`;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
