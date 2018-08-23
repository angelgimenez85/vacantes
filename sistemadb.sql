-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2018 at 04:52 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Solicitud`
--

CREATE TABLE `Solicitud` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `vacante` int(11) NOT NULL,
  `curriculum` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Solicitud`
--

INSERT INTO `Solicitud` (`id`, `fecha`, `nombre`, `email`, `telefono`, `direccion`, `vacante`, `curriculum`) VALUES
(1, '2018-05-21', 'Edward S. Hloomstrong', 'edwardinfo@hloom.com', '(123) 456 78 99', ' 	123 Park Avenue, Michigan MI 60689', 17, '20180521115127.pdf'),
(3, '2018-05-21', 'Marcos Santos Ortiz', 'marcos_santos@yahoo.com', '(584) 58471256', 'C. Enrique Estrada #89', 20, '20180521115541.pdf'),
(4, '2018-05-21', 'Matteo Sintoni', 'matteo_sintoni@yahoo.com', '(478) 485965214', 'Calle del Olmo #15567', 19, '20180521115702.pdf'),
(5, '2018-05-21', 'Daniela Dominguez Arteaga', 'daniela@test.com', '485963541', 'C. Luis Moya #456', 16, '20180521115847.pdf'),
(6, '2018-05-21', 'Virginie Spinka', 'h2734196@nwytg.com', '919-692-8349', '4362 Erling Spur', 16, '20180521120335.pdf'),
(7, '2018-05-21', 'Jane Doe Olmo', 'janedool@yahoo.com', '496-5489635', 'Av. Sonora #4, Col. Centro', 18, '20180521060402.rtf'),
(8, '2018-05-21', 'Hettie Fisher', 'h2778264@nwytg.com', '831-194-3755', '978 Thea Lodge', 9, '20180521061144.doc');

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `perfil` varchar(30) DEFAULT NULL,
  `estatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`id`, `nombre`, `email`, `username`, `password`, `perfil`, `estatus`) VALUES
(1, 'Ivan Eliseo Tinajero Díaz', 'ivanetinajero@gmail.com', 'ivan', '81dc9bdb52d04dc20036dbd8313ed055', 'administrador', 'activo'),
(2, 'Angel Gimenez', 'angelgimenez@gmail.com', 'angel', '1a1dc91c907325c69271ddf0c944bc72', 'administrador', 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `Vacante`
--

CREATE TABLE `Vacante` (
  `id` int(11) NOT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` text,
  `detalle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Vacante`
--

