-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Fev-2025 às 19:22
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `victorialuzestoque`
--
CREATE DATABASE IF NOT EXISTS `victorialuzestoque` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `victorialuzestoque`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `uf` char(2) NOT NULL,
  `ie` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nome_cliente`, `endereco`, `cidade`, `cep`, `cnpj`, `uf`, `ie`) VALUES
(20, 'Beth', 'Av Climério n. 45', 'São Paulo', '25679-300', '4352.224133224', 'SP', 9280),
(110, 'Jorge', 'Rua Caiapó 13', 'Curitiba', '30078-500', '1379.774252593', 'PR', 2245),
(130, 'Edmar', 'Rua da Prais s/n', 'Salvador', '30079-300', '9988.626649638', 'BA', 7121),
(157, 'Paulo', 'Tv. Moraes c/3', 'Londrina', '94925', '10110.086057988', 'PR', 1923),
(180, 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '30077-500', '5382.745206646', 'SC', 1332),
(222, 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '22124-391', '2945.012943945', 'MG', 2985),
(234, 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '22841-650', '17631.240259740', 'DF', 2931),
(260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046-500', '9322.598969514', 'RJ', 2530),
(290, 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '30225-900', '10738.191714053', 'SP', 1820),
(390, 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '30438700', '15083.113455227', 'MG', 9071),
(410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '30078-900', '5373.069053708', 'RJ', 7431),
(720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358-310', '12113197.000000000', 'RJ', 2134),
(830, 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '30126-830', '4333.113194909', 'SP', 9343),
(870, 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '22763-931', '245.792735658', 'SP', 4631);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_de_pedido`
--

CREATE TABLE `item_de_pedido` (
  `num_pedido` int(11) NOT NULL,
  `Cod_Produto` int(11) NOT NULL,
  `QNTD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `item_de_pedido`
--

INSERT INTO `item_de_pedido` (`num_pedido`, `Cod_Produto`, `QNTD`) VALUES
(121, 25, 10),
(121, 31, 35),
(97, 77, 20),
(101, 31, 9),
(148, 45, 8),
(148, 31, 7),
(148, 77, 3),
(148, 25, 10),
(148, 78, 30),
(104, 53, 32),
(203, 31, 6),
(189, 78, 45),
(143, 31, 20),
(105, 78, 10),
(111, 25, 10),
(111, 78, 70),
(103, 53, 37),
(91, 77, 40),
(138, 22, 10),
(138, 77, 35),
(138, 53, 18),
(108, 13, 17),
(119, 77, 40),
(119, 13, 6),
(119, 22, 10),
(119, 53, 43),
(137, 13, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `num_pedido` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_Vendedor` int(11) NOT NULL,
  `prazo_entrega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`num_pedido`, `cod_cliente`, `cod_Vendedor`, `prazo_entrega`) VALUES
(91, 260, 11, 20),
(97, 720, 101, 20),
(98, 410, 209, 20),
(101, 720, 101, 15),
(103, 260, 11, 20),
(104, 110, 101, 30),
(105, 180, 240, 15),
(108, 290, 310, 15),
(111, 260, 240, 20),
(119, 390, 250, 30),
(121, 410, 209, 20),
(127, 410, 11, 10),
(137, 720, 720, 20),
(138, 260, 11, 20),
(143, 20, 111, 30),
(148, 720, 101, 20),
(189, 870, 213, 15),
(203, 830, 250, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `Cod_Produto` int(11) NOT NULL COMMENT 'Este campo é responsável pelo código do produto.',
  `unid_produto` varchar(10) NOT NULL COMMENT 'Este campo é responsável pela medida do produto.',
  `desc_produto` varchar(50) NOT NULL COMMENT 'Este campo é responsável pela descrição do produto.',
  `valor_unit` decimal(15,2) NOT NULL COMMENT 'Este campo é responsável pelo valor unitário do produto.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`Cod_Produto`, `unid_produto`, `desc_produto`, `valor_unit`) VALUES
(13, 'G', 'Ouro', '6.18'),
(22, 'M', 'Linho', '0.11'),
(25, 'Kg', 'Queijo', '0.97'),
(30, 'SAC', 'Açucar', '0.30'),
(31, 'Bar', 'Chocolate', '0.87'),
(45, 'M', 'Madeira', '0.25'),
(53, 'M', 'Linha', '1.80'),
(77, 'M', 'Papel', '1.05'),
(78, 'L', 'Vinho', '2.00'),
(87, 'M', 'Cano', '1.97');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `cod_Vendedor` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar o código do vendedor.',
  `nome_vendedor` varchar(50) DEFAULT NULL COMMENT 'Este campo é responsável pelo nome do vendedor.',
  `sal_fixo` decimal(15,2) DEFAULT NULL COMMENT 'Este campo é responsável pelo salário fixo do vendedor.',
  `faixa_comissão` char(2) DEFAULT NULL COMMENT 'Este campo é responsável pela faixa de comissão do vendedor.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`cod_Vendedor`, `nome_vendedor`, `sal_fixo`, `faixa_comissão`) VALUES
(11, 'João', '2780.00', 'C'),
(101, 'João', '2650.32', 'C'),
(111, 'Carlos', '2490.00', 'A'),
(209, 'José', '1800.00', 'C'),
(213, 'Jonas', '2300.50', 'A'),
(240, 'Antonio', '9500.00', 'C'),
(250, 'Mauricío', '2930.00', 'B'),
(310, 'Josias', '870.00', 'B'),
(720, 'Felipe', '4600.00', 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices para tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD KEY `fk_num_pedido` (`num_pedido`),
  ADD KEY `fk_Cod_Produto` (`Cod_Produto`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_pedido`),
  ADD KEY `fk_cod_cliente` (`cod_cliente`),
  ADD KEY `fk_cod_Vendedor` (`cod_Vendedor`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Cod_Produto`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`cod_Vendedor`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD CONSTRAINT `fk_Cod_Produto` FOREIGN KEY (`Cod_Produto`) REFERENCES `produto` (`Cod_Produto`),
  ADD CONSTRAINT `fk_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedido` (`num_pedido`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_cod_Vendedor` FOREIGN KEY (`cod_Vendedor`) REFERENCES `vendedor` (`cod_Vendedor`),
  ADD CONSTRAINT `fk_cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
