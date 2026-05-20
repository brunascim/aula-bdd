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
SELECT DISTINCT cidade 
FROM clientes;

-- 2.2 Mostrar tipos de produtos sem repetir
SELECT DISTINCT tipo 
FROM produtos;

-- 2.3 Mostrar cargos diferentes dos funcionários
SELECT DISTINCT cargo 
FROM funcionarios;

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
SELECT cargo, ROUND(AVG(salario),2) AS media_salarial
FROM funcionarios
GROUP BY cargo
HAVING AVG(salario) > 3000;

-- UNION
-- 19.1 Clientes e funcionários em uma única lista
SELECT nome AS clientes_e_funcionarios
FROM clientes
UNION
SELECT nome FROM funcionarios;

-- 19.2 Produtos baratos e produtos com estoque baixo
SELECT nome, preco, 'Barato' AS categoria  
FROM produtos
WHERE preco < 50
UNION
SELECT nome, estoque, 'Baixo estoque' AS categoria
from produtos
WHERE estoque < 10;

-- 19.3 Salario e renda de clientes e funcionários
SELECT nome, renda FROM clientes
UNION
SELECT nome, salario FROM funcionarios;

-- =========================================
-- BETWEEN
-- 20.1 Produtos entre 10 e 20 reais
SELECT * FROM produtos
WHERE preco BETWEEN 10 AND 20;

-- 20.2 Clientes com renda entre 3000 e 5000
SELECT * FROM clientes
WHERE renda BETWEEN 3000 AND 5000;

-- 20.3 Vendas entre julho e agosto
SELECT * FROM vendas
WHERE data_venda BETWEEN '2025-07-01' AND '2025-08-31';

-- =========================================
-- LIKE
-- 21.1 Produtos que começam com Pão
SELECT * FROM produtos 
WHERE nome LIKE 'Pão%';

-- 21.2 Clientes que terminam com Silva
SELECT * FROM clientes
WHERE nome LIKE '%Silva';

-- 21.3 Funcionários que possuem a letra A no nome
SELECT nome FROM clientes
WHERE nome LIKE '%A%';

-- =========================================
-- NULL / NOT NULL
-- 22.1 Clientes com telefone preenchido
SELECT * FROM clientes
WHERE telefone IS NOT NULL;

-- 22.2 Produtos com estoque preenchido
SELECT * FROM produtos
WHERE estoque IS NOT NULL;

-- 22.3 Funcionários com cargo preenchido
SELECT * FROM funcionarios
WHERE cargo IS NOT NULL;


-- =========================================
-- ORDER BY
-- 23.1 Produtos do mais caro para o mais barato
SELECT * FROM produtos
ORDER BY preco DESC;

-- 23.2 Clientes por nome
SELECT * FROM clientes
ORDER BY nome ASC;

-- 23.3 Funcionários por salário
SELECT * FROM funcionarios
ORDER BY salario DESC;

-- =========================================
-- TRIM
-- 24.1 Remover espaços dos clientes
SELECT TRIM(nome) AS nome_limpo
FROM clientes;

-- 24.2 Remover espaços dos produtos
SELECT TRIM(nome) AS produto_limpo
FROM produtos;

-- 24.3 Remover espaços dos cargos
SELECT TRIM(cargo) AS cargo_limpo
FROM funcionarios;

-- =========================================
-- REPLACE
-- 25.1 Trocar "Pão" por "Padaria"
SELECT nome, REPLACE(nome, 'Pão', 'Padaria') AS nome_novo
FROM produtos;

-- 25.2 Trocar "Chocolate" por "Choco"
SELECT nome, REPLACE(nome, 'Chocolate','Choco') AS nome_novo
FROM produtos;

-- 25.3 Trocar "Gerente" por "Supervisor"
SELECT nome, REPLACE(cargo, 'Gerente', 'Supervisor') AS nome_novo
FROM funcionarios;

