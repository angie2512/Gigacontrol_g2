-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: gigacontrol
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `comentarincidencia`
--

DROP TABLE IF EXISTS `comentarincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarincidencia` (
  `idComentario` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idIncidencia` int NOT NULL,
  `ComentarioIncidencia` longtext NOT NULL,
  PRIMARY KEY (`idComentario`,`idUsuario`,`idIncidencia`),
  KEY `fk_idUsuario_has_Incidencia_Incidencia1_idx` (`idIncidencia`),
  KEY `fk_idUsuario_has_Incidencia_idUsuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_idUsuario_has_Incidencia_idUsuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_idUsuario_has_Incidencia_Incidencia1` FOREIGN KEY (`idIncidencia`) REFERENCES `incidencia` (`idIncidencia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarincidencia`
--

LOCK TABLES `comentarincidencia` WRITE;
/*!40000 ALTER TABLE `comentarincidencia` DISABLE KEYS */;
INSERT INTO `comentarincidencia` VALUES (1,2,1,'La grieta aun puede hacerse mas grande'),(2,3,3,''),(3,4,2,''),(4,5,4,'Es demasiado urgente, no puedo caminar bien'),(5,6,5,''),(6,7,6,''),(7,9,7,'Urgente, se necesita volver intentar resolver esta incidencia, necesito usar el lab'),(8,11,9,'En mi laptop tengo muchas cosas importante'),(9,12,8,'Necesito encontrarla'),(10,13,10,'Porfavor atender la incidencia con urgencia');
/*!40000 ALTER TABLE `comentarincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destacarincidencia`
--

DROP TABLE IF EXISTS `destacarincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destacarincidencia` (
  `idUsuario` int NOT NULL,
  `idIncidencia` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idIncidencia`),
  KEY `fk_Usuario_has_Incidencia_Incidencia1_idx` (`idIncidencia`),
  KEY `fk_Usuario_has_Incidencia_Usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_Usuario_has_Incidencia_Incidencia1` FOREIGN KEY (`idIncidencia`) REFERENCES `incidencia` (`idIncidencia`),
  CONSTRAINT `fk_Usuario_has_Incidencia_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destacarincidencia`
--

