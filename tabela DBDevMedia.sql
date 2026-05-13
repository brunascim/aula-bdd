CREATE DATABASE 04102_DBDevMedia_Bruna; 
USE 04102_DBDevMedia_Bruna; 


CREATE TABLE Alunos(
	AlunoID INT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Sobrenome VARCHAR(100) NOT NULL,
	Email VARCHAR(150) UNIQUE,
	DataNascimento DATE,
	Ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Cursos(
	CursoID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    Descricao TEXT,
    CargaHoraria INT,
    preco DECIMAL(10,2)
);

SHOW TABLES; -- Mostra as tabelas criadas 
DESCRIBE Alunos; -- DESCRIBE: descreve o conteudo das tabelas
DESCRIBE Cursos;

INSERT INTO Alunos(Nome, Sobrenome, Email, DataNascimento)
VALUES ('Ana', 'Costa', 'ana.costa@email.com', '2000-01-10');

INSERT INTO Alunos(Nome, Sobrenome, Email, DataNascimento, Ativo)
VALUES ('Pedro', 'Lima', 'pedro.lima@email.com', '1998-03-22', FALSE);

INSERT INTO Alunos(Nome, Sobrenome, Email)
VALUES ('Mariana', 'Souza', 'mariana.s@email.com');

INSERT INTO Alunos(Nome, Sobrenome, Email, DataNascimento)
VALUES ('Carlos', 'Gomes', 'carlos.g@email.com', '2001-11-05');

INSERT INTO Cursos(Titulo, Descricao, CargaHoraria, preco)
VALUES ('Introdução ao SQL', 'Curso básico de SQL para iniciantes', 40, 299.90);

INSERT INTO Cursos(Titulo, Descricao, CargaHoraria, preco)
VALUES ('Desenvolvimento Web com Phyton', 'Aprenda a criar aplicações web com Phyton', 80, 599.90);

INSERT INTO Cursos(Titulo, Descricao, CargaHoraria, preco)
VALUES ('Banco de Dados Avançado', 'Tópicos avançados em otimização e modelagem', 60, 450.00);

-- DML
SHOW TABLES;
SELECT * FROM Alunos;
SELECT * FROM Cursos;

-- DML
UPDATE Alunos
SET Email = 'pedro.novo.email@email.com'
WHERE AlunoID = 2;

BEGIN; -- iniciar uma transação
UPDATE Alunos
SET Ativo = FALSE
WHERE AlunoID = 3;

SELECT Nome, Ativo
FROM Alunos
WHERE Nome = 'Mariana';

ROLLBACK; -- voltar

UPDATE Cursos
SET  
	CargaHoraria = 45,
    preco = 320.00
WHERE CursoID = 1;
COMMIT; -- salvar permanente

BEGIN; -- iniciar outra
DELETE FROM Alunos
WHERE AlunoID = 2;

SELECT * FROM  Alunos
WHERE Nome = 'Pedro';

ROLLBACK;

BEGIN;
DELETE FROM Alunos -- deletar todos os alunos
WHERE Ativo = TRUE;

TRUNCATE TABLE Alunos; 
SELECT * FROM Alunos;
SELECT * FROM Cursos;