-- =========================================
-- SUBSTRING
-- 26.1 Primeiras 4 letras dos clientes
SELECT SUBSTRING(nome, 1, 4) AS 4_letras
FROM clientes;

-- 26.2 Últimos 5 caracteres dos produtos
SELECT SUBSTRING(nome, -5) AS ultimos_5
FROM clientes;

-- 26.3 Mostrar mês das vendas
SELECT SUBSTRING(data_venda, 6, 2) AS mes_vendas
FROM vendas;

-- =========================================
-- UPPER
-- 27.1 Produtos em maiúsculo
SELECT UPPER(nome) AS produtos_maiusculos
FROM produtos;

SELECT LOWER(nome) AS produtos_minusculos
FROM produtos;

-- 27.2 Clientes em maiúsculo
SELECT UPPER(nome) AS nomes_maiusculos
FROM clientes;

SELECT LOWER(nome) AS nomes_minusculos
FROM clientes;

-- 27.3 Funcionários e cargos em maiúsculo
SELECT UPPER(nome), UPPER(cargo) 
FROM funcionarios;


-- =========================================
-- LENGTH
-- 28.1 Produtos com nomes longos
SELECT nome, LENGTH(nome) AS nome_longo
FROM produtos
ORDER BY nome_longo DESC;

-- 28.2 Clientes com nome acima de 10 letras
SELECT nome, LENGTH(nome) AS nome_longo
FROM clientes
WHERE LENGTH(nome) > 10;

-- 28.3 Mostrar tamanho dos cargos
SELECT cargo, LENGTH(cargo) AS tamanho_cargo
FROM funcionarios;

-- =========================================
-- CAST
-- 29.1 Converter preço para inteiro
SELECT nome, CAST(preco AS SIGNED) AS preco_int
FROM produtos;

-- 29.2 Converter salário para inteiro
SELECT nome, CAST(salario AS SIGNED) AS salario_int
FROM funcionarios;

-- 29.3 Converter data da venda para texto
SELECT data_venda, CAST(data_venda AS CHAR) AS data_texto
FROM vendas;

-- =========================================
-- CONCAT
-- 30.1 Produto e preço
SELECT CONCAT(nome, ' - Custa R$ ', preco) AS nome_preco
FROM produtos;

-- 30.2 Cliente e cidade
SELECT CONCAT(nome, ' - ', cidade) AS cliente_cidade
FROM clientes;

-- 30.3 Funcionário e cargo
SELECT CONCAT(nome, ' - ', cargo) AS funcionario_cargo
FROM funcionarios;

-- =========================================
-- CASE WHEN
-- 31.1 Classificar produtos
SELECT nome, preco,
	CASE 
		WHEN preco < 50 THEN 'Barato'
        WHEN preco BETWEEN 50 AND 100 THEN 'Médio'
        ELSE 'Caro'
    END AS classificacao
FROM produtos;

-- 31.2 Classificar clientes
SELECT nome, renda,
    CASE
        WHEN renda < 2000 THEN 'Baixa renda'
        WHEN renda BETWEEN 2000 AND 5000 THEN 'Média renda'
        ELSE 'Alta renda'
    END AS classificacao
FROM clientes;

-- 31.3 Classificar funcionários
SELECT nome, salario,
    CASE
        WHEN salario < 2000 THEN 'Salário baixo'
        WHEN salario BETWEEN 2000 AND 3000 THEN 'Salário médio'
        ELSE 'Salário alto'
    END AS classificacao
FROM funcionarios;

-- =========================================
-- VIEWS
-- 26.1 View de produtos caros
CREATE VIEW produtos_caros AS
SELECT nome, preco 
FROM produtos
WHERE preco > 10
ORDER BY preco DESC;
-- Mostrar view
SELECT * FROM produtos_caros;

-- 26.2 View de clientes premium
CREATE VIEW clientes_premium AS
SELECT nome, renda, cidade
FROM clientes
WHERE renda > 5000;
-- Mostrar view
SELECT * FROM clientes_premium;