INSERT INTO `Vacante` (`id`, `fechaPublicacion`, `nombre`, `descripcion`, `detalle`) VALUES
(9, '2018-05-21', 'Arquitecto/a dibujante', 'Digitalizar levantamientos arquitectonicos, Diseño de mobiliario de oficinas (distribucion), Realizar modelo 3D de los espacios, Realizar renders en 3D Max (perspectivas), Dibujo de proyectos Arquitectonicos, Dibujo de proyectos ejecutivos', '<p><span style=\"font-size: 12pt;\">Requerimientos</span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span></li>\r\n<li><span style=\"font-size: 12pt;\">A&ntilde;os de experiencia: 1</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de viajar: No</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de cambio de residencia: No</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 12pt;\">Fecha de contratacion: 22-03-2016</span></p>\r\n<p><span style=\"font-size: 12pt;\">Cantidad de vacantes: 2</span></p>'),
(10, '2018-05-21', 'Arquitecto Proyectista', 'Realizacion de diseño y conceptos arquitectonicos, proyectos ejecutivos arquitectonicos conocimientos en programas autocad, resolucion de problemas arquitectonicos y detalles constructivos, conocimiento de materiales constructivos, elaboracion de generadores de obra.', '<p><strong><span style=\"font-size: 12pt;\">Requerimientos</span></strong></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span></li>\r\n<li><span style=\"font-size: 12pt;\">A&ntilde;os de experiencia: 4</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de viajar: No</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de cambio de residencia: No</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 12pt;\"><strong>Cantidad de vacantes</strong>: 3</span></p>\r\n<p><strong><span style=\"font-size: 12pt;\">Ofrecemos:</span></strong></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Seguro social</span></li>\r\n<li><span style=\"font-size: 12pt;\">Prestaciones de Ley</span></li>\r\n<li><span style=\"font-size: 12pt;\">2 Semanas de vacaciones al A&ntilde;o</span></li>\r\n<li><span style=\"font-size: 12pt;\">Vales de despensas</span></li>\r\n</ul>'),
(11, '2018-05-21', 'Coordinador de Costos - Ingeniero Civil ', 'Ingeniero civil para organizacion, planeacion, control, capacidad de abstraccion, toma de decisiones, atencion al detalle, manejo del estres, paciencia, iniciativa, apego a normas, necesidad de terminar una tarea, analisis y sintesis.', '<p><span style=\"font-size: 10pt;\"><strong>Conocimientos</strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 10pt;\"> Costos de Obra</span></li>\r\n<li><span style=\"font-size: 10pt;\">An&aacute;lisis de precios unitarios</span></li>\r\n<li><span style=\"font-size: 10pt;\">Infraestructura, levantamientos y vol&uacute;menes de obra</span></li>\r\n<li><span style=\"font-size: 10pt;\">Tarjetas de precios unitarios </span></li>\r\n<li><span style=\"font-size: 10pt;\">Conocimiento de obra civil y su normatividad</span></li>\r\n<li><span style=\"font-size: 10pt;\">Rendimientos de mano de obra y maquinaria</span></li>\r\n<li><span style=\"font-size: 10pt;\">Supervisi&oacute;n de obra</span></li>\r\n<li><span style=\"font-size: 10pt;\">Manejo de Sinco, Opus, Diazar</span></li>\r\n<li><span style=\"font-size: 10pt;\">Edificaci&oacute;n de vivienda de Inter&eacute;s social</span></li>\r\n<li><span style=\"font-size: 10pt;\">Edificaci&oacute;n con moldes</span></li>\r\n</ul>\r\n<h3><span style=\"font-size: 10pt;\">Requerimientos</span></h3>\r\n<ul>\r\n<li><span style=\"font-size: 10pt;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span></li>\r\n<li><span style=\"font-size: 10pt;\">A&ntilde;os de experiencia: 2</span></li>\r\n<li><span style=\"font-size: 10pt;\">Disponibilidad de viajar: No</span></li>\r\n<li><span style=\"font-size: 10pt;\">Disponibilidad de cambio de residencia: No</span></li>\r\n</ul>\r\n<ul>\r\n<li><span style=\"font-size: 10pt;\"> Sexo: Indistinto</span></li>\r\n<li><span style=\"font-size: 10pt;\">Edad: 28-45 a&ntilde;os</span></li>\r\n<li><span style=\"font-size: 10pt;\">Estado Civil: Indistinto</span></li>\r\n<li><span style=\"font-size: 10pt;\">Escolaridad: Licenciatura en Ingenier&iacute;a Civil</span></li>\r\n</ul>\r\n<p><br /><span style=\"font-size: 10pt;\"><strong>Experiencia</strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 10pt;\">2 a&ntilde;os en el &aacute;rea de costos y presupuestos de obra.</span></li>\r\n</ul>'),
(12, '2018-05-21', ' Ingeniero Agronomo - Desarrollador de Proyectos ', 'Implementar viveros de cosecha agricola, implementar y supervisar los sistemas de riego y drenaje, inspecciones en lo relacionado a los sistemas de siembra, cosecha de cultivos, suministros, certificacion de semillas, fertilizacion. Evaluar la estimacion de los costos de produccion, prevencion e identificacion de plagas.', '<p><span style=\"font-size: 12pt;\"><strong>Requisitos</strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Sexo indistinto de 28 a 40 a&ntilde;os</span></li>\r\n<li><span style=\"font-size: 12pt;\"> Ing. Agr&oacute;nomo con especialidad en Fitotecnia u Horticultura protegida / Ing. en Agricultura</span></li>\r\n<li><span style=\"font-size: 12pt;\">Experiencia m&iacute;nima de 5 a&ntilde;os en puesto similar con amplia experiencia en dise&ntilde;o e implementaci&oacute;n de viveros de cosecha agr&iacute;cola, sistemas de riego y siembra, etc. </span></li>\r\n<li><span style=\"font-size: 12pt;\">Conocimientos en normatividad y procedimientos de la conservaci&oacute;n al medio ambiente. </span></li>\r\n<li><span style=\"font-size: 12pt;\">Deseable ingl&eacute;s intermedio </span></li>\r\n<li><span style=\"font-size: 12pt;\">Office avanzado</span></li>\r\n<li><span style=\"font-size: 12pt;\">Contar con auto propio</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 12pt;\"><strong>Competencias deseables:</strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Planeaci&oacute;n estrat&eacute;gica </span></li>\r\n<li><span style=\"font-size: 12pt;\">Soluci&oacute;n de conflictos</span></li>\r\n<li><span style=\"font-size: 12pt;\">Orientaci&oacute;n a resultados </span></li>\r\n<li><span style=\"font-size: 12pt;\">Tolerancia a la presi&oacute;n </span></li>\r\n<li><span style=\"font-size: 12pt;\">Comunicaci&oacute;n efectiva </span></li>\r\n<li><span style=\"font-size: 12pt;\">Negociaci&oacute;n </span></li>\r\n<li><span style=\"font-size: 12pt;\">Atenci&oacute;n al cliente interno y externo</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 12pt;\"><strong>Ofrecemos</strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Sueldo negociable acorde a experiencia y conocimientos </span></li>\r\n<li><span style=\"font-size: 12pt;\">Turno completo de Lunes a Viernes de 9:00 a 17:00 horas</span></li>\r\n<li><span style=\"font-size: 12pt;\">Excelente ambiente de trabajo</span></li>\r\n<li><span style=\"font-size: 12pt;\">Estabilidad y desarrollo profesional</span></li>\r\n<li><span style=\"font-size: 12pt;\">LUGAR DE TRABAJO: QUERETARO (Solo aplicar residentes de dicha ciudad)</span></li>\r\n</ul>'),
(13, '2018-05-21', ' Ingeniero en Software QA/ Tester', 'Buscamos un individuo listo, ambicioso y trabajador en busca de una carrera desafiante en Software Development Testing. Analizara requerimientos, ejecutara test plans. Ejecutara casos de testing manuales y automatizados. Evaluara back-end data, servicios y API calls. Reportara, encontrara y proveera sugerencias a problemas que pudieran ser encontrados.', '<p><span style=\"font-size: 10pt;\"><strong>Requisitos</strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 10pt;\">Experiencia utilizando herramientas de Testing ( QTP, VS)</span></li>\r\n<li><span style=\"font-size: 10pt;\">Licenciatura en Ciencias Computacionales o equivalente.</span></li>\r\n<li><span style=\"font-size: 10pt;\">Habilidad en resolver problemas anal&iacute;ticos.</span></li>\r\n<li><span style=\"font-size: 10pt;\">Automatizaci&oacute;n es un Plus.</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 10pt;\"><strong>Ofrecemos</strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 10pt;\">Seguro de gastos m&eacute;dicos.</span></li>\r\n<li><span style=\"font-size: 10pt;\">Seguro de vida.</span></li>\r\n<li><span style=\"font-size: 10pt;\">Horarios flexibles. </span></li>\r\n<li><span style=\"font-size: 10pt;\">Hack Day. </span></li>\r\n<li><span style=\"font-size: 10pt;\">Beneficios alternativos</span></li>\r\n</ul>\r\n<h3><span style=\"font-size: 10pt;\">Requerimientos</span></h3>\r\n<ul>\r\n<li><span style=\"font-size: 10pt;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span></li>\r\n<li><span style=\"font-size: 10pt;\">A&ntilde;os de experiencia: 1</span></li>\r\n<li><span style=\"font-size: 10pt;\">Idiomas: Ingl&eacute;s </span></li>\r\n<li><span style=\"font-size: 10pt;\">Disponibilidad de viajar: Si</span></li>\r\n<li><span style=\"font-size: 10pt;\">Disponibilidad de cambio de residencia: Si</span></li>\r\n</ul>'),
(14, '2018-05-21', 'Veterinario o Ingeniero Agronomo Zootecnista', 'Medico veterinario Zootecnista. Ing. Zootecnista o Ingeniero Agronomo para supervisar y mejorar la eficiencia en la produccion de la granja. Determinar, verificar y supervisar el manejo de las parvadas. Seleccionar, contratar y capacitar al personal de la granja.', '<p><span style=\"font-size: 12pt;\"><strong><span style=\"color: #333333; font-family: Roboto, Helvetica, Arial, sans-serif; line-height: 21px;\">Se ofrece:</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\"><span style=\"color: #333333; font-family: Roboto, Helvetica, Arial, sans-serif;\"><span style=\"line-height: 21px;\"><strong><span style=\"font-weight: normal;\">Se proporciona veh&iacute;culo y gasolina</span></strong></span></span></span></li>\r\n<li><span style=\"font-size: 12pt;\"><span style=\"color: #333333; font-family: Roboto, Helvetica, Arial, sans-serif;\"><span style=\"line-height: 21px;\"><strong><span style=\"font-weight: normal;\">Prestaciones de acuerdo a la ley</span><br /></strong></span></span></span></li>\r\n</ul>\r\n<h3 style=\"box-sizing: border-box; font-size: 16px; margin: 20px 0px 0px; color: #333333; font-family: Roboto, Helvetica, Arial, sans-serif; line-height: 21px;\"><span style=\"font-size: 12pt;\">Requerimientos:</span></h3>\r\n<ul>\r\n<li><span style=\"color: #333333; font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 12pt; line-height: 21px;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span></li>\r\n<li><span style=\"font-size: 12pt;\">A&ntilde;os de experiencia: 2</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de viajar: Si</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de cambio de residencia: No</span></li>\r\n</ul>\r\n<p><strong><span style=\"color: #333333; font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 12pt; line-height: 21px;\">Funciones:</span></strong></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\"><span style=\"color: #333333; font-family: Roboto, Helvetica, Arial, sans-serif;\"><span style=\"line-height: 21px;\">Verificar el funcionamiento de los equipos e instalaciones de las granjas.</span></span></span></li>\r\n<li><span style=\"color: #333333; font-family: Roboto, Helvetica, Arial, sans-serif;\"><span style=\"font-size: 15px; line-height: 21px;\"><span style=\"font-size: 12pt;\">Coordinar la producci&oacute;n con administraci&oacute;n y ventas.</span><br /></span></span></li>\r\n</ul>'),
(15, '2018-05-21', 'Ingenieria de software', 'El aspirante debera cumplir con varios estandares de programacion, asi como manejar por lo menos tres lenguajes de programacion', '<p>los principales lenguajes&nbsp;</p>\r\n<p>visual basic</p>\r\n<p>php</p>\r\n<p>java</p>'),
(16, '2018-05-21', 'Asesor de ventas', 'Se solicita asesor de ventas en el ramo de alarmas con experiencia en ventas de campo y/o ventas corporativas asi como prospeccion de clientes.', '<p><strong><span style=\"font-size: 12pt; color: #ff0000;\">Informaci&oacute;n de contacto:</span></strong><br /><br /><span style=\"font-size: 12pt;\"><span style=\"font-size: 12pt;\">Si estas interesado </span><span style=\"font-size: 12pt;\">comun&iacute;cate con nosotros.</span><br /></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\"><span style=\"font-size: 12pt;\">Ing. Felipe Sanchez Hern&aacute;ndez<br /></span></span></li>\r\n<li><span style=\"font-size: 12pt;\"><span style=\"font-size: 12pt;\">Tel. 5557848521</span></span></li>\r\n<li><span style=\"font-size: 12pt;\"><span style=\"font-size: 12pt;\">Cel. 9997 388434</span></span></li>\r\n<li><span style=\"font-size: 12pt;\">Favor de enviar tu CV a la direcci&oacute;n de correo electr&oacute;nico: reculatamiento@alarmassavc.net</span></li>\r\n</ul>\r\n<p><br /><span style=\"color: #ff0000;\"><strong><span style=\"font-size: 12pt;\">Salario</span></strong></span><br /><span style=\"font-size: 12pt;\">$ 10.000,00 (Neto mensual)</span></p>\r\n<p><br /><span style=\"color: #ff0000;\"><strong><span style=\"font-size: 12pt;\">Localizaci&oacute;n</span></strong></span><br /><span style=\"font-size: 12pt;\">M&eacute;rida, Yucat&aacute;n</span><br /><br /><br /><span style=\"color: #ff0000;\"><strong><span style=\"font-size: 12pt;\">Otros requerimientos:</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Proactivo.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Orientaci&oacute;n a resultados.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Negociador.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Habilidad de comunicaci&oacute;n.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Tolerancia a frustraci&oacute;n y presi&oacute;n.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Sociabilidad.</span></li>\r\n</ul>\r\n<p><br /><span style=\"color: #ff0000;\"><strong><span style=\"font-size: 12pt;\">Ofrecemos:</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Sueldo base: $5000 Netos Mensuales, pago semanal.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Estabilidad Laboral.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Buen Ambiente de trabajo.</span></li>\r\n<li><span style=\"font-size: 12pt;\">+EXCELENTES Comisiones $$$$$</span></li>\r\n</ul>\r\n<p><br /><span style=\"text-decoration: underline;\"><strong><span style=\"font-size: 12pt;\">Horario de Trabajo: Lunes a Viernes de 9am a 7pm y Sabados de 9am a 2pm</span></strong></span><br /><br /><span style=\"font-size: 12pt; color: #ff0000;\"><strong>Otros detalles:</strong></span></p>\r\n<ol>\r\n<li><span style=\"font-size: 12pt;\">Fecha de contrataci&oacute;n: 02/06/2016</span></li>\r\n<li><span style=\"font-size: 12pt;\">Cantidad de vacantes: 3</span></li>\r\n<li><span style=\"font-size: 12pt;\">Requerimientos</span></li>\r\n<li><span style=\"font-size: 12pt;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n media superior -Bachillerato General</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de viajar: No</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de cambio de residencia: No</span></li>\r\n<li><span style=\"font-size: 12pt;\">Sexo: Indistinto</span></li>\r\n<li><span style=\"font-size: 12pt;\">Edad: 25 a 40 a&ntilde;os.</span></li>\r\n</ol>'),
(17, '2018-05-21', ' Gerente de Recursos Humanos', 'Empresa dedicada a la manufactura requiere gerente de RH con experiencia minima 2 años en reclutamiento y seleccion de personal, manejo de nomina semanal y anual, calculo en salarios, vales de despensa, premios e incentivos, (ingresos, altas, bajas, transferencias y promociones) control de asistencia, conocimiento de seguridad e higiene, politicas y procedimientos. ', '<p><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">REQUERIMIENTOS</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span></li>\r\n<li><span style=\"font-size: 12pt;\">A&ntilde;os de experiencia: 2</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de viajar: No</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de cambio de residencia: No</span></li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">CONOCIMIENTOS</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Amplio conocimiento en NOI, IDSE, SUA.</span></li>\r\n<li><span style=\"font-size: 12pt;\"> Manejo avanzado de Office.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Manejo de Outlook.</span></li>\r\n<li><span style=\"color: #000000; font-size: 12pt;\">Ley Federal de Trabajo.</span></li>\r\n<li><span style=\"color: #000000; font-size: 12pt;\">Administraci&oacute;n de Seguro de Vida y SGMM.</span></li>\r\n<li><span style=\"color: #000000; font-size: 12pt;\">Comunicaci&oacute;n organizacional.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Acostumbrada al trabajo en equipo, tolerancia a la frustraci&oacute;n, proactiva, organizada, trabajo bajo presi&oacute;n y responsable.</span></li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">OFRECE</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">SUELDO: $16,000.00 mensuales. Brutos</span></li>\r\n<li><span style=\"font-size: 12pt;\">HORARIO: DE 8:30 a 18:00 hrs. de Lunes a Viernes. </span></li>\r\n<li><span style=\"font-size: 12pt;\">Vales de despensa.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Bonos de puntualidad.</span></li>\r\n<li><span style=\"font-size: 12pt;\">Despu&eacute;s de los 3 meses prestaciones superiores a la Ley.</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 12pt;\">Si cubres el perfil no es necesario realizar cita, enviar CV en formato Word y presentarse con CV impreso y tres &uacute;ltimas cartas de recomendaci&oacute;n laboral. L</span><span style=\"font-size: 12pt;\">os horarios de entrevista son de lunes a jueves de 9:00 a 12:30 y de 14:00 a 17:30 hrs y los viernes de 9:00 a 12:30 hrs. Es el edificio de la Manufactura, a dos cuadras de la Avenida Francisco Garc&iacute;a Salinas. </span><strong><span style=\"font-size: 12pt;\">Preguntar por la Lic. Lucia Zapata Ort&iacute;z.</span></strong></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Cantidad de vacantes: 1</span></li>\r\n</ul>'),
(18, '2018-05-21', 'Gerente de Redes y Sistemas de Información', 'Se solicita Ing de Sistemas para implementar soluciones de infraestructura a la empresa, detectar areas de oportunidad y mejora en las aplicaciones y servicios de la empresa. Estara encargado tambien de documentar implementaciones y controles de cambio, dar soporte a usuarios finales dentro de la empresa. Es importante que tenga buen trato a usuarios finales y trabajo en equipo.', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\"><span style=\"box-sizing: border-box; color: #000080;\"><strong style=\"box-sizing: border-box; font-weight: bold;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">INFORMACI&Oacute;N DE CONTACTO</span></strong></span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\"><span style=\"color: #000080;\"><strong style=\"box-sizing: border-box; font-weight: bold;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Interesados favor de contactarnos por cualquiera de los siguientes medios:</span></strong></span><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-size: 12pt; color: #000080;\"><strong style=\"box-sizing: border-box; font-weight: bold;\">Email</strong>: rh@miempresa.net</span><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-size: 12pt; color: #000080;\"><strong style=\"box-sizing: border-box; font-weight: bold;\">Telefono</strong>: (01) 458-958741</span><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-size: 12pt; color: #000080;\"><strong style=\"box-sizing: border-box; font-weight: bold;\">Celular</strong>: 458745226</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\"><span style=\"text-decoration: underline;\"><strong><span style=\"box-sizing: border-box; font-size: 12pt; color: #ff0000; text-decoration: underline;\">REQUISITOS</span></strong></span></p>\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Edad: 28 a 40 a&ntilde;os</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Escolaridad: Lic &oacute; Ing. en Sistemas, Telecomunicaciones, Electr&oacute;nica o a fin</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Experiencia: 3 a&ntilde;os en puesto similar, manejo de pesonal, soporte t&eacute;cnico, conocimiento de redes, windows,servidores desarrollo, punto de contacto con clientes internosy externos, deseable conocimientos en IP y Avaya.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Habilidades requeridas: Negociaci&oacute;n, Pensamiento Anal&iacute;tico, Resoluci&oacute;n de Problemas</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Ingl&eacute;s Avanzado</span></li>\r\n</ul>\r\n<p><span style=\"text-decoration: underline; color: #ff0000;\"><strong><span style=\"box-sizing: border-box; font-size: 12pt;\">OFRECEMOS</span></strong></span></p>\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Sueldo $25, 000</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Prestaciones de Ley, Seguro de Vida y Membres&iacute;a M&eacute;dica</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Estabilidad Laboral</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Oportunidad de desarrollo</span></li>\r\n</ul>\r\n<p><span style=\"text-decoration: underline; color: #ff0000;\"><strong><span style=\"box-sizing: border-box; font-size: 12pt;\">REQUERIMIENTOS</span></strong></span></p>\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">A&ntilde;os de experiencia: 3</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Disponibilidad de viajar: No</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Disponibilidad de cambio de residencia: No</span></li>\r\n</ul>\r\n<p><span style=\"text-decoration: underline; color: #ff0000;\"><strong style=\"box-sizing: border-box; font-weight: bold; color: #ff0000; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration: underline;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">CARACTERISTICAS Y COMPETENCIAS</span></strong></span></p>\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Proactivo</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Din&aacute;mico</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Liderazgo</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Manejo y desarrollo de personal</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Habilidades en administraci&oacute;n planeaci&oacute;n y control</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Orientaci&oacute;n a resultados,</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Capacidad de an&aacute;lisis y s&iacute;ntesis</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Ordenado</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Manejo de conflictos</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Toma de decisiones</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Tolerancia a la frustraci&oacute;n y presi&oacute;n.</span></li>\r\n</ul>\r\n<p><span style=\"text-decoration: underline; color: #ff0000;\"><strong style=\"box-sizing: border-box; font-weight: bold; color: #ff0000; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration: underline;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">INFORMACION ADICIONAL</span></strong></span></p>\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: #333333; font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Fecha de contrataci&oacute;n: 03/07/2016</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 12pt;\">Cantidad de vacantes: 1</span></li>\r\n</ul>'),
(19, '2018-05-21', 'Auxiliar contable', 'Se solicita auxiliar de contabilidad para apoyar al depto contable en la verificacion de incidencias, manejo y captura de incidencias, elaboracion de prenomina, nomina quincenal operativos y administrativos. Tambien se encargara del tramite de tarjetas bancarias, aclaraciones de nomina, reportes quincenales, mensuales, bimestrales, anuales y otros.', '<p><span style=\"color: #ff0000;\"><strong><span style=\"font-size: 12pt;\">Informaci&oacute;n de contacto:</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Tel: 85954482</span></li>\r\n<li><span style=\"font-size: 12pt;\">Email: human_resources@lorefa.net</span></li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">Salario</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">A convenir</span></li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">Localizaci&oacute;n</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">M&eacute;rida, Yucat&aacute;n</span></li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">Descripci&oacute;n</span></strong></span><br /><span style=\"font-size: 12pt;\">Horario de trabajo: Lunes a viernes de 8:00 a 6:30 pm de lunes a viernes</span><br /><br /><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">Actividades</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Captura de p&oacute;lizas</span></li>\r\n<li><span style=\"font-size: 12pt;\">Ingresos</span></li>\r\n<li><span style=\"font-size: 12pt;\">Egresos</span></li>\r\n<li><span style=\"font-size: 12pt;\">Diarios</span></li>\r\n<li><span style=\"font-size: 12pt;\">Conocimientos intermedios de contabilidad</span></li>\r\n</ul>\r\n<p><br /><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">Habilidades y actitudes</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Num&eacute;rica</span></li>\r\n<li><span style=\"font-size: 12pt;\">Trabajo en equipo</span></li>\r\n<li><span style=\"font-size: 12pt;\">Responsable</span></li>\r\n<li><span style=\"font-size: 12pt;\">Honestidad</span></li>\r\n<li><span style=\"font-size: 12pt;\">Empat&iacute;a</span></li>\r\n<li><span style=\"font-size: 12pt;\">Iniciativa</span></li>\r\n</ul>\r\n<p><br /><span style=\"color: #0000ff;\"><strong><span style=\"font-size: 12pt;\">Requerimientos</span></strong></span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span></li>\r\n<li><span style=\"font-size: 12pt;\">A&ntilde;os de experiencia: 1</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de viajar: No</span></li>\r\n<li><span style=\"font-size: 12pt;\">Disponibilidad de cambio de residencia: No</span></li>\r\n</ul>\r\n<p><strong><span style=\"font-size: 12pt;\">Fecha de contrataci&oacute;n: 23/08/2016</span></strong><br /><strong><span style=\"font-size: 12pt;\">Cantidad de vacantes: 2</span></strong></p>'),
(20, '2018-05-21', 'Tecnico mecanico automotriz', 'Se solicita mecanico automotriz para dar seguimiento a las ordenes de servicio ingresadas, realizar el diagnostico oportuno a las unidades para su reparacion, identificar piezas de reemplazo por unidad y reportar al jefe de taller las reparaciones finalizadas.', '<p><span style=\"color: #ff0000;\"><strong><span style=\"font-size: 12pt;\">INTERESADOS FAVOR DE MANDAR CV EN FORMATO PDF AL CORREO: recursos_humanos@mycompany.com</span></strong></span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"color: #0000ff;\">REQUISITOS</span>:</span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Masculino</span></li>\r\n<li><span style=\"font-size: 12pt;\">Edad de 25 a 35 a&ntilde;os</span></li>\r\n<li><span style=\"font-size: 12pt;\">Conocimientos en mec&aacute;nica general, di&eacute;sel y el&eacute;ctricosen veh&iacute;culos todo terreno</span></li>\r\n<li><span style=\"font-size: 12pt;\">Conocimiento en computaci&oacute;n y software de diagn&oacute;stico</span></li>\r\n<li><span style=\"font-size: 12pt;\">Interpretaci&oacute;n de cat&aacute;logos de partes</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"color: #0000ff;\">INGRESOS</span>:</span></p>\r\n<ul>\r\n<li><span style=\"font-size: 12pt;\">Salario base de $5,000</span></li>\r\n<li><span style=\"font-size: 12pt;\">Bono de productividad de hasta $6,ooo MN</span></li>\r\n<li><span style=\"font-size: 12pt;\">Todas las prestaciones de Ley</span></li>\r\n<li><span style=\"font-size: 12pt;\">Excelente ambiente laboral</span></li>\r\n</ul>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Solicitud`
--
ALTER TABLE `Solicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacante` (`vacante`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Vacante`
--
ALTER TABLE `Vacante`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Solicitud`
--
ALTER TABLE `Solicitud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Vacante`
--
ALTER TABLE `Vacante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Solicitud`
--
ALTER TABLE `Solicitud`
  ADD CONSTRAINT `Solicitud_ibfk_1` FOREIGN KEY (`vacante`) REFERENCES `Vacante` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
