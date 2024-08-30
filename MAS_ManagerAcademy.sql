DROP DATABASE IF EXISTS MAS;
CREATE DATABASE MAS;
USE MAS;

CREATE TABLE Contato
(
    id_contato INT PRIMARY KEY NOT NULL,
    nome_contato VARCHAR(100),
    email VARCHAR(50),
    telefone VARCHAR(14),
    whatsapp VARCHAR(14)
);

CREATE TABLE Usuario
(
    id_usuario INT PRIMARY KEY NOT NULL,
    login_usuario VARCHAR(12),
    senha_usuario VARCHAR(15),
    nivel_usuario ENUM('admin', 'regular_user', 'visitor'),
    dataNas_usuario DATE,
    id_contato INT,
    CONSTRAINT contatoUsuario FOREIGN KEY (id_contato) REFERENCES Contato (id_contato)
);

CREATE TABLE Endereco
(
    id_endereco INT PRIMARY KEY NOT NULL,
    Cep VARCHAR(9),
    Rua VARCHAR(100),
    Bairro VARCHAR(100),
    numero_residencia VARCHAR(100),
    Cidade VARCHAR(100),
    Estado CHAR(2),
    pais VARCHAR(100)
);

CREATE TABLE Empresa 
(
    id_empresa INT PRIMARY KEY NOT NULL,
    cpnj VARCHAR(14),
    nome_empresa VARCHAR(100),
    id_contato INT,
    id_endereco INT,
    CONSTRAINT Contato_empresa FOREIGN KEY (id_contato) REFERENCES Contato(id_contato),
    CONSTRAINT Endereco_empresa FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE Faculdade
(
    id_faculdade INT PRIMARY KEY NOT NULL,
    nome_faculdade VARCHAR(100),
    id_contato INT,
    id_endereco INT,
    CONSTRAINT Contato_faculdade FOREIGN KEY (id_contato) REFERENCES Contato(id_contato),
    CONSTRAINT Endereco_faculdade FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE NotaFiscal
(
    id_notaFiscal INT PRIMARY KEY NOT NULL,
    serie VARCHAR(50),
    nNF VARCHAR(50),
    dhEmi DATETIME,
    tpNF VARCHAR(50),
    indPag VARCHAR(50),
    indPres VARCHAR(50),
    natOp VARCHAR(50),
    idDest VARCHAR(50),
    valor_total DECIMAL (10,2)
);


CREATE TABLE Compra 
(
    id_compra INT PRIMARY KEY NOT NULL,
    status_compra ENUM('aprovado','pendente','cancelado'),
    data_compra DATETIME,
    id_faculdade INT,
    id_notaFiscal INT,
    CONSTRAINT Compra_faculdade FOREIGN KEY (id_faculdade) REFERENCES Faculdade(id_faculdade),
    CONSTRAINT NotaFiscal FOREIGN KEY (id_notaFiscal) REFERENCES NotaFiscal(id_notaFiscal)
);

CREATE TABLE Item
(
    id_item INT PRIMARY KEY NOT NULL,
    nome_item VARCHAR(50),
    serial_item VARCHAR(20),
    descricao_item VARCHAR(100),
    localizacao_uso_item VARCHAR(200),
    id_faculdade INT,
    id_compra INT,
    id_notaFiscal INT,
    CONSTRAINT item_faculdade FOREIGN KEY (id_faculdade) REFERENCES Faculdade(id_faculdade),
    CONSTRAINT Compra FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
    CONSTRAINT NotaFiscal_item FOREIGN KEY (id_notaFiscal) REFERENCES NotaFiscal(id_notaFiscal)
);


INSERT INTO Contato (id_contato, nome_contato, email, telefone, whatsapp) 
VALUES 
(1, 'João Silva', 'joao.silva@example.com', '1198765-4321', '1198765-4321'),
(2, 'Maria Oliveira', 'maria.oliveira@example.com', '2199876-5432', '2199876-5432'),
(3, 'Pedro Santos', 'pedro.santos@example.com', '411234-5678', '411234-5678'),
(4, 'Ana Costa', 'ana.costa@example.com', '3198765-1234', '3198765-1234');

INSERT INTO Usuario (id_usuario, login_usuario, senha_usuario, nivel_usuario, dataNas_usuario, id_contato)
VALUES 
(1, 'jsilva', 'senha123', 'admin', '1985-01-15', 1),
(2, 'moliveira', 'senha456', 'regular_user', '1990-02-20', 2),
(3, 'psantos', 'senha789', 'visitor', '1987-03-25', 3),
(4, 'acosta', 'senha101', 'regular_user', '1992-04-30', 4);

INSERT INTO Endereco (id_endereco, Cep, Rua, Bairro, numero_residencia, Cidade, Estado, pais) 
VALUES 
(1, '12345-678', 'Rua das Flores', 'Jardim das Rosas', '123', 'São Paulo', 'SP', 'Brasil'),
(2, '23456-789', 'Avenida Paulista', 'Bela Vista', '456', 'São Paulo', 'SP', 'Brasil'),
(3, '34567-890', 'Rua XV de Novembro', 'Centro', '789', 'Curitiba', 'PR', 'Brasil'),
(4, '45678-901', 'Avenida Atlântica', 'Copacabana', '1011', 'Rio de Janeiro', 'RJ', 'Brasil');

INSERT INTO Empresa (id_empresa, cpnj, nome_empresa, id_contato, id_endereco)
VALUES 
(1, '12345678000195', 'Tech Solutions Ltda', 1, 1),
(2, '98765432000177', 'Innovatech S.A.', 2, 2),
(3, '45678912000155', 'Green Energy Inc.', 3, 3),
(4, '78912345000166', 'Global Trading Co.', 4, 4);

INSERT INTO Faculdade (id_faculdade, nome_faculdade, id_contato, id_endereco)
VALUES 
(1, 'Universidade Federal de São Paulo', 1, 1),
(2, 'Universidade de Brasília', 2, 2),
(3, 'Universidade Estadual de Campinas', 3, 3),
(4, 'Universidade Federal do Rio de Janeiro', 4, 4);

INSERT INTO NotaFiscal (id_notaFiscal, serie, nNF, dhEmi, tpNF, indPag, indPres, natOp, idDest, valor_total)
VALUES 
(1, '001', '123456', '2024-07-16 10:30:00', 'Venda', '1', '9', 'Venda de produtos', '1', 10200.00),
(2, '002', '789012', '2024-07-15 14:45:00', 'Devolução', '1', '9', 'Devolução de mercadoria', '1', 20000.00),
(3, '001', '345678', '2024-07-14 09:00:00', 'Venda', '1', '9', 'Venda de serviços', '1', 2500.00),
(4, '003', '901234', '2024-07-13 16:20:00', 'Venda', '1', '9', 'Venda de produtos', '3', 80000.00);

INSERT INTO Compra (id_compra, status_compra, data_compra, id_faculdade, id_notaFiscal)
VALUES 
(1, 'aprovado', '2024-07-16 10:00:00', 1, 1),
(2, 'pendente', '2024-07-15 14:30:00', 2, 2),
(3, 'cancelado', '2024-07-14 09:45:00', 3, 3),
(4, 'aprovado', '2024-07-13 16:20:00', 4, 4);

INSERT INTO Item (id_item, nome_item, serial_item, descricao_item, localizacao_uso_item, id_faculdade, id_compra, id_notaFiscal)
VALUES 
(1, 'Computador', 'ABC123', 'Computador de mesa', 'Laboratório 101', 1, 1, 1),
(2, 'Projetor', 'XYZ789', 'Projetor para apresentações', 'Sala de conferências', 2, 2, 2),
(3, 'Mesa', 'DEF456', 'Mesa de escritório', 'Escritório administrativo', 3, 3, 3),
(4, 'Cadeira', 'GHI789', 'Cadeira ergonômica', 'Sala de aula 202', 4, 4, 4);


SELECT * FROM Item;
SELECT * FROM NotaFiscal;

-- A)
-- execucao sem indice
EXPLAIN SELECT u.id_usuario, u.login_usuario, c.status_compra
FROM Usuario u
JOIN Compra c ON u.id_usuario = c.id_compra
WHERE u.id_usuario = 1;
-- execucao com indice
CREATE INDEX idx_usuario_id ON Usuario(id_usuario);
EXPLAIN SELECT u.id_usuario, u.login_usuario, c.status_compra
FROM Usuario u
JOIN Compra c ON u.id_usuario = c.id_compra
WHERE u.id_usuario = 1;

-- teste com straigh 
EXPLAIN SELECT u.id_usuario, u.login_usuario, c.status_compra
FROM Usuario u
STRAIGHT_JOIN Compra c ON u.id_usuario = c.id_compra
WHERE u.id_usuario = 1;

-- B)
-- SEM INDICE
EXPLAIN SELECT u.id_usuario, u.login_usuario
FROM Usuario u
WHERE u.id_usuario IN (
    SELECT c.id_faculdade
    FROM Compra c
    WHERE c.status_compra = 'aprovado'
);
-- COM INDICE
EXPLAIN SELECT u.id_usuario, u.login_usuario
FROM Usuario u
WHERE u.id_usuario IN (
    SELECT c.id_faculdade
    FROM Compra c
    WHERE c.status_compra = 'aprovado'
);