-- 26.3 View completa de vendas
CREATE VIEW vendas_completas AS
SELECT id_venda, quantidade, valor, data_venda
FROM vendas;
-- Mostrar view
SELECT * FROM vendas_completas;


-- ========================================= 
-- TAREFA

-- SELECT
-- 1.1 Produtos com preço acima da média
SELECT nome, preco
FROM produtos
WHERE preco > 
	(SELECT AVG(preco)
    FROM produtos );
    
-- 1.2 Clientes com renda maior que todos os clientes de Curitiba
SELECT nome, renda, cidade
FROM clientes 
WHERE renda >  -- MAIOR
	(SELECT MAX(renda)
    FROM clientes 
    WHERE cidade = 'Curitiba');
    
-- 1.3 Funcionários com salário menor que a média dos gerentes
SELECT nome, salario, cargo
FROM funcionarios
WHERE salario <  -- MENOR
	(SELECT AVG(salario) 
    FROM funcionarios
    WHERE cargo = 'Gerente');

-- =========================================
-- DISTINCT
-- 2.1 Tipos diferentes de produtos com estoque acima de 20
SELECT DISTINCT estoque
FROM produtos
WHERE estoque > 20;

-- 2.2 Cidades diferentes de clientes com renda acima de 5000
SELECT DISTINCT cidade
FROM clientes 
WHERE renda > 5000; 

-- 2.3 Cargos diferentes dos funcionários casados
SELECT DISTINCT cargo 
FROM funcionarios 
WHERE estado_civil = 'Casado';

-- =========================================
-- WHERE
-- 3.1 Produtos entre 10 e 20 reais com estoque acima de 15
SELECT * FROM produtos
WHERE preco BETWEEN 10 AND 20
AND estoque > 15;

-- 3.2 Clientes femininos de São Paulo com renda acima de 4000
SELECT * FROM clientes
WHERE genero = 'Feminino'
AND cidade = 'São Paulo'
AND renda > 4000;

-- 3.3 Funcionários solteiros com salário maior que 3000
SELECT * FROM funcionarios
WHERE estado_civil = 'Solteiro'
AND salario > 3000;


-- =========================================
-- LIMIT + ORDER BY
-- 4.1 Os 5 produtos mais caros
SELECT * FROM produtos
ORDER BY preco DESC
LIMIT 5;

-- 4.2 Os 3 clientes com maior renda
SELECT * FROM clientes
ORDER BY renda DESC
LIMIT 3;

-- 4.3 Os 2 funcionários mais antigos
SELECT * FROM funcionarios
ORDER BY id_funcionario ASC 
LIMIT 2;

-- =========================================
-- AS
-- 5.1 Mostrar produto com preço formatado
SELECT nome AS produto,
       CONCAT('R$ ', preco) AS preco_formatado
FROM produtos;

-- 5.2 Mostrar renda anual dos clientes
SELECT nome, renda * '12' AS renda_anual 
FROM clientes;

-- 5.3 Mostrar salário anual dos funcionários
SELECT nome, salario * '12' AS salario_anual
FROM funcionarios;

-- =========================================
-- AND / OR / NOT
-- 6.1 Produtos baratos ou com estoque alto
SELECT * FROM produtos
WHERE preco < 15
OR estoque > 20;
 
-- 6.2 Clientes que não são do Rio de Janeiro
SELECT * FROM clientes 
WHERE NOT cidade = 'Rio de Janeiro';
-- 
SELECT * FROM clientes
WHERE cidade <> 'Rio de Janeiro';

-- 6.3 Funcionários gerentes ou vendedores com salário acima de 3000
SELECT * FROM funcionarios 
WHERE cargo = 'Gerente' 
OR cargo = 'Vendedor'
AND salario > 3000;

-- =========================================
-- AVG
-- 7.1 Média dos preços dos produtos
SELECT AVG(preco) AS media_produtos
FROM produtos;

