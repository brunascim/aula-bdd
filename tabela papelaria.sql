CREATE DATABASE 04102_Papelaria_Bruna;
USE 04102_Papelaria_Bruna;

CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);
CREATE TABLE Produtos (
	id_Produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
    id_fornecedor INT, 
	FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);
CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE,
    quantidade INT,
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO Fornecedores(nome, telefone, email) 
VALUES('Papelaria Brasil', '1199999-1111', 'contato@papelaria.com'),
('Distribuidora Escolar', '1198888-2222', 'vendas@escolar.com'),
('Mega Papelaria Ltda', '1197777-3333', 'contato@megapapelaria.com');

INSERT INTO Produtos(nome, preco, estoque, id_fornecedor)
VALUES('Caneta Azul', 2.50, 100, 1),
('Caderno 10 matérias', 15.00, 50, 2),
('Lápis Preto', 1.50, 200, 1);

INSERT INTO Vendas(data_venda, quantidade, id_produto) 
VALUES('2026-05-01', 10, 1),
('2026-05-02', 5, 2),
('2026-05-03', 20, 3);

SELECT * FROM Fornecedores;
SELECT * FROM Produtos;
SELECT * FROM Vendas;

SELECT * FROM Produtos WHERE nome LIKE 'C%';
SELECT * FROM Vendas WHERE data_venda <2026-05-01;
SELECT * FROM Vendas WHERE data_venda >2026-05-03;

CREATE USER 'bruna_nascimento'@'%' IDENTIFIED BY 'Franca0401_'; -- Criando o usuario

GRANT SELECT ON Produtos TO 'bruna_nascimento'; -- Garante a permissão de leitura da tabela 'Produtos' para o usuario 'bruna_nascimento'
GRANT SELECT ON Fornecedores TO 'bruna_nascimento';
GRANT SELECT ON Vendas TO 'bruna_nascimento';

GRANT SELECT, INSERT ON Produtos TO 'bruna_nascimento'; -- Garante a permissão de leitura e de inserir dados da tabela 'Produtos' para o usuario 'bruna_nascimento'
GRANT SELECT, INSERT ON Fornecedores TO 'bruna_nascimento';
GRANT SELECT, INSERT ON Vendas TO 'bruna_nascimento';

GRANT ALL PRIVILEGES ON 04102_Papelaria_Bruna.* TO 'bruna_nascimento'@'%'; -- Garante todos os privilegios 

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'bruna_nascimento'@'%';

SELECT User, Host
FROM mysql.user
WHERE User = 'bruna_nascimento';