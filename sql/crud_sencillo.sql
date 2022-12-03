-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2022 a las 01:28:52
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crud_sencillo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'No activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_tareas`
--

CREATE TABLE `estado_tareas` (
  `id` int(11) NOT NULL,
  `cod_estado` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado_tareas`
--

INSERT INTO `estado_tareas` (`id`, `cod_estado`, `nombre_estado`, `estado`) VALUES
(1, 'TPH', 'Tareas por hacer', 1),
(2, 'EP', 'En proceso', 1),
(3, 'R', 'Realizadas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_tareas`
--

CREATE TABLE `historial_tareas` (
  `id` int(11) NOT NULL,
  `estado_anterior` int(11) DEFAULT NULL,
  `estado_actual` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_tarea` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `historial_tareas`
--

INSERT INTO `historial_tareas` (`id`, `estado_anterior`, `estado_actual`, `fecha`, `id_tarea`, `estado`) VALUES
(6, NULL, 1, '2022-12-03 00:21:22', 1, 1),
(7, NULL, 1, '2022-12-03 00:21:53', 2, 1),
(8, NULL, 2, '2022-12-03 00:22:01', 2, 1),
(9, NULL, 3, '2022-12-03 00:22:03', 2, 1),
(10, NULL, 1, '2022-12-03 00:22:04', 2, 1),
(11, NULL, 2, '2022-12-03 00:22:06', 2, 1),
(12, NULL, 1, '2022-12-03 00:24:19', 2, 1),
(13, NULL, 2, '2022-12-03 00:24:20', 2, 1),
(14, NULL, 3, '2022-12-03 00:24:22', 2, 1),
(15, NULL, 1, '2022-12-03 00:24:23', 2, 1),
(16, NULL, 3, '2022-12-03 00:24:25', 2, 1),
(17, NULL, 1, '2022-12-03 00:24:26', 2, 1),
(18, NULL, 2, '2022-12-03 00:24:30', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_tareas`
--
ALTER TABLE `estado_tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_tareas`
--
ALTER TABLE `historial_tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_tareas_estados_id_fk` (`estado`),
  ADD KEY `historial_tareas_tareas_id_fk` (`id_tarea`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_tareas`
--
ALTER TABLE `estado_tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historial_tareas`
--
ALTER TABLE `historial_tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_tareas`
--
ALTER TABLE `historial_tareas`
  ADD CONSTRAINT `historial_tareas_estados_id_fk` FOREIGN KEY (`estado`) REFERENCES `estados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