-- 7.2 Média da renda dos clientes femininos
SELECT ROUND(AVG(renda),2) AS renda_mulheres
FROM clientes
WHERE genero = 'Feminino';

-- 7.3 Média salarial dos gerentes
SELECT ROUND(AVG(salario),2) AS renda_gerentes
FROM funcionarios
WHERE cargo = 'Gerente';


-- =========================================
-- SUM
-- 8.1 Soma total das vendas
SELECT SUM(quantidade)
FROM vendas;

-- 8.2 Soma das rendas dos clientes de São Paulo
SELECT SUM(renda) 
FROM clientes
WHERE cidade = 'São Paulo';

-- 8.3 Soma dos salários dos funcionários casados
SELECT SUM(salario)
FROM funcionarios 
WHERE estado_civil = 'Casado';

-- =========================================
-- MAX / MIN
-- 9.1 Produto mais caro
SELECT MAX(preco)
FROM produtos;

-- 9.2 Produto mais barato
SELECT MIN(preco)
FROM produtos;

-- 9.3 Maior salário entre funcionarios
SELECT MAX(salario)
FROM funcionarios;

-- =========================================
-- COUNT
-- 10.1 Quantidade de produtos com estoque abaixo de 20
SELECT COUNT(*) AS contagem_produtos
FROM produtos 
WHERE estoque < 20;

-- 10.2 Quantidade de clientes do Rio de Janeiro
SELECT COUNT(*) AS clientes_RJ
FROM clientes
WHERE cidade = 'Rio de Janeiro';

-- 10.3 Quantidade de vendas acima de 50 reais
SELECT COUNT(*) AS qt_vendas
FROM vendas
WHERE valor > 50;

-- =========================================
-- GROUP BY
-- 11.1 Média de preço por tipo
SELECT tipo, ROUND(AVG(preco),2) AS media_preco
FROM produtos
GROUP BY tipo;

-- 11.2 Quantidade de clientes por cidade
SELECT cidade, COUNT(*) AS numero_clientes
FROM clientes
GROUP BY cidade;

-- 11.3 Soma salarial por cargo
SELECT cargo, SUM(salario) AS soma
FROM funcionarios
GROUP BY cargo;

-- =========================================
-- HAVING
-- 12.1 Tipos de produtos com média acima de 15
SELECT ROUND(AVG(preco),2) AS media_produtos
FROM produtos
GROUP BY tipo
HAVING ROUND(AVG(preco),2) > 15;

-- 12.2 Cidades com mais de 5 clientes
SELECT cidade, COUNT(*) AS clientes
FROM clientes
GROUP BY cidade 
HAVING COUNT(*) > 5;

-- 12.3 Cargos com soma salarial acima de 10000
SELECT cargo, SUM(salario) AS soma_salarial
FROM funcionarios
GROUP BY cargo
HAVING soma_salarial > 10000;

-- =========================================
-- UNION
-- 13.1 Clientes e funcionários em uma única lista
SELECT nome FROM clientes
UNION
SELECT nome FROM funcionarios;

-- 13.2 Produtos baratos e produtos com estoque baixo
SELECT nome, preco, 'Barato' AS categoria  
FROM produtos
WHERE preco < 50
UNION
SELECT nome, estoque, 'Baixo estoque' AS categoria
from produtos
WHERE estoque < 10;

-- 13.3 Cidades de clientes e funcionários
-- 19.3 Salario e renda de clientes e funcionários
SELECT nome, renda FROM clientes
UNION
SELECT nome, salario FROM funcionarios;

-- =========================================
-- BETWEEN
-- 14.1 Produtos entre 10 e 20 reais
SELECT * FROM produtos 
WHERE preco BETWEEN 10 AND 20;

-- 14.2 Clientes com renda entre 3000 e 5000
SELECT * FROM clientes
WHERE renda BETWEEN 3000 AND 5000;

-- 14.3 Vendas entre julho e agosto
SELECT * FROM vendas
WHERE data_venda BETWEEN '2025-07-01' AND '2025-08-31';

