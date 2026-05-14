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

-- SELECT é usado para recuperar dados de uma tabela
-- SINTAXE BÁSICA: SELECT coluna FROM tabela
	-- 1.1 Selecionar todos os produtos e depois vendas.
SELECT * FROM produtos;
SELECT * FROM vendas;

	-- 1.2 Selecionar apenas nome e valor dos produtos.
SELECT nome_produtos, preco FROM produtos;

	-- 1.3 Selecionar produtos com o tipo "Padaria"
SELECT * FROM produtos 
WHERE tipo = 'Padaria';

	-- 1.4 Selecionar apenas nome e estoque dos produtos
SELECT nome_produtos, estoque
FROM produtos;

-- DISTINCT remove duplicatas e retorna apenas valores únicos
-- Útil para identificar categorias diferentes ou valores distintos
-- SINTAXE BÁSICA: SELECT DISTINCT coluna FROM tabela
	-- 2.1 Preços distintos dos produtos
SELECT  DISTINCT preco FROM produtos;

	-- 2.2 Combinação única de nome e estoque
SELECT DISTINCT nome_produtos, estoque FROM produtos;

	-- 2.3 id e produtos 
SELECT DISTINCT id, nome_produtos FROM produtos;

	-- 2.4 Tipos de produtos sem repetir
SELECT DISTINCT tipo
FROM produtos;

-- WHERE filtra registros baseado em condições específicas
-- Pode usar com operadores: =, <>, <, >, <=, >=, LIKE, IN, BETWEEN
-- SINTAXE BÁSICA: SELECT coluna FROM tabela WHERE = 'Condicao'
	-- 3.1 Todos os doces
SELECT * FROM produtos 
WHERE tipo = 'Doce';
	-- 3.2 Todos os salgados
SELECT * FROM produtos 
WHERE tipo = 'Salgado';
	-- 3.3 Todos os tipos "padaria"
SELECT * FROM produtos 
WHERE tipo = 'Padaria';
	-- 3.4 Produtos entre 5 e 18 reais
SELECT * FROM produtos 
WHERE preco BETWEEN 5 AND 18;
	-- 3.5 Produtos com estoque maior que 20
SELECT * FROM produtos
WHERE estoque > 20;

-- LIMIT restringue o número de registro retornados
-- Útil para paginação ou vizualização rápida
-- SINTAXE BÁSICA: SELECT coluna FROM tabela LIMIT 1
	-- 4.1 nome e preco dos primeiros 7 produtos
SELECT nome_produtos, preco 
FROM produtos 
LIMIT 7;

	-- 4.2 8 produtos com a maior quantidade de estoque
SELECT nome_produtos, estoque
FROM produtos 
ORDER BY estoque DESC
LIMIT 8;

	-- 4.3 4 vendas mais caras
SELECT nome_produtos, valor
FROM vendas
ORDER BY valor DESC
LIMIT 4;

	-- 4.4 3 produtos mais baratos
SELECT nome_produtos, preco
FROM produtos
ORDER BY preco ASC
LIMIT 3;

	-- 4.5 Mostrar apenas as 2 primeiras vendas
SELECT *
FROM vendas
LIMIT 2;

-- AS dá nomes temporários a coluna ou tabelas
-- SINTAXE BÁSICA: 
-- Melhora a legibilidade dos resultados
	-- 5.1 Renomear coluna nome_produtos para nome
SELECT nome_produtos AS nome
FROM produtos;

	-- 5.2 Apelido para data_venda
SELECT data_venda AS date
FROM vendas;

	-- 5.3 Apelido para cálculo
SELECT SUM(estoque) AS unidades 
FROM produtos
WHERE nome_produtos = 'pão francês';

	-- 5.4 Renomear coluna preco para valor_produto
SELECT preco AS valor_produto
FROM produtos;

