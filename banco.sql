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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,0,0,'aAa@gmail.com','a','Aah','a','3122'),(3,2,0,0,'leandrin@hotmail.com','123','Leandro Falamto','231','1233344'),(4,1,0,1,'ads@a.com','a','A D S','das','321'),(5,1,0,0,'lucassouza@hotmail.com','lucas','Lucas Bememcasa','500','roubado'),(6,2,0,0,'teste22@teste22.com','1234','Lucas Souza','00000009','121212121'),(7,1,0,0,'dark@hotmail.com','bre123','Brunao','12312312312','922224444'),(8,1,0,0,'dark2@hotmail.com','99999','hauhsauhsua','22222222222','922224444');
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
INSERT INTO `estacionamento` VALUES (1,'Anhembi',55);
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
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `cpfCli` varchar(11) DEFAULT NULL,
  `data_entrada` date DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_reserva_idcli` (`id_cliente`),
  CONSTRAINT `fk_reserva_idcli` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,1,'1223','2019-11-29'),(2,1,'31231','2019-12-22'),(3,1,'31231','2019-10-22'),(4,1,'a','2019-12-29');
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'1',1,1,1,1,'2000-10-10 00:00:00','2000-11-10 00:00:00'),(2,'1',1,1,1,1,'2000-10-10 00:00:00','2000-11-10 00:00:00'),(3,'1',1,1,1,1,'1010-10-10 00:00:00','2000-11-10 00:00:00'),(4,'1',1,1,1,1,'2011-12-18 13:17:17','2000-11-10 00:00:00'),(5,'jdk1234',31,0,1,1,'2019-11-13 20:10:14',NULL),(6,'jdb1254',49,999999,1,2,'2019-11-13 20:23:57',NULL),(7,'jdb1254',63,3,1,2,'2019-11-13 20:24:09',NULL),(8,'abc134',21,999999,1,2,'2019-11-13 20:28:32',NULL),(9,'aaa1111',25,3,1,2,'2019-11-13 20:32:08',NULL),(10,'bbb2222',54,0,1,1,'2019-11-13 20:32:18',NULL),(11,'ccc2222',82,0,1,1,'2019-11-14 18:15:45',NULL),(12,'ddd3333',1,0,1,1,'2019-11-14 18:16:32',NULL),(13,'eee4444',85,0,1,1,'2019-11-14 18:37:43',NULL),(14,'ggg5555',61,0,1,1,'2019-11-14 18:38:33','2019-11-14 20:20:34'),(15,'hhh8888',29,0,1,1,'2019-11-14 18:40:26',NULL),(16,'jjj1234',78,0,1,1,'2019-11-14 18:41:51',NULL),(17,'kkk2222',34,0,1,1,'2019-11-14 18:44:24',NULL),(18,'lll1234',86,0,1,1,'2019-11-14 18:46:27',NULL),(19,'1',1,1,1,1,'2019-11-13 13:17:17','2019-11-14 13:17:17'),(20,'1',1,1,1,1,'2019-11-13 13:17:17','2019-11-14 15:43:17'),(21,'ppp1234',54,0,1,1,'2019-11-14 20:33:36','2019-11-14 20:34:10'),(22,'nnn6666',25,6,1,2,'2019-11-14 20:35:48','2019-11-14 20:36:04'),(23,'lol4343',18,0,1,1,'2019-11-14 20:50:52','2019-11-28 19:34:37'),(24,'xxx2222',32,0,1,1,'2019-11-14 21:03:03',NULL),(25,'uuuuuuu',44,0,1,1,'2019-11-14 21:04:08',NULL),(26,'uuuuuuu',12,0,1,1,'2019-11-14 21:04:18',NULL),(27,'uuuuuuu',8,0,1,1,'2019-11-14 21:04:24',NULL),(28,'uuuuuuu',6,0,1,1,'2019-11-14 21:04:31',NULL),(29,'uuuuuuu',34,0,1,1,'2019-11-14 21:04:49',NULL),(30,'uuuuuuu',49,0,1,1,'2019-11-14 21:04:54',NULL),(31,'uuuuuuu',11,0,1,1,'2019-11-14 21:04:59',NULL),(32,'uuuuuuu',10,0,1,1,'2019-11-14 21:05:06',NULL),(33,'uuuuuuu',20,0,1,1,'2019-11-14 21:05:10',NULL),(34,'uuuuuuu',2,0,1,1,'2019-11-14 21:05:16',NULL),(35,'uuuuuuu',38,0,1,1,'2019-11-14 21:05:26',NULL),(36,'uuuuuuu',5,0,1,1,'2019-11-14 21:05:30',NULL),(37,'uuuuuuu',14,0,1,1,'2019-11-14 21:05:35',NULL),(38,'uuuuuuu',55,0,1,1,'2019-11-14 21:05:41',NULL),(39,'uuuuuuu',7,0,1,1,'2019-11-14 21:05:45',NULL),(40,'uuuuuuu',40,0,1,1,'2019-11-14 21:05:50',NULL),(41,'uuuuuuu',52,0,1,1,'2019-11-14 21:05:56',NULL),(42,'uuuuuuu',3,0,1,1,'2019-11-14 21:06:04',NULL),(43,'uuuuuuu',19,0,1,1,'2019-11-14 21:06:09',NULL),(44,'uuuuuuu',36,0,1,1,'2019-11-14 21:06:14',NULL),(45,'uuuuuuu',1,0,1,1,'2019-11-14 21:06:18',NULL),(46,'uuuuuuu',4,0,1,1,'2019-11-14 21:06:25',NULL),(47,'uuuuuuu',17,0,1,1,'2019-11-14 21:06:30',NULL),(48,'uuuuuuu',18,0,1,1,'2019-11-14 21:06:34',NULL),(49,'ggg5555',24,0,1,1,'2019-11-14 21:06:38',NULL),(50,'uuuuuuu',39,0,1,1,'2019-11-14 21:06:45',NULL),(51,'uuuuuuu',37,0,1,1,'2019-11-14 21:06:48',NULL),(52,'uuuuuuu',16,0,1,1,'2019-11-14 21:06:52',NULL),(53,'uuuuuuu',45,0,1,1,'2019-11-14 21:06:57',NULL),(54,'uuuuuuu',30,0,1,1,'2019-11-14 21:07:02',NULL),(55,'uuuuuuu',23,0,1,1,'2019-11-14 21:07:06',NULL),(56,'uuuuuuu',42,0,1,1,'2019-11-14 21:07:10',NULL),(57,'uuuuuuu',31,0,1,1,'2019-11-14 21:07:16',NULL),(58,'uuuuuuu',15,0,1,1,'2019-11-14 21:07:21',NULL),(59,'uuuuuuu',51,0,1,1,'2019-11-14 21:07:26',NULL),(60,'uuuuuuu',27,0,1,1,'2019-11-14 21:07:31',NULL),(61,'uuuuuuu',47,0,1,1,'2019-11-14 21:07:36',NULL),(62,'uuuuuuu',13,0,1,1,'2019-11-14 21:07:41',NULL),(63,'uuuuuuu',33,0,1,1,'2019-11-14 21:07:45',NULL),(64,'uuuuuuu',53,0,1,1,'2019-11-14 21:07:49',NULL),(65,'uuuuuuu',22,0,1,1,'2019-11-14 21:07:53',NULL),(66,'uuuuuuu',50,0,1,1,'2019-11-14 21:07:57',NULL),(67,'uuuuuuu',35,0,1,1,'2019-11-14 21:08:01',NULL),(68,'uuuuuuu',26,0,1,1,'2019-11-14 21:08:06',NULL),(69,'uuuuuuu',28,0,1,1,'2019-11-14 21:08:10',NULL),(70,'uuuuuuu',21,0,1,1,'2019-11-14 21:08:14',NULL),(71,'uuuuuuu',48,0,1,1,'2019-11-14 21:08:18',NULL),(72,'uuuuuuu',41,0,1,1,'2019-11-14 21:08:24',NULL),(73,'uuuuuuu',46,0,1,1,'2019-11-14 21:08:28',NULL),(74,'uuuuuuu',43,0,1,1,'2019-11-14 21:08:32',NULL),(75,'uuuuuuu',29,0,1,1,'2019-11-14 21:08:41',NULL),(76,'uuuuuuu',9,0,1,1,'2019-11-14 21:09:01','2019-11-14 21:11:10'),(77,'uuuuuuu',1,0,1,1,'2019-11-14 21:16:14',NULL),(78,'naopcdp',1,0,1,1,'2019-11-14 21:18:55',NULL),(79,'naopcdp',3,0,1,1,'2019-11-14 21:23:05',NULL),(80,'naoepcd',4,0,1,1,'2019-11-14 21:23:15',NULL),(81,'lol3232',5,0,1,1,'2019-11-14 21:23:29',NULL),(82,'maisum1',2,0,1,1,'2019-11-14 21:23:56','2019-11-28 19:35:03'),(83,'ggg5555',1,0,1,1,'2019-11-21 21:40:08','2019-11-28 19:35:09');
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
INSERT INTO `tipo_servico` VALUES (1,1,50,0,10,20,'Avulso'),(2,2,0,500,0,0,'Mensalista'),(3,1,0,0,0,0,'Reserva');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaga`
--

