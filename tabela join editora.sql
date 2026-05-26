 CREATE DATABASE DB_Bruna_Join_Editora;
 USE DB_Bruna_Join_Editora;
 
 CREATE TABLE livros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    categoria SET(
        'Ficção',
        'Não-ficção',
        'Romance',
        'Terror',
        'Ficção Cientifica'
    ) DEFAULT 'Não-ficção'
);

CREATE TABLE editoras (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

DESCRIBE livros;

-- Tabela associativa N:N
CREATE TABLE livros_editoras (
    id_livro INT NOT NULL,
    id_editora INT NOT NULL,
    preco DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (id_livro, id_editora),
    FOREIGN KEY (id_livro) REFERENCES livros(id),
    FOREIGN KEY (id_editora) REFERENCES editoras(id)
);

INSERT INTO livros (titulo, categoria) VALUES
('1984', 'Ficção,Ficção Cientifica'),
('Dom Casmurro', 'Romance,Ficção'),
('O Iluminado', 'Terror,Ficção'),
('Sapiens: Uma Breve História da Humanidade', 'Não-ficção'),
('Duna', 'Ficção Cientifica,Ficção');

INSERT INTO editoras (nome) VALUES
('Companhia das Letras'),
('Editora Rocco'),
('HarperCollins'),
('Intrínseca'),
('Editora Record'),
('Penguin Random House'),
('Sextante'),
('Aleph'),
('DarkSide Books'),
('Nova Fronteira');

INSERT INTO livros_editoras (id_livro, id_editora, preco) VALUES
-- Livro 1 (1984)
(1, 2, 39.90),
(1, 5, 42.50),
(1, 6, 37.00),

-- Livro 2 (Dom Casmurro)
(2, 1, 29.90),
(2, 4, 31.50),

-- Livro 3 (O Iluminado)
(3, 9, 45.00),
(3, 3, 41.90),

-- Livro 4 (Sapiens)
(4, 7, 55.00),
(4, 1, 52.90),

-- Livro 5 (Duna)
(5, 8, 64.90),
(5, 6, 61.50),
(5, 9, 66.00);

SELECT * FROM livros_editoras;

-- Visualizar livros e editoras
SELECT
    l.titulo AS livro,
    e.nome AS editora,
    le.preco
FROM livros_editoras le
INNER JOIN livros l ON le.id_livro = l.id
INNER JOIN editoras e ON le.id_editora = e.id;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

INSERT INTO clientes (nome) VALUES
('Ana Silva'),
('Bruno Costa'),
('Carla Mendes'),
('Diego Oliveira'),
('Fernanda Souza'),
('Gabriel Lima'),
('Helena Martins'),
('Igor Ferreira'),
('Juliana Rocha'),
('Lucas Almeida');

CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_livro INT NOT NULL,
    id_editora INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_livro) REFERENCES livros(id),
    FOREIGN KEY (id_editora) REFERENCES editoras(id)
);

INSERT INTO pedidos (id_cliente, id_livro, id_editora, quantidade) VALUES
(1, 1, 5, 3),
(3, 3, 3, 1),
(1, 3, 3, 2),
(8, 5, 9, 4),
(4, 1, 6, 5);

-- Pedidos completos
SELECT
    c.nome AS cliente,
    l.titulo AS livro,
    e.nome AS editora,
    p.quantidade
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id
INNER JOIN editoras e ON p.id_editora = e.id
INNER JOIN livros l ON p.id_livro = l.id;

-- Pedidos com valor total
SELECT
    c.nome AS cliente,
    l.titulo AS livro,
    e.nome AS editora,
    p.quantidade,
    (p.quantidade * le.preco) AS total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id
JOIN livros l ON p.id_livro = l.id
JOIN editoras e ON p.id_editora = e.id
JOIN livros_editoras le
    ON p.id_livro = le.id_livro
    AND p.id_editora = le.id_editora;

-- Livros sem editoras
INSERT INTO livros (titulo, categoria) VALUES
('O Hobbit', 'Ficção'),
('Clean Code', 'Não-ficção'),
('It: A Coisa', 'Terror');

