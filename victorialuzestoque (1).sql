-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Fev-2025 às 18:09
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
  `Cod_Cliente` int(11) NOT NULL COMMENT 'Este campo é responsável pelo código do cliente.',
  `Cep` varchar(10) NOT NULL COMMENT 'Este campo é responsável pelo cep do cliente.',
  `Nome_cliente` varchar(50) NOT NULL COMMENT 'Este campo é responsável pelo nome do cliente.',
  `Endereço` varchar(50) NOT NULL COMMENT 'Este campo é responsável pelo endereço do cliente.',
  `cidade` varchar(50) NOT NULL COMMENT 'Este campo é responsável pela cidade do cliente.',
  `cnpj` varchar(30) NOT NULL COMMENT 'Este campo é responsável pelo cnpj do cliente.',
  `uf` char(2) NOT NULL COMMENT 'Este campo é responsável  armazenar a unidade federativa do cliente.',
  `ie` int(10) NOT NULL COMMENT 'Este campo é responsável por  formalizar a situação da empresa e permitir a comercialização de produtos e a emissão de nota fiscal.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Cod_Cliente`, `Cep`, `Nome_cliente`, `Endereço`, `cidade`, `cnpj`, `uf`, `ie`) VALUES
(20, '25679-300', 'Beth', 'Av Climério n. 45', 'São Paulo', '43762241/3322-54', 'SP', 9280),
(110, '30078-500', 'Jorge', 'Rua Caiapó 13', 'Curitiba', '13857742/5259-30', 'PR', 6790),
(130, '30079-300', 'Edmar', 'Rua da Prais 456', 'Salvador', '99216266/4963-68', 'BA', 7121),
(157, '60943-762', 'Paulo', 'Tv. Moraes c/3', 'Londrina', '10130086/0579-88', 'PR', 1923),
(180, '30077-500', 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '54227452/0664-06', 'SC', 369),
(222, '22124-391', 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '30210129/4394-45', 'MG', 2985),
(234, '22841-650', 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '17632240/2597-40', 'DF', 2931),
(260, '30046-500', 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '92775989/6951-49', 'RJ', 2530),
(290, '30225-900', 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '10737191/7140-53', 'SP', 1820),
(390, '30438-700', 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '15058113/4552-27', 'MG', 9071),
(410, '30078-900', 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '53820690/5370-85', 'RJ', 7431),
(720, '24358-310', 'Ana', 'Rua 17 n. 19', 'Niteroi', '12113197/0000-00', 'RJ', 2134),
(830, '30126-831', 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '43291131/9490-89', 'SP', 9343),
(870, '22763-931', 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '23105673/8041-09', 'SP', 4631);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item de pedido`
--

CREATE TABLE `item de pedido` (
  `QTDE` int(11) NOT NULL COMMENT 'Este campo é responsável pela quantidade do pedido.',
  `cod_produto` int(11) NOT NULL,
  `num_Pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `num_Pedido` int(11) NOT NULL COMMENT 'Este campo é responsável pelo código do pedido.',
  `prazo_entrega` int(10) NOT NULL COMMENT 'Este campo é responsável pelo prazo de entrega do pedido.',
  `cod_vendedor` int(11) NOT NULL COMMENT 'Este campo é responsável pelo código do vendedor.',
  `cod_cliente` int(11) NOT NULL,
  `Vendedor_cod_Vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD PRIMARY KEY (`Cod_Cliente`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_Pedido`);

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
-- Limitadores para a tabela `item de pedido`
--
ALTER TABLE `item de pedido`
  ADD CONSTRAINT `fk_Item de pedido_Pedido1` FOREIGN KEY (`Pedido_num_Pedido`) REFERENCES `pedido` (`num_Pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Item de pedido_Produto1` FOREIGN KEY (`Produto_Cod_Produto`) REFERENCES `produto` (`Cod_Produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`Cod_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_Vendedor1` FOREIGN KEY (`Vendedor_cod_Vendedor`) REFERENCES `vendedor` (`cod_Vendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
