-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/02/2025 às 21:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `victoria_financeiro`
--
CREATE DATABASE IF NOT EXISTS `victoria_financeiro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `victoria_financeiro`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `mySp_correntistaDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_correntistaDelete` (`v_id` INT)   BEGIN
IF ((v_id > 0) and (v_id !='')) THEN
DELETE FROM tbl_correntista WHERE correntista_id =v_id;
ELSE
SELECT 'O identificador do registro não foi informado!' AS
Msg;
end if;
end$$

DROP PROCEDURE IF EXISTS `mySp_correntistaInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_correntistaInsert` (`v_nome` VARCHAR(60), `v_cpf` VARCHAR(20))   BEGIN
IF((v_nome!='') && (v_cpf!='')) THEN
INSERT INTO tbl_correntista
(correntista_nome,correntista_cpf)
VALUES
(v_nome,v_cpf);
ELSE
SELECT 'nome e cpf devem ser fornecidos para o cadastro!'
AS Msg;
END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_correntistaUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_correntistaUpdate` (`v_id` INT, `v_nome` VARCHAR(60), `v_cpf` VARCHAR(20))   BEGIN
IF (((v_id>0)&&(v_id !=''))&&(v_nome !='')&&(v_cpf !=''))THEN
UPDATE tbl_correntista SET correntista_nome =v_nome,correntista_cpf=v_cpf
WHERE correntista_id =v_id;
ELSE
SELECT 'Os novos nomes e cpf devem ser informados!'
AS Msg;
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `intensvenda`
--

DROP TABLE IF EXISTS `intensvenda`;
CREATE TABLE `intensvenda` (
  `venda` int(11) DEFAULT NULL,
  `produto` varchar(3) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Acionadores `intensvenda`
--
DROP TRIGGER IF EXISTS `Tgr_intensvenda_Delete`;
DELIMITER $$
CREATE TRIGGER `Tgr_intensvenda_Delete` AFTER DELETE ON `intensvenda` FOR EACH ROW begin
update produtos set estoque = estoque + old.quantidade
where referencia = old.produto;
end
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Tgr_intensvenda_Insert`;
DELIMITER $$
CREATE TRIGGER `Tgr_intensvenda_Insert` AFTER INSERT ON `intensvenda` FOR EACH ROW BEGIN
Update produtos SET estoque = estoque - new.quantidade
where referencia = new.produto;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `referencia` varchar(3) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`referencia`, `descricao`, `estoque`) VALUES
('001', 'feijão', 10),
('002', 'arroz', 5),
('003', 'farinha', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_correntista`
--

DROP TABLE IF EXISTS `tbl_correntista`;
CREATE TABLE `tbl_correntista` (
  `correntista_id` int(11) NOT NULL,
  `correntista_nome` varchar(60) NOT NULL,
  `correntista_cpf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbl_correntista`
--

INSERT INTO `tbl_correntista` (`correntista_id`, `correntista_nome`, `correntista_cpf`) VALUES
(1, 'Victoria Gabrieli Da Luz', '023.456.789-10'),
(2, 'Arya Stark', '123.456.789-11');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `v`;
CREATE TABLE `v` (
`QNTD` int(11)
,`preco` decimal(10,1)
,`valor` decimal(20,1)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE `vendas` (
  `QNTD` int(11) NOT NULL,
  `preco` decimal(10,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`QNTD`, `preco`) VALUES
(3, 5.5),
(10, 45.0),
(20, 3.5),
(8, 9.9);

-- --------------------------------------------------------

--
-- Estrutura para view `v`
--
DROP TABLE IF EXISTS `v`;

DROP VIEW IF EXISTS `v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v`  AS SELECT `vendas`.`QNTD` AS `QNTD`, `vendas`.`preco` AS `preco`, `vendas`.`QNTD`* `vendas`.`preco` AS `valor` FROM `vendas` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`referencia`),
  ADD UNIQUE KEY `descricao` (`descricao`);

--
-- Índices de tabela `tbl_correntista`
--
ALTER TABLE `tbl_correntista`
  ADD PRIMARY KEY (`correntista_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_correntista`
--
ALTER TABLE `tbl_correntista`
  MODIFY `correntista_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