-- Editoras sem livros
INSERT INTO editoras (nome) VALUES
('Editora Fantasma'),
('Livros Perdidos LTDA');

-- Clientes sem pedidos
INSERT INTO clientes (nome) VALUES
('Mariana Santos'),
('Pedro Henrique'),
('Tatiane Vieira');

-- ANTI JOIN
-- Clientes sem pedidos
SELECT c.*
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
WHERE p.id IS NULL;

-- Livros nunca vendidos
SELECT l.titulo
FROM livros l
LEFT JOIN pedidos p ON l.id = p.id_livro
WHERE p.id_livro IS NULL;

-- Editoras nunca vendidas
SELECT e.nome
FROM editoras e
LEFT JOIN pedidos p ON e.id = p.id_editora
WHERE p.id_editora IS NULL;

-- Todos os pedidos com preço e total
SELECT
    c.nome AS cliente,
    l.titulo,
    e.nome AS editora,
    p.quantidade,
    le.preco,
    (p.quantidade * le.preco) AS total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id
JOIN editoras e ON p.id_editora = e.id
JOIN livros l ON p.id_livro = l.id
JOIN livros_editoras le
    ON p.id_livro = le.id_livro
    AND p.id_editora = le.id_editora;

-- Removendo Foreign Keys
ALTER TABLE pedidos DROP FOREIGN KEY pedidos_ibfk_1;
ALTER TABLE pedidos DROP FOREIGN KEY pedidos_ibfk_2;
ALTER TABLE pedidos DROP FOREIGN KEY pedidos_ibfk_3;

ALTER TABLE livros_editoras DROP FOREIGN KEY livros_editoras_ibfk_1;
ALTER TABLE livros_editoras DROP FOREIGN KEY livros_editoras_ibfk_2;

-- Cliente inexistente
INSERT INTO pedidos (id_cliente, id_livro, id_editora, quantidade)
VALUES (999, 1, 5, 1);

-- Livro inexistente
INSERT INTO pedidos (id_cliente, id_livro, id_editora, quantidade)
VALUES (1, 999, 5, 2);

-- Editora inexistente
INSERT INTO pedidos (id_cliente, id_livro, id_editora, quantidade)
VALUES (1, 1, 999, 3);

-- Tudo inexistente
INSERT INTO pedidos (id_cliente, id_livro, id_editora, quantidade)
VALUES (999, 999, 999, 1);

-- Livro inexistente
INSERT INTO livros_editoras (id_livro, id_editora, preco)
VALUES (999, 1, 39.90);

-- Editora inexistente
INSERT INTO livros_editoras (id_livro, id_editora, preco)
VALUES (1, 999, 49.90);

-- Ambos inexistentes
INSERT INTO livros_editoras (id_livro, id_editora, preco)
VALUES (999, 999, 59.90);

-- Novos livros
INSERT INTO livros (titulo, categoria) VALUES
('Banco de Dados Avançado', 'Não-ficção'),
('Machine Learning Moderno', 'Ficção Cientifica');

-- Novas editoras
INSERT INTO editoras (nome) VALUES
('Editora SQL Master'),
('Tech Books Brasil');

-- Novos clientes
INSERT INTO clientes (nome) VALUES
('Ricardo Mendes'),
('Patrícia Gomes'),
('Vinicius Alves');

-- Novos pedidos
INSERT INTO pedidos (id_cliente, id_livro, id_editora, quantidade) VALUES
(2, 2, 1, 10),
(5, 4, 7, 7),
(7, 5, 8, 6);

-- Livro vendido por apenas uma editora
INSERT INTO livros (titulo, categoria)
VALUES ('Python para Dados', 'Não-ficção');

INSERT INTO livros_editoras (id_livro, id_editora, preco)
VALUES (8, 2, 79.90);

-- Clientes que compraram muito
INSERT INTO pedidos (id_cliente, id_livro, id_editora, quantidade) VALUES
(3, 5, 9, 20),
(4, 3, 3, 15);

-- =========================
-- ANTI JOIN
-- =========================
-- 1) Mostrar os clientes que nunca fizeram pedidos
SELECT c.* 
FROM clientes c 
LEFT JOIN pedidos p ON c.id = p.id_cliente
WHERE p.id IS NULL;


