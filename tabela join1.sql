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

-- 6) Mostrar todos os funcionários, incluindo os que não possuem tarefas
SELECT f.nome, t.descricao 
FROM funcionarios f
LEFT JOIN tarefas t
ON t.id_funcionario = f.id;

-- 7) Listar funcionários que possuem crachá e tarefa ao mesmo tempo
SELECT f.nome
FROM funcionarios f
INNER JOIN crachas c ON c.id_funcionario = f.id
INNER JOIN tarefas t ON t.id_funcionario = f.id
GROUP BY f.nome;

-- 8) Listar os funcionários que participam de projetos
SELECT f.nome
FROM funcionarios f
INNER JOIN funcionario_projetos fp
ON fp.id_funcionario = f.id
GROUP BY nome;

-- 9) Mostrar o nome do projeto e o nome do funcionário participante
SELECT p.nome, f.nome
FROM projetos p
INNER JOIN funcionario_projetos fp ON  p.id = fp.id_projeto
INNER JOIN funcionarios f ON f.id = fp.id_funcionario;


-- 10) Mostrar todos os projetos, incluindo os que não possuem funcionários associados
SELECT p.nome, f.nome
FROM projetos p
LEFT JOIN funcionario_projetos fp ON p.id = fp.id_projeto
LEFT JOIN funcionarios f ON f.id = fp.id_funcionario;  


-- 11) Mostrar todos os funcionários, incluindo os que não participam de projetos
SELECT f.nome, p.nome AS projeto
FROM funcionarios f 
LEFT JOIN funcionario_projetos fp ON f.id = fp.id_funcionario
LEFT JOIN projetos p ON p.id = fp.id_projeto;


-- 12) Mostrar os funcionários que possuem mais de uma tarefa
SELECT f.nome, COUNT(*) AS qt_tarefas
FROM funcionarios f 
INNER JOIN tarefas t ON f.id = t.id_funcionario
GROUP BY f.nome
HAVING COUNT(*) > 1;

-- 13) Mostrar os funcionários que participam de mais de um projeto
SELECT f.nome, COUNT(*) AS qt_projetos
FROM funcionarios f 
INNER JOIN funcionario_projetos fp ON f.id = fp.id_funcionario
INNER JOIN projetos p ON p.id = fp.id_projeto
GROUP BY f.nome
HAVING COUNT(*) > 1;

-- 14) Mostrar os funcionários que não possuem tarefas cadastradas
SELECT f.nome
FROM funcionarios f 
LEFT JOIN tarefas t 
ON f.id = t.id_funcionario
WHERE t.descricao IS NULL;

-- 15) Mostrar as tarefas que ainda não foram atribuídas para nenhum funcionário
SELECT t.descricao
FROM tarefas t
LEFT JOIN funcionarios f ON f.id = t.id_funcionario
WHERE f.nome IS NULL;

-- 16) Mostrar os funcionários que possuem crachá mas não possuem tarefa
SELECT f.nome
FROM funcionarios f 
INNER JOIN crachas c ON f.id = c.id_funcionario
LEFT JOIN tarefas t ON f.id = t.id_funcionario
WHERE t.id IS NULL;

-- 17) Mostrar os funcionários que possuem tarefa mas não possuem crachá
SELECT f.nome
FROM funcionarios f 
INNER JOIN tarefas t ON f.id = t.id_funcionario
LEFT JOIN crachas c ON f.id = c.id_funcionario
WHERE c.numero IS NULL;


-- 18) Mostrar os funcionários que possuem crachá e participam de projetos
SELECT f.nome 
FROM funcionarios f 
INNER JOIN crachas c ON f.id = c.id_funcionario
INNER JOIN funcionario_projetos fp ON f.id = fp.id_funcionario;


-- 19) Mostrar os projetos que possuem funcionários associados
SELECT p.nome
FROM projetos p
INNER JOIN funcionario_projetos fp ON p.id = fp.id_projeto
INNER JOIN funcionarios f ON f.id = fp.id_funcionario;


-- 20) Mostrar os projetos sem funcionários associados
SELECT p.nome 
FROM projetos p 
LEFT JOIN funcionario_projetos fp ON p.id = fp.id_projeto
LEFT JOIN funcionarios f ON f.id = fp.id_funcionario
WHERE fp.id_funcionario IS NULL;

-- 21) Mostrar quantas tarefas cada funcionário possui
SELECT f.nome, COUNT(*) AS qt_tarefas
FROM funcionarios f
INNER JOIN tarefas t ON f.id = t.id_funcionario
GROUP BY f.nome;

-- 22) Mostrar quantos funcionários existem em cada projeto
SELECT p.nome, COUNT(*) AS qt_funcionarios
FROM projetos p
INNER JOIN funcionario_projetos fp ON p.id = fp.id_projeto
INNER JOIN funcionarios f ON f.id = fp.id_funcionario
GROUP BY p.nome;

