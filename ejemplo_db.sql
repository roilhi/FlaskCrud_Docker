-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.29-MariaDB-1:10.4.29+maria~ubu2004 - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ejemplo_db
CREATE DATABASE IF NOT EXISTS `ejemplo_db` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `ejemplo_db`;

-- Dumping structure for table ejemplo_db.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `ID_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Edad` tinyint(4) NOT NULL,
  `Domicilio` varchar(20) DEFAULT NULL,
  `ID_Gerente` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table ejemplo_db.empleados: ~11 rows (approximately)
INSERT INTO `empleados` (`ID_empleado`, `Nombre`, `Apellido`, `Telefono`, `Edad`, `Domicilio`, `ID_Gerente`) VALUES
	(1, 'Alberto', 'Barrientos', 34766613, 26, 'Federal 233', '5942572'),
	(2, 'Alexander', 'Martinez', 36554872, 28, 'Camino viejo 123', '5942572'),
	(3, 'Maria', 'Zapata', 35354455, 34, 'Boulevard 85', '5942572'),
	(4, 'Egidio', 'Lopez', 33444383, 24, 'Rosas 996', '5942572'),
	(5, 'Haygnes', 'Ortiz', 35400189, 27, 'General Diaz 343', '5942572'),
	(6, 'Alexandra', 'Zapata', 33467136, 31, 'Ingenieros 234', '5942572'),
	(7, 'Jesus', 'Agudelo', 34616222, 35, '', ''),
	(8, 'Elena', 'Atehortua', 35581732, 37, 'Sierra del tigre 299', '5942572'),
	(9, 'Jairo', 'Mira', 36403810, 29, 'Calle 25 interior 2', '5942572'),
	(10, 'Albeiro', 'Villa', 33631010, 39, 'Carniceros 233', '5942572'),
	(11, 'Reinaldo', 'Gonzalez', 36642727, 43, 'Vallarta 711', '5942572');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
