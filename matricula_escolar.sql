-- Base de datos: 360
-- Importar desde phpMyAdmin (XAMPP) > Importar

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `360` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `360`;

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `Dni` varchar(15) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Ap_Paterno` varchar(50) NOT NULL,
  `Ap_Materno` varchar(50) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Sexo` char(1) NOT NULL,
  PRIMARY KEY (`Dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `apoderado`;
CREATE TABLE `apoderado` (
  `Dni` varchar(15) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Ocupacion` varchar(100) NOT NULL,
  `Estado_Civil` varchar(50) NOT NULL,
  `Grado_Instruccion` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`Dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `parentesco`;
CREATE TABLE `parentesco` (
  `Cod_Parentesco` int(11) NOT NULL AUTO_INCREMENT,
  `Parentesco` varchar(50) NOT NULL,
  `Dni_Alumno` varchar(15) NOT NULL,
  `Dni_Apoderado` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_Parentesco`),
  KEY `idx_parentesco_Dni_Alumno` (`Dni_Alumno`),
  KEY `idx_parentesco_Dni_Apoderado` (`Dni_Apoderado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `documentacion`;
CREATE TABLE `documentacion` (
  `Id_Documentacion` int(11) NOT NULL AUTO_INCREMENT,
  `Partida` tinyint(1) NOT NULL,
  `Certificado` tinyint(1) NOT NULL,
  `Dni_Alumno` varchar(15) NOT NULL,
  PRIMARY KEY (`Id_Documentacion`),
  KEY `idx_documentacion_Dni_Alumno` (`Dni_Alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `ano_escolar`;
CREATE TABLE `ano_escolar` (
  `Num_Ano` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Termino` date NOT NULL,
  PRIMARY KEY (`Num_Ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE `aulas` (
  `Cod_Aula` int(11) NOT NULL AUTO_INCREMENT,
  `Capacidad` int(11) NOT NULL,
  `VacantesLib` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `especialidad`;
CREATE TABLE `especialidad` (
  `Cod_Especialidad` int(11) NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Especialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente` (
  `Dni` varchar(15) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Id_Especialidad` int(11) NOT NULL,
  PRIMARY KEY (`Dni`),
  KEY `idx_docente_Id_Especialidad` (`Id_Especialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE `matricula` (
  `N_Matric` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Grado` varchar(50) NOT NULL,
  `Seccion` varchar(20) NOT NULL,
  `Id_Aula` int(11) NOT NULL,
  `Dni_Alumno` varchar(15) NOT NULL,
  `Num_Ano` int(11) NOT NULL,
  `Dni_Docente` varchar(15) NOT NULL,
  PRIMARY KEY (`N_Matric`),
  KEY `idx_matricula_Id_Aula` (`Id_Aula`),
  KEY `idx_matricula_Dni_Alumno` (`Dni_Alumno`),
  KEY `idx_matricula_Num_Ano` (`Num_Ano`),
  KEY `idx_matricula_Dni_Docente` (`Dni_Docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `Cod_Curso` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `trimestres`;
CREATE TABLE `trimestres` (
  `Cod_Trimestre` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Trimestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `Id_Horario` int(11) NOT NULL AUTO_INCREMENT,
  `Dia` varchar(20) NOT NULL,
  `Hora_Inicio` time NOT NULL,
  `Hora_Fin` time NOT NULL,
  `Seccion` varchar(20) NOT NULL,
  `Id_Aula` int(11) NOT NULL,
  `Dni_Docente` varchar(15) NOT NULL,
  `ID_Curso` int(11) NOT NULL,
  PRIMARY KEY (`Id_Horario`),
  KEY `idx_horario_Id_Aula` (`Id_Aula`),
  KEY `idx_horario_Dni_Docente` (`Dni_Docente`),
  KEY `idx_horario_ID_Curso` (`ID_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `notas`;
CREATE TABLE `notas` (
  `Cod_Notas` int(11) NOT NULL AUTO_INCREMENT,
  `Nota` decimal(5,2) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Id_Curso` int(11) NOT NULL,
  `Dni_Alumno` varchar(15) NOT NULL,
  `Id_Trimestre` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Notas`),
  KEY `idx_notas_Id_Curso` (`Id_Curso`),
  KEY `idx_notas_Dni_Alumno` (`Dni_Alumno`),
  KEY `idx_notas_Id_Trimestre` (`Id_Trimestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `parentesco`
  ADD CONSTRAINT `fk_parentesco_Dni_Alumno` FOREIGN KEY (`Dni_Alumno`) REFERENCES `alumno` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `parentesco`
  ADD CONSTRAINT `fk_parentesco_Dni_Apoderado` FOREIGN KEY (`Dni_Apoderado`) REFERENCES `apoderado` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `documentacion`
  ADD CONSTRAINT `fk_documentacion_Dni_Alumno` FOREIGN KEY (`Dni_Alumno`) REFERENCES `alumno` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `docente`
  ADD CONSTRAINT `fk_docente_Id_Especialidad` FOREIGN KEY (`Id_Especialidad`) REFERENCES `especialidad` (`Cod_Especialidad`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_matricula_Id_Aula` FOREIGN KEY (`Id_Aula`) REFERENCES `aulas` (`Cod_Aula`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_matricula_Dni_Alumno` FOREIGN KEY (`Dni_Alumno`) REFERENCES `alumno` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_matricula_Num_Ano` FOREIGN KEY (`Num_Ano`) REFERENCES `ano_escolar` (`Num_Ano`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_matricula_Dni_Docente` FOREIGN KEY (`Dni_Docente`) REFERENCES `docente` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_Id_Aula` FOREIGN KEY (`Id_Aula`) REFERENCES `aulas` (`Cod_Aula`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_Dni_Docente` FOREIGN KEY (`Dni_Docente`) REFERENCES `docente` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_ID_Curso` FOREIGN KEY (`ID_Curso`) REFERENCES `curso` (`Cod_Curso`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `notas`
  ADD CONSTRAINT `fk_notas_Id_Curso` FOREIGN KEY (`Id_Curso`) REFERENCES `curso` (`Cod_Curso`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `notas`
  ADD CONSTRAINT `fk_notas_Dni_Alumno` FOREIGN KEY (`Dni_Alumno`) REFERENCES `alumno` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `notas`
  ADD CONSTRAINT `fk_notas_Id_Trimestre` FOREIGN KEY (`Id_Trimestre`) REFERENCES `trimestres` (`Cod_Trimestre`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO `usuario` (`Id_Usuario`,`Nombre`,`Contrasena`) VALUES
  (1, 'admin', '7e9c6265daf3229a84f9d67b2308db703d301dc16db949a794b8a94388f86d2d'),
  (2, 'secretaria', 'e82077fbe80bbb53400f1abc9f9d06681b58bd52400cd28c717cf8ed15e7060b'),
  (3, 'director', 'e7cd90bdb3f49e385a75405cbaefbc6c170417ba2c9fa0c7d84fb83861ad297b'),
  (4, 'subdirector', '834d22e09a9e79894720d1c88e0b0aea3a92b71283740588787232b52db2e359'),
  (5, 'auxiliar', '3dfab76fc5071b1086d7e0914b8bad981938212149e0d52e9c5ca6719ad394a3'),
  (6, 'docente1', 'e664ecf1dff94c719db9d099b3eecd68e1269a545029f201f8e61c74e4bb78f4'),
  (7, 'docente2', 'a7c1e405232b60afdae4f3d9973e446930df078c299c1c816a8f68cf943aea1b'),
  (8, 'tesorero', '14462ddd6555ec3e5ad712794a86cf0bab062689d5d7ab7e049d104b15be247e'),
  (9, 'registro', 'ede66a8b2607a559ceb717394ba1970a0ee99b698c58f0096f586bbba9a1e2bc'),
  (10, 'soporte', '05720c2101952ec83b11a24bd5b0cb3afbc4b82f062668b93ecb816f7757c93a');

INSERT INTO `alumno` (`Dni`,`Nombres`,`Ap_Paterno`,`Ap_Materno`,`Edad`,`Sexo`) VALUES
  ('72234567', 'Luis Mateo', 'Quispe', 'Mamani', 6, 'M'),
  ('73469134', 'Valeria', 'Flores', 'Condori', 7, 'F'),
  ('74703701', 'Diego Andrés', 'Rojas', 'Vargas', 8, 'M'),
  ('75938268', 'Camila', 'Choque', 'Ramos', 9, 'F'),
  ('77172835', 'Sebastián', 'Gutiérrez', 'Torrez', 10, 'M'),
  ('78407402', 'Fernanda', 'Mendoza', 'Limachi', 11, 'F'),
  ('79641969', 'Joaquín', 'Cruz', 'Aguilar', 12, 'M'),
  ('80876536', 'Daniela', 'Salazar', 'Paredes', 13, 'F'),
  ('82111103', 'Mateo', 'Herrera', 'Rivera', 14, 'M'),
  ('83345670', 'Sofía', 'Castro', 'Medina', 15, 'F');

INSERT INTO `apoderado` (`Dni`,`Nombres`,`Apellidos`,`Edad`,`Sexo`,`Ocupacion`,`Estado_Civil`,`Grado_Instruccion`,`Telefono`,`Direccion`) VALUES
  ('42111111', 'Carlos', 'Quispe Huanca', 30, 'M', 'Comerciante', 'Casado', 'Secundaria completa', '71210101', 'Av. Hernando Siles 120'),
  ('43222222', 'María', 'Flores Lara', 32, 'F', 'Enfermera', 'Casada', 'Superior técnica', '71220202', 'Calle Bolívar 45'),
  ('44333333', 'Jorge', 'Rojas Pinto', 34, 'M', 'Albañil', 'Conviviente', 'Secundaria completa', '71230303', 'Calle Junín 310'),
  ('45444444', 'Rosa', 'Choque Mita', 36, 'F', 'Costurera', 'Soltera', 'Secundaria completa', '71240404', 'Av. Las Américas 88'),
  ('46555555', 'Pedro', 'Gutiérrez Soto', 38, 'M', 'Chofer', 'Casado', 'Secundaria incompleta', '71250505', 'Calle Ravelo 205'),
  ('47666666', 'Elena', 'Mendoza Ríos', 40, 'F', 'Profesora', 'Casada', 'Superior universitaria', '71260606', 'Calle Dalence 77'),
  ('48777777', 'Raúl', 'Cruz Vega', 42, 'M', 'Electricista', 'Casado', 'Superior técnica', '71270707', 'Av. Germán Mendoza 150'),
  ('49888888', 'Lucía', 'Salazar Ortiz', 44, 'F', 'Contadora', 'Divorciada', 'Superior universitaria', '71280808', 'Calle Loa 62'),
  ('50999999', 'Mario', 'Herrera Díaz', 46, 'M', 'Agricultor', 'Casado', 'Primaria completa', '71290909', 'Calle Olañeta 19'),
  ('52111110', 'Ana', 'Castro Luna', 48, 'F', 'Vendedora', 'Viuda', 'Secundaria completa', '71301010', 'Av. Jaime Mendoza 340');

INSERT INTO `parentesco` (`Cod_Parentesco`,`Parentesco`,`Dni_Alumno`,`Dni_Apoderado`) VALUES
  (1, 'Padre', '72234567', '42111111'),
  (2, 'Madre', '73469134', '43222222'),
  (3, 'Padre', '74703701', '44333333'),
  (4, 'Madre', '75938268', '45444444'),
  (5, 'Padre', '77172835', '46555555'),
  (6, 'Madre', '78407402', '47666666'),
  (7, 'Padre', '79641969', '48777777'),
  (8, 'Madre', '80876536', '49888888'),
  (9, 'Padre', '82111103', '50999999'),
  (10, 'Madre', '83345670', '52111110');

INSERT INTO `documentacion` (`Id_Documentacion`,`Partida`,`Certificado`,`Dni_Alumno`) VALUES
  (1, 0, 0, '72234567'),
  (2, 1, 1, '73469134'),
  (3, 1, 1, '74703701'),
  (4, 1, 0, '75938268'),
  (5, 0, 1, '77172835'),
  (6, 1, 1, '78407402'),
  (7, 1, 0, '79641969'),
  (8, 1, 1, '80876536'),
  (9, 0, 1, '82111103'),
  (10, 1, 0, '83345670');

INSERT INTO `ano_escolar` (`Num_Ano`,`Fecha_Inicio`,`Fecha_Termino`) VALUES
  (2017, '2017-03-01', '2017-12-20'),
  (2018, '2018-03-01', '2018-12-20'),
  (2019, '2019-03-01', '2019-12-20'),
  (2020, '2020-03-01', '2020-12-20'),
  (2021, '2021-03-01', '2021-12-20'),
  (2022, '2022-03-01', '2022-12-20'),
  (2023, '2023-03-01', '2023-12-20'),
  (2024, '2024-03-01', '2024-12-20'),
  (2025, '2025-03-01', '2025-12-20'),
  (2026, '2026-03-01', '2026-12-20');

INSERT INTO `aulas` (`Cod_Aula`,`Capacidad`,`VacantesLib`) VALUES
  (1, 30, 28),
  (2, 30, 26),
  (3, 30, 24),
  (4, 30, 22),
  (5, 30, 20),
  (6, 30, 18),
  (7, 30, 16),
  (8, 30, 14),
  (9, 30, 12),
  (10, 30, 10);

INSERT INTO `especialidad` (`Cod_Especialidad`,`Especialidad`) VALUES
  (1, 'Matemática'),
  (2, 'Comunicación'),
  (3, 'Ciencias Naturales'),
  (4, 'Historia'),
  (5, 'Inglés'),
  (6, 'Educación Física'),
  (7, 'Arte'),
  (8, 'Computación'),
  (9, 'Religión'),
  (10, 'Formación Cívica');

INSERT INTO `docente` (`Dni`,`Nombres`,`Apellidos`,`Edad`,`Sexo`,`Direccion`,`Email`,`Telefono`,`Fecha_Nacimiento`,`Id_Especialidad`) VALUES
  ('22357913', 'Ricardo', 'Vargas Peña', 45, 'M', 'Av. Las Américas 88', 'ricardo.docente@colegio360.edu.bo', '60504301', '1981-01-10', 1),
  ('23715826', 'Patricia', 'Lozano Cruz', 38, 'F', 'Calle Ravelo 205', 'patricia.docente@colegio360.edu.bo', '61514311', '1988-02-11', 2),
  ('25073739', 'Héctor', 'Soria Ibáñez', 52, 'M', 'Calle Dalence 77', 'hector.docente@colegio360.edu.bo', '62524321', '1974-03-12', 3),
  ('26431652', 'Gabriela', 'Arce Montaño', 41, 'F', 'Av. Germán Mendoza 150', 'gabriela.docente@colegio360.edu.bo', '63534331', '1985-04-13', 4),
  ('27789565', 'Julio', 'Barrón Oña', 36, 'M', 'Calle Loa 62', 'julio.docente@colegio360.edu.bo', '64544341', '1990-05-14', 5),
  ('29147478', 'Marta', 'Zeballos Roca', 48, 'F', 'Calle Olañeta 19', 'marta.docente@colegio360.edu.bo', '65554351', '1978-06-15', 6),
  ('30505391', 'Óscar', 'Navia Prado', 33, 'M', 'Av. Jaime Mendoza 340', 'oscar.docente@colegio360.edu.bo', '66564361', '1993-07-16', 7),
  ('31863304', 'Silvia', 'Terán Calle', 44, 'F', 'Av. Hernando Siles 120', 'silvia.docente@colegio360.edu.bo', '67574371', '1982-08-17', 8),
  ('33221217', 'Andrés', 'Fuentes Gil', 50, 'M', 'Calle Bolívar 45', 'andres.docente@colegio360.edu.bo', '68584381', '1976-09-18', 9),
  ('34579130', 'Teresa', 'Ávila Mora', 39, 'F', 'Calle Junín 310', 'teresa.docente@colegio360.edu.bo', '69594391', '1987-01-10', 10);

INSERT INTO `matricula` (`N_Matric`,`Fecha`,`Monto`,`Grado`,`Seccion`,`Id_Aula`,`Dni_Alumno`,`Num_Ano`,`Dni_Docente`) VALUES
  (1, '2026-02-10', 150.0, '1° Primaria', 'A', 1, '72234567', 2026, '22357913'),
  (2, '2026-02-11', 175.0, '2° Primaria', 'B', 2, '73469134', 2026, '23715826'),
  (3, '2026-02-12', 200.0, '3° Primaria', 'A', 3, '74703701', 2026, '25073739'),
  (4, '2026-02-13', 150.0, '4° Primaria', 'B', 4, '75938268', 2026, '26431652'),
  (5, '2026-02-14', 175.0, '5° Primaria', 'A', 5, '77172835', 2026, '27789565'),
  (6, '2026-02-15', 200.0, '6° Primaria', 'B', 6, '78407402', 2026, '29147478'),
  (7, '2026-02-16', 150.0, '1° Secundaria', 'A', 7, '79641969', 2026, '30505391'),
  (8, '2026-02-17', 175.0, '2° Secundaria', 'B', 8, '80876536', 2026, '31863304'),
  (9, '2026-02-18', 200.0, '3° Secundaria', 'A', 9, '82111103', 2026, '33221217'),
  (10, '2026-02-19', 150.0, '4° Secundaria', 'B', 10, '83345670', 2026, '34579130');

INSERT INTO `curso` (`Cod_Curso`,`Nombres`) VALUES
  (1, 'Matemática'),
  (2, 'Comunicación'),
  (3, 'Ciencia y Tecnología'),
  (4, 'Personal Social'),
  (5, 'Inglés'),
  (6, 'Educación Física'),
  (7, 'Arte y Cultura'),
  (8, 'Computación'),
  (9, 'Religión'),
  (10, 'Tutoría');

INSERT INTO `trimestres` (`Cod_Trimestre`,`Descripcion`) VALUES
  (1, 'Primer Trimestre'),
  (2, 'Segundo Trimestre'),
  (3, 'Tercer Trimestre');

INSERT INTO `horario` (`Id_Horario`,`Dia`,`Hora_Inicio`,`Hora_Fin`,`Seccion`,`Id_Aula`,`Dni_Docente`,`ID_Curso`) VALUES
  (1, 'Lunes', '08:00:00', '08:45:00', 'A', 1, '22357913', 1),
  (2, 'Martes', '09:00:00', '09:45:00', 'B', 2, '23715826', 2),
  (3, 'Miércoles', '010:00:00', '010:45:00', 'A', 3, '25073739', 3),
  (4, 'Jueves', '011:00:00', '011:45:00', 'B', 4, '26431652', 4),
  (5, 'Viernes', '08:00:00', '08:45:00', 'A', 5, '27789565', 5),
  (6, 'Lunes', '09:00:00', '09:45:00', 'B', 6, '29147478', 6),
  (7, 'Martes', '010:00:00', '010:45:00', 'A', 7, '30505391', 7),
  (8, 'Miércoles', '011:00:00', '011:45:00', 'B', 8, '31863304', 8),
  (9, 'Jueves', '08:00:00', '08:45:00', 'A', 9, '33221217', 9),
  (10, 'Viernes', '09:00:00', '09:45:00', 'B', 10, '34579130', 10);

INSERT INTO `notas` (`Cod_Notas`,`Nota`,`Descripcion`,`Id_Curso`,`Dni_Alumno`,`Id_Trimestre`) VALUES
  (1, 15, 'Examen escrito', 1, '72234567', 1),
  (2, 17, 'Práctica calificada', 2, '73469134', 2),
  (3, 12, 'Trabajo grupal', 3, '74703701', 3),
  (4, 18, 'Examen oral', 4, '75938268', 1),
  (5, 14, 'Exposición', 5, '77172835', 2),
  (6, 16, 'Tarea', 6, '78407402', 3),
  (7, 13, 'Examen escrito', 7, '79641969', 1),
  (8, 19, 'Proyecto', 8, '80876536', 2),
  (9, 11, 'Práctica calificada', 9, '82111103', 3),
  (10, 17, 'Examen final', 10, '83345670', 1);

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;