-- 2) Mostrar os livros que nunca foram vendidos
SELECT l.*
FROM livros l 
LEFT JOIN pedidos p ON l.id = p.id_livro
WHERE p.id IS NULL;


-- 3) Mostrar as editoras que nunca participaram de vendas
SELECT e.*
FROM editoras e 
LEFT JOIN pedidos p ON e.id = p.id_editora
WHERE p.id IS NULL;

-- 4) Mostrar os livros que não possuem editora associada
SELECT l.* 
FROM livros l 
LEFT JOIN livros_editoras le ON l.id = le.id_livro
LEFT JOIN editoras e ON e.id = le.id_editora
WHERE e.id IS NULL;

-- 5) Mostrar as editoras que não possuem livros associados
SELECT e.*
FROM editoras e 
LEFT JOIN livros_editoras le ON e.id = le.id_editora
LEFT JOIN livros l ON l.id = le.id_livro
WHERE l.id IS NULL;

-- 6) Mostrar os clientes que nunca compraram livros de Terror
SELECT c.*
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
LEFT JOIN livros l ON l.id = p.id_livro
AND l.categoria NOT LIKE '%Terror%'
WHERE l.id IS NULL;

-- 7) Mostrar os clientes que nunca compraram o livro '1984'
SELECT DISTINCT c.*
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
LEFT JOIN livros l ON l.id = p.id_livro AND l.titulo = '1984'
WHERE l.id IS NULL;

-- 8) Mostrar os livros que nunca apareceram em pedidos com quantidade maior que 2
SELECT l.*
FROM livros l
LEFT JOIN pedidos p ON l.id = p.id_livro AND p.quantidade > 2
WHERE p.id IS NULL;

-- 9) Mostrar editoras que nunca venderam o livro 'Duna'
SELECT e.*
FROM editoras e
LEFT JOIN pedidos p ON e.id = p.id_editora
LEFT JOIN livros l ON l.id = p.id_livro AND l.titulo = 'Duna'
WHERE l.id IS NULL;

-- 10) Mostrar clientes que nunca compraram da editora 'DarkSide Books'
SELECT c.*
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
LEFT JOIN editoras e ON e.id = p.id_editora AND e.nome = 'DarkSide Books'  
WHERE e.id IS NULL;

-- =========================
-- ANTI LEFT JOIN
-- =========================
-- 11) Mostrar todos os clientes sem pedidos utilizando LEFT JOIN + IS NULL
SELECT c.*
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente 
WHERE p.id IS NULL;

-- 12) Mostrar todos os livros sem vendas utilizando LEFT JOIN + IS NULL
SELECT l.*
FROM livros l 
LEFT JOIN pedidos p ON l.id = p.id_livro
WHERE p.id IS NULL;

-- 13) Mostrar todas as editoras sem livros associados utilizando LEFT JOIN + IS NULL
SELECT e.*
FROM editoras e
LEFT JOIN livros_editoras le ON e.id = le.id_editora
LEFT JOIN livros l ON l.id = le.id_livro
WHERE l.id IS NULL;

-- 14) Mostrar todos os livros sem editoras utilizando LEFT JOIN + IS NULL
SELECT l.*
FROM livros l 
LEFT JOIN livros_editoras le ON l.id = le.id_livro
LEFT JOIN editoras e ON e.id = le.id_editora
WHERE e.id IS NULL;

-- 15) Mostrar clientes que nunca compraram livros da categoria 'Romance'
SELECT c.* 
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
LEFT JOIN livros l ON l.id = p.id_livro AND l.categoria = 'Romance'
WHERE l.id IS NULL;

-- 16) Mostrar editoras que nunca venderam nenhum livro de Terror
SELECT e.* 
FROM editoras e 
LEFT JOIN pedidos p ON e.id = p.id_editora
LEFT JOIN livros l ON l.id = p.id_livro AND l.categoria = 'Terror'
WHERE l.id IS NULL;

