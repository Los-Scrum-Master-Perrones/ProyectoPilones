-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para db_taopar_pilones
CREATE DATABASE IF NOT EXISTS `db_taopar_pilones` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_taopar_pilones`;

-- Volcando estructura para tabla db_taopar_pilones.clase_tabaco
CREATE TABLE IF NOT EXISTS `clase_tabaco` (
  `id_tabaco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tabaco` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tabaco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_taopar_pilones.control_temperatura
CREATE TABLE IF NOT EXISTS `control_temperatura` (
  `id_temperatura` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pilones` int(11) NOT NULL DEFAULT 0,
  `temperatura` int(11) NOT NULL DEFAULT 0,
  `fecha_revision` date NOT NULL DEFAULT '0000-00-00',
  `mantenimiento` varchar(20) NOT NULL,
  PRIMARY KEY (`id_temperatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento db_taopar_pilones.insertar_tabaco
DELIMITER //
CREATE PROCEDURE `insertar_tabaco`(
	IN `pa_nombre` VARCHAR(100)
)
BEGIN

	if EXISTS (SELECT * from clase_tabaco WHERE nombre_tabaco = pa_nombre) then 
			SELECT 'no se puede';
	else
			INSERT INTO clase_tabaco (nombre_tabaco) VALUES(pa_nombre);
	end IF;

END//
DELIMITER ;

-- Volcando estructura para tabla db_taopar_pilones.pilones
CREATE TABLE IF NOT EXISTS `pilones` (
  `id_pilon` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero_pilon` int(11) NOT NULL,
  `id_tabaco` int(11) NOT NULL,
  PRIMARY KEY (`id_pilon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_taopar_pilones.remision_proceso
CREATE TABLE IF NOT EXISTS `remision_proceso` (
  `id_remision_proceso` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_remision` int(11) NOT NULL DEFAULT 0,
  `fecha_remision` date NOT NULL DEFAULT '0000-00-00',
  `destino_remision` varchar(20) NOT NULL DEFAULT '0',
  `origen_remision` varchar(20) NOT NULL DEFAULT '0',
  `descripcion1_remision` varchar(100) NOT NULL DEFAULT '0',
  `descripcion2_remision` varchar(100) DEFAULT '0',
  `descripcion3_remision` varchar(100) DEFAULT '0',
  `descripcion4_remision` varchar(100) DEFAULT '0',
  `descripcion5_remision` varchar(100) DEFAULT '0',
  `cantidad_lbs_remision` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_remision` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_remision_proceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_taopar_pilones.tabla_pilon
CREATE TABLE IF NOT EXISTS `tabla_pilon` (
  `id_tabla_pilon` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_proceso` date NOT NULL,
  `id_remision` int(11) NOT NULL DEFAULT 0,
  `entradas_salidas` varchar(30) NOT NULL DEFAULT '0',
  `id_tabaco` int(11) NOT NULL DEFAULT 0,
  `id_pilon` int(11) NOT NULL DEFAULT 0,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_libras` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_tabla_pilon`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_taopar_pilones.tabla_procesos
CREATE TABLE IF NOT EXISTS `tabla_procesos` (
  `id_tabla_proceso` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_proceso` date NOT NULL,
  `id_remision` int(11) NOT NULL DEFAULT 0,
  `entradas_salidas` varchar(30) NOT NULL DEFAULT '0',
  `id_tabaco` int(11) NOT NULL DEFAULT 0,
  `id_pilon` int(11) NOT NULL DEFAULT 0,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_libras` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_tabla_proceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
