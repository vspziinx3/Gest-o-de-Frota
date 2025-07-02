CREATE DATABASE  IF NOT EXISTS `locadora_frota` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `locadora_frota`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: locadora_frota
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `manutencao`
--

DROP TABLE IF EXISTS `manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencao` (
  `id_manutencao` int NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `tipo` enum('preventiva','corretiva') DEFAULT NULL,
  `quilometragem` int DEFAULT NULL,
  `descricao` text,
  `custo_total` decimal(10,2) DEFAULT NULL,
  `id_veiculo` int DEFAULT NULL,
  `id_oficina` int DEFAULT NULL,
  `id_responsavel` int DEFAULT NULL,
  PRIMARY KEY (`id_manutencao`),
  KEY `id_veiculo` (`id_veiculo`),
  KEY `id_oficina` (`id_oficina`),
  KEY `id_responsavel` (`id_responsavel`),
  CONSTRAINT `manutencao_ibfk_1` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`),
  CONSTRAINT `manutencao_ibfk_2` FOREIGN KEY (`id_oficina`) REFERENCES `oficina` (`id_oficina`),
  CONSTRAINT `manutencao_ibfk_3` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id_responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencao`
--

LOCK TABLES `manutencao` WRITE;
/*!40000 ALTER TABLE `manutencao` DISABLE KEYS */;
INSERT INTO `manutencao` VALUES (1,'2024-04-15','preventiva',15000,'Troca de óleo e filtro',180.00,1,3,3),(2,'2024-05-02','corretiva',22300,'Reparo em funilaria e pintura lateral',950.00,2,2,2),(3,'2024-06-10','preventiva',10000,'Revisão geral com troca de óleo',320.00,3,1,1),(4,'2024-06-18','corretiva',30050,'Troca de pastilhas de freio e disco',600.00,4,1,1);
/*!40000 ALTER TABLE `manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oficina`
--

DROP TABLE IF EXISTS `oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oficina` (
  `id_oficina` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_oficina`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficina`
--

LOCK TABLES `oficina` WRITE;
/*!40000 ALTER TABLE `oficina` DISABLE KEYS */;
INSERT INTO `oficina` VALUES (1,'Loja do Mecanico','00.111.222/0001-00','11999999999','Rua das Oficinas, 123 - SP'),(2,'Criativo Lataria e Pintura','11.222.333/0001-11','11988888888','Av. Funilaria, 456 - SP'),(3,'Loja Lub Lubrificacao','22.333.444/0001-22','11777777777','Travessa do Óleo, 789 - SP');
/*!40000 ALTER TABLE `oficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca` (
  `id_peca` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `valor_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_peca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (1,'Óleo 5W30','Lubrax',45.00),(2,'Filtro de óleo','Fram',35.00),(3,'Pastilha de freio','Bosch',180.00),(4,'Disco de freio','Bosch',200.00),(5,'Serviço de funilaria e pintura','Interno',950.00),(6,'Mão de obra revisão geral','Interno',150.00);
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca_manutencao`
--

DROP TABLE IF EXISTS `peca_manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca_manutencao` (
  `id_peca` int NOT NULL,
  `id_manutencao` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_peca`,`id_manutencao`),
  KEY `id_manutencao` (`id_manutencao`),
  CONSTRAINT `peca_manutencao_ibfk_1` FOREIGN KEY (`id_peca`) REFERENCES `peca` (`id_peca`),
  CONSTRAINT `peca_manutencao_ibfk_2` FOREIGN KEY (`id_manutencao`) REFERENCES `manutencao` (`id_manutencao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca_manutencao`
--

LOCK TABLES `peca_manutencao` WRITE;
/*!40000 ALTER TABLE `peca_manutencao` DISABLE KEYS */;
INSERT INTO `peca_manutencao` VALUES (1,1,1,45.00),(1,3,1,45.00),(2,1,1,35.00),(2,3,1,35.00),(3,4,1,180.00),(4,4,2,400.00),(5,2,1,950.00),(6,3,1,150.00);
/*!40000 ALTER TABLE `peca_manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel` (
  `id_responsavel` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_responsavel`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
INSERT INTO `responsavel` VALUES (1,'João Mecanico','Mecânico','111.111.111-11'),(2,'José Latoeiro','Latoeiro','222.222.222-22'),(3,'Gilmar Técnico em lubrificação','Técnico em Lubrificação','333.333.333-33');
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id_veiculo` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) NOT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `chassi` varchar(20) DEFAULT NULL,
  `status` enum('ativo','em manutenção','desativado') DEFAULT 'ativo',
  PRIMARY KEY (`id_veiculo`),
  UNIQUE KEY `placa` (`placa`),
  UNIQUE KEY `chassi` (`chassi`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'ABC1A23','Onix','Chevrolet',2021,'9BG1234567ABCDEF1','ativo'),(2,'DEF4B56','Argo','Fiat',2022,'8AD4567890FIATXYZ2','ativo'),(3,'GHI7C89','Polo Track','Volkswagen',2023,'9BW7890123VWPOLO3','ativo'),(4,'JKL0D12','Kwid','Renault',2020,'93Y4567890RENKWID4','ativo'),(5,'MNO3E45','Mobi','Fiat',2019,'8AF1234567FIATMOB5','ativo'),(6,'PQR6F78','Creta','Hyundai',2023,'93H8901234HYUCRET6','ativo'),(37,'ABC1B23','Onix','Chevrolet',2021,'9BG1234567ABCDEF2','ativo'),(38,'DEF4B57','Argo','Fiat',2022,'8AD4567890FIATXYZ3','ativo'),(39,'GHI7C99','Polo Track','Volkswagen',2023,'9BW7890113VWPOLO3','ativo'),(40,'JKL0D42','Kwid','Renault',2020,'93Y4367890RENKWID4','ativo'),(41,'MNO3E95','Mobi','Fiat',2019,'8AF1234567GIATMOB5','ativo'),(42,'PQR6Q78','Creta','Hyundai',2023,'93H8901634HYUCRET6','ativo');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 20:53:41
