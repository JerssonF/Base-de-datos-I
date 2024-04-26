-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2023 a las 07:03:26
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `1077721250asignatura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `Catalinaid` int(11) NOT NULL,
  `Catalinausuario` varchar(100) NOT NULL,
  `Catalinadocumento` varchar(25) NOT NULL,
  `Catalinacolegio` varchar(100) NOT NULL,
  `Catalinaprofesor` varchar(150) NOT NULL,
  `Catalinagrado` int(2) NOT NULL,
  `Catalinamateria` varchar(30) NOT NULL,
  `Catalinanota` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`Catalinaid`, `Catalinausuario`, `Catalinadocumento`, `Catalinacolegio`, `Catalinaprofesor`, `Catalinagrado`, `Catalinamateria`, `Catalinanota`) VALUES
(1, 'CATA10', '1077721250', '', 'Cesar', 0, 'Estrucutra de datos', '4'),
(2, 'ANDRE19', '3645477', '', 'Ivan', 0, 'Arquitectura de pc', '2'),
(4, 'DAYSO6', '1075204755', '', 'Juan', 0, 'Programaciom II', '5'),
(5, 'Prueba', 'Prueba', '', 'Prueba', 0, 'Prueba', 'Pr'),
(6, 'Miguelon04', '1075300058', 'Inem', 'Maria Casquitos', 8, 'Estadistica', '3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`Catalinaid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `Catalinaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