-- straight
EXPLAIN SELECT u.id_usuario, u.login_usuario
FROM Usuario u
STRAIGHT_JOIN Compra c ON u.id_usuario = c.id_faculdade
WHERE c.status_compra = 'aprovado';

-- C)

-- agrupamento 
EXPLAIN SELECT u.nivel_usuario, COUNT(c.id_compra) AS total_compras
FROM Usuario u
LEFT JOIN Compra c ON u.id_usuario = c.id_faculdade
GROUP BY u.nivel_usuario;

-- consulta com straight
EXPLAIN SELECT u.nivel_usuario, COUNT(c.id_compra) AS total_compras
FROM Compra c
STRAIGHT_JOIN Usuario u ON u.id_usuario = c.id_faculdade
GROUP BY u.nivel_usuario;



-- 1) integrador procedures 

-- procedures de insercao
DELIMITER //

CREATE PROCEDURE InserirUsuario(
    IN p_id_usuario INT,
    IN p_login_usuario VARCHAR(12),
    IN p_senha_usuario VARCHAR(15),
    IN p_nivel_usuario ENUM('admin', 'regular_user', 'visitor'),
    IN p_dataNas_usuario DATE,
    IN p_id_contato INT
)
BEGIN
  
    IF p_login_usuario IS NULL OR p_senha_usuario IS NULL OR p_nivel_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Campos obrigatórios não informados.';
    ELSE
        INSERT INTO Usuario (id_usuario, login_usuario, senha_usuario, nivel_usuario, dataNas_usuario, id_contato)
        VALUES (p_id_usuario, p_login_usuario, p_senha_usuario, p_nivel_usuario, p_dataNas_usuario, p_id_contato);
    END IF;
