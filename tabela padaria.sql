CREATE DATABASE 04102_Padaria_Bruna;
USE 04102_Padaria_Bruna;
SHOW DATABASES;

drop database 04102_Padaria_Bruna;

CREATE TABLE produtos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produtos VARCHAR(100),
    preco DECIMAL(4,2)
);

CREATE TABLE vendas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produtos VARCHAR(100),
    quantidade TINYINT,
    valor DECIMAL(4,2),
    data_venda DATE
);

INSERT INTO produtos(nome_produtos, preco) VALUES
('Bolo de Fubá', 15.00),
('Bolo de Chocolate', 20.00),
('Bolo de Cenoura', 18.00),
('Bolo de Milho', 16.00);

INSERT INTO vendas(nome_produtos, quantidade, valor, data_venda) VALUES
('Bolo de Fubá', 2, 30.00, '2025-06-03'),
('Bolo de Chocolate', 1, 20.00, '2025-06-03'),
('Bolo de Cenoura', 3, 54.00, '2025-06-04'),
('Bolo de Fubá', 1, 15.00, '2025-06-04'),
('Bolo de Chocolate', 2, 40.00, '2025-06-05'),
('Bolo de Milho', 4, 64.00, '2025-06-03');