-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 01-Nov-2022 às 14:29
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_financeiro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(11) NOT NULL,
  `assetName` varchar(200) NOT NULL,
  `assetId` varchar(200) NOT NULL,
  `PurchaseDate` date NOT NULL,
  `PurchaseFrom` varchar(200) NOT NULL,
  `Manufacturer` varchar(200) NOT NULL,
  `Model` varchar(200) NOT NULL,
  `Status` int(10) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `AssetCondition` varchar(255) NOT NULL,
  `Warranty` varchar(255) NOT NULL,
  `Price` int(255) NOT NULL,
  `AssetUser` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `DateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `assets`
--

INSERT INTO `assets` (`id`, `assetName`, `assetId`, `PurchaseDate`, `PurchaseFrom`, `Manufacturer`, `Model`, `Status`, `Supplier`, `AssetCondition`, `Warranty`, `Price`, `AssetUser`, `Description`, `DateTime`) VALUES
(1, 'Macbook Book', '#AST-031256', '2020-09-23', 'Amazon', 'Apple Inc.', '2020', 1, 'Amazon', 'In good shape', '12 Months', 1900, 'Mushe abdul-Hakim', 'This is the description of the laptop', '2020-09-23 23:57:26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aulas`
--

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE IF NOT EXISTS `aulas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aulas`
--

