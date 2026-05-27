CREATE DATABASE 04102_Operadores_Bruna;
USE 04102_Operadores_Bruna;
DROP DATABASE 04102_Operadores_Bruna;
SHOW databases;

CREATE TABLE funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50),
    salario DECIMAL(6,2)
);

INSERT INTO funcionarios (nome, email, salario) VALUES
('Ana', 'ana@email.com', 1000.00),
('José', 'jose@email.com', 1200.00),
('João', 'joao@email.com', 1500.00);

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO clientes (nome, email) VALUES
('Ana', 'ana@email.com'),
('Paulo', 'paulo@email.com'),
('Gabriel', 'gabriel@email.com');

-- UNION
SELECT nome, email
FROM funcionarios
UNION
SELECT nome, email
FROM clientes;

-- UNION ALL
SELECT nome, email
FROM funcionarios
UNION ALL
SELECT nome, email
FROM clientes;

-- INTERSECT
SELECT nome, email
FROM funcionarios
INTERSECT
SELECT nome, email
FROM clientes;

-- EXCEPT
SELECT nome, email
FROM funcionarios
EXCEPT
SELECT nome, email
FROM clientes;

CREATE TABLE curso_sql (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE curso_python (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE curso_excel (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

INSERT INTO curso_sql (nome) VALUES
('Ana'),
('Bruno'),
('Carla'),
('Daniel'),
('Fernanda'),
('Gustavo');

INSERT INTO curso_python (nome) VALUES
('Ana'),
('Carla'),
('Eduardo'),
('Fernanda'),
('Helena'),
('Igor');

INSERT INTO curso_excel (nome) VALUES
('Bruno'),
('Daniel'),
('Fernanda'),
('Igor'),
('Julia'),
('Karen');

-- Contar alunos em python e SQL
SELECT 'Python' AS CURSOS, COUNT(*) AS TOTAL_ALUNOS		
FROM curso_python 
UNION ALL
SELECT 'SQL', COUNT(*) 
FROM curso_sql; 
-- OU
SELECT COUNT(*) AS quantidade
FROM (
    SELECT nome FROM curso_sql
        INTERSECT
        SELECT nome FROM curso_python
) AS interseção;
-- OU
Select 'Phyton' as curso, count(id) as Quantidade
from curso_python
Union 
Select 'SQL' as curso, count(id) as Quantidade
from curso_sql;

-- alunos presentes nos 3 cursos
SELECT nome
FROM curso_sql
INTERSECT
SELECT nome
FROM curso_excel
INTERSECT
SELECT nome 
FROM curso_python;

-- alunos que estudam só Python
SELECT nome
FROM curso_python 
EXCEPT 
SELECT nome
FROM curso_sql
EXCEPT
SELECT nome
FROM curso_excel;

-- alunos que cursam pelo menos dois cursos diferentes
SELECT nome, COUNT(*) AS qnt_cursos
FROM (
	SELECT nome FROM curso_sql
    UNION ALL 
    SELECT nome FROM curso_excel 
    UNION ALL 
    SELECT nome FROM curso_python
) AS cursos
GROUP BY nome
HAVING COUNT(*) >= 2;
-- OU 
SELECT 
    aluno,
        COUNT(DISTINCT curso) AS quantidade_curso,
        GROUP_CONCAT(DISTINCT curso ORDER BY curso) AS cursos
FROM (
    SELECT nome AS aluno, 'SQL' AS curso FROM curso_sql
        UNION ALL
        SELECT nome, 'Python' FROM curso_python
        UNION ALL
        SELECT nome, 'Excel' FROM curso_excel
) AS todos_alunos
GROUP BY aluno
HAVING COUNT(DISTINCT curso) >= 2
ORDER BY cursos DESC, aluno;

-- alunos que estão em 2 cursos diferentes, mas não em 3
SELECT nome, COUNT(*) AS qnt_cursos
FROM (
	SELECT nome FROM curso_sql
    UNION ALL 
    SELECT nome FROM curso_excel 
    UNION ALL 
    SELECT nome FROM curso_python
) AS cursos
GROUP BY nome
HAVING COUNT(*) = 2;
-- OU 
SELECT nome
FROM (
    SELECT nome FROM curso_sql
        INTERSECT
        SELECT nome FROM curso_python
        UNION
        SELECT nome FROM curso_sql
        INTERSECT 
        SELECT nome FROM curso_excel
        UNION 
        SELECT nome FROM curso_python
        INTERSECT
        SELECT nome FROM curso_excel
) AS dois_cursos
EXCEPT
(
  SELECT nome
    FROM curso_sql
    INTERSECT
    SELECT nome FROM curso_python
    INTERSECT
    SELECT nome FROM curso Excel
);

-- alunos em SQL e Python
SELECT nome 
FROM curso_sql 
INTERSECT 
SELECT nome
FROM curso_python; 

-- alunos em SQL e Excel
SELECT nome 
FROM curso_sql 
INTERSECT 
SELECT nome
FROM curso_excel; 

-- alunos em Python e Excel
SELECT nome 
FROM curso_python
INTERSECT 
SELECT nome
FROM curso_excel; 

-- alunos matriculados em pelo menos 1 curso, sem duplicatas
SELECT nome
FROM curso_sql
UNION 
SELECT nome 
FROM curso_excel
UNION 
SELECT nome
FROM curso_python;

-- alunos matriculados em pelo menos 1 curso, com duplicatas
SELECT nome
FROM curso_sql
UNION ALL
SELECT nome 
FROM curso_excel
UNION ALL
SELECT nome
FROM curso_python;

-- alunos apenas no curso de SQL (exclusivos)
SELECT nome
FROM curso_sql
EXCEPT
SELECT nome
FROM curso_python
EXCEPT
SELECT nome
FROM curso_excel;
-- OU 
SELECT nome
FROM curso_sql
except
(select nome 
from curso_python
union
select nome
from curso_excel);

-- alunos apenas no curso de Python (exclusivos)
SELECT nome
FROM curso_python
EXCEPT
SELECT nome
FROM curso_sql
EXCEPT
SELECT nome
FROM curso_excel;

-- alunos apenas no curso de Excel (exclusivos)
SELECT nome
FROM curso_excel
EXCEPT
SELECT nome
FROM curso_python
EXCEPT
SELECT nome
FROM curso_sql;
 
-- alunos comuns entre SQL e Python
SELECT nome 
FROM curso_sql
INTERSECT 
SELECT nome
FROM curso_python;

-- alunos que estão em SQL mas não estão em Python
SELECT nome
FROM curso_sql
EXCEPT
SELECT nome
FROM curso_python;

-- total de matriculas por curso
SELECT 'SQL' AS Curso, COUNT(*) AS Total
FROM curso_sql
UNION ALL 
SELECT 'PYTHON', COUNT(*)
FROM curso_python
UNION ALL
SELECT 'EXCEL', COUNT(*)
FROM curso_excel;

-- alunos únicos por curso
(SELECT nome
FROM curso_sql
EXCEPT
SELECT nome
FROM curso_python
EXCEPT
SELECT nome
FROM curso_excel
)
UNION 
(
SELECT nome
FROM curso_python
EXCEPT
SELECT nome
FROM curso_sql
EXCEPT
SELECT nome
FROM curso_excel
)
UNION
(
SELECT nome
FROM curso_excel
EXCEPT
SELECT nome
FROM curso_python
EXCEPT
SELECT nome
FROM curso_sql
);