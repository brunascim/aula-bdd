CREATE DATABASE 04102_Join1_Bruna;
USE 04102_Join1_Bruna;

CREATE TABLE funcionarios (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE crachas (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  id_funcionario INT UNIQUE,
  numero VARCHAR(50) NOT NULL UNIQUE,
  FOREIGN KEY (id_funcionario) REFERENCES funcionarios(ID)
);

INSERT INTO funcionarios (nome) VALUES
('Ana'),
('José'),
('Fernanda'),
('João'),
('Gabriel'),
('Leonardo'),
('Enzo');

INSERT INTO crachas (id_funcionario, numero) VALUES
(1, 'CR0001'),
(3, 'CR0002'),
(5, 'CR0003'),
(6, 'CR0005');

-- Visualizar funcionarios com crachas
SELECT c.id, c.numero, f.nome
FROM crachas AS c
INNER JOIN funcionarios AS f
ON c.id_funcionario = f.id;

-- Inserir crachas sem funcionario
INSERT INTO crachas(numero) VALUES
('CR0004');

-- Visualizar funcionarios sem cracha
SELECT c.numero, f.nome
FROM crachas c
RIGHT JOIN funcionarios f
ON c.id_funcionario = f.id;

-- Visualizar crachas sem funcionario associado
SELECT c.numero, f.nome
FROM crachas c
LEFT JOIN funcionarios f
ON c.id_funcionario = f.id;

-- Visualizar todos os funcionarios e crachas, associados ou não 
SELECT c.numero, f.nome
FROM crachas c
LEFT JOIN funcionarios f
ON c.id_funcionario = f.id
UNION
SELECT c.numero, f.nome
FROM crachas c
RIGHT JOIN funcionarios f
ON c.id_funcionario = f.id;

CREATE TABLE tarefas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    id_funcionario INT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

INSERT INTO tarefas (descricao, id_funcionario) VALUES
('Criar relatório', 3),
('Contatar cliente', 7),
('Organizar arquivo', NULL),
('Fazer manutenção nos computadores', 4),
('Criar proposta de aquisição de concorrente', NULL),
('Criar análise de dados do ano anterior', 2),
('Avaliar viabilidade de ferramenta NoSQL', 2);

-- Visualizar funcionarios e tarefas
SELECT f.nome, t.descricao
FROM tarefas t
INNER JOIN funcionarios f
ON t.id_funcionario = f.id;

SELECT f.nome, t.descricao
FROM tarefas t
RIGHT JOIN funcionarios f
ON t.id_funcionario = f.id;

SELECT f.nome, t.descricao
FROM tarefas t
LEFT JOIN funcionarios f
ON t.id_funcionario = f.id;

-- Inserindo funcionário com nome duplicado e crachá único
INSERT INTO funcionarios(nome)
VALUE ('Leonardo');

INSERT INTO crachas(numero, id_funcionario) VALUES
('CR0006', 8);

INSERT INTO tarefas(descricao, id_funcionario) VALUES
('Fazer café', 8);

-- Visualizar cracha, nome e tarefa com associação em todos
SELECT c.numero, f.nome, t.descricao
FROM tarefas t
INNER JOIN funcionarios f ON t.id_funcionario = f.id
INNER JOIN crachas c ON c.id_funcionario = f.id;

CREATE TABLE projetos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

INSERT INTO projetos(nome) VALUES
('Migrar sistema de banco de dados'),
('Criar sistema frontend'),
('Integrar IA');

CREATE TABLE funcionario_projetos (
    id_funcionario INT,
    id_projeto INT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id),
    PRIMARY KEY (id_funcionario, id_projeto)
);

INSERT INTO funcionario_projetos (id_funcionario, id_projeto) VALUES
(1, 1),
(1, 3),
(5, 2),
(2, 3),
(8, 1);

-- INNER 
SELECT f.nome AS nome_funcionario, p.nome AS nome_projeto
FROM funcionario_projetos fp
INNER JOIN funcionarios f ON fp.id_funcionario = f.id
INNER JOIN projetos p ON fp.id_projeto = p.id;

-- 1) Listar todos os funcionários e seus crachás
SELECT f.nome, c.numero
FROM funcionarios f
LEFT JOIN crachas c
ON c.id_funcionario = f.id;

-- 2) Listar todos os funcionários que não possuem crachá
SELECT f.nome
FROM funcionarios f
LEFT JOIN crachas c 
ON c.id_funcionario = f.id
WHERE c.numero IS NULL;

-- 3) Listar todos os crachás que não estão associados a funcionários
SELECT c.numero
FROM crachas c
LEFT JOIN funcionarios f
ON c.id_funcionario = f.id
WHERE f.nome IS NULL;

-- 4) Mostrar o nome dos funcionários e suas tarefas
SELECT f.nome, t.descricao
FROM funcionarios f 
INNER JOIN tarefas t ON t.id_funcionario = f.id;

-- 5) Mostrar todas as tarefas, incluindo as que não possuem funcionário responsável
SELECT t.descricao, f.nome
FROM tarefas t 
LEFT JOIN funcionarios f
ON t.id_funcionario = f.id;