-- =========================================
-- LIKE
-- 15.1 Produtos que começam com Pão
SELECT * FROM produtos 
WHERE nome LIKE 'Pão%';

-- 15.2 Clientes que terminam com Silva
SELECT * FROM clientes
WHERE nome LIKE '%Silva';

-- 15.3 Funcionários que possuem a letra A no nome
SELECT nome FROM clientes
WHERE nome LIKE '%A%';

-- =========================================
-- NULL / NOT NULL
-- 16.1 Clientes com telefone preenchido
SELECT * FROM clientes
WHERE telefone IS NOT NULL;

-- 16.2 Produtos com estoque preenchido
SELECT * FROM produtos
WHERE estoque IS NOT NULL;

-- 16.3 Funcionários com cargo preenchido
SELECT * FROM funcionarios
WHERE cargo IS NOT NULL;

-- =========================================
-- ORDER BY
-- 17.1 Produtos do mais caro para o mais barato
SELECT * FROM produtos
ORDER BY preco DESC;

-- 17.2 Clientes por nome
SELECT * FROM clientes
ORDER BY nome ASC;

-- 17.3 Funcionários por salário
SELECT * FROM funcionarios
ORDER BY salario DESC;

-- =========================================
-- TRIM
-- 18.1 Remover espaços dos clientes
SELECT TRIM(nome) AS nome_limpo
FROM clientes;

-- 18.2 Remover espaços dos produtos
SELECT TRIM(nome) AS produto_limpo
FROM produtos;

-- 18.3 Remover espaços dos cargos
SELECT TRIM(cargo) AS cargo_limpo
FROM funcionarios;
-- =========================================
-- REPLACE
-- 19.1 Trocar "Pão" por "Padaria"
SELECT nome, REPLACE(nome, 'Pão', 'Padaria') AS nome_novo
FROM produtos;

-- 19.2 Trocar "Chocolate" por "Choco"
SELECT nome, REPLACE(nome, 'Chocolate','Choco') AS nome_novo
FROM produtos;

-- 19.3 Trocar "Gerente" por "Supervisor"
SELECT nome, REPLACE(cargo, 'Gerente', 'Supervisor') AS nome_novo
FROM funcionarios;
-- =========================================
-- SUBSTRING
-- 20.1 Primeiras 4 letras dos clientes
SELECT SUBSTRING(nome, 1, 4) AS 4_letras
FROM clientes;

-- 20.2 Últimos 5 caracteres dos produtos
SELECT SUBSTRING(nome, -5) AS ultimos_5
FROM clientes;

-- 20.3 Mostrar mês das vendas
SELECT SUBSTRING(data_venda, 6, 2) AS mes_vendas
FROM vendas;


-- =========================================
-- UPPER
-- 21.1 Produtos em maiúsculo
SELECT UPPER(nome) AS produtos_maiusculos
FROM produtos;

SELECT LOWER(nome) AS produtos_minusculos
FROM produtos;

-- 21.2 Clientes em maiúsculo
SELECT UPPER(nome) AS nomes_maiusculos
FROM clientes;

SELECT LOWER(nome) AS nomes_minusculos
FROM clientes;

-- 21.3 Funcionários e cargos em maiúsculo
SELECT UPPER(nome), UPPER(cargo) 
FROM funcionarios;

-- =========================================
-- LENGTH

-- 22.1 Produtos com nomes longos
SELECT nome, LENGTH(nome) AS nome_longo
FROM produtos
ORDER BY nome_longo DESC;

-- 22.2 Clientes com nome acima de 10 letras
SELECT nome, LENGTH(nome) AS nome_longo
FROM clientes
WHERE LENGTH(nome) > 10;

-- 22.3 Mostrar tamanho dos cargos
SELECT cargo, LENGTH(cargo) AS tamanho_cargo
FROM funcionarios;

-- =========================================
-- CAST
-- 23.1 Converter preço para inteiro
SELECT nome, CAST(preco AS SIGNED) AS preco_int
FROM produtos;