-- 17) Mostrar livros que nunca foram comprados pela cliente 'Ana Silva'
SELECT l.*
FROM livros l 
LEFT JOIN pedidos p ON l.id = p.id_livro
LEFT JOIN clientes c ON c.id = p.id_cliente AND c.nome = 'Ana Silva'
WHERE c.id IS NULL;

-- 18) Mostrar clientes que nunca compraram mais de 3 unidades em um pedido
SELECT c.*
FROM clientes c 
LEFT JOIN pedidos p ON c.id = p.id_cliente AND p.quantidade > 3 
WHERE p.id IS NULL;

-- 19) Mostrar editoras que nunca participaram de pedidos acima de R$ 100
SELECT e.*
FROM editoras e
LEFT JOIN pedidos p ON e.id = p.id_editora
LEFT JOIN livros_editoras le ON p.id_livro = le.id_livro 
	AND p.id_editora = le.id_editora
    AND (p.quantidade * le.preco) > 100
WHERE le.id_editora IS NULL;

-- 20) Mostrar livros que nunca foram vendidos pela editora 'Aleph'
SELECT l.*
FROM livros l
LEFT JOIN pedidos p ON l.id = p.id_livro
LEFT JOIN editoras e ON e.id = p.id_editora AND e.nome = 'Aleph'
WHERE e.id IS NULL;

-- =========================
-- ANTI RIGHT JOIN
-- =========================
-- 21) Mostrar pedidos sem clientes associados utilizando RIGHT JOIN
SELECT p.* 
FROM clientes c 
RIGHT JOIN pedidos p ON c.id = p.id_cliente
WHERE c.id IS NULL;

-- 22) Mostrar pedidos sem livros associados utilizando RIGHT JOIN
SELECT p.*
FROM livros l 
RIGHT JOIN pedidos p ON l.id = p.id_livro
WHERE l.id IS NULL;


-- 23) Mostrar pedidos sem editoras associadas utilizando RIGHT JOIN
SELECT p.* 
FROM editoras e 
RIGHT JOIN pedidos p ON e.id = p.id_editora
WHERE e.id IS NULL;

-- 24) Mostrar livros sem pedidos utilizando RIGHT JOIN
SELECT l.* 
FROM pedidos p 
RIGHT JOIN livros l ON l.id = p.id_livro
WHERE p.id IS NULL;

-- 25) Mostrar editoras sem vendas utilizando RIGHT JOIN
SELECT e.*
FROM pedidos p 
RIGHT JOIN editoras e ON e.id = p.id_editora
WHERE p.id IS NULL;

-- 26) Mostrar clientes sem pedidos utilizando RIGHT JOIN
SELECT c.* 
FROM pedidos p 
RIGHT JOIN clientes c ON c.id = p.id_cliente
WHERE p.id IS NULL;

-- 27) Mostrar livros que não possuem associação na tabela livros_editoras usando RIGHT JOIN
SELECT l.*
FROM livros_editoras le 
RIGHT JOIN livros l ON l.id = le.id_livro
WHERE le.id_livro IS NULL;

-- 28) Mostrar editoras que não possuem associação na tabela livros_editoras usando RIGHT JOIN
SELECT e.*
FROM livros_editoras le 
RIGHT JOIN editoras e ON e.id = le.id_editora
WHERE le.id_editora IS NULL;

-- 29) Mostrar clientes que nunca compraram livros da categoria 'Ficção'
SELECT c.*
FROM pedidos p
RIGHT JOIN clientes c ON c.id = p.id_cliente
LEFT JOIN livros l ON l.id = p.id_livro AND l.categoria = 'Ficção'
WHERE l.id IS NULL;

-- 30) Mostrar editoras que nunca venderam livros da categoria 'Não-ficção'
SELECT e.*
FROM pedidos p 
RIGHT JOIN editoras e ON e.id = p.id_editora 
LEFT JOIN livros l ON l.id = p.id_livro AND l.categoria = 'Não-ficção'
WHERE l.id IS NULL;

-- =========================
-- ANTI FULL JOIN
-- =========================
-- 31) Mostrar registros de clientes sem pedidos e pedidos sem clientes (simulação de FULL OUTER JOIN)
SELECT c.id AS cliente 
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente 
WHERE p.id IS NULL
UNION 
SELECT p.id AS pedido 
FROM pedidos p 
LEFT JOIN clientes c ON c.id = p.id_cliente
WHERE c.id IS NULL;


