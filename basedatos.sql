-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2024 a las 16:52:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cacique_xtremo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `nombre`, `apellido`, `fecha_nacimiento`, `email`, `telefono`, `direccion`, `fecha_registro`) VALUES
(1096700563, 'santiago', 'figueroa', '2004-11-27', 'asasdssdds@gmail.com', '3177912599', 'cra 33#43-12', '2024-05-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte_xtremo_plan`
--

CREATE TABLE `deporte_xtremo_plan` (
  `deporte_plan_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `duracion_tiempo` int(11) NOT NULL,
  `precio` date NOT NULL,
  `guia_id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_turistico`
--

CREATE TABLE `guia_turistico` (
  `guia_id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `experiencia` int(11) NOT NULL,
  `idiomas` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_material`
--

CREATE TABLE `inventario_material` (
  `inventario_id` int(11) NOT NULL,
  `paquete_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `deporte_plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_deporte`
--

CREATE TABLE `material_deporte` (
  `material_id` int(11) NOT NULL,
  `nombre` int(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `fecha_adquisicio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete_turismo`
--

CREATE TABLE `paquete_turismo` (
  `paquete_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `duracion_dias` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `guia_id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `promocion_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `descuento` decimal(5,2) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `proveedor_id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `contacto` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `reserva_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `paquete_id` int(11) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `cantidad_personas` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `deporte_plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguros`
--

CREATE TABLE `seguros` (
  `seguro_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `paquete_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `cobertura` varchar(350) NOT NULL,
  `deporte_plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasporte`
--

CREATE TABLE `trasporte` (
  `trasporte_id` int(11) NOT NULL,
  `paquete_id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `deporte_plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `deporte_xtremo_plan`
--
ALTER TABLE `deporte_xtremo_plan`
  ADD PRIMARY KEY (`deporte_plan_id`),
  ADD KEY `id_guia` (`guia_id`);

--
-- Indices de la tabla `guia_turistico`
--
ALTER TABLE `guia_turistico`
  ADD PRIMARY KEY (`guia_id`);

--
-- Indices de la tabla `inventario_material`
--
ALTER TABLE `inventario_material`
  ADD PRIMARY KEY (`inventario_id`),
  ADD KEY `id_paquete1` (`paquete_id`),
  ADD KEY `id_deporte1` (`deporte_plan_id`);

--
-- Indices de la tabla `material_deporte`
--
ALTER TABLE `material_deporte`
  ADD PRIMARY KEY (`material_id`),
  ADD KEY `id_proveedor` (`proveedor_id`);

--
-- Indices de la tabla `paquete_turismo`
--
ALTER TABLE `paquete_turismo`
  ADD PRIMARY KEY (`paquete_id`),
  ADD KEY `id_guia2` (`guia_id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`promocion_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`proveedor_id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`reserva_id`),
  ADD KEY `id_cliente` (`cliente_id`),
  ADD KEY `id_paquete` (`paquete_id`),
  ADD KEY `id_deporte` (`deporte_plan_id`);

--
-- Indices de la tabla `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`seguro_id`),
  ADD KEY `id_cliente1` (`cliente_id`),
  ADD KEY `id_paquete2` (`paquete_id`),
  ADD KEY `id_proveedor1` (`proveedor_id`),
  ADD KEY `id_deporte2` (`deporte_plan_id`);

--
-- Indices de la tabla `trasporte`
--
ALTER TABLE `trasporte`
  ADD PRIMARY KEY (`trasporte_id`),
  ADD KEY `id_paquete3` (`paquete_id`),
  ADD KEY `id_proveedor1` (`proveedor_id`),
  ADD KEY `id_deporte3` (`deporte_plan_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deporte_xtremo_plan`
--
ALTER TABLE `deporte_xtremo_plan`
  ADD CONSTRAINT `id_guia` FOREIGN KEY (`guia_id`) REFERENCES `guia_turistico` (`guia_id`);

--
-- Filtros para la tabla `inventario_material`
--
ALTER TABLE `inventario_material`
  ADD CONSTRAINT `id_deporte1` FOREIGN KEY (`deporte_plan_id`) REFERENCES `deporte_xtremo_plan` (`deporte_plan_id`);

--
-- Filtros para la tabla `material_deporte`
--
ALTER TABLE `material_deporte`
  ADD CONSTRAINT `id_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`);

--
-- Filtros para la tabla `paquete_turismo`
--
ALTER TABLE `paquete_turismo`
  ADD CONSTRAINT `id_guia2` FOREIGN KEY (`guia_id`) REFERENCES `guia_turistico` (`guia_id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `id_deporte` FOREIGN KEY (`deporte_plan_id`) REFERENCES `deporte_xtremo_plan` (`deporte_plan_id`);

--
-- Filtros para la tabla `seguros`
--
ALTER TABLE `seguros`
  ADD CONSTRAINT `id_deporte2` FOREIGN KEY (`deporte_plan_id`) REFERENCES `deporte_xtremo_plan` (`deporte_plan_id`);

--
-- Filtros para la tabla `trasporte`
--
ALTER TABLE `trasporte`
  ADD CONSTRAINT `id_deporte3` FOREIGN KEY (`deporte_plan_id`) REFERENCES `deporte_xtremo_plan` (`deporte_plan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