-- 23.2 Converter salário para inteiro
SELECT nome, CAST(salario AS SIGNED) AS salario_int
FROM funcionarios;

-- 23.3 Converter data da venda para texto
SELECT data_venda, CAST(data_venda AS CHAR) AS data_texto
FROM vendas;

-- =========================================
-- CONCAT
-- 24.1 Produto e preço
SELECT CONCAT(nome, ' - Custa R$ ', preco) AS nome_preco
FROM produtos;

-- 24.2 Cliente e cidade
SELECT CONCAT(nome, ' - ', cidade) AS cliente_cidade
FROM clientes;

-- 24.3 Funcionário e cargo
SELECT CONCAT(nome, ' - ', cargo) AS funcionario_cargo
FROM funcionarios;

-- =========================================
-- CASE WHEN
-- 25.1 Classificar produtos
SELECT nome, preco,
	CASE 
		WHEN preco < 50 THEN 'Barato'
        WHEN preco BETWEEN 50 AND 100 THEN 'Médio'
        ELSE 'Caro'
    END AS classificacao
FROM produtos;

-- 25.2 Classificar clientes
SELECT nome, renda,
    CASE
        WHEN renda < 2000 THEN 'Baixa renda'
        WHEN renda BETWEEN 2000 AND 5000 THEN 'Média renda'
        ELSE 'Alta renda'
    END AS classificacao
FROM clientes;

-- 25.3 Classificar funcionários
SELECT nome, salario,
    CASE
        WHEN salario < 2000 THEN 'Salário baixo'
        WHEN salario BETWEEN 2000 AND 3000 THEN 'Salário médio'
        ELSE 'Salário alto'
    END AS classificacao
FROM funcionarios;
-- =========================================
-- VIEWS
-- 26.1 View de produtos caros
CREATE VIEW produtos_caros AS
SELECT nome, preco 
FROM produtos
WHERE preco > 10
ORDER BY preco DESC;
-- Mostrar view
SELECT * FROM produtos_caros;

-- 26.2 View de clientes premium
CREATE VIEW clientes_premium AS
SELECT nome, renda, cidade
FROM clientes
WHERE renda > 5000;
-- Mostrar view
SELECT * FROM clientes_premium;

-- 26.3 View completa de vendas
CREATE VIEW vendas_completas AS
SELECT id_venda, quantidade, valor, data_venda
FROM vendas;
-- Mostrar view
SELECT * FROM vendas_completas;

-- ========================================= NIVEL HARD =========================================

-- =========================================
-- SELECT
-- 1.1 Mostrar os produtos que possuem preço maior que a média geral
SELECT nome, preco 
FROM produtos
WHERE preco > (
	SELECT ROUND(AVG(preco),2)
    FROM produtos
 );

-- 1.2 Mostrar vendas com valor maior que a maior venda do dia 2025-06-03
SELECT * FROM vendas
WHERE valor > (
	SELECT MAX(valor)
    FROM vendas
    WHERE data_venda = '2025-06-03'
    );

-- 1.3 Mostrar produtos que possuem estoque menor que o estoque médio dos produtos do mesmo tipo
SELECT * FROM produtos p1
WHERE estoque < (
    SELECT AVG(estoque)
    FROM produtos p2
    WHERE p1.tipo = p2.tipo
);


-- =========================================
-- DISTINCT
-- 2.1 Mostrar datas diferentes onde houve vendas acima de 40 reais
SELECT DISTINCT data_venda 
FROM vendas 
WHERE valor > 40;

-- 2.2 Mostrar tipos diferentes de produtos com estoque acima de 20
SELECT DISTINCT tipo 
FROM produtos
WHERE estoque > 20;

-- 2.3 Mostrar valores diferentes de vendas maiores que 30
SELECT DISTINCT valor
FROM vendas
WHERE valor > 30;

-- =========================================
-- WHERE
-- 3.1 Mostrar produtos do tipo Doce com estoque menor que 30
SELECT * FROM produtos 
WHERE tipo = 'Doce'
AND estoque > 30;