-- 32) Mostrar livros sem vendas e vendas sem livros associados
SELECT l.id AS livro
FROM livros l
LEFT JOIN pedidos p ON l.id = p.id_livro
WHERE p.id IS NULL
UNION
SELECT p.id AS pedido
FROM pedidos p
LEFT JOIN livros l ON l.id = p.id_livro
WHERE l.id IS NULL;

-- 33) Mostrar editoras sem livros e livros sem editoras
SELECT e.id AS editora
FROM editoras e
LEFT JOIN livros_editoras le ON e.id = le.id_editora
WHERE le.id_editora IS NULL
UNION
SELECT l.id AS livro
FROM livros l
LEFT JOIN livros_editoras le ON l.id = le.id_livro
WHERE le.id_livro IS NULL;
-- 
SELECT e.nome AS editora, NULL AS titulo
FROM editoras e
LEFT JOIN livros_editoras le ON e.id = le.id_editora
WHERE le.id_editora IS NULL
UNION
SELECT NULL, l.titulo
FROM livros l
LEFT JOIN livros_editoras le ON l.id = le.id_livro
WHERE le.id_livro IS NULL;

-- 34) Mostrar clientes sem pedidos e pedidos com clientes inexistentes
SELECT c.id AS cliente
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
WHERE p.id IS NULL
UNION
SELECT p.id AS pedido
FROM pedidos p
LEFT JOIN clientes c ON c.id = p.id_cliente
WHERE c.id IS NULL;

-- 35) Mostrar livros sem editoras e editoras sem livros
SELECT l.id AS livro
FROM livros l
LEFT JOIN livros_editoras le ON l.id = le.id_livro
WHERE le.id_livro IS NULL
UNION
SELECT e.id AS editora
FROM editoras e
LEFT JOIN livros_editoras le ON e.id = le.id_editora
WHERE le.id_editora IS NULL;

-- 36) Mostrar livros sem pedidos e pedidos sem livros válidos
SELECT l.id AS livro
FROM livros l
LEFT JOIN pedidos p ON l.id = p.id_livro
WHERE p.id IS NULL
UNION
SELECT p.id AS pedido
FROM pedidos p
LEFT JOIN livros l ON l.id = p.id_livro
WHERE l.id IS NULL;

-- 37) Mostrar editoras sem vendas e vendas sem editoras válidas
SELECT e.nome, e.id AS editora
FROM editoras e
LEFT JOIN pedidos p ON e.id = p.id_editora
WHERE p.id IS NULL
UNION
SELECT e.nome, p.id AS pedido
FROM pedidos p
LEFT JOIN editoras e ON e.id = p.id_editora
WHERE e.id IS NULL;

-- 38) Mostrar clientes sem pedidos e pedidos sem cliente associado utilizando UNION
SELECT c.id AS cliente
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
WHERE p.id IS NULL
UNION
SELECT p.id AS pedido
FROM pedidos p
LEFT JOIN clientes c ON c.id = p.id_cliente
WHERE c.id IS NULL;


-- 39) Mostrar livros sem associação em livros_editoras e associações órfãs na tabela livros_editoras
SELECT l.id AS livro
FROM livros l
LEFT JOIN livros_editoras le ON l.id = le.id_livro
WHERE le.id_livro IS NULL
UNION
SELECT le.id_livro AS associacao_orfa
FROM livros_editoras le
LEFT JOIN livros l ON l.id = le.id_livro
WHERE l.id IS NULL;


-- 40) Mostrar editoras sem associação em livros_editoras e associações órfãs na tabela livros_editoras
SELECT e.id AS editora
FROM editoras e
LEFT JOIN livros_editoras le ON e.id = le.id_editora
WHERE le.id_editora IS NULL
UNION
SELECT le.id_editora AS associacao_orfa
FROM livros_editoras le
LEFT JOIN editoras e ON e.id = le.id_editora
WHERE e.id IS NULL;