-- 23) Mostrar o nome do funcionário, número do crachá e nome do projeto
SELECT f.nome, c.numero, p.nome
FROM funcionarios f 
INNER JOIN crachas c ON f.id = c.id_funcionario
INNER JOIN funcionario_projetos fp ON f.id = fp.id_funcionario
INNER JOIN projetos p ON p.id = fp.id_projeto;

-- 24) Mostrar o funcionário com maior quantidade de tarefas
SELECT f.nome, COUNT(*) AS qt_tarefas
FROM funcionarios f 
INNER JOIN tarefas t ON f.id = t.id_funcionario 
GROUP BY f.nome
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 25) Mostrar os funcionários ordenados pela quantidade de tarefas
SELECT f.nome, COUNT(*) AS qt_tarefas
FROM funcionarios f 
INNER JOIN tarefas t ON f.id = t.id_funcionario
GROUP BY f.nome
ORDER BY qt_tarefas ASC;

-- 26) Mostrar quantos crachás estão sem funcionário associado
SELECT COUNT(*) AS sem_func
FROM crachas c
LEFT JOIN funcionarios f ON f.id = c.id_funcionario
WHERE f.id IS NULL;
-- OU 
SELECT COUNT(c.id) AS cracha_semFuncionarios
FROM crachas c
WHERE id_funcionario IS NULL;

-- 27) Mostrar os funcionários que possuem o nome repetido
SELECT nome, COUNT(*) AS nomes_repetidos
FROM funcionarios 
GROUP BY nome
HAVING nomes_repetidos > 1;

-- 28) Mostrar todos os funcionários e a quantidade de projetos em que trabalham
SELECT f.nome, COUNT(p.id) AS qt_projetos
FROM funcionarios f
LEFT JOIN funcionario_projetos fp ON f.id = fp.id_funcionario
LEFT JOIN projetos p ON p.id = fp.id_projeto
GROUP BY f.nome;


-- 29) Mostrar os funcionários que não possuem crachá nem tarefa
SELECT f.nome
FROM funcionarios f
LEFT JOIN crachas c ON f.id = c.id_funcionario
LEFT JOIN tarefas t ON f.id = t.id_funcionario
WHERE c.id IS NULL
AND t.id IS NULL;


-- 30) Mostrar todos os dados dos funcionários, crachás, tarefas e projetos juntos
SELECT f.nome, c.numero, t.descricao, p.nome
FROM funcionarios f
LEFT JOIN crachas c ON f.id = c.id_funcionario
LEFT JOIN tarefas t ON f.id = t.id_funcionario
LEFT JOIN funcionario_projetos fp ON f.id = fp.id_funcionario
LEFT JOIN projetos p ON p.id = fp.id_projeto;


-- 31) Mostrar a quantidade total de tarefas cadastradas
SELECT COUNT(*) AS total_tarefas
FROM tarefas;

-- 32) Mostrar a quantidade de funcionários cadastrados
SELECT COUNT(*) AS total_funcionarios
FROM funcionarios;

-- 33) Mostrar a quantidade de projetos cadastrados
SELECT COUNT(*) AS total_projetos
FROM projetos;

-- 34) Mostrar o nome dos funcionários e quantas tarefas sem responsável existem
SELECT f.nome, 
       (SELECT COUNT(*) 
        FROM tarefas
        WHERE id_funcionario IS NULL) AS tarefas_sem_responsavel
FROM funcionarios f;

-- 35) Mostrar quais funcionários trabalham no projeto "Integrar inteligência artificial"
SELECT f.nome
FROM funcionarios f
INNER JOIN funcionario_projetos fp ON f.id = fp.id_funcionario
INNER JOIN projetos p ON p.id = fp.id_projeto
WHERE p.nome = 'Integrar IA';

-- 36) Mostrar quais tarefas pertencem ao funcionário "Fernanda"
SELECT t.descricao
FROM tarefas t
INNER JOIN funcionarios f ON f.id = t.id_funcionario
WHERE f.nome = 'Fernanda';

-- 37) Mostrar o número do crachá do funcionário "Leonardo"
SELECT c.numero 
FROM crachas c 
INNER JOIN funcionarios f ON f.id = c.id_funcionario
WHERE f.nome = 'Leonardo';

-- 38) Mostrar quais funcionários possuem crachá com número começando em 'CR000'
SELECT f.nome, c.numero
FROM funcionarios f
INNER JOIN crachas c ON f.id = c.id_funcionario
WHERE c.numero LIKE 'CR000%';

-- 39) Mostrar os funcionários e projetos em ordem alfabética
SELECT f.nome, p.nome
FROM funcionarios f
INNER JOIN funcionario_projetos fp ON f.id = fp.id_funcionario
INNER JOIN projetos p ON p.id = fp.id_projeto
ORDER BY f.nome ASC, p.nome ASC;

-- 40) Mostrar os funcionários que não participam de nenhum projeto e não possuem tarefa
SELECT f.nome
FROM funcionarios f
LEFT JOIN funcionario_projetos fp ON f.id = fp.id_funcionario
LEFT JOIN tarefas t ON f.id = t.id_funcionario
WHERE fp.id_projeto IS NULL
AND t.id IS NULL;

