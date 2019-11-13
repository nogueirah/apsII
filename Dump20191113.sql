-- MySQL dump 10.13  Distrib 5.5.14, for Win32 (x86)
--
-- Host: localhost    Database: estacionamento
-- ------------------------------------------------------
-- Server version	5.5.14

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_cliente` int(2) NOT NULL,
  `bloqueado` tinyint(1) NOT NULL,
  `pcd` tinyint(1) NOT NULL,
  `emailCli` varchar(45) NOT NULL,
  `senhaCli` varchar(10) NOT NULL,
  `nomeCli` varchar(50) NOT NULL,
  `cpfCli` varchar(11) NOT NULL,
  `celularCli` varchar(12) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_cli_tipocli` (`id_tipo_cliente`),
  CONSTRAINT `fk_cli_tipocli` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipo_cliente` (`id_tipo_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,0,0,'aAa@gmail.com','a','Aah','a','23'),(3,2,0,0,'leandrin@hotmail.com','123','Leandro Falamto','231','1233344'),(4,1,0,1,'ads@a.com','a','A D S','das','321'),(5,1,0,0,'lucassouza@hotmail.com','lucas','Lucas Bememcasa','500','roubado');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `rua` varchar(300) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `Id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES ('Av. Paulista','1415','Jardim Paulista','Em frente ao MASP','São Paulo','SP',1);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacionamento`
--

