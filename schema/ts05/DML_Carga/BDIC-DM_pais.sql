CREATE DATABASE  IF NOT EXISTS `BDIC-DM` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `BDIC-DM`;
-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (i686)
--
-- Host: orion2412.startdedicated.net    Database: BDIC-DM
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `pais_id` int(11) NOT NULL,
  `pais_nm` char(40) NOT NULL,
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Afeganistão'),(2,'África do Sul'),(3,'Akrotiri'),(4,'Albânia'),(5,'Alemanha'),(6,'Andorra'),(7,'Angola'),(8,'Anguila'),(9,'Antárctida'),(10,'Antígua e Barbuda'),(11,'Antilhas Neerlandesas'),(12,'Arábia Saudita'),(13,'Arctic Ocean'),(14,'Argélia'),(15,'Argentina'),(16,'Arménia'),(17,'Aruba'),(18,'Ashmore and Cartier Islands'),(19,'Atlantic Ocean'),(20,'Austrália'),(21,'Áustria'),(22,'Azerbaijão'),(23,'Baamas'),(24,'Bangladeche'),(25,'Barbados'),(26,'Barém'),(27,'Bélgica'),(28,'Belize'),(29,'Benim'),(30,'Bermudas'),(31,'Bielorrússia'),(32,'Birmânia'),(33,'Bolívia'),(34,'Bósnia e Herzegovina'),(35,'Botsuana'),(36,'Brasil'),(37,'Brunei'),(38,'Bulgária'),(39,'Burquina Faso'),(40,'Burúndi'),(41,'Butão'),(42,'Cabo Verde'),(43,'Camarões'),(44,'Camboja'),(45,'Canadá'),(46,'Catar'),(47,'Cazaquistão'),(48,'Chade'),(49,'Chile'),(50,'China'),(51,'Chipre'),(52,'Clipperton Island'),(53,'Colômbia'),(54,'Comores'),(55,'Congo-Brazzaville'),(56,'Congo-Kinshasa'),(57,'Coral Sea Islands'),(58,'Coreia do Norte'),(59,'Coreia do Sul'),(60,'Costa do Marfim'),(61,'Costa Rica'),(62,'Croácia'),(63,'Cuba'),(64,'Dhekelia'),(65,'Dinamarca'),(66,'Domínica'),(67,'Egipto'),(68,'Emiratos Árabes Unidos'),(69,'Equador'),(70,'Eritreia'),(71,'Eslováquia'),(72,'Eslovénia'),(73,'Espanha'),(74,'Estados Unidos'),(75,'Estónia'),(76,'Etiópia'),(77,'Faroé'),(78,'Fiji'),(79,'Filipinas'),(80,'Finlândia'),(81,'França'),(82,'Gabão'),(83,'Gâmbia'),(84,'Gana'),(85,'Gaza Strip'),(86,'Geórgia'),(87,'Geórgia do Sul e Sandwich do Sul'),(88,'Gibraltar'),(89,'Granada'),(90,'Grécia'),(91,'Gronelândia'),(92,'Guame'),(93,'Guatemala'),(94,'Guernsey'),(95,'Guiana'),(96,'Guiné'),(97,'Guiné Equatorial'),(98,'Guiné-Bissau'),(99,'Haiti'),(100,'Honduras'),(101,'Hong Kong'),(102,'Hungria'),(103,'Iémen'),(104,'Ilha Bouvet'),(105,'Ilha do Natal'),(106,'Ilha Norfolk'),(107,'Ilhas Caimão'),(108,'Ilhas Cook'),(109,'Ilhas dos Cocos'),(110,'Ilhas Falkland'),(111,'Ilhas Heard e McDonald'),(112,'Ilhas Marshall'),(113,'Ilhas Salomão'),(114,'Ilhas Turcas e Caicos'),(115,'Ilhas Virgens Americanas'),(116,'Ilhas Virgens Britânicas'),(117,'Índia'),(118,'Indian Ocean'),(119,'Indonésia'),(120,'Irão'),(121,'Iraque'),(122,'Irlanda'),(123,'Islândia'),(124,'Israel'),(125,'Itália'),(126,'Jamaica'),(127,'Jan Mayen'),(128,'Japão'),(129,'Jersey'),(130,'Jibuti'),(131,'Jordânia'),(132,'Kuwait'),(133,'Laos'),(134,'Lesoto'),(135,'Letónia'),(136,'Líbano'),(137,'Libéria'),(138,'Líbia'),(139,'Listenstaine'),(140,'Lituânia'),(141,'Luxemburgo'),(142,'Macau'),(143,'Macedónia'),(144,'Madagáscar'),(145,'Malásia'),(146,'Malávi'),(147,'Maldivas'),(148,'Mali'),(149,'Malta'),(150,'Man Isle of'),(151,'Marianas do Norte'),(152,'Marrocos'),(153,'Maurícia'),(154,'Mauritânia'),(155,'Mayotte'),(156,'México'),(157,'Micronésia'),(158,'Moçambique'),(159,'Moldávia'),(160,'Mónaco'),(161,'Mongólia'),(162,'Monserrate'),(163,'Montenegro'),(164,'Mundo'),(165,'Namíbia'),(166,'Nauru'),(167,'Navassa Island'),(168,'Nepal'),(169,'Nicarágua'),(170,'Níger'),(171,'Nigéria'),(172,'Niue'),(173,'Noruega'),(174,'Nova Caledónia'),(175,'Nova Zelândia'),(176,'Omã'),(177,'Pacific Ocean'),(178,'Países Baixos'),(179,'Palau'),(180,'Panamá'),(181,'Papua-Nova Guiné'),(182,'Paquistão'),(183,'Paracel Islands'),(184,'Paraguai'),(185,'Peru'),(186,'Pitcairn'),(187,'Polinésia Francesa'),(188,'Polónia'),(189,'Porto Rico'),(190,'Portugal'),(191,'Quénia'),(192,'Quirguizistão'),(193,'Quiribáti'),(194,'Reino Unido'),(195,'República Centro-Africana'),(196,'República Checa'),(197,'República Dominicana'),(198,'Roménia'),(199,'Ruanda'),(200,'Rússia'),(201,'Salvador'),(202,'Samoa'),(203,'Samoa Americana'),(204,'Santa Helena'),(205,'Santa Lúcia'),(206,'São Cristóvão e Neves'),(207,'São Marinho'),(208,'São Pedro e Miquelon'),(209,'São Tomé e Príncipe'),(210,'São Vicente e Granadinas'),(211,'Sara Ocidental'),(212,'Seicheles'),(213,'Senegal'),(214,'Serra Leoa'),(215,'Sérvia'),(216,'Singapura'),(217,'Síria'),(218,'Somália'),(219,'Southern Ocean'),(220,'Spratly Islands'),(221,'Sri Lanca'),(222,'Suazilândia'),(223,'Sudão'),(224,'Suécia'),(225,'Suíça'),(226,'Suriname'),(227,'Svalbard e Jan Mayen'),(228,'Tailândia'),(229,'Taiwan'),(230,'Tajiquistão'),(231,'Tanzânia'),(232,'Território Britânico do Oceano Índico'),(233,'Territórios Austrais Franceses'),(234,'Timor Leste'),(235,'Togo'),(236,'Tokelau'),(237,'Tonga'),(238,'Trindade e Tobago'),(239,'Tunísia'),(240,'Turquemenistão'),(241,'Turquia'),(242,'Tuvalu'),(243,'Ucrânia'),(244,'Uganda'),(245,'União Europeia'),(246,'Uruguai'),(247,'Usbequistão'),(248,'Vanuatu'),(249,'Vaticano'),(250,'Venezuela'),(251,'Vietname'),(252,'Wake Island'),(253,'Wallis e Futuna'),(254,'West Bank'),(255,'Zâmbia'),(256,'Zimbabué'),(260,'Afeganistão');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-09 23:30:25
