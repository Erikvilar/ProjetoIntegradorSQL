drop database if exists MAS;
create database MAS;
use MAS;

CREATE TABLE Usuario
(	
	
	id_usuario INT PRIMARY KEY NOT NULL,
    login_usuario varchar(12),
    senha_usuario varchar(15),
    nivel_usuario ENUM('admin', 'regular_user', 'visitor'),
    dataNas_usuario DATE,
    id_contato INT, -- id contato carrega o nome do usuario
    CONSTRAINT contatoUsuario FOREIGN KEY (id_contato) REFERENCES Contato (id_contato)
);
INSERT INTO Usuario (id_usuario, login_usuario, senha_usuario, nivel_usuario, dataNas_usuario, id_contato)
VALUES (1, 'jsilva', 'senha123', 'admin', '1985-01-15', 1);

INSERT INTO Usuario (id_usuario, login_usuario, senha_usuario, nivel_usuario, dataNas_usuario, id_contato)
VALUES (2, 'moliveira', 'senha456', 'regular_user', '1990-02-20', 2);

INSERT INTO Usuario (id_usuario, login_usuario, senha_usuario, nivel_usuario, dataNas_usuario, id_contato)
VALUES (3, 'psantos', 'senha789', 'visitor', '1987-03-25', 3);

INSERT INTO Usuario (id_usuario, login_usuario, senha_usuario, nivel_usuario, dataNas_usuario, id_contato)
VALUES (4, 'acosta', 'senha101', 'regular_user', '1992-04-30', 4);



CREATE TABLE Contato
(
	id_contato int primary key NOT NULL,
    nome_contato varchar(100),
	email varchar(50),
    telefone varchar(14),
    whatsapp varchar(14)
	
);

INSERT INTO Contato (id_contato, nome_contato, email, telefone, whatsapp) 
VALUES (1, 'João Silva', 'joao.silva@example.com', '1198765-4321', '1198765-4321');

INSERT INTO Contato (id_contato, nome_contato, email, telefone, whatsapp) 
VALUES (2, 'Maria Oliveira', 'maria.oliveira@example.com', '2199876-5432', '2199876-5432');

INSERT INTO Contato (id_contato, nome_contato, email, telefone, whatsapp) 
VALUES (3, 'Pedro Santos', 'pedro.santos@example.com', '411234-5678', '411234-5678');

INSERT INTO Contato (id_contato, nome_contato, email, telefone, whatsapp) 
VALUES (4, 'Ana Costa', 'ana.costa@example.com', '3198765-1234', '3198765-1234');


CREATE TABLE endereco
(
	id_endereco INT PRIMARY KEY NOT NULL,
    Cep varchar(9),
    Rua varchar(100),
    Bairro varchar(100),
    numero_residencia varchar(100),
    Cidade varchar(100),
    Estado char(2),
    pais varchar(100)
);
INSERT INTO endereco (id_endereco, Cep, Rua, Bairro, numero_residencia, Cidade, Estado, pais) 
VALUES (1, '12345-678', 'Rua das Flores', 'Jardim das Rosas', '123', 'São Paulo', 'SP', 'Brasil');

INSERT INTO endereco (id_endereco, Cep, Rua, Bairro, numero_residencia, Cidade, Estado, pais) 
VALUES (2, '23456-789', 'Avenida Paulista', 'Bela Vista', '456', 'São Paulo', 'SP', 'Brasil');

INSERT INTO endereco (id_endereco, Cep, Rua, Bairro, numero_residencia, Cidade, Estado, pais) 
VALUES (3, '34567-890', 'Rua XV de Novembro', 'Centro', '789', 'Curitiba', 'PR', 'Brasil');

INSERT INTO endereco (id_endereco, Cep, Rua, Bairro, numero_residencia, Cidade, Estado, pais) 
VALUES (4, '45678-901', 'Avenida Atlântica', 'Copacabana', '1011', 'Rio de Janeiro', 'RJ', 'Brasil');

CREATE TABLE empresa 
(
	id_empresa INT PRIMARY KEY NOT NULL,
    cpnj varchar(14),
    nome_empresa varchar(100),
    id_contato int,
    id_endereco int,
    constraint Contato_empresa FOREIGN KEY (id_contato) references Contato(id_contato),
    constraint Endereco_empresa FOREIGN KEY (id_endereco) references Endereco(id_endereco)
);

INSERT INTO Empresa (id_empresa, cpnj, nome_empresa, id_contato, id_endereco)
VALUES (1, '12345678000195', 'Tech Solutions Ltda', 1, 1);

INSERT INTO Empresa (id_empresa, cpnj, nome_empresa, id_contato, id_endereco)
VALUES (2, '98765432000177', 'Innovatech S.A.', 2, 2);