DROP TABLE IF EXISTS `estacionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estacionamento` (
  `id_estacionamento` int(11) NOT NULL,
  `nome_estacionamento` varchar(45) DEFAULT NULL,
  `total_vagas` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_estacionamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacionamento`
--

LOCK TABLES `estacionamento` WRITE;
/*!40000 ALTER TABLE `estacionamento` DISABLE KEYS */;
INSERT INTO `estacionamento` VALUES (1,'Anhembi',99);
/*!40000 ALTER TABLE `estacionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `nomeFun` varchar(45) NOT NULL,
  `cpfFun` varchar(11) NOT NULL,
  `Id_endereco` int(11) NOT NULL,
  `celularFun` varchar(12) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `fk_fun_endfun` (`Id_endereco`),
  CONSTRAINT `fk_fun_endfun` FOREIGN KEY (`Id_endereco`) REFERENCES `endereco` (`Id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'admin','admin','Lucas Benincasa','12345678311',1,'roubado');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `data_entrada` date DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_reserva_idcli` (`id_cliente`),
  KEY `fk_reserva_idserv` (`id_servico`),
  CONSTRAINT `fk_reserva_idcli` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_reserva_idserv` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `id_servico` int(11) NOT NULL AUTO_INCREMENT,
  `placaCli` varchar(7) NOT NULL,
  `id_vaga` int(5) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_tipo_servico` int(11) NOT NULL,
  `dh_entrada` datetime DEFAULT NULL,
  `dh_saida` datetime DEFAULT NULL,
  PRIMARY KEY (`id_servico`),
  KEY `fk_serv_idfun` (`id_funcionario`),
  CONSTRAINT `fk_serv_idfun` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'1',1,1,1,1,'2000-10-10 00:00:00','2000-11-10 00:00:00'),(2,'1',1,1,1,1,'2000-10-10 00:00:00','2000-11-10 00:00:00'),(3,'1',1,1,1,1,'1010-10-10 00:00:00','2000-11-10 00:00:00'),(4,'1',1,1,1,1,'2011-12-18 13:17:17','2000-11-10 00:00:00'),(5,'jdk1234',31,0,1,1,'2019-11-13 20:10:14',NULL),(6,'jdb1254',49,999999,1,2,'2019-11-13 20:23:57',NULL),(7,'jdb1254',63,3,1,2,'2019-11-13 20:24:09',NULL),(8,'abc134',21,999999,1,2,'2019-11-13 20:28:32',NULL),(9,'aaa1111',25,3,1,2,'2019-11-13 20:32:08',NULL),(10,'bbb2222',54,0,1,1,'2019-11-13 20:32:18',NULL);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cliente`
--

DROP TABLE IF EXISTS `tipo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cliente` (
  `id_tipo_cliente` int(2) NOT NULL,
  `desc_tipo_cliente` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cliente`
--

LOCK TABLES `tipo_cliente` WRITE;
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
INSERT INTO `tipo_cliente` VALUES (1,'Avulso'),(2,'Mensalista');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servico`
--

DROP TABLE IF EXISTS `tipo_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_servico` (
  `id_tipo_servico` int(11) NOT NULL,
  `id_tipo_cliente` int(11) NOT NULL,
  `valor_diario` float NOT NULL,
  `valor_mensal` float NOT NULL,
  `valor_demais_hora` float DEFAULT NULL,
  `ate_uma_hora` float DEFAULT NULL,
  `desc_tipo_servico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_servico`),
  KEY `fk_tiposerv_idtipo` (`id_tipo_cliente`),
  CONSTRAINT `fk_tiposerv_idtipo` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipo_cliente` (`id_tipo_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servico`
--

LOCK TABLES `tipo_servico` WRITE;
/*!40000 ALTER TABLE `tipo_servico` DISABLE KEYS */;
INSERT INTO `tipo_servico` VALUES (1,1,50,0,8,12,'Avulso'),(2,2,0,0,500,0,'Mensalista');
/*!40000 ALTER TABLE `tipo_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaga`
--

DROP TABLE IF EXISTS `vaga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaga` (
  `id_vaga` int(5) NOT NULL AUTO_INCREMENT,
  `status_vaga` varchar(15) NOT NULL,
  `tipo_vaga` varchar(45) NOT NULL,
  PRIMARY KEY (`id_vaga`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaga`
--

LOCK TABLES `vaga` WRITE;
/*!40000 ALTER TABLE `vaga` DISABLE KEYS */;
INSERT INTO `vaga` VALUES (1,'Disponível','PCD'),(2,'Disponível','PCD'),(3,'Ocupado','Comum'),(4,'Disponível','Comum'),(5,'Disponível','Comum'),(6,'Disponível','Comum'),(7,'Disponível','Comum'),(8,'Disponível','Comum'),(9,'Disponível','Comum'),(10,'Ocupado','Comum'),(11,'Disponível','Comum'),(12,'Disponível','Comum'),(13,'Disponível','Comum'),(14,'Disponível','Comum'),(15,'Disponível','Comum'),(16,'Disponível','Comum'),(17,'Ocupado','Comum'),(18,'Disponível','Comum'),(19,'Disponível','Comum'),(20,'Disponível','Comum'),(21,'Ocupado','Comum'),(22,'Disponível','Comum'),(23,'Ocupado','Comum'),(24,'Disponível','Comum'),(25,'Ocupado','Comum'),(26,'Disponível','Comum'),(27,'Disponível','Comum'),(28,'Disponível','Comum'),(29,'Disponível','Comum'),(30,'Disponível','Comum'),(31,'Ocupado','Comum'),(32,'Disponível','Comum'),(33,'Ocupado','Comum'),(34,'Disponível','Comum'),(35,'Disponível','Comum'),(36,'Disponível','Comum'),(37,'Disponível','Comum'),(38,'Disponível','Comum'),(39,'Disponível','Comum'),(40,'Disponível','Comum'),(41,'Disponível','Comum'),(42,'Disponível','Comum'),(43,'Disponível','Comum'),(44,'Disponível','Comum'),(45,'Disponível','Comum'),(46,'Disponível','Comum'),(47,'Ocupado','Comum'),(48,'Disponível','Comum'),(49,'Ocupado','Comum'),(50,'Disponível','Comum'),(51,'Disponível','Comum'),(52,'Disponível','Comum'),(53,'Disponível','Comum'),(54,'Ocupado','Comum'),(55,'Disponível','Comum'),(56,'Disponível','Comum'),(57,'Disponível','Comum'),(58,'Disponível','Comum'),(59,'Disponível','Comum'),(60,'Disponível','Comum'),(61,'Disponível','Comum'),(62,'Disponível','Comum'),(63,'Ocupado','Comum'),(64,'Disponível','Comum'),(65,'Disponível','Comum'),(66,'Disponível','Comum'),(67,'Disponível','Comum'),(68,'Disponível','Comum'),(69,'Disponível','Comum'),(70,'Disponível','Comum'),(71,'Disponível','Comum'),(72,'Ocupado','Comum'),(73,'Disponível','Comum'),(74,'Disponível','Comum'),(75,'Disponível','Comum'),(76,'Disponível','Comum'),(77,'Disponível','Comum'),(78,'Disponível','Comum'),(79,'Disponível','Comum'),(80,'Disponível','Comum'),(81,'Disponível','Comum'),(82,'Disponível','Comum'),(83,'Disponível','Comum'),(84,'Disponível','Comum'),(85,'Disponível','Comum'),(86,'Disponível','Comum'),(87,'Disponível','Comum'),(88,'Disponível','Comum'),(89,'Disponível','Comum'),(90,'Disponível','Comum'),(91,'Disponível','Comum'),(92,'Disponível','Comum'),(93,'Disponível','Comum'),(94,'Disponível','Comum'),(95,'Disponível','Comum'),(96,'Disponível','Comum'),(97,'Disponível','Comum'),(98,'Disponível','Comum'),(99,'Disponível','Comum');
/*!40000 ALTER TABLE `vaga` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13 20:42:39
