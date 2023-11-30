-- Aluno: Pedro Henrique Santos de Jesus - 3 DS A

-- CRIANDO BANCO DE DADOS
CREATE DATABASE Industria_Beleza;

-- INICIALIZANDO BANCO DE DADOS
USE Industria_Beleza;

-- Definindo Tabela 'Regioes'
CREATE TABLE Regioes (
    id int identity, -- Identificador único
    nome varchar(30),
    PRIMARY KEY(id)
);

-- Exibindo a tabela 'Regioes'
SELECT * FROM Regioes;

-- Definindo Tabela 'PontosEstrategicos'
CREATE TABLE PontosEstrategicos (
    id int identity, -- Chave Primária
    nome varchar(30),
    id_regiao int, -- Chave Estrangeira referenciando 'Regioes'
    PRIMARY KEY(id),
    FOREIGN KEY (id_regiao) REFERENCES Regioes (id)
);

-- Exibindo a tabela 'PontosEstrategicos'
SELECT * FROM PontosEstrategicos;

-- Definindo Tabela 'Vendedores'
CREATE TABLE Vendedores (
    id int identity, -- ID Único
    nome varchar(30),
    id_regiao int, -- Chave Estrangeira referenciando 'Regioes'
    PRIMARY KEY(id),
    FOREIGN KEY (id_regiao) REFERENCES Regioes (id)
);

-- Exibindo a tabela 'Vendedores'
SELECT * FROM Vendedores;

-- Definindo Tabela 'Veiculos'
CREATE TABLE Veiculos (
    id int identity, -- Identificação única
    placa varchar(10),
    tipo varchar(20),
    PRIMARY KEY(id)
);

-- Exibindo a tabela 'Veiculos'
SELECT * FROM Veiculos;

-- Definindo Tabela associativa 'VigiaVeiculo'
CREATE TABLE VigiaVeiculo (
    id int identity, -- Identificador único
    id_vendedor int, -- Chave Estrangeira referenciando 'Vendedores'
    id_veiculo int, -- Chave Estrangeira referenciando 'Veiculos'
    data_vigia date,
    PRIMARY KEY(id),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedores (id),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos (id)
);

-- Exibindo a tabela 'VigiaVeiculo'
SELECT * FROM VigiaVeiculo;

-- Definindo Tabela 'Clientes'
CREATE TABLE Clientes (
    id int identity, -- ID Único
    nome varchar(30),
    PRIMARY KEY(id)
);

-- Exibindo a tabela 'Clientes'
SELECT * FROM Clientes;

-- Definindo Tabela 'NotasFiscais'
CREATE TABLE NotasFiscais (
    id int identity, -- Número único
    id_vendedor int, -- Chave Estrangeira referenciando 'Vendedores'
    id_cliente int, -- Chave Estrangeira referenciando 'Clientes'
    qtdVendida int,
    data_nota date,
    PRIMARY KEY(id),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedores (id),
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id)
);

-- Exibindo a tabela 'NotasFiscais'
SELECT * FROM NotasFiscais;

-- Definindo Tabela 'Produtos'
CREATE TABLE Produtos (
    id int identity, -- ID único
    nome varchar(30),
    desc_produto varchar(50),
    preco float,
    qtdEstoque int,
    PRIMARY KEY(id)
);

-- Exibindo a tabela 'Produtos'
SELECT * FROM Produtos;

-- Definindo Tabela 'ItensNotaFiscal'
CREATE TABLE ItensNotaFiscal (
    id int identity, -- Identificador único
    id_produto int, -- Chave Estrangeira referenciando 'Produtos'
    id_nota int, -- Chave Estrangeira referenciando 'NotasFiscais'
    PRIMARY KEY(id),
    FOREIGN KEY (id_produto) REFERENCES Produtos (id),
    FOREIGN KEY (id_nota) REFERENCES NotasFiscais (id)
);

-- Exibindo a tabela 'ItensNotaFiscal'
SELECT * FROM ItensNotaFiscal;

-- INSERINDO DADOS NAS TABELAS

-- Inserindo dados na tabela 'Regioes'
INSERT INTO Regioes (nome) VALUES ('Central');
INSERT INTO Regioes (nome) VALUES ('Oeste');
INSERT INTO Regioes (nome) VALUES ('Leste');
INSERT INTO Regioes (nome) VALUES ('Sul');
INSERT INTO Regioes (nome) VALUES ('Norte');

