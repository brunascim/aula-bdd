CREATE DATABASE 04102_Padaria_Bruna;
USE 04102_Padaria_Bruna;
SHOW DATABASES;
SELECT * FROM produtos, vendas; 

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

-- Listar todos os produtos cadastrados 
SELECT * FROM produtos;

-- Listar total de unidades vendidas por produto SUM
SELECT nome_produtos, SUM(quantidade) AS total_unidades  -- as total unidades é tipo um complemento antes da resposta
FROM vendas 
GROUP BY nome_produtos; 

-- Listar o total de vendas do Bolo de fubá
SELECT SUM(valor) AS total_vendas
FROM vendas
WHERE nome_produtos = 'Bolo de Fubá';

-- Listar o total de vendas do Bolo de Chocolate
SELECT SUM(valor) AS total_vendas
FROM vendas 
WHERE nome_produtos = 'Bolo de Chocolate';

-- Produtos vendidos em 2025-06-03
SELECT nome_produtos, quantidade, valor
FROM vendas
WHERE data_venda = '2025-06-03'


-- 1 quais produtos tem preço acima de 5?
-- 2 quais produtos possuem a palavra ''Bolo'' no nome?
-- 3 quais produtos tem menos de 20 unidades no estoque?






