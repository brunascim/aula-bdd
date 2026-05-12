CREATE DATABASE 04102_vendas_Bruna; 
USE 04102_vendas_Bruna; 
SELECT * FROM vendas_corporativas;

CREATE TABLE vendas_corporativas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100),
    produto VARCHAR(100),
    categoria VARCHAR(50),
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    data_venda DATE
);

INSERT INTO vendas_corporativas (cliente,produto,categoria,quantidade,preco_unitario,data_venda) VALUES
('Alfa Logística', 'Servidor Dell PowerEdge', 'Hardware', 2, 14500.00, '2025-07-01'),
('Beta Telecom', 'Licença Microsoft 365', 'Software', 30, 450.00, '2025-07-01'),
('Gama Engenharia', 'Serviço de Backup em Nuvem', 'Serviço', 12, 800.00, '2025-07-02'),
('Delta Financeira', 'Firewall Fortinet', 'Hardware', 1, 9800.00, '2025-07-02'),
('Epsilon Saúde', 'Servidor Dell PowerEdge', 'Hardware', 1, 14500.00, '2025-07-03'),
('Zeta Consultoria', 'Consultoria em Segurança', 'Serviço', 5, 1200.00, '2025-07-03'),
('Omega Energia', 'Licença Microsoft 365', 'Software', 50, 450.00, '2025-07-04'),
('Sigma Transportes', 'Notebook Lenovo ThinkPad', 'Hardware', 8, 5200.00, '2025-07-04'),
('Theta Seguros', 'Serviço de Backup em Nuvem', 'Serviço', 20, 800.00, '2025-07-05'),
('Lambda Alimentos', 'Firewall Fortinet', 'Hardware', 2, 9800.00, '2025-07-05'),
('Beta Telecom', 'Servidor Dell PowerEdge', 'Hardware', 1, 14500.00, '2025-07-06'),
('Gama Engenharia', 'Notebook Lenovo ThinkPad', 'Hardware', 3, 5200.00, '2025-07-06'),
('Epsilon Saúde', 'Licença Microsoft 365', 'Software', 20, 450.00, '2025-07-07'),
('Delta Financeira', 'Consultoria em Segurança', 'Serviço', 8, 1200.00, '2025-07-07'),
('Sigma Transportes', 'Serviço de Backup em Nuvem', 'Serviço', 10, 800.00, '2025-07-08'),
('Theta Seguros', 'Notebook Lenovo ThinkPad', 'Hardware', 4, 5200.00, '2025-07-08'),
('Lambda Alimentos', 'Licença Microsoft 365', 'Software', 15, 450.00, '2025-07-08'),
('Omega Energia', 'Consultoria em Segurança', 'Serviço', 6, 1200.00, '2025-07-09'),
('Alfa Logística', 'Firewall Fortinet', 'Hardware', 1, 9800.00, '2025-07-09'),
('Zeta Consultoria', 'Notebook Lenovo ThinkPad', 'Hardware', 2, 5200.00, '2025-07-10');

-- 1) Contagem de registros de venda
SELECT COUNT(*) AS total_vendas 
FROM vendas_corporativas;

-- 2) Soma de unidades vendidas
SELECT SUM(quantidade) AS total_unidades
FROM vendas_corporativas;

-- 3) Cálculo do faturamento total (quantidade * preço)
SELECT SUM(quantidade * preco_unitario) AS Faturamento_total
FROM vendas_corporativas;

-- 4) Cálculo do preço médio unitário -- AVG (media) -- ROUND(arredondar)
SELECT ROUND(AVG (preco_unitario), 2) AS preco_medio
FROM vendas_corporativas;

-- 5) Identificação do maior e menor preço unitário -- MAX --MIN
SELECT MAX(preco_unitario) AS maior_preco,
	   MIN(preco_unitario) AS menor_preco
FROM vendas_corporativas;

-- 6) Faturamento do produto específico "Servidor Dell PowerEdge"
SELECT SUM(quantidade * preco_unitario) AS faturamento 
FROM vendas_corporativas
WHERE produto = 'Servidor Dell PowerEdge';

-- 7) Soma de unidades vendidas por categoria "Hardware"
SELECT SUM(quantidade) AS unidades 
FROM vendas_corporativas
WHERE categoria = 'Hardware';

-- 8) Listagem de vendas com faturamento individual acima de R$10.000,00
SELECT cliente, produto, quantidade, preco_unitario, (quantidade * preco_unitario) AS faturamento
FROM vendas_corporativas
WHERE (quantidade * preco_unitario) > 10000;

-- 9) Faturamento total em intervalo de datas 01 de julho de 2025 e 05 de julho de 2025
SELECT SUM(quantidade * preco_unitario) AS faturamento_total
FROM vendas_corporativas
WHERE data_venda BETWEEN '2025-07-01' AND '2025-07-05'; -- BETWEEN (ENTRE) -- AND(E)

-- 10) Soma de unidades vendidas por cliente específico "Beta Telecom"
SELECT SUM(quantidade) AS unidades_vendidas
FROM vendas_corporativas
WHERE cliente = 'Beta Telecom';

-- 11) Listagem de produtos com preço unitário acima de R$5.000,00 sem repetições --DISTINCT = distinguir 
SELECT DISTINCT produto, preco_unitario 
FROM vendas_corporativas
WHERE preco_unitario > 5000;

-- 12) Soma de unidades vendidas por produto
SELECT produto, SUM(quantidade) AS total_unidade
FROM vendas_corporativas
GROUP BY produto
ORDER BY total_unidade DESC;
-- GROUP BY = agrupa por
-- ORDER BY = ordena por

-- 13) Cálculo de faturamento por categoria
SELECT categoria, SUM(quantidade * preco_unitario) AS faturamento
FROM vendas_corporativas
GROUP BY categoria
ORDER BY faturamento ASC;

-- 14) Listagem de clientes com faturamento acima de R$30.000,00
SELECT cliente, SUM(quantidade * preco_unitario) AS faturamento
FROM vendas_corporativas
GROUP BY cliente
HAVING faturamento > 30000
ORDER BY faturamento ASC;
-- HAVING = tem

-- 15) Produto mais vendido em unidades
SELECT produto, SUM(quantidade) AS quantidade_vendas
FROM vendas_corporativas
GROUP BY produto
ORDER BY quantidade_vendas DESC
LIMIT 1; 
-- LIMIT = limita 

-- 16) Cálculo da média de preço unitário por categoria
SELECT categoria, ROUND(AVG(quantidade * preco_unitario),2) AS preco_unitario
FROM vendas_corporativas
GROUP BY categoria
ORDER BY preco_unitario DESC;

-- 17) Identificação do cliente com menor faturamento
SELECT cliente, SUM(quantidade * preco_unitario) AS menor_faturamento
FROM vendas_corporativas
GROUP BY cliente
ORDER BY menor_faturamento ASC
LIMIT 1;

-- 18) Contagem de clientes distintos
SELECT COUNT(DISTINCT cliente) AS cliente_distintos
FROM vendas_corporativas;

-- 19) Média de faturamento por venda
SELECT ROUND(AVG(quantidade * preco_unitario),2) AS media_faturamento
FROM vendas_corporativas;

-- 20) Listagem de produtos com unidades totais vendidas entre 10 e 20
SELECT produto, SUM(quantidade) AS unidades_totais
FROM vendas_corporativas
GROUP BY produto
HAVING SUM(quantidade) BETWEEN 10 AND 20;
