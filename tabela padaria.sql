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
WHERE data_venda = '2025-06-03';

ALTER TABLE produtos
ADD COLUMN estoque FLOAT,
ADD COLUMN tipo VARCHAR(20);

INSERT INTO produtos (nome_produtos, preco, estoque, tipo) VALUES
('Pão Francês', 2.50, 50, 'Padaria'),
('Pão de Queijo', 5.00, 15, 'Padaria'),
('Croissant', 8.50, 40, 'Padaria'),
('Bolo de Morango', 22.00, 10, 'Bolo'),
('Bolo Simples', 6.00, 18, 'Bolo'),
('Torta de Frango', 12.00, 25, 'Salgado'),
('Pão Integral', 7.50, 12, 'Padaria'),
('Cookie', 3.50, 60, 'Doce'),
('Pão Doce', 4.50, 35, 'Padaria'),
('Pão Australiano', 9.00, 22, 'Padaria'),
('Bolo de Limão', 17.00, 14, 'Bolo'),
('Bolo de Prestígio', 25.00, 8, 'Bolo'),
('Croissant de Chocolate', 11.50, 45, 'Padaria'),
('Croissant de Frango', 13.00, 28, 'Padaria'),
('Sonho', 6.50, 19, 'Doce'),
('Rosquinha', 3.00, 55, 'Doce'),
('Torta de Chocolate', 14.00, 16, 'Doce'),
('Pão de Batata', 5.50, 18, 'Padaria'),
('Empada', 7.00, 32, 'Salgado'),
('Cuca de Banana', 15.00, 11, 'Bolo'),
('Bolo Red Velvet', 30.00, 6, 'Bolo'),
('Muffin', 8.00, 27, 'Doce'),
('Pão Caseiro', 10.00, 13, 'Padaria');

-- quais produtos tem preço acima de 5?
SELECT nome_produtos, preco 
FROM produtos
WHERE preco > 5;

-- quais produtos possuem a palavra ''Bolo'' no nome?
SELECT nome_produtos
FROM produtos
WHERE nome_produtos LIKE 'Bolo%';

-- quais produtos tem menos de 20 unidades no estoque?
SELECT nome_produtos, estoque
FROM produtos
WHERE estoque < 20;

-- quais produtos custam entre 3 e 10?
SELECT nome_produtos, preco
FROM produtos
WHERE preco BETWEEN 3 AND 10;

-- quais produtos tem nome que começa com ''Pão''?
SELECT nome_produtos
FROM produtos
WHERE nome_produtos LIKE 'Pão%';

-- qual é o comando para encontrar produtos com nome "Croissant'' e que tenham mais de 30 unidades no estoque?
SELECT nome_produtos, estoque
FROM produtos 
WHERE nome_produtos = 'Croissant'
HAVING estoque > 30; -- da pra usar o AND ao inves do HAVING

INSERT INTO produtos (nome_produtos, preco, estoque, tipo) VALUES
('Brigadeiro', 4.00, 30, 'Doce'),
('Pudim', 12.00, 10, 'Doce'),
('Esfiha', 6.50, 20, 'Salgado'),
('Pão de Leite', 5.00, 25, 'Padaria');

UPDATE produtos
SET preco = 13.50,
    estoque = 15
WHERE id = 29; -- pudim

DELETE FROM produtos
WHERE id = 30; -- esfiha

SELECT COUNT(*) AS total_vendas 
FROM produtos;

UPDATE produtos -- bolo de fubá
SET preco = 13.00
WHERE id = 1;

UPDATE produtos
SET estoque = 8,
	tipo = 'Bolo'
WHERE id = 1;

UPDATE produtos
SET estoque = 10,
	tipo = 'Bolo'
WHERE id = 2;

UPDATE produtos
SET estoque = 12,
	tipo = 'Bolo'
WHERE id = 3;


UPDATE produtos
SET estoque = 7,
	tipo = 'Bolo'
WHERE id = 4;





