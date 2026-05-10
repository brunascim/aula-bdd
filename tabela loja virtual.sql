CREATE DATABASE 04102_Lojavirtual_Bruna;
USE 04102_Lojavirtual_Bruna;
SHOW DATABASES;
SELECT * FROM Clientes;
CREATE TABLE Clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_nasc DATE
);

CREATE TABLE Pedidos (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT,
    produto VARCHAR(100),
    data_pedido DATE, 
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- adicionar colunas
ALTER TABLE Clientes
ADD COLUMN endereco VARCHAR(200);

ALTER TABLE Clientes
ADD COLUMN ativo BOOLEAN DEFAULT TRUE;

-- modificar tipo na coluna
ALTER TABLE Clientes
MODIFY COLUMN nome VARCHAR(200) NOT NULL;

-- modificar nome e tipo juntos
ALTER TABLE Clientes
CHANGE COLUMN telefone celular VARCHAR(15) NOT NULL;

-- INSERTS CLIENTES
INSERT INTO Clientes(nome, celular, email, data_nasc, endereco, ativo)
VALUES
('Ana Silva', '14998112233', 'ana@gmail.com', '2000-05-10', 'Rua das Flores, 120', TRUE),
('Carlos Souza', '14997776655', 'carlos@gmail.com', '1998-08-21',  'Av. Brasil, 450', TRUE),
('Mariana Lima', '14996554411', 'mariana@gmail.com', '2001-11-15', 'Rua Central, 89', TRUE),
('João Pedro', '14998887766','joao@gmail.com', '1999-03-02', 'Rua Afonso Pena, 300', FALSE),
('Fernanda Alves', '14995553322','fernanda@gmail.com',  '2002-07-19', 'Av. Paulista, 1000', TRUE);

-- INSERTS PEDIDOS
INSERT INTO Pedidos(id_cliente, produto, data_pedido)
VALUES
(6, 'Notebook Gamer', '2026-05-01'),
(7, 'Mouse Sem Fio', '2026-05-02'),
(9, 'Teclado Mecânico', '2026-05-03'),
(10, 'Monitor 24 Polegadas', '2026-05-04'),
(8, 'Headset Gamer', '2026-05-05');

-- AS
SELECT nome, celular, id_cliente AS cadastro
FROM Clientes;