INSERT INTO Empresa (id_empresa, cpnj, nome_empresa, id_contato, id_endereco)
VALUES (3, '45678912000155', 'Green Energy Inc.', 3, 3);

INSERT INTO Empresa (id_empresa, cpnj, nome_empresa, id_contato, id_endereco)
VALUES (4, '78912345000166', 'Global Trading Co.', 4, 4);

CREATE TABLE Faculdade
(
	id_faculdade INT PRIMARY KEY NOT NULL,
    nome_faculdade varchar(100),
   
	id_contato int,
    id_endereco int,
	
    constraint Contato_faculdade FOREIGN KEY (id_contato) references Contato(id_contato),
    constraint Endereco_faculdade FOREIGN KEY (id_endereco) references Endereco(id_endereco)
);
INSERT INTO Faculdade (id_faculdade, nome_faculdade, id_contato, id_endereco)
VALUES (1, 'Universidade Federal de São Paulo', 1, 1),
 (2, 'Universidade de Brasília', 2, 2),
 (3, 'Universidade Estadual de Campinas', 3, 3),
 (4, 'Universidade Federal do Rio de Janeiro', 4, 4);

CREATE TABLE item
(
	id_item INT PRIMARY KEY NOT NULL,
    nome_item varchar(50),
    serial_item varchar(20),
    descricao_item varchar(100),
    localizacao_uso_item varchar(200),
    id_faculdade int,
    id_compra int,
    id_notaFiscal int,
    constraint item_faculdade FOREIGN KEY (id_faculdade)  references Faculdade (id_faculdade),
	constraint Compra FOREIGN KEY (id_compra) references Compra(id_compra),
    constraint NotaFiscal_item FOREIGN KEY (id_notaFiscal) references NotaFiscal(id_notaFiscal)
);

INSERT INTO item (id_item, nome_item, serial_item, descricao_item, localizacao_uso_item, id_faculdade, id_compra, id_notaFiscal)
VALUES (1, 'Computador', 'ABC123', 'Computador de mesa', 'Laboratório 101', 1, 1, 1),
 (2, 'Projetor', 'XYZ789', 'Projetor para apresentações', 'Sala de conferências', 2, 2, 2),
 (3, 'Mesa', 'DEF456', 'Mesa de escritório', 'Escritório administrativo', 3, 3, 3),
 (4, 'Cadeira', 'GHI789', 'Cadeira ergonômica', 'Sala de aula 202', 4, 4, 4);
select * from item;

CREATE TABLE NotaFiscal
(
	id_notaFiscal INT PRIMARY KEY NOT NULL,
    serie varchar(50),
    nNF varchar(50),
    dhEmi DATETIME,
    tpNF varchar(50),
    indPag varchar(50),
    indPres varchar(50),
    natOp varchar(50),
    idDest varchar(50),
    valor_total decimal (10,2)
    
    
);
select * from notaFiscal;

INSERT INTO NotaFiscal (id_notaFiscal, serie, nNF, dhEmi, tpNF, indPag, indPres, natOp, idDest, valor_total)
VALUES (1, '001', '123456', '2024-07-16 10:30:00', 'Venda', '1', '9', 'Venda de produtos', '1',10200.00),
 (2, '002', '789012', '2024-07-15 14:45:00', 'Devolução', '1', '9', 'Devolução de mercadoria','1', 20000.00),
(3, '001', '345678', '2024-07-14 09:00:00', 'Venda', '1', '9', 'Venda de serviços', '1',2500.00),
(4, '003', '901234', '2024-07-13 16:20:00', 'Venda', '1', '9', 'Venda de produtos', '3',80.000);



-- TABELA CHAVE DO BANCO DE DADOS
CREATE TABLE Compra 
(
	id_compra int primary key not null,
    status_compra enum("aprovado","pendente","cancelado"),
    data_compra DATETIME,
    id_faculdade int,
    id_notaFiscal int,
    constraint Compra_faculdade FOREIGN KEY (id_faculdade) references Faculdade(id_faculdade),
    constraint NotaFiscal FOREIGN KEY (id_notaFiscal) references NotaFiscal(id_notaFiscal)
    
);

INSERT INTO Compra (id_compra, status_compra, data_compra, id_faculdade, id_notaFiscal)
VALUES (1, 'aprovado', '2024-07-16 10:00:00', 1, 1),
 (2, 'pendente', '2024-07-15 14:30:00', 2, 2),
 (3, 'cancelado', '2024-07-14 09:45:00', 3, 3),
 (4, 'aprovado', '2024-07-13 16:20:00', 4, 4);
select * from compra

DELIMITER //

CREATE FUNCTION converterDataBr(data date)
returns varchar(10) -- tipo de dado retornado parecido como um const 
BEGIN
	RETURN DATE_FORMAT(data, '%d/%m/%Y');
END //

DELIMITER ;

