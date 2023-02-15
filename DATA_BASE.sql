-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla carip.alumnos
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `alum_fecha` datetime DEFAULT NULL,
  `fecha_inscripcion` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `rubros_id` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL,
  `tipo_alumnos_id` int(11) NOT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `observacion` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cuotas` int(11) DEFAULT NULL,
  `condiciones_id` int(11) NOT NULL,
  `usuario_usua_id` int(11) NOT NULL,
  `habilitado` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `alum_pers_id` int(11) NOT NULL,
  `alum_apoderado_id` int(11) DEFAULT NULL,
  `alum_pagado` decimal(7,2) DEFAULT NULL,
  `alum_comi_direc_pagada` tinyint(4) NOT NULL,
  `alum_comi_deriv_pagada` tinyint(4) NOT NULL,
  `alum_es_becado` tinyint(4) DEFAULT NULL,
  `alum_descuento` decimal(10,2) DEFAULT NULL,
  `alum_completado` tinyint(4) DEFAULT NULL,
  `alum_hubo_bienvenida` enum('OK','NC') COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `alum_tipo_tarjeta` enum('CREDITO','DEBITO') COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `alum_numero_tarjeta` varchar(64) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `alum_mes_caducidad` varchar(2) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `alum_anho_caducidad` varchar(2) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `alum_enba_id` int(11) DEFAULT NULL,
  `alum_fran_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `fk_alumnos_rubros_idx` (`rubros_id`),
  KEY `fk_alumnos_productos1_idx` (`productos_id`),
  KEY `fk_alumnos_tipo_alumnos1_idx` (`tipo_alumnos_id`),
  KEY `fk_alumnos_tipo_pago1_idx` (`tipo_pago_id`),
  KEY `fk_alumnos_condiciones1_idx` (`condiciones_id`),
  KEY `fk_alumnos_usuario1_idx` (`usuario_usua_id`),
  KEY `fk_alumnos_personas1_idx` (`alum_pers_id`),
  KEY `fk_alumnos_personas2_idx` (`alum_apoderado_id`),
  KEY `fk_alumnos_entidades_bancarias1_idx` (`alum_enba_id`),
  KEY `fk_alumnos_franquicias1_idx` (`alum_fran_id`),
  CONSTRAINT `fk_alumnos_condiciones1` FOREIGN KEY (`condiciones_id`) REFERENCES `condiciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_entidades_bancarias1` FOREIGN KEY (`alum_enba_id`) REFERENCES `entidades_bancarias` (`enba_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_franquicias1` FOREIGN KEY (`alum_fran_id`) REFERENCES `franquicias` (`fran_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_personas1` FOREIGN KEY (`alum_pers_id`) REFERENCES `personas` (`pers_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_personas2` FOREIGN KEY (`alum_apoderado_id`) REFERENCES `personas` (`pers_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_productos1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_rubros` FOREIGN KEY (`rubros_id`) REFERENCES `rubros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_tipo_alumnos1` FOREIGN KEY (`tipo_alumnos_id`) REFERENCES `tipo_alumnos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_tipo_pago1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pagos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_usuario1` FOREIGN KEY (`usuario_usua_id`) REFERENCES `usuario` (`usua_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.condiciones
CREATE TABLE IF NOT EXISTS `condiciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.departamentos
CREATE TABLE IF NOT EXISTS `departamentos` (
  `iddepartamentos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iddepartamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.entidades_bancarias
CREATE TABLE IF NOT EXISTS `entidades_bancarias` (
  `enba_id` int(11) NOT NULL AUTO_INCREMENT,
  `enba_nombre` varchar(128) NOT NULL,
  PRIMARY KEY (`enba_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.flujocaja
CREATE TABLE IF NOT EXISTS `flujocaja` (
  `id_flujocaja` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `descripcion_flujo` varchar(256) DEFAULT NULL,
  `importe_flujo` decimal(7,2) NOT NULL,
  `fecha_flujo` date DEFAULT NULL,
  `observacion_flujo` varchar(256) DEFAULT NULL,
  `rubrogasto_id_rubrogasto` int(11) NOT NULL,
  PRIMARY KEY (`id_flujocaja`),
  KEY `fk_flujocaja_rubrogasto1_idx` (`rubrogasto_id_rubrogasto`),
  CONSTRAINT `fk_flujocaja_rubrogasto1` FOREIGN KEY (`rubrogasto_id_rubrogasto`) REFERENCES `rubrogasto` (`id_rubrogasto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.franquicias
CREATE TABLE IF NOT EXISTS `franquicias` (
  `fran_id` int(11) NOT NULL AUTO_INCREMENT,
  `fran_nombre` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`fran_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.grupos
CREATE TABLE IF NOT EXISTS `grupos` (
  `grup_id` int(11) NOT NULL AUTO_INCREMENT,
  `grup_docente_id` int(11) NOT NULL,
  `grup_nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `grup_finalizado` tinyint(4) NOT NULL DEFAULT '0',
  `grup_correlativo` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `grup_dias` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grup_peri_id` int(11) NOT NULL,
  `grup_hora` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grup_fechacrea` date DEFAULT NULL,
  PRIMARY KEY (`grup_id`),
  KEY `fk_grupo_academico_usuario1_idx` (`grup_docente_id`),
  KEY `fk_grupo_academico_periodos1_idx` (`grup_peri_id`),
  CONSTRAINT `fk_grupo_academico_periodos1` FOREIGN KEY (`grup_peri_id`) REFERENCES `periodos` (`peri_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_academico_usuario1` FOREIGN KEY (`grup_docente_id`) REFERENCES `usuario` (`usua_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.grupos_alumnos
CREATE TABLE IF NOT EXISTS `grupos_alumnos` (
  `gral_grup_id` int(11) NOT NULL,
  `gral_id_alumno` int(11) NOT NULL,
  `gral_asistencias` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gral_notas` varchar(256) COLLATE utf8_unicode_ci DEFAULT '0,0',
  `gral_llamadas` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `fk_grupo_has_alumnos_alumnos1_idx` (`gral_id_alumno`),
  KEY `fk_grupo_has_alumnos_grupo1_idx` (`gral_grup_id`),
  CONSTRAINT `fk_grupo_has_alumnos_alumnos1` FOREIGN KEY (`gral_id_alumno`) REFERENCES `alumnos` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_has_alumnos_grupo1` FOREIGN KEY (`gral_grup_id`) REFERENCES `grupos` (`grup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.llamadas
CREATE TABLE IF NOT EXISTS `llamadas` (
  `id_llamada` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_usua_id` int(11) NOT NULL,
  `respuestas_id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `llam_concretado` tinyint(4) NOT NULL,
  `llam_pers_id` int(11) NOT NULL,
  `llam_prod_id` int(11) NOT NULL,
  PRIMARY KEY (`id_llamada`),
  KEY `fk_llamadas_usuario1_idx` (`usuario_usua_id`),
  KEY `fk_llamadas_respuestas1_idx` (`respuestas_id`),
  KEY `fk_llamadas_personas1_idx` (`llam_pers_id`),
  KEY `fk_llamadas_productos1_idx` (`llam_prod_id`),
  CONSTRAINT `fk_llamadas_personas1` FOREIGN KEY (`llam_pers_id`) REFERENCES `personas` (`pers_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_llamadas_productos1` FOREIGN KEY (`llam_prod_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_llamadas_respuestas1` FOREIGN KEY (`respuestas_id`) REFERENCES `respuestas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_llamadas_usuario1` FOREIGN KEY (`usuario_usua_id`) REFERENCES `usuario` (`usua_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.pagopersonal
CREATE TABLE IF NOT EXISTS `pagopersonal` (
  `idpago` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `mes` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `bono` decimal(7,2) DEFAULT '0.00',
  `monto` decimal(7,2) DEFAULT '0.00',
  `observacion` varchar(256) DEFAULT 'Ninguna',
  `curso` varchar(100) DEFAULT NULL,
  `comisiondirecta` decimal(7,2) DEFAULT '0.00',
  `comisionasesores` decimal(7,2) DEFAULT '0.00',
  `horas` decimal(7,2) DEFAULT '0.00',
  `costohora` decimal(7,2) DEFAULT '0.00',
  `usuario_usua_id` int(11) NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_pagopersonal_usuario1_idx` (`usuario_usua_id`),
  CONSTRAINT `fk_pagopersonal_usuario1` FOREIGN KEY (`usuario_usua_id`) REFERENCES `usuario` (`usua_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.pagos
CREATE TABLE IF NOT EXISTS `pagos` (
  `idpagos` int(11) NOT NULL AUTO_INCREMENT,
  `fechapago` date NOT NULL,
  `monto` decimal(7,2) NOT NULL,
  `alumnos_id_alumno` int(11) NOT NULL,
  PRIMARY KEY (`idpagos`),
  KEY `fk_pagos_alumnos1_idx` (`alumnos_id_alumno`),
  CONSTRAINT `fk_pagos_alumnos1` FOREIGN KEY (`alumnos_id_alumno`) REFERENCES `alumnos` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.periodos
CREATE TABLE IF NOT EXISTS `periodos` (
  `peri_id` int(11) NOT NULL AUTO_INCREMENT,
  `peri_anho` int(11) NOT NULL,
  `peri_correlativo` int(11) NOT NULL,
  `peri_prod_id` int(11) NOT NULL,
  PRIMARY KEY (`peri_id`),
  KEY `fk_Periodo_productos1_idx` (`peri_prod_id`),
  CONSTRAINT `fk_Periodo_productos1` FOREIGN KEY (`peri_prod_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `pers_id` int(11) NOT NULL AUTO_INCREMENT,
  `pers_nombres` varchar(128) DEFAULT NULL,
  `pers_apellidos` varchar(128) DEFAULT NULL,
  `pers_dni` varchar(16) DEFAULT NULL,
  `pers_celular` varchar(16) DEFAULT NULL,
  `pers_correo_electronico` varchar(128) DEFAULT NULL,
  `pers_direccion` varchar(256) DEFAULT NULL,
  `pers_centro_laboral` varchar(128) DEFAULT NULL,
  `pers_fecha_nacimiento` date DEFAULT NULL,
  `pers_iddepartamentos` int(11) DEFAULT NULL,
  PRIMARY KEY (`pers_id`),
  KEY `fk_personas_departamentos1_idx` (`pers_iddepartamentos`),
  CONSTRAINT `fk_personas_departamentos1` FOREIGN KEY (`pers_iddepartamentos`) REFERENCES `departamentos` (`iddepartamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `comision` decimal(10,2) DEFAULT NULL,
  `comision_asesor` decimal(10,2) DEFAULT NULL,
  `sesiones` int(11) DEFAULT NULL,
  `matricula` decimal(10,2) DEFAULT NULL,
  `cuotas` int(11) DEFAULT NULL,
  `notaaprobatoria` int(2) DEFAULT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.respuestas
CREATE TABLE IF NOT EXISTS `respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.rubrogasto
CREATE TABLE IF NOT EXISTS `rubrogasto` (
  `id_rubrogasto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_rubrogasto` varchar(256) NOT NULL,
  PRIMARY KEY (`id_rubrogasto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.rubros
CREATE TABLE IF NOT EXISTS `rubros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.tipousuario
CREATE TABLE IF NOT EXISTS `tipousuario` (
  `tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_denominacion` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`tipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO `tipousuario` (`tipo_id`, `tipo_denominacion`) VALUES
(1, 'VENTAS'),
(2, 'ADMINISTRACIÓN'),
(3, 'ATE-CLIENTE'),
(4, 'COBRANZA'),
(5, 'DOCENTE');

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.tipo_alumnos
CREATE TABLE IF NOT EXISTS `tipo_alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.tipo_pagos
CREATE TABLE IF NOT EXISTS `tipo_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla carip.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usua_id` int(11) NOT NULL AUTO_INCREMENT,
  `usua_nombres` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_apellidos` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_user` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_password` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_email` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_fechanac` date DEFAULT NULL,
  `usua_movil` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_ultimoip` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_habilitado` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_intento` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usua_tipo` int(11) NOT NULL,
  `usua_dni` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usuario_usua_id` int(11) DEFAULT NULL,
  `usua_foto` varchar(180) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`usua_id`),
  KEY `fk_usuario_ tipousuario1_idx` (`usua_tipo`),
  KEY `fk_usuario_usuario1_idx` (`usuario_usua_id`),
  CONSTRAINT `fk_usuario_ tipousuario1` FOREIGN KEY (`usua_tipo`) REFERENCES `tipousuario` (`tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_usuario1` FOREIGN KEY (`usuario_usua_id`) REFERENCES `usuario` (`usua_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



INSERT INTO `usuario` (`usua_id`, `usua_nombres`, `usua_apellidos`, `usua_user`, `usua_password`, `usua_email`, `usua_fechanac`, `usua_movil`, `usua_ultimoip`, `usua_habilitado`, `usua_intento`, `usua_tipo`, `usua_dni`, `usuario_usua_id`, `usua_foto`) VALUES
(1, 'RICHARD', 'CALLAPANI', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'richard@gruposistemas.com', NULL, '957296226', '45.191.96.60', '1', '0', 2, '45821616', NULL, NULL),
-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