END //

DELIMITER ;


-- procedures de att usuarios
DELIMITER //

CREATE PROCEDURE InserirUsuario(
    IN p_id_usuario INT,
    IN p_login_usuario VARCHAR(12),
    IN p_senha_usuario VARCHAR(15),
    IN p_nivel_usuario ENUM('admin', 'regular_user', 'visitor'),
    IN p_dataNas_usuario DATE,
    IN p_id_contato INT
)
BEGIN
    
    IF p_login_usuario IS NULL OR p_senha_usuario IS NULL OR p_nivel_usuario IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Campos obrigatórios não informados.';
    ELSE
        INSERT INTO Usuario (id_usuario, login_usuario, senha_usuario, nivel_usuario, dataNas_usuario, id_contato)
        VALUES (p_id_usuario, p_login_usuario, p_senha_usuario, p_nivel_usuario, p_dataNas_usuario, p_id_contato);
    END IF;
END //

DELIMITER ;
-- procedure para relatorio de nivel do usuario
DELIMITER //

CREATE PROCEDURE RelatorioComprasPorNivel()
BEGIN
    SELECT u.nivel_usuario, COUNT(c.id_compra) AS total_compras
    FROM Usuario u
    LEFT JOIN Compra c ON u.id_usuario = c.id_faculdade
    GROUP BY u.nivel_usuario;
END //

DELIMITER ;

-- procedure de compras e usuarios 
DELIMITER //

CREATE PROCEDURE RelatorioUsuariosCompras()
BEGIN
    SELECT u.login_usuario, COUNT(c.id_compra) AS total_compras
    FROM Usuario u
    LEFT JOIN Compra c ON u.id_usuario = c.id_faculdade
    GROUP BY u.login_usuario;
END //

DELIMITER ;

-- 1) integrador funcoes
-- funcao de retorno de data padrao brasil
DELIMITER //

CREATE FUNCTION FormatarData(
    p_data DATE
) RETURNS VARCHAR(10)
BEGIN
    RETURN DATE_FORMAT(p_data, '%d/%m/%Y');
END //

DELIMITER ;

-- funcao de retorno de data com calculo de idade
DELIMITER //

CREATE FUNCTION CalcularIdade(
    p_data_nascimento DATE
) RETURNS INT
BEGIN
    DECLARE idade INT;
    SET idade = YEAR(CURDATE()) - YEAR(p_data_nascimento);
    
    -- Verifica se o aniversário já ocorreu este ano
    IF (MONTH(CURDATE()) < MONTH(p_data_nascimento)) OR 
       (MONTH(CURDATE()) = MONTH(p_data_nascimento) AND DAY(CURDATE()) < DAY(p_data_nascimento)) THEN
        SET idade = idade - 1;
    END IF;

    RETURN idade;
END //

DELIMITER ;
-- 1) integrador triggers
-- verificar se usuario ja existe
DELIMITER //

CREATE TRIGGER VerificarLoginAntesDeInserir
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
    DECLARE usuario_existente INT;

    -- Verifica se o login já existe
    SELECT COUNT(*) INTO usuario_existente
    FROM Usuario
    WHERE login_usuario = NEW.login_usuario;

    IF usuario_existente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: O login já está em uso.';
    END IF;
END //

DELIMITER ;
-- ultimo registro
DELIMITER //

CREATE TRIGGER AtualizarDataNasUsuario
BEFORE UPDATE ON Usuario
FOR EACH ROW
BEGIN
    -- Atualiza a data de nascimento para a data atual antes da atualização
    SET NEW.dataNas_usuario = CURDATE();
END //

DELIMITER ;