LOCK TABLES `vaga` WRITE;
/*!40000 ALTER TABLE `vaga` DISABLE KEYS */;
INSERT INTO `vaga` VALUES (1,'Disponível','PCD'),(2,'Disponível','PCD'),(3,'Disponível','Comum'),(4,'Disponível','Comum'),(5,'Disponível','Comum'),(6,'Disponível','Comum'),(7,'Disponível','Comum'),(8,'Disponível','Comum'),(9,'Disponível','Comum'),(10,'Disponível','Comum'),(11,'Disponível','Comum'),(12,'Disponível','Comum'),(13,'Disponível','Comum'),(14,'Disponível','Comum'),(15,'Disponível','Comum'),(16,'Disponível','Comum'),(17,'Disponível','Comum'),(18,'Disponível','Comum'),(19,'Disponível','Comum'),(20,'Disponível','Comum'),(21,'Disponível','Comum'),(22,'Disponível','Comum'),(23,'Disponível','Comum'),(24,'Disponível','Comum'),(25,'Disponível','Comum'),(26,'Disponível','Comum'),(27,'Disponível','Comum'),(28,'Disponível','Comum'),(29,'Disponível','Comum'),(30,'Disponível','Comum'),(31,'Disponível','Comum'),(32,'Disponível','Comum'),(33,'Disponível','Comum'),(34,'Disponível','Comum'),(35,'Disponível','Comum'),(36,'Disponível','Comum'),(37,'Disponível','Comum'),(38,'Disponível','Comum'),(39,'Disponível','Comum'),(40,'Disponível','Comum'),(41,'Disponível','Comum'),(42,'Disponível','Comum'),(43,'Disponível','Comum'),(44,'Disponível','Comum'),(45,'Disponível','Comum'),(46,'Disponível','Comum'),(47,'Disponível','Comum'),(48,'Disponível','Comum'),(49,'Disponível','Comum'),(50,'Disponível','Comum'),(51,'Disponível','Comum'),(52,'Disponível','Comum'),(53,'Disponível','Comum'),(54,'Disponível','Comum'),(55,'Disponível','Comum');
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

-- Dump completed on 2019-11-28 20:50:53