INSERT INTO `aulas` (`id`, `titulo`, `ordem`) VALUES
(1, 'EXEMPLO', 9),
(2, 'EXEMPLO', 2),
(3, 'EXEMPLO', 4),
(4, 'EXEMPLO', 7),
(5, 'EXEMPLO', 8),
(6, 'EXEMPLO', 1),
(7, 'EXEMPLO', 3),
(8, 'EXEMPLO', 6),
(9, 'EXEMPLO', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `boletos`
--

DROP TABLE IF EXISTS `boletos`;
CREATE TABLE IF NOT EXISTS `boletos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `banco` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `prazo` int(11) NOT NULL COMMENT 'dias',
  `taxa` double NOT NULL,
  `conta_cedente` int(11) NOT NULL,
  `conta_cedente_d` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `agencia_d` int(11) NOT NULL,
  `conta` int(11) NOT NULL,
  `conta_d` int(11) NOT NULL,
  `carteira` varchar(10) NOT NULL,
  `carteira_descricao` varchar(100) NOT NULL,
  `identificacao` varchar(150) NOT NULL,
  `cpf_cnpj` varchar(18) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cedente` varchar(100) NOT NULL,
  `convenio` int(11) NOT NULL,
  `contrato` int(11) NOT NULL,
  `instrucoes1` varchar(100) NOT NULL,
  `instrucoes2` varchar(100) NOT NULL,
  `instrucoes3` varchar(100) NOT NULL,
  `instrucoes4` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '2' COMMENT '1=ativo/2=inativo',
  `obs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `boletos`
--

INSERT INTO `boletos` (`id`, `banco`, `pagina`, `prazo`, `taxa`, `conta_cedente`, `conta_cedente_d`, `agencia`, `agencia_d`, `conta`, `conta_d`, `carteira`, `carteira_descricao`, `identificacao`, `cpf_cnpj`, `endereco`, `cidade`, `uf`, `cedente`, `convenio`, `contrato`, `instrucoes1`, `instrucoes2`, `instrucoes3`, `instrucoes4`, `status`, `obs`) VALUES
(1, 'BRADESCO', '1', 12, 9, 55, 65, 1, 6, 6448, 77, '65', '85das', '1', '52225059870', 'fdgdsf', 'dsfsdf', 'sp', 'sdfsdf', 111, 111, 'vgbhfc', 'fghdf', 'sadfs', 'sdfgdf', 1, 'dfgdfg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartoes`
--

DROP TABLE IF EXISTS `cartoes`;
CREATE TABLE IF NOT EXISTS `cartoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `bandeira` int(1) NOT NULL COMMENT '1=visa / 2=mastercard / 3=diners / 4=amex / 5=hipercard',
  `final` varchar(4) NOT NULL,
  `fechamento` varchar(2) NOT NULL,
  `vencimento` varchar(2) NOT NULL,
  `limite` double NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1=ativo / 2=inativo',
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartoesgastos`
--

DROP TABLE IF EXISTS `cartoesgastos`;
CREATE TABLE IF NOT EXISTS `cartoesgastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cartao` int(11) NOT NULL,
  `titulo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `valor` double NOT NULL,
  `datadacompra` date NOT NULL,
  `data` datetime NOT NULL,
  `obs` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_filial` bigint(20) NOT NULL,
  `id_conheceu` bigint(20) NOT NULL,
  `tipo` int(1) NOT NULL COMMENT '1=juridica/2=fisica',
  `nome` varchar(150) NOT NULL,
  `fantasia` varchar(200) NOT NULL,
  `razao` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `nascimento` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `orgao` varchar(50) NOT NULL,
  `endereco` text NOT NULL,
  `cep` varchar(10) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `tel1` varchar(15) NOT NULL,
  `tel2` varchar(15) NOT NULL,
  `tel3` varchar(15) NOT NULL,
  `obs` text NOT NULL,
  `data` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1=ativo/2=inativo',
  `id_admin` bigint(20) NOT NULL,
  `nome_cartao` int(11) DEFAULT NULL,
  `numero_cartao` int(50) DEFAULT NULL,
  `cli_for` int(11) NOT NULL COMMENT '1=cliente/2=Fornecedor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `id_filial`, `id_conheceu`, `tipo`, `nome`, `fantasia`, `razao`, `email`, `nascimento`, `cpf`, `cnpj`, `rg`, `orgao`, `endereco`, `cep`, `bairro`, `cidade`, `uf`, `tel1`, `tel2`, `tel3`, `obs`, `data`, `status`, `id_admin`, `nome_cartao`, `numero_cartao`, `cli_for`) VALUES
(31, 7, 1, 2, 'ssss', 'ssss', '', 'aldysalvino@gmail.com', '2019-12-25', '111.111.111-11', '', '1111', '1111', '111111', '11.111-111', '111', '111', 'AC', '(11) 1111-11111', '', '', '', '2019-02-25 16:31:34', 1, 1, NULL, NULL, 0),
(32, 7, 1, 1, 'FORNEC', 'FONECEDOR 1', 'FORNECEDOR 1', 'teste@teste.com', '2019-02-26', '', '11.111.111/1111-11', '', '', 'WWWWWWWWWWWWW', '11.111-111', 'KKKKKKKKKK', 'OOOOOOO', 'AC', '(11) 1111-11111', '', '', '', '2019-02-26 01:47:53', 1, 1, NULL, NULL, 0),
(33, 7, 6, 2, 'Lucas S Souza', 'Lucas S Souza', '', 'llucas.silva2231@gmail.com', '2001-08-24', '522.250.598-70', '', '50.074.342-3', 'SP', 'Bom Tempo, 979, G3', '07.810-550', 'BOM TEMPO', 'FRANCO DA ROCHA', 'SP', '(11) 9965-89020', '(11) 9965-89020', '(11) 9965-89020', 'DSFSDF', '2022-08-11 18:14:42', 1, 1, NULL, NULL, 1),
(34, 7, 1, 1, 'Lucas S Souza', 'Lucas S Souza', 'Silva Tech Souza ', 'llucas.silva2231@gmail.com', '2022-08-11', '', '55.555.555/0001-26', '', '', 'Bom Tempo, 979, G3', '07.810-550', 'BOM TEMPO', 'FRANCO DA ROCHA', 'SP', '(11) 9116-01652', '(11) 9965-89020', '(11) 9116-01652', 'asdasdas', '2022-08-11 20:25:03', 1, 1, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
CREATE TABLE IF NOT EXISTS `colaboradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `rg` varchar(100) NOT NULL,
  `banco` varchar(255) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `salario` float NOT NULL,
  `salario2` float NOT NULL,
  `data_salario2` date NOT NULL,
  `minimo` varchar(8) NOT NULL,
  `valor_semana` float NOT NULL,
  `valor_22_6` float NOT NULL,
  `valor_sab` float NOT NULL,
  `valor_dom` float NOT NULL,
  `valor_night` float NOT NULL,
  `valor_night2` float NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `cart_trab` varchar(100) NOT NULL,
  `pis` varchar(50) NOT NULL,
  `admissao` date NOT NULL,
  `endereco` int(255) NOT NULL,
  `tel1` int(14) NOT NULL,
  `tel2` int(14) NOT NULL,
  `tel3` int(14) NOT NULL,
  `obs` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conheceu`
--

DROP TABLE IF EXISTS `conheceu`;
CREATE TABLE IF NOT EXISTS `conheceu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `conheceu`
--

INSERT INTO `conheceu` (`id`, `nome`, `data`) VALUES
(1, 'Google', '2013-12-20 17:19:19'),
(2, 'Outros', '2013-12-19 21:28:15'),
(3, 'Facebook', '2013-12-19 21:27:51'),
(4, 'Yahoo', '2014-01-15 19:40:15'),
(5, 'Twitter', '2014-01-15 19:41:15'),
(6, 'Instagram', '2014-01-15 19:41:22'),
(7, 'Indicação ', '2014-01-17 01:58:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contasapagar`
--

DROP TABLE IF EXISTS `contasapagar`;
CREATE TABLE IF NOT EXISTS `contasapagar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_fornecedor` bigint(20) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `valor` double NOT NULL,
  `valor_pago` double NOT NULL,
  `vencimento` date NOT NULL,
  `pagamento` date NOT NULL,
  `obs` text NOT NULL,
  `data` datetime NOT NULL,
  `id_pagamento` int(11) DEFAULT NULL,
  `compra` date DEFAULT NULL,
  `id_aquisicao` int(11) DEFAULT NULL,
  `parcelamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=740 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contasapagar`
--

INSERT INTO `contasapagar` (`id`, `id_fornecedor`, `titulo`, `valor`, `valor_pago`, `vencimento`, `pagamento`, `obs`, `data`, `id_pagamento`, `compra`, `id_aquisicao`, `parcelamento`) VALUES
(739, 34, 'silva tech souza', 625, 625, '2022-08-12', '2022-08-12', 'sdasda', '2022-08-12 09:38:32', 0, '0000-00-00', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `faturas`
--

DROP TABLE IF EXISTS `faturas`;
CREATE TABLE IF NOT EXISTS `faturas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cliente` bigint(20) NOT NULL,
  `vencimento` date NOT NULL,
  `enviado` datetime NOT NULL,
  `reenviado` datetime NOT NULL,
  `visualizado` datetime NOT NULL,
  `dia` int(1) NOT NULL DEFAULT '0',
  `dois` int(1) NOT NULL DEFAULT '0',
  `cinco` int(1) NOT NULL DEFAULT '0',
  `fechado` date NOT NULL,
  `id_servico1` int(11) NOT NULL,
  `id_servico2` int(11) NOT NULL,
  `id_servico3` int(11) NOT NULL,
  `id_servico4` int(11) NOT NULL,
  `id_servico5` int(11) NOT NULL,
  `valor1` double NOT NULL,
  `valor2` double NOT NULL,
  `valor3` double NOT NULL,
  `valor4` double NOT NULL,
  `valor5` double NOT NULL,
  `obs` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=aberto / 2=enviado / 3=reenviado / 4=visualizado / 5=fechado',
  `data` datetime NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_pagamento` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=840 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `faturas`
--

INSERT INTO `faturas` (`id`, `id_cliente`, `vencimento`, `enviado`, `reenviado`, `visualizado`, `dia`, `dois`, `cinco`, `fechado`, `id_servico1`, `id_servico2`, `id_servico3`, `id_servico4`, `id_servico5`, `valor1`, `valor2`, `valor3`, `valor4`, `valor5`, `obs`, `status`, `data`, `id_admin`, `id_pagamento`) VALUES
(835, 33, '2022-09-08', '2022-08-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '0000-00-00', 12, 0, 0, 0, 0, 625, 0, 0, 0, 0, '0', 1, '2022-08-12 09:40:33', 1, 0),
(837, 33, '2022-08-12', '2022-08-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '1901-01-12', 12, 0, 0, 0, 0, 625, 0, 0, 0, 0, 'sts', 5, '2022-08-12 10:00:57', 1, 0),
(839, 33, '2022-08-22', '2022-08-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '2022-08-12', 12, 0, 0, 0, 0, 625, 0, 0, 0, 0, 'STS', 5, '2022-08-12 11:35:30', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `filiais`
--

DROP TABLE IF EXISTS `filiais`;
CREATE TABLE IF NOT EXISTS `filiais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcriador` varchar(11) NOT NULL,
  `nomeempresa` varchar(200) NOT NULL,
  `nomefantasia` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `estados` varchar(20) NOT NULL,
  `cep` varchar(200) NOT NULL,
  `email1` varchar(200) NOT NULL,
  `email2` varchar(200) NOT NULL,
  `telefone1` varchar(200) NOT NULL,
  `telefone2` varchar(200) NOT NULL,
  `cnpj` varchar(200) NOT NULL,
  `datacriacao` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `filiais`
--

INSERT INTO `filiais` (`id`, `idcriador`, `nomeempresa`, `nomefantasia`, `endereco`, `estados`, `cep`, `email1`, `email2`, `telefone1`, `telefone2`, `cnpj`, `datacriacao`) VALUES
(5, '0000', 'Brás\r\n', 'Brás', 'Bom Tempo', 'BA', '07810-550.', 'llucas.silva2231@gmail.com', 'llucas.silva2231@gmail.com', '11996589020', '11911601652', '55.555.555/0001-26', '13/10/2022'),
(6, '0000', 'Via CAD têxtil ', 'Bom Retiro', 'Bom Tempo', 'BA', '07810-550.', 'llucas.silva2231@gmail.com', 'llucas.silva2231@gmail.com', '11996589020', '11996589020', '55.555.555/0001-26', '13/10/2022');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `goals`
--

DROP TABLE IF EXISTS `goals`;
CREATE TABLE IF NOT EXISTS `goals` (
  `id` int(11) NOT NULL,
  `Type` varchar(200) NOT NULL,
  `Subject` varchar(200) NOT NULL,
  `Target` text NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Description` text NOT NULL,
  `Status` int(11) NOT NULL,
  `Progress` varchar(200) NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `goals`
--

INSERT INTO `goals` (`id`, `Type`, `Subject`, `Target`, `StartDate`, `EndDate`, `Description`, `Status`, `Progress`, `dateTime`) VALUES
(1, 'Another One', 'Coding', 'Code till time infinity ', '2020-09-25', '2020-10-10', 'This is the thing i always want to do and am doing it for the rest of my life now friend.', 1, '80', '2020-09-25 00:13:34'),
(2, 'Another One', 'this is a test', 'Code till time infinity ', '2020-09-25', '2020-10-10', 'This is a test', 1, '50', '2020-09-25 00:39:34'),
(3, 'Invoice Goal', 'This is another test', 'Code till thy kingdom come.', '2020-09-25', '2048-09-10', 'this is another one of the wierdest thing that i have ever done. I having alot of the shit not working but i got this.', 0, '0', '2020-09-25 01:08:59');

-- --------------------------------------------------------

--
-- Estrutura da tabela `holidays`
--

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE IF NOT EXISTS `holidays` (
  `id` int(11) NOT NULL,
  `Holiday_Name` varchar(200) NOT NULL,
  `Holiday_Date` date NOT NULL,
  `DateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `holidays`
--

INSERT INTO `holidays` (`id`, `Holiday_Name`, `Holiday_Date`, `DateTime`) VALUES
(1, 'Christmas', '2020-12-25', '2020-09-26 19:15:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `intermediarios`
--

DROP TABLE IF EXISTS `intermediarios`;
CREATE TABLE IF NOT EXISTS `intermediarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=ativo / 2=inativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `intermediarios`
--

INSERT INTO `intermediarios` (`id`, `nome`, `email`, `status`) VALUES
(1, 'PagSeguro Uol', 'email@email.com', 2),
(2, 'PayPal', 'email@email.com', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE IF NOT EXISTS `leaves` (
  `id` int(11) NOT NULL,
  `Employee` varchar(200) NOT NULL,
  `Starting_At` date NOT NULL,
  `Ending_On` date NOT NULL,
  `Days` int(200) NOT NULL,
  `Reason` text NOT NULL,
  `Time_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `leaves`
--

INSERT INTO `leaves` (`id`, `Employee`, `Starting_At`, `Ending_On`, `Days`, `Reason`, `Time_Added`) VALUES
(1, 'Goerge Merchason', '2020-09-01', '2020-10-01', 10, 'This is a test to the leaving system', '2020-10-04 01:50:34'),
(2, 'Mushe Abdul-Hakim', '2020-09-01', '2020-10-16', 10, 'this is another reason why he going home for number of days', '2020-10-04 01:53:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

DROP TABLE IF EXISTS `mensagens`;
CREATE TABLE IF NOT EXISTS `mensagens` (
  `id` bigint(20) NOT NULL,
  `id_col` bigint(20) NOT NULL,
  `id_col2` bigint(20) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `overtime`
--

DROP TABLE IF EXISTS `overtime`;
CREATE TABLE IF NOT EXISTS `overtime` (
  `id` int(11) NOT NULL,
  `Employee` varchar(200) NOT NULL,
  `OverTime_Date` date NOT NULL,
  `Hours` varchar(20) NOT NULL,
  `Type` varchar(200) NOT NULL,
  `Description` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `overtime`
--

INSERT INTO `overtime` (`id`, `Employee`, `OverTime_Date`, `Hours`, `Type`, `Description`, `dateTime`) VALUES
(1, 'Mushe Abdul-Hakim', '2020-09-29', '5', '	Normal ex.5', 'This extra minutes are spent on trying to improve my knowledge on programming everyday.', '2020-09-29 00:38:26'),
(2, 'Goerge Merchason', '2020-09-29', '5', '	Normal ex.5', 'This was just to help the ceo with his presentation prep for tomorrow\'s big event.', '2020-09-29 09:20:37'),
(3, 'Yahuza Abdul-Hakim', '2020-09-10', '3', 'Normal ex.5', 'This is another test of the overtime of employees', '2020-09-29 09:28:59');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(15) NOT NULL,
  `iduser` varchar(15) NOT NULL,
  `idfilial` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `iduser`, `idfilial`) VALUES
(1, '6', '5'),
(2, '0', '5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

DROP TABLE IF EXISTS `projeto`;
CREATE TABLE IF NOT EXISTS `projeto` (
  `id` int(11) NOT NULL,
  `titulo` text NOT NULL,
  `descricao` text NOT NULL,
  `estrelas` int(11) NOT NULL,
  `btnlink` text NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`id`, `titulo`, `descricao`, `estrelas`, `btnlink`, `tipo`) VALUES
(1, 'Tela Branca', 'O Tela Branca é um aplicativo voltado para desenhar, com suas funções é possível criar artes incríveis e com toda facilidade na palma da mão. Este nome foi pensado para que essa tela em branco possa ser preenchida com toda sua criatividade.', 4, 'telabranca.html', 1),
(2, 'Pague Pouco', 'O Pague Pouco Combustível é um aplicativo que auxilia motoristas de carros flex. Facilitando na escolha de gasolina ou etanol, saber qual combustível colocar para cada situação pode implicar em mais aproveitamento de seu veículo além de fazer uma boa economia.', 4, 'https://play.google.com/store/apps/details?id=br.com.lucassouza.sts.pjpaguepouco&hl=pt_BR&gl=US', 1),
(3, 'QrCode Silva', 'QrCode Silva é um aplicativo de criação e escâner de qr codes, atualmente os qr codes estão cada vez mais presente nas nossas vidas em cada canto podemos encontrar um diferente. Estar em dia com o futuro é essencial esse aplicativo pode ser muito útil.', 4, 'https://play.google.com/store/apps/details?id=br.com.lucassouza.ntech.qrcode_silva&hl=pt_BR&gl=US', 1),
(4, 'Jogo Da Velha', 'Game Jogo da Velha é um jogo divertido de se jogar com os colegas, o jogo da velha é um dos jogos mais antigos da humanidade então nada melhor do que criar uma versão para celular facilitando na hora de jogar com os amigos.', 4, 'https://play.google.com/store/apps/details?id=br.com.lucassts.gamejv&hl=pt_BR&gl=US', 2),
(5, 'Kalkular', 'O Kalkular é uma calculadora com funções que facilitam e agilizam na hora de resolver as contas, contendo a funções de comando de voz basta dizer sua conta e na hora será gerando o resultado.', 4, '#', 1),
(6, 'Caramello', 'O nosso primeiro jogo, um jogo onde o cachorro caramelo percorre diferentes cenários brasileiros para fugir dos experimentos do governo.  ', 4, '#', 2),
(7, 'Frigobar', 'Um Aplicativo que gera receitas aleatórias, toda vez que clica na geladeira no app, mostrando ingrediente e modo de preparo, assim caso esteja na dúvida do que preparar é só abrir o frigobar.', 4, '#', 1),
(8, 'I.A Filtro', 'Um sistema integrado com uma inteligência artificial, capaz de recolher informações de documentos pré escolhidos, podendo fazer isso em série, assim basta subir seus arquivos e deixar ela fazer o trabalho. ', 5, '#', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipopagamento`
--

DROP TABLE IF EXISTS `tipopagamento`;
CREATE TABLE IF NOT EXISTS `tipopagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipopagamento`
--

INSERT INTO `tipopagamento` (`id`, `nome`, `data`) VALUES
(5, 'BB-J', '2015-03-12'),
(6, 'BB-P', '2015-03-12'),
(7, 'ITAÚ-P', '2015-03-12'),
(8, 'ITAÚ-J', '2015-03-12'),
(9, 'CASH', '2015-03-12'),
(10, 'CARTÃO BBJ-12', '2015-03-12'),
(11, 'CARTÃO BBP-12', '2015-03-12'),
(12, 'CARTÃO SANT-08', '2015-03-12'),
(13, 'CARTÃO ITAÚ P -17', '2015-03-12'),
(14, 'CHEQUE BBJ', '2015-03-12'),
(15, 'CHEQUE BBP', '2015-03-12'),
(16, 'CHEQUE ITAÚ-P', '2015-03-12'),
(17, 'CHEQUE ITAU-J', '2015-03-12'),
(18, 'BOLETO BANCÁRIO', '2015-11-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiposervicos`
--

DROP TABLE IF EXISTS `tiposervicos`;
CREATE TABLE IF NOT EXISTS `tiposervicos` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tiposervicos`
--

INSERT INTO `tiposervicos` (`id`, `nome`, `data`) VALUES
(1, 'Corte', '2022-08-11 19:05:42'),
(13, 'Solucoes em TI', '2022-08-12 13:08:26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `UserName` varchar(200) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Picture` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `filial` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `FirstName`, `LastName`, `UserName`, `Email`, `Password`, `Phone`, `Address`, `Picture`, `dateTime`, `filial`) VALUES
(6, 'Lucas\r\n', 'Cudo', '0000', 'barrycuda@example.com', '$2y$10$zb2ibzzBKJHQaMeMoMZqTuRxERFAZl0LZUya8yJkxKa8JM6yzQEXy', '9876543210', 'Los Angeles, California', 'avatar-19.jpg', '2020-09-21 19:04:47', '6'),
(7, 'Renato', 'Abdul-Hakim', '0001', 'musheabdulhakim@protonmail.ch', '$2y$10$zb2ibzzBKJHQaMeMoMZqTuRxERFAZl0LZUya8yJkxKa8JM6yzQEXy', '233209229025', 'San Francisco Bay Area', 'my-passport-photo.jpg', '2020-09-21 19:05:43', '5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `id_func` int(11) DEFAULT NULL COMMENT 'id de colaborador no banco de funcionarios',
  `status` text,
  `filia` text,
  `ping_usuario` datetime DEFAULT NULL,
  `cpf` text,
  `rg` text,
  `email2` text,
  `cel1` text,
  `cel2` text,
  `cep` text,
  `endereco` text,
  `datanaci` text,
  `geral` text,
  `finan` text,
  `rh` text,
  `salario` text,
  PRIMARY KEY (`id`,`login`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `login`, `senha`, `id_func`, `status`, `filia`, `ping_usuario`, `cpf`, `rg`, `email2`, `cel1`, `cel2`, `cep`, `endereco`, `datanaci`, `geral`, `finan`, `rh`, `salario`) VALUES
(1, 'Lucas Silva', 'email@email.com.br', 'teste', 'VkZaU1NtVnJOVUpRVkRBOQ==', 20, 'on', '', '2022-08-18 15:43:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'renato', 'retato', 'retato', 'VkZaU1NtVnJOVUpRVkRBOQ==', NULL, 'on', '7', '2022-08-18 15:43:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Lucas S Souza', 'llucas.silva2231@gmail.com', 'lucas', 'VkZaU1NtVnJOVUpRVkRBOQ==', NULL, 'off', '8', NULL, '522.250.598-70', '50.074.342-3', 'llucas.silva2231@gmail.com', '11111111111', '1111111111', '055', 'Bom Tempo', '2001-08-24', 'on', 'on', 'on', '111');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