-- Exibindo a tabela 'Regioes'
SELECT * FROM Regioes;

-- Inserindo dados na tabela 'PontosEstrategicos'
INSERT INTO PontosEstrategicos (nome, id_regiao) VALUES ('Museu do Lol', 1);
INSERT INTO PontosEstrategicos (nome, id_regiao) VALUES ('Rocinha', 2);
INSERT INTO PontosEstrategicos (nome, id_regiao) VALUES ('Shopping Itaquera', 3);
INSERT INTO PontosEstrategicos (nome, id_regiao) VALUES ('Parque Maeda', 4);
INSERT INTO PontosEstrategicos (nome, id_regiao) VALUES ('ETEC Zona Leste', 5);

-- Exibindo a tabela 'PontosEstrategicos'
SELECT * FROM PontosEstrategicos;

-- Inserindo dados na tabela 'Vendedores'
INSERT INTO Vendedores (nome, id_Regiao) VALUES ('Nicolas', 1);
INSERT INTO Vendedores (nome, id_Regiao) VALUES ('Duda', 2);
INSERT INTO Vendedores (nome, id_Regiao) VALUES ('Fernando', 3);
INSERT INTO Vendedores (nome, id_Regiao) VALUES ('Higor', 4);
INSERT INTO Vendedores (nome, id_Regiao) VALUES ('Miguel', 5);

-- Exibindo a tabela 'Vendedores'
SELECT * FROM Vendedores;

-- Inserindo dados na tabela 'Veiculos'
INSERT INTO Veiculos (placa, tipo) VALUES ('GAY985', 'Van');
INSERT INTO Veiculos (placa, tipo) VALUES ('SUV990', 'Carro');
INSERT INTO Veiculos (placa, tipo) VALUES ('DIK145', 'Caminhão');
INSERT INTO Veiculos (placa, tipo) VALUES ('TRE555', 'Moto');
INSERT INTO Veiculos (placa, tipo) VALUES ('TRV777', 'Ônibus');

-- Exibindo a tabela 'Veiculos'
SELECT * FROM Veiculos;

-- Inserindo dados na tabela 'VigiaVeiculo'
INSERT INTO VigiaVeiculo (id_vendedor, id_veiculo, data_vigia) VALUES (1, 1, '2005-10-03');
INSERT INTO VigiaVeiculo (id_vendedor, id_veiculo, data_vigia) VALUES (2, 2, '2005-05-30');
INSERT INTO VigiaVeiculo (id_vendedor, id_veiculo, data_vigia) VALUES (3, 3, '2005-04-21');
INSERT INTO VigiaVeiculo (id_vendedor, id_veiculo, data_vigia) VALUES (4, 4, '2005-09-11');
INSERT INTO VigiaVeiculo (id_vendedor, id_veiculo, data_vigia) VALUES (5, 5, '2005-12-25');

-- Exibindo a tabela 'VigiaVeiculo'
SELECT * FROM VigiaVeiculo;

-- Inserindo dados na tabela 'Clientes'
INSERT INTO Clientes (nome) VALUES ('Nicolas');
INSERT INTO Clientes (nome) VALUES ('Higor');
INSERT INTO Clientes (nome) VALUES ('Fernando');
INSERT INTO Clientes (nome) VALUES ('Marcelo');
INSERT INTO Clientes (nome) VALUES ('Rogério');

-- Exibindo a tabela 'Clientes'
SELECT * FROM Clientes;

-- Inserindo dados na tabela 'NotasFiscais'
INSERT INTO NotasFiscais (id_vendedor, id_cliente, qtdVendida, data_nota) VALUES (1, 1, 10, '2005-10-04');
INSERT INTO NotasFiscais (id_vendedor, id_cliente, qtdVendida, data_nota) VALUES (2, 2, 15, '2005-06-01');
INSERT INTO NotasFiscais (id_vendedor, id_cliente, qtdVendida, data_nota) VALUES (3, 3, 20, '2005-04-22');
INSERT INTO NotasFiscais (id_vendedor, id_cliente, qtdVendida, data_nota) VALUES (4, 4, 25, '2005-09-12');
INSERT INTO NotasFiscais (id_vendedor, id_cliente, qtdVendida, data_nota) VALUES (5, 5, 30, '2005-12-26');

-- Exibindo a tabela 'NotasFiscais'
SELECT * FROM NotasFiscais;

