CREATE DATABASE 04102_Operadores_Bruna;
USE 04102_Operadores_Bruna;
SHOW databases;

CREATE TABLE funcionarios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50),
salario decimal(6,2)
);

INSERT INTO funcionarios (nome, email, salario) VALUES
('Ana', 'ana@email.com', 1000.00),
('José', 'jose@email.com', 1200.00),
('João', 'joao@email.com', 1500.00);

CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50)
);

INSERT INTO clientes (nome, email) VALUES
('Ana', 'ana@email.com'),
('Paulo', 'paulo@email.com'),
('Gabriel', 'gabriel@email.com');
