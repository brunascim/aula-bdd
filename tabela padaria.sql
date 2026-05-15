CREATE DATABASE 04102_Padaria_Bruna;
USE 04102_Padaria_Bruna;
SHOW DATABASES;
SELECT * FROM produtos, vendas; 

drop table produtos;
drop table vendas;

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


CREATE TABLE clientes (
 id_cliente INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100),
 cidade VARCHAR(100),
 telefone VARCHAR(20),
 genero VARCHAR(20),
 renda DECIMAL(8,2)
);

CREATE TABLE funcionarios (
 id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100),
 cargo VARCHAR(50),
 salario DECIMAL(8,2),
 estado_civil VARCHAR(30)
);

CREATE TABLE categorias (
 id_categoria INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(50)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(6,2),
    estoque INT,
    tipo VARCHAR(50),
    id_categoria INT,
    FOREIGN KEY (id_categoria)
    REFERENCES categorias(id_categoria)
);

CREATE TABLE vendas (
id_venda INT PRIMARY KEY AUTO_INCREMENT,
id_produto INT,
id_cliente INT,
id_funcionario INT,
quantidade INT,
valor DECIMAL(8,2),
data_venda DATE,
FOREIGN KEY (id_produto)
REFERENCES produtos(id_produto),
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente),
FOREIGN KEY (id_funcionario)
REFERENCES funcionarios(id_funcionario)
);

INSERT INTO categorias (nome) VALUES
('Padaria'),
('Bolo'),
('Doce'),
('Salgado');

INSERT INTO clientes (nome, cidade, telefone, genero, renda) VALUES
('Maria Silva', 'São Paulo', '119999999', 'Feminino', 4500),
('João Costa', 'Curitiba', '419888888', 'Masculino', 3200),
('Ana Souza', 'Rio de Janeiro', '219777777', 'Feminino', 5100),
('Carlos Lima', 'Belo Horizonte', '319666666', 'Masculino', 2800),
('Fernanda Alves', 'São Paulo', '119555555', 'Feminino', 7000),
('Pedro Martins', 'Curitiba', '419444444', 'Masculino', 3900);

INSERT INTO funcionarios (nome, cargo, salario, estado_civil) VALUES
('Juliana Rocha', 'Atendente', 2500, 'Solteira'),
('Ricardo Souza', 'Gerente', 5000, 'Casado'),
('Amanda Lima', 'Caixa', 2800, 'Solteira'),
('Felipe Costa', 'Padeiro', 3500, 'Casado');

INSERT INTO produtos (nome, preco, estoque, tipo, id_categoria) VALUES
('Pão Francês', 2.50, 50, 'Padaria', 1),
('Pão de Queijo', 5.00, 15, 'Padaria', 1),
('Croissant', 8.50, 40, 'Padaria', 1),
('Bolo de Morango', 22.00, 10, 'Bolo', 2),
('Bolo Simples', 6.00, 18, 'Bolo', 2),
('Torta de Frango', 12.00, 25, 'Salgado', 4),
('Pão Integral', 7.50, 12, 'Padaria', 1),
('Cookie', 3.50, 60, 'Doce', 3),
('Pão Doce', 4.50, 35, 'Padaria', 1),
('Pão Australiano', 9.00, 22, 'Padaria', 1),
('Bolo de Limão', 17.00, 14, 'Bolo', 2),
('Bolo de Prestígio', 25.00, 8, 'Bolo', 2),
('Croissant de Chocolate', 11.50, 45, 'Padaria', 1),
('Croissant de Frango', 13.00, 28, 'Padaria', 1),
('Sonho', 6.50, 19, 'Doce', 3),
('Rosquinha', 3.00, 55, 'Doce', 3),
('Torta de Chocolate', 14.00, 16, 'Doce', 3),
('Pão de Batata', 5.50, 18, 'Padaria', 1),
('Empada', 7.00, 32, 'Salgado', 4),
('Cuca de Banana', 15.00, 11, 'Bolo', 2),
('Bolo Red Velvet', 30.00, 6, 'Bolo', 2),
('Muffin', 8.00, 27, 'Doce', 3),
('Pão Caseiro', 10.00, 13, 'Padaria', 1);


INSERT INTO vendas (id_produto, id_cliente, id_funcionario, quantidade, valor, data_venda)
VALUES (1, 1, 1, 10, 25.00, '2025-06-01'),
(4, 2, 2, 1, 22.00, '2025-06-01'),
(3, 3, 1, 2, 17.00, '2025-06-02'),
(6, 4, 3, 3, 36.00, '2025-06-02'),
(12, 5, 2, 1, 25.00, '2025-06-03'),
(8, 6, 4, 5, 17.50, '2025-06-03'),
(14, 1, 1, 2, 26.00, '2025-06-04'),
(20, 2, 3, 1, 15.00, '2025-06-04'),
(21, 3, 2, 1, 30.00, '2025-06-05'),
(18, 4, 4, 4, 22.00, '2025-06-05'),
(11, 5, 2, 2, 34.00, '2025-06-06'),
(2, 6, 1, 6, 30.00, '2025-06-06');

-- SELECT
-- Recupera dados das tabelas
-- 1.1 Mostrar todos os produtos
SELECT * FROM produtos;

-- 1.2 Mostrar nome e preço dos produtos
SELECT nome, preco 
FROM produtos;

-- 1.3 Mostrar todos os clientes
SELECT * FROM clientes;

-- DISTINCT
-- Remove valores repetidos
-- 2.1 Mostrar cidades sem repetir
SELECT DISTINCT cidade FROM clientes;

-- 2.2 Mostrar tipos de produtos sem repetir
SELECT DISTINCT tipo FROM produtos;

-- 2.3 Mostrar cargos diferentes dos funcionários
SELECT DISTINCT cargo FROM funcionarios;

-- WHERE
-- Filtra informações
-- 3.1 Produtos acima de 10 reais
SELECT * FROM produtos
WHERE preco > 10;

-- 3.2 Clientes de São Paulo
SELECT * FROM clientes
WHERE cidade = 'São Paulo';

-- 3.3 Funcionários com salário maior que 3000
SELECT * FROM funcionarios
WHERE salario > 3000;

-- BETWEEN
-- Busca valores dentro de um intervalo
-- 4.1 Produtos entre 5 e 15 reais
SELECT * FROM produtos
WHERE preco BETWEEN 5 AND 15;

-- 4.2 Clientes com renda entre 3000 e 6000
SELECT * FROM clientes
WHERE renda BETWEEN 3000 AND 6000;

-- 4.3 Vendas feitas entre dois dias
SELECT * FROM vendas
WHERE data_venda BETWEEN '2025-06-04' AND '2025-06-06';

-- LIKE
-- Procura padrões em textos
-- 5.1 Produtos com a palavra "Bolo"
SELECT * FROM produtos 
WHERE nome LIKE '%Bolo%';

-- 5.2 Clientes que começam com Maria
SELECT * FROM clientes 
WHERE nome LIKE 'Maria%';

-- 5.3 Produtos que terminam com "Chocolate"
SELECT * FROM produtos 
WHERE nome LIKE '%Chocolate';

-- LIMIT
-- Limita quantidade de resultados
-- 6.1 Mostrar os 5 primeiros produtos
SELECT * FROM produtos
LIMIT 5;

-- 6.2 Mostrar os 3 produtos mais caros
SELECT * FROM produtos
ORDER BY preco DESC
LIMIT 3;

-- 6.3 Mostrar os 2 clientes com maior renda
SELECT * FROM clientes
ORDER BY renda DESC
LIMIT 2;

-- ORDER BY
-- Ordena resultados
-- 7.1 Produtos do mais barato para o mais caro
SELECT * FROM produtos
ORDER BY preco ASC;

-- 7.2 Clientes em ordem alfabética
SELECT * FROM clientes
ORDER BY nome ASC;

-- 7.3 Funcionários do maior para o menor salário
SELECT * FROM funcionarios
ORDER BY salario DESC;

-- AS
-- Cria apelidos para colunas
-- 8.1 Renomear coluna preco
SELECT preco AS precinho
FROM produtos;

-- 8.2 Renomear coluna salario
SELECT salario AS pagamento
FROM funcionarios;

-- 8.3 Mostrar renda anual dos clientes
SELECT nome, renda * '12' AS renda_anual 
FROM clientes;

-- AND
-- Usa mais de uma condição
-- 9.1 Produtos acima de 10 reais e estoque maior que 20
SELECT * FROM produtos 
WHERE preco > 10
AND estoque > 20; 

-- 9.2 Clientes femininos de São Paulo
SELECT nome, cidade, genero FROM clientes 
WHERE cidade = 'São Paulo'
AND genero = 'Feminino'; 

-- 9.3 Funcionários casados com salário maior que 3000
SELECT * FROM funcionarios
WHERE estado_civil = 'Casado'
AND salario > 3000;

-- OR
-- Retorna resultados com uma condição OU outra
-- 10.1 Clientes de São Paulo ou Curitiba
SELECT * FROM clientes
WHERE cidade = 'São Paulo'
OR cidade = 'Curitiba';

-- 10.2 Produtos do tipo Bolo ou Doce
SELECT * FROM produtos
WHERE tipo = 'Bolo'
OR tipo = 'Doce';

-- 10.3 Funcionários que são Gerente ou Caixa
SELECT * FROM funcionarios
WHERE cargo = 'Gerente'
OR cargo = 'Caixa';

-- NOT
-- Exclui condições
-- 11.1 Produtos que não são do tipo Bolo
SELECT * FROM produtos
WHERE NOT tipo = 'Bolo';

-- 11.2 Clientes que não moram no Rio de Janeiro
SELECT * FROM clientes
WHERE NOT cidade = 'Rio de Janeiro';

-- 11.3 Funcionários que não são solteiros
SELECT * FROM funcionarios
WHERE NOT estado_civil = 'Solteiro';

-- AVG
-- Calcula média
-- 12.1 Média dos preços dos produtos
SELECT ROUND(AVG(preco),2) AS media_precos
FROM produtos;

-- 12.2 Média salarial dos funcionários
SELECT ROUND(AVG(salario),2) AS media_salarial
FROM funcionarios;

-- 12.3 Média de renda dos clientes
SELECT ROUND(AVG(renda),2) AS media_renda
FROM clientes;

-- SUM
-- Soma valores
-- 13.1 Soma total das vendas
SELECT SUM(valor) AS total_vendas
FROM vendas;

-- 13.2 Soma da quantidade vendida
SELECT SUM(quantidade) AS total_quantidade
FROM vendas; 

-- 13.3 Soma dos salários dos funcionários
SELECT SUM(salario) AS total_salario
FROM funcionarios;

-- MAX
-- Mostra maior valor
-- 14.1 Produto mais caro
SELECT MAX(preco) AS maior_preco
FROM produtos;

-- 14.2 Maior salário
SELECT MAX(salario) AS maior_salario
FROM funcionarios;

-- 14.3 Maior renda dos clientes
SELECT MAX(renda) AS maior_renda
FROM clientes;

-- MIN
-- Mostra menor valor
-- 15.1 Produto mais barato
SELECT MIN(preco) AS menor_preco
FROM produtos;

-- 15.2 Menor salário
SELECT MIN(salario) AS menor_salario
FROM funcionarios;

-- 15.3 Menor renda dos clientes
SELECT MIN(renda) AS menor_renda
FROM clientes;

-- COUNT
-- Conta registros
-- 16.1 Quantidade de produtos
SELECT COUNT(*) AS quantidade_produtos
FROM produtos;

-- 16.2 Quantidade de clientes
SELECT COUNT(*) AS quantidade_clientes
FROM clientes;

-- 16.3 Quantidade de vendas
SELECT COUNT(*) AS quantidade_vendas
FROM vendas;

-- GROUP BY
-- Agrupa informações
-- 17.1 Quantidade de produtos por tipo
SELECT tipo, COUNT(*) AS quantidade
FROM produtos
GROUP BY tipo;

-- 17.2 Média salarial por cargo
SELECT cargo, ROUND(AVG(salario),2) AS media_salarial
FROM funcionarios
GROUP BY cargo;

-- 17.3 Total vendido por produto
SELECT id_produto, SUM(quantidade) AS total_vendido
FROM vendas
GROUP BY id_produto;

-- HAVING
-- Filtra grupos
-- 18.1 Tipos com mais de 5 produtos
SELECT tipo, COUNT(*) AS quantidade
FROM produtos
GROUP BY tipo
HAVING COUNT(*) > 5;

-- 18.2 Produtos vendidos mais de 3 vezes
SELECT id_produto, SUM(quantidade) AS total_vendido
FROM vendas
GROUP BY id_produto
HAVING SUM(quantidade) > 3;

-- 18.3 Cargos com média salarial maior que 3000
SELECT cargo, AVG(salario) AS media_salarial
FROM funcionarios
GROUP BY cargo
HAVING AVG(salario) > 3000;