LOCK TABLES `destacarincidencia` WRITE;
/*!40000 ALTER TABLE `destacarincidencia` DISABLE KEYS */;
INSERT INTO `destacarincidencia` VALUES (10,1),(11,1),(2,2),(4,2),(9,2),(3,3),(1,4),(15,4),(8,5),(14,5),(13,6),(5,7),(12,7),(6,8),(2,10),(7,10),(8,10);
/*!40000 ALTER TABLE `destacarincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idEstado` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'En Proceso'),(2,'Registrado'),(3,'Atendido'),(4,'Resuelto');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencia`
--

DROP TABLE IF EXISTS `incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencia` (
  `idIncidencia` int NOT NULL AUTO_INCREMENT,
  `NombreDeIncidencia` varchar(45) NOT NULL,
  `Descripcion` text NOT NULL,
  `ZonaPUCP` varchar(100) NOT NULL,
  `Ubicacion` varchar(100) NOT NULL,
  `Foto` blob,
  `idUsuario` int NOT NULL,
  `idTipoIncidencia` int NOT NULL,
  `idNivelUrgencia` int NOT NULL,
  `idEstado` int NOT NULL,
  PRIMARY KEY (`idIncidencia`),
  KEY `fk_Incidencia_Usuario1_idx` (`idUsuario`),
  KEY `fk_Incidencia_TipoIncidencia1_idx` (`idTipoIncidencia`),
  KEY `fk_Incidencia_NivelUrgencia1_idx` (`idNivelUrgencia`),
  KEY `fk_Incidencia_Estado1_idx` (`idEstado`),
  CONSTRAINT `fk_Incidencia_Estado1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  CONSTRAINT `fk_Incidencia_NivelUrgencia1` FOREIGN KEY (`idNivelUrgencia`) REFERENCES `nivelurgencia` (`idNivelUrgencia`),
  CONSTRAINT `fk_Incidencia_TipoIncidencia1` FOREIGN KEY (`idTipoIncidencia`) REFERENCES `tipoincidencia` (`idTipoIncidencia`),
  CONSTRAINT `fk_Incidencia_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencia`
--

LOCK TABLES `incidencia` WRITE;
/*!40000 ALTER TABLE `incidencia` DISABLE KEYS */;
INSERT INTO `incidencia` VALUES (1,'Hay una grieta notable','La grieta es de aproximadamente 15 ccm, alrededor existe humedad','ceprepuc','aula 305',NULL,10,3,2,3),(2,'La baranda de la escalera esta floja','Al usar la baranda, esta se sale fácilmente','pabellon Z','piso 2',NULL,6,3,3,4),(3,'Olvide mis audifonos ','Al revisar mi mochila me di cuenta que faltaban mis audifonos y el último lugar en el que estuve fue cia','cia','cubiculo 19',NULL,1,2,1,4),(4,'Me tropecé con la mesa ','Sin fijarme, tropecé y ahora siento hinchado mi dedo del pie','tinkuy','piso 1',NULL,2,4,2,3),(5,'No encuentro mi calculadora cientifica','Estuve en la azotea estudiando, luego comenzo a llover y tuve que guardar mis cosas rapido, sin embargo no pude guardar mi calculadora','comedor central','azotea',NULL,1,2,2,4),(6,'Mi amigo se desmayo ','El cubiculo fue muy pequenio y mi amigo no pudo soportarlo','biblioteca central','cubiculo 108',NULL,2,5,3,4),(7,'Sono un ruido extraño','Para poder cargar mi laptop conecte su cargador y de pronto salieron chispas y se escucho un sonido extraño','pabellon V','laboratorio 306',NULL,1,6,3,1),(8,'No encontre mi laptop','Tenia muchas ganas de ir al banio, por eso la deje por menos de cinco minutos, luego volvi y no estaba','mac gregor','banio',NULL,4,2,2,2),(9,'Me robaron mi cartuchera','Un chico estuvo cerca mio en la biblioteca, luego de un rato desaparecio y me di cuenta que no estaba mi cartuchera','biblioteca sociales','sotano 1',NULL,8,1,2,2),(10,'Se me cayo un collar','Cuando estaba guardando mis cosas,  luego de terminar mi rutina, no encontre mi collar','polideportivo','cancha',NULL,4,2,1,1);
/*!40000 ALTER TABLE `incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelurgencia`
--

DROP TABLE IF EXISTS `nivelurgencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivelurgencia` (
  `idNivelUrgencia` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idNivelUrgencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelurgencia`
--

LOCK TABLES `nivelurgencia` WRITE;
/*!40000 ALTER TABLE `nivelurgencia` DISABLE KEYS */;
INSERT INTO `nivelurgencia` VALUES (1,'Leve'),(2,'Moderado'),(3,'Critico');
/*!40000 ALTER TABLE `nivelurgencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'seguridad'),(2,'usuario pucp');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoincidencia`
--

DROP TABLE IF EXISTS `tipoincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoincidencia` (
  `idTipoIncidencia` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoIncidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoincidencia`
--

LOCK TABLES `tipoincidencia` WRITE;
/*!40000 ALTER TABLE `tipoincidencia` DISABLE KEYS */;
INSERT INTO `tipoincidencia` VALUES (1,'robo'),(2,'objetos perdidos'),(3,'infraestructura'),(4,'accidente'),(5,'ambulancia PUCP'),(6,'otros');
/*!40000 ALTER TABLE `tipoincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Contrasenia` varchar(256) NOT NULL,
  `Codigo` char(8) NOT NULL,
  `DNI` char(8) NOT NULL,
  `Celular` char(9) NOT NULL,
  `Categoria` varchar(45) NOT NULL,
  `FotoPerfil` blob,
  `Rol_idRol` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_idUsuario_Rol1_idx` (`Rol_idRol`),
  CONSTRAINT `fk_idUsuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Alexia','Jauregui','a20192270@pucp.edu.pe','61121375ef52259541ae121ae8e4373449957ce8b803a5289cc1794a5d61e51d','20192270','78223422','993344562','alumno',NULL,2),(2,'Angie','Alejandro','a20191792@pucp.edu.pe','2e8811270bf6d46d8add83c072b55a5bc746fd471b8c8e346c1eef846d462900','20191792','70862602','997210426','alumno',NULL,2),(3,'Anais','Salvador','a20202152@pucp.edu.pe','45f112999247e3517ad9f89ab3a6a0cced97a58d9fa2e4590b1bacc10fc61b45','20202152','72679933','990122890','alumno',NULL,2),(4,'Christian','Gonzales','a20181758@pucp.edu.pe','0f2acc094848ab16437038fac1186cba24a26f68147a79c7d84f5bfef627c9df','20181758','71398483','934583523','alumno',NULL,2),(5,'Abigail','Ramirez','abigail.ramirez@pucp.edu.pe','e24b30d96013fbe6cedad159f01b5fa620238b3d0a7925afdf320c1bbad7d23e','20191822','78667234','900086543','alumno',NULL,2),(6,'Adrian','Lopez','adrian.lopez@pucp.edu.pe','b7d858e4019dc176fdff29d48de1469fae18e9871cae64c1f830373fbbf72949','20176054','78293449','998777535','alumno',NULL,2),(7,'Sebastian','Segura','a20203368@pucp.edu.pe','ffa447388607c3631ac27417bc79a6545127fc60e7214ab09f87ad38dff7edff','20203368','78666834','999742483','alumno',NULL,2),(8,'Brighit','Egusquiza','a20190802@pucp.edu.pe','86ccb9ef2b32af3bc1396983bc4c55f72d22284d057b170835c57f00e790009a','20190802','73456834','908765667','alumno',NULL,2),(9,'Stuardo','Lucho','a20064452@pucp.edu.pe','84284d44d6f099c85b59598e7d42a8ca7d2df3ec4d069017d1df38b464a446e1','20064452','43122455','923454455','profesor',NULL,1),(10,'Julio','Carrion','a20161448@pucp.edu.pe','67cf8c7816ba02ec6e2ab9065c301592a5628b7515c5d2a6f0fd9eb9aee9d92b','20161448','45678842','978356646','jefe de practica',NULL,2),(11,'Brenda','Tumbalobos','a20100006@pucp.edu.pe','016392f669cadf194bf3088a48f00333045558807397894890213e1359b676e3','20100006','43566476','986788543','jefe de practica',NULL,2),(12,'Hiroshi','Giotoku','a20122925@pucp.edu.pe','6a0c9774c1964eaac1c6d5ee33319fe6099e4d7db39651b5c59e90e727807ff7','20122925','45678688','976688567','jefe de practica',NULL,2),(13,'Alvaro','Burga','a20150632@pucp.edu.pe','22b94dc84145867293dc244878ed4d59dd597d42b149841db558589e428aa4e8','20150632','44345424','967889878','jefe de practica',NULL,2),(14,'Alonso','Guevera','a20160679@pucp.edu.pe','02592d704f7d48ffdc4cad7ff104045160db0ce32d5195e5d9923a964676991b','20160679','42341412','955344465','jefe de practica',NULL,2),(15,'Carlos','Minaya','a20161056@pucp.edu.pe','0e975471325eea77631f4486c9f79efed3a3ebfb689f1e6d78523d74cc5b0ccd','20161056','42492984','927374235','jefe de practica',NULL,2),(16,'Antonio','Paredes','a20132344@pucp.edu.pe','9aeb6d89cf1dadc3701ef28cead4de8c0f2d34f90900036868da8635d3ccd090','20132344','43234543','933442243','administrativo',NULL,2),(17,'Gerardo','Medina','a20032113@pucp.edu.pe','96cea882c9e7f9e83635163d41a94dc0002af0d9c502255e3f80b59b5cbbb3d5','20032113','24930392','923321132','administrativo',NULL,2),(18,'Alicia','Camarena','a20124523@pucp.edu.pe','b049d1141812135caba3a9eaaa4cddd2fc04f37fe85bbf2f5ea882db76d6c65e','20124523','45345643','923456823','egresado',NULL,1),(19,'Carlos','Obregon','a20132242@pucp.edu.pe','996ce0e101b8b6f4b3202a7f288ed58ca3ed8895cee30e9340e26bc1e7210289','20132242','34567245','908798654','egresado',NULL,1),(20,'Juan','Lara','a20094565@pucp.edu.pe','746b1def052763a992afadc1e2c5c9d466833646bd013a0e539ad881b00fe2ef','20094565','76543632','934523435','egresado',NULL,2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validacionusuarionuevo`
--

DROP TABLE IF EXISTS `validacionusuarionuevo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validacionusuarionuevo` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Codigo` varchar(8) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `Celular` varchar(9) NOT NULL,
  `Categoria` varchar(45) NOT NULL,
  `Rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validacionusuarionuevo`
--

LOCK TABLES `validacionusuarionuevo` WRITE;
/*!40000 ALTER TABLE `validacionusuarionuevo` DISABLE KEYS */;
INSERT INTO `validacionusuarionuevo` VALUES (1,'Alexia','Jauregui','a20192270@pucp.edu.pe','20192270','78223422','993344562','alumno','usuario pucp'),(2,'Angie','Alejandro','a20191792@pucp.edu.pe','20191792','70862602','997210426','alumno','usuario pucp'),(3,'Anais','Salvador','a20202152@pucp.edu.pe','20202152','72679933','990122890','alumno','usuario pucp'),(4,'Christian','Gonzales','a20181758@pucp.edu.pe','20181758','71398483','934583523','alumno','usuario pucp'),(5,'Abigail','Ramirez','abigail.ramirez@pucp.edu.pe','20191822','78667234','900086543','alumno','usuario pucp'),(6,'Adrian','Lopez','adrian.lopez@pucp.edu.pe','20176054','78293449','998777535','alumno','usuario pucp'),(7,'Sebastian','Segura','a20203368@pucp.edu.pe','20203368','78666834','999742483','alumno','usuario pucp'),(8,'Brighit','Egusquiza','a20190802@pucp.edu.pe','20190802','73456834','908765667','alumno','usuario pucp'),(9,'Stuardo','Lucho','a20064452@pucp.edu.pe','20064452','43122455','923454455','profesor','usuario pucp'),(10,'Julio','Carrion','a20161448@pucp.edu.pe','20161448','45678842','978356646','jefe de practica','usuario pucp'),(11,'Brenda','Tumbalobos','a20100006@pucp.edu.pe','20100006','43566476','986788543','jefe de practica','usuario pucp'),(12,'Hiroshi','Giotoku','a20122925@pucp.edu.pe','20122925','45678688','976688567','jefe de practica','usuario pucp'),(13,'Alvaro','Burga','a20150632@pucp.edu.pe','20150632','44345424','967889878','jefe de practica','usuario pucp'),(14,'Alonso','Guevera','a20160679@pucp.edu.pe','20160679','42341412','955344465','jefe de practica','usuario pucp'),(15,'Carlos','Minaya','a20161056@pucp.edu.pe','20161056','42492984','927374235','jefe de practica','usuario pucp'),(16,'Antonio','Paredes','a20132344@pucp.edu.pe','20132344','43234543','933442243','administrativo','seguridad'),(17,'Gerardo','Medina','a20032113@pucp.edu.pe','20032113','24930392','923321132','administrativo','seguridad'),(18,'Alicia','Camarena','a20124523@pucp.edu.pe','20124523','45345643','923456823','egresado','seguridad'),(19,'Carlos','Obregon','a20132242@pucp.edu.pe','20132242','34567245','908798654','egresado','seguridad'),(20,'Juan','Lara','a20094565@pucp.edu.pe','20094565','76543632','934523435','egresado','usuario pucp');
/*!40000 ALTER TABLE `validacionusuarionuevo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 21:38:09