-- Inserindo dados na tabela 'Produtos'
INSERT INTO Produtos (nome, preco, qtdEstoque) VALUES ('Batom', 10.99, 100);
INSERT INTO Produtos (nome, preco, qtdEstoque) VALUES ('Gel lubrificante', 15.99, 150);
INSERT INTO Produtos (nome, preco, qtdEstoque) VALUES ('Shampoo', 20.99, 200);
INSERT INTO Produtos (nome, preco, qtdEstoque) VALUES ('Creme pra calvice', 25.99, 250);
INSERT INTO Produtos (nome, preco, qtdEstoque) VALUES ('Desodorante', 30.99, 300);

-- Exibindo a tabela 'Produtos'
SELECT * FROM Produtos;

-- Inserindo dados na tabela 'ItensNotaFiscal'
INSERT INTO ItensNotaFiscal (id_produto, id_nota) VALUES (1, 1);
INSERT INTO ItensNotaFiscal (id_produto, id_nota) VALUES (2, 2);
INSERT INTO ItensNotaFiscal (id_produto, id_nota) VALUES (3, 3);
INSERT INTO ItensNotaFiscal (id_produto, id_nota) VALUES (4, 4);
INSERT INTO ItensNotaFiscal (id_produto, id_nota) VALUES (5, 5);

-- Exibindo a tabela 'ItensNotaFiscal'
SELECT * FROM ItensNotaFiscal;

-- CONSULTAS:

-- A - Listar todos os pontos estratégicos de cada região.
SELECT r.nome as Regiao, pe.nome as PontoEstrategico
FROM Regioes r
JOIN PontosEstrategicos pe ON r.id = pe.id_regiao;

-- B - Listar os nomes das regiões cadastradas.
SELECT nome FROM Regioes;

-- C - Listar todos os vendedores e quais veículos que eles utilizaram no último mês.
SELECT v.nome as Vendedor, vv.data_vigia, ve.placa, ve.tipo
FROM Vendedores v
LEFT JOIN VigiaVeiculo vv ON v.id = vv.id_vendedor AND vv.data_vigia >= '2005-04-01' -- Ajuste a data conforme necessário
LEFT JOIN Veiculos ve ON vv.id_veiculo = ve.id;

-- D - Listar todos os vendedores responsáveis por cada região.
SELECT r.nome as Regiao, v.nome as Vendedor
FROM Regioes r
JOIN Vendedores v ON r.id = v.id_regiao;

-- E - Todos os produtos vendidos por um determinado vendedor.
SELECT v.nome as Vendedor, p.nome as Produto
FROM Vendedores v
JOIN NotasFiscais nf ON v.id = nf.id_vendedor
JOIN ItensNotaFiscal inf ON nf.id = inf.id_nota
JOIN Produtos p ON inf.id_produto = p.id
WHERE v.nome = 'Duda'; -- Substitua 'Nome do Vendedor' pelo nome desejado.

-- F - Todos os vendedores que venderam um determinado produto.
SELECT v.nome as Vendedor, p.nome as Produto
FROM Vendedores v
JOIN NotasFiscais nf ON v.id = nf.id_vendedor
JOIN ItensNotaFiscal inf ON nf.id = inf.id_nota
JOIN Produtos p ON inf.id_produto = p.id
WHERE p.nome = 'Shampoo'; -- Substitua 'Nome do Produto' pelo nome desejado.

-- G - Todos os produtos que ainda não foram vendidos.
SELECT p.nome as Produto
FROM Produtos p
LEFT JOIN ItensNotaFiscal inf ON p.id = inf.id_produto
WHERE inf.id_produto IS NULL;

-- H - Listar o histórico de utilização de um determinado veículo.
SELECT ve.placa, ve.tipo, vv.data_vigia, v.nome as Vendedor
FROM Veiculos ve
JOIN VigiaVeiculo vv ON ve.id = vv.id_veiculo
JOIN Vendedores v ON vv.id_vendedor = v.id
WHERE ve.placa = 'GAY985'; -- Substitua 'Placa do Veículo' pela placa desejada.

-- I - A quantidade de itens de cada nota fiscal.
SELECT nf.id as NotaFiscal, COUNT(inf.id) as QuantidadeItens
FROM NotasFiscais nf
JOIN ItensNotaFiscal inf ON nf.id = inf.id_nota
GROUP BY nf.id;