-- 3.2 Mostrar vendas feitas após o dia 2025-06-03 com valor acima de 50
SELECT * FROM vendas
WHERE data_venda > '2025-06-03'
AND valor > 50;


-- 3.3 Mostrar produtos que não são do tipo Padaria e custam mais de 15 reais
SELECT * FROM produtos
WHERE NOT tipo = 'Padaria' 
AND preco > 15;


-- =========================================
-- LIMIT
-- 4.1 Mostrar os 4 produtos com maior estoque
SELECT * FROM produtos
ORDER BY estoque DESC
LIMIT 4;

-- 4.2 Mostrar as 3 vendas com menor valor
SELECT * FROM vendas
ORDER BY valor ASC
LIMIT 3;

-- 4.3 Mostrar os 5 produtos mais baratos do tipo Padaria
SELECT * FROM produtos
WHERE tipo = 'Padaria'
ORDER BY preco ASC
LIMIT 3;

-- =========================================
-- AS
-- 5.1 Mostrar o dobro do estoque com apelido estoque_dobrado
SELECT nome, estoque * 2 AS estoque_dobrado
FROM produtos;

-- 5.2 Mostrar valor total possível do estoque de cada produto
SELECT nome, preco, estoque, 
		preco * estoque AS valor_total_estoque
FROM produtos;

-- 5.3 Mostrar quantidade vendida com apelido total_itens
SELECT SUM(quantidade) AS total_itens
FROM vendas;

-- =========================================
-- AND / OR / NOT
-- 6.1 Mostrar produtos do tipo Bolo ou Doce com preço acima de 15
SELECT nome, preco, estoque FROM produtos
WHERE (tipo = 'Bolo'
OR tipo = 'Doce')
AND preco > 15;

-- 6.2 Mostrar produtos que não são Bolo e possuem estoque acima de 20
SELECT nome, tipo, estoque FROM produtos
WHERE NOT tipo = 'Bolo'
AND estoque > 20; 

-- 6.3 Mostrar vendas com quantidade maior que 2 ou valor acima de 50
SELECT * FROM vendas
WHERE (quantidade > 2 
OR valor > 50); 

-- =========================================
-- AVG
-- 7.1 Média de preço por tipo
SELECT tipo, ROUND(AVG(preco),2) AS media_tipo
FROM produtos
GROUP BY tipo;

-- 7.2 Média de quantidade vendida por produto
SELECT id_produto,
       ROUND(AVG(quantidade), 2) AS media_qt
FROM vendas
GROUP BY id_produto;

-- 7.3 Média de valor vendido por data
SELECT data_venda, ROUND(AVG(valor),2) AS media_valor
FROM vendas
GROUP BY data_venda;

-- =========================================
-- SUM
-- 8.1 Soma do estoque por tipo
SELECT tipo, SUM(estoque) AS estoque_total
FROM produtos
GROUP BY tipo;

-- 8.2 Soma do valor vendido por produto
SELECT id_produto, SUM(valor) AS valor_vendido
FROM vendas
GROUP BY id_produto;

-- 8.3 Soma das quantidades vendidas por data
SELECT data_venda, SUM(quantidade) AS qt_vendidas
FROM vendas
GROUP BY data_venda;

-- =========================================
-- MAX / MIN
-- 9.1 Produto mais caro de cada tipo
SELECT tipo, MAX(preco) AS produto_mais_caro
FROM produtos
GROUP BY tipo;

-- 9.2 Menor estoque de cada tipo
SELECT tipo, MIN(estoque) AS menor_estoque
FROM produtos
GROUP BY tipo;

-- 9.3 Maior valor de venda por data
SELECT data_venda, MAX(valor) AS maior_venda
FROM vendas
GROUP BY data_venda;

-- =========================================
-- COUNT
-- 10.1 Quantidade de produtos por tipo
SELECT COUNT(quantidade)
FROM produtos
GROUP BY 