SELECT converterDataBr(dataNas_usuario) as dataBr from Usuario;

-- listando todas as compras realizadas oir cada faculdade
SELECT f.nome_faculdade AS Faculdade,
       c.id_compra AS ID_Compra,
       nf.serie AS Serie_NF,
       nf.nNF AS Numero_NF,
       c.data_compra AS Data_Compra
FROM Faculdade f
INNER JOIN Compra c ON f.id_faculdade = c.id_faculdade
INNER JOIN NotaFiscal nf ON c.id_notaFiscal = nf.id_notaFiscal;
-- relatorio de cada item por compra
SELECT c.id_compra AS ID_Compra,
       i.nome_item AS Item,
       i.serial_item AS Serial,
       i.descricao_item AS Descricao,
       i.localizacao_uso_item AS Localizacao
FROM Compra c
INNER JOIN item i ON c.id_compra = i.id_compra;

-- relatorio de valor total das compras do valor de cada faculdade
SELECT f.nome_faculdade AS Faculdade,
       SUM(nf.valor_total) AS Valor_Total
FROM Faculdade f
INNER JOIN Compra c ON f.id_faculdade = c.id_faculdade
INNER JOIN NotaFiscal nf ON c.id_notaFiscal = nf.id_notaFiscal
GROUP BY f.nome_faculdade;
-- associação por compra
SELECT f.nome_faculdade AS Faculdade,
       c.id_compra AS ID_Compra,
       nf.serie AS Serie_NF,
       nf.nNF AS Numero_NF,
       nf.valor_total AS Valor_Total
FROM Faculdade f
INNER JOIN Compra c ON f.id_faculdade = c.id_faculdade
INNER JOIN NotaFiscal nf ON c.id_notaFiscal = nf.id_notaFiscal;
--  associação de compras nao realiadas no caso a so uma
SELECT f.nome_faculdade AS Faculdade,
       c.id_compra AS ID_Compra,
       nf.serie AS Serie_NF,
       nf.nNF AS Numero_NF,
       nf.valor_total AS Valor_Total
FROM Faculdade f
INNER JOIN Compra c ON f.id_faculdade = c.id_faculdade
INNER JOIN NotaFiscal nf ON c.id_notaFiscal = nf.id_notaFiscal
WHERE c.status_compra = 'cancelado';



-- Lista compra e faculdade na mesma coluna (nao sei se e util :)
SELECT c.status_compra AS Informacao
FROM Compra c
UNION ALL
SELECT f.nome_faculdade AS Informacao
FROM Faculdade f;

-- Lista o tipo e a informação de compra e nome da faculdade em colunas abaixo
SELECT 'Status de Compra' AS Tipo,
       c.status_compra AS Informacao
FROM Compra c
UNION
SELECT 'Nome de Faculdade' AS Tipo,
       f.nome_faculdade AS Informacao
FROM Faculdade f;

-- todas as compras com data de emissao de nota
CREATE VIEW vw_TodasCompras AS
SELECT c.id_compra, 
       c.status_compra, 
       f.nome_faculdade AS nome_faculdade_compra,
       nf.serie AS serie_nf,
       nf.nNF AS numero_nf,
       nf.dhEmi AS data_emissao_nf,
       nf.tpNF AS tipo_nf,
       nf.indPag AS indicador_pagamento
FROM Compra c
INNER JOIN Faculdade f ON c.id_faculdade = f.id_faculdade
INNER JOIN NotaFiscal nf ON c.id_notaFiscal = nf.id_notaFiscal;

select * from vw_TodasCompras;

CREATE VIEW vw_EstatisticasComprasFaculdade AS
SELECT f.nome_faculdade AS Faculdade,
       COUNT(c.id_compra) AS Total_Compras,
       SUM(nf.valor_total) AS Valor_Total_Gasto
FROM Faculdade f
LEFT JOIN Compra c ON f.id_faculdade = c.id_faculdade
LEFT JOIN NotaFiscal nf ON c.id_notaFiscal = nf.id_notaFiscal
GROUP BY f.nome_faculdade;


-- vendo todas as compras realizadas segmentada por cada facul
select * from vw_EstatisticasComprasFaculdade;
--  detalha nota fiscal  de coada compra pela faculdade
CREATE VIEW vw_DetalhesNotasFiscais AS
SELECT nf.id_notaFiscal,
       nf.serie,
       nf.nNF AS numero_nf,
       nf.dhEmi AS data_emissao,
       f.nome_faculdade AS nome_faculdade_compra,
       c.status_compra AS status_compra
FROM NotaFiscal nf
INNER JOIN Compra c ON nf.id_notaFiscal = c.id_notaFiscal
INNER JOIN Faculdade f ON c.id_faculdade = f.id_faculdade;

select* from vw_DetalhesNotasFiscais;