-- 10.2 Quantidade de vendas
-- por produto

 

-- 10.3 Quantidade de produtos
-- com estoque abaixo de 20

 

 

-- =========================================
-- GROUP BY

 

-- 11.1 Total vendido por produto

 

-- 11.2 Quantidade total vendida
-- por data

 

-- 11.3 Média de estoque por tipo

 

 

-- =========================================
-- HAVING

 

-- 12.1 Tipos com média de preço
-- acima de 10 reais

 

-- 12.2 Produtos com soma de vendas
-- maior que 50 reais

 

-- 12.3 Datas com mais de 2 vendas

 

 

-- =========================================
-- UNION

 

-- 13.1 Produtos do tipo Bolo
-- e produtos do tipo Doce

 

-- 13.2 Produtos caros e produtos
-- com estoque baixo

 

-- 13.3 Datas com vendas acima
-- de 50 e datas com vendas abaixo de 20

 

 

-- =========================================
-- BETWEEN

 

-- 14.1 Produtos com preço
-- entre 5 e 15

 

-- 14.2 Produtos com estoque
-- entre 10 e 30

 

-- 14.3 Vendas feitas entre
-- 2025-06-03 e 2025-06-05

 

 

-- =========================================
-- LIKE

 

-- 15.1 Produtos com nome
-- terminando em Chocolate

 

-- 15.2 Produtos contendo
-- a palavra Pão

 

-- 15.3 Produtos que começam
-- com a letra C

 

 

-- =========================================
-- NULL / NOT NULL

 

-- 16.1 Produtos com preço preenchido

 

-- 16.2 Vendas com data preenchida

 

-- 16.3 Produtos com estoque preenchido

 

 

-- =========================================
-- ORDER BY

 

-- 17.1 Produtos ordenados
-- do maior estoque para o menor

 

-- 17.2 Produtos ordenados
-- alfabeticamente

 

-- 17.3 Vendas ordenadas
-- por maior valor

 

 

-- =========================================
-- TRIM

 

-- 18.1 Remover espaços
-- do nome dos produtos

 

-- 18.2 Remover espaços
-- do tipo dos produtos

 

-- 18.3 Remover espaços
-- do nome das vendas

 

 

-- =========================================
-- REPLACE

 

-- 19.1 Trocar "Bolo"
-- por "Torta"

 

-- 19.2 Trocar "Pão"
-- por "Padaria"

 

-- 19.3 Trocar "Chocolate"
-- por "Choco"

 

 

-- =========================================
-- SUBSTRING

 

-- 20.1 Primeiras 4 letras
-- dos produtos

 

-- 20.2 Últimas 3 letras
-- dos produtos

 

-- 20.3 Extrair o mês
-- das datas de venda

 

 

-- =========================================
-- UPPER

 

-- 21.1 Produtos em maiúsculo

 

-- 21.2 Tipos em maiúsculo

 

-- 21.3 Produtos vendidos
-- em maiúsculo

 

 

-- =========================================
-- LENGTH

 

-- 22.1 Produtos com nomes
-- maiores que 12 caracteres

 

-- 22.2 Produtos com nomes
-- menores que 8 caracteres

 

-- 22.3 Produtos com tipo
-- maior que 5 letras

 

 

-- =========================================
-- CAST

 

-- 23.1 Converter preço
-- para inteiro

 

-- 23.2 Converter valor
-- das vendas para inteiro

 

-- 23.3 Converter data
-- para texto

 

 

-- =========================================
-- CONCAT

 

-- 24.1 Nome do produto
-- junto com o preço

 

-- 24.2 Produto vendido
-- junto com quantidade

 

-- 24.3 Produto junto com tipo

 

 

-- =========================================
-- CASE WHEN

 

-- 25.1 Classificar produtos
-- pelo estoque

 

-- 25.2 Classificar produtos
-- pelo preço

 

-- 25.3 Classificar vendas
-- pelo valor
