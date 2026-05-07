CREATE DATABASE 04102_BibliotecaDigital_Bruna;
USE 04102_BibliotecaDigital_Bruna;
SHOW DATABASES;

CREATE TABLE Livro (
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(80),
    genero VARCHAR(50),
    data_publicacao DATE 
);

INSERT INTO Livro(titulo, autor, genero, data_publicacao)
VALUES('Sonho de uma noite de verão', 'William Shakespeare', 'Romance', '1595-01-08'),
('O gato preto', 'Edgar Allan Poe', 'Terror', '1843-09-04'),
('O alquimista', 'Paulo Coelho', 'Ficção', '1988-08-06'),
('1984', 'George Orwell', 'Ficção/Distopia', '1949-11-12'),
('Clean Code', 'Robert Cecil Martin', 'Educação', '2008-02-09'),
('Revolução dos Bichos', 'George Orwell', 'Fábula Politíca', '1945-10-04');

SELECT * FROM Livro; -- seleciona toda a tabela
SELECT titulo, autor FROM Livro; -- seleciona só o titulo e o autor

SELECT * FROM Livro WHERE data_publicacao <1950-01-01;
SELECT * FROM Livro WHERE autor = 'George Orwell';
SELECT * FROM Livro WHERE genero = 'Ficção';

SELECT * FROM Livro ORDER BY titulo ASC; -- crescente
SELECT * FROM Livro ORDER BY titulo DESC; -- decrescente
SELECT * FROM Livro ORDER BY autor ASC; -- crescente
SELECT * FROM Livro ORDER BY autor DESC; -- decrescente
SELECT * FROM Livro ORDER BY data_publicacao ASC; -- crescente
SELECT * FROM Livro ORDER BY data_publicacao DESC; -- decrescente

SELECT * FROM Livro LIMIT 3;

SELECT * FROM Livro WHERE titulo LIKE 'Sonho%';
SELECT * FROM Livro WHERE titulo LIKE '%s';
SELECT * FROM Livro WHERE titulo LIKE '%qui%';
SELECT * FROM Livro WHERE titulo LIKE '___4';

SELECT * FROM Livro WHERE autor LIKE 'George%';
SELECT * FROM Livro WHERE autor LIKE '%e';
SELECT * FROM Livro WHERE autor LIKE '%aul%';
SELECT * FROM Livro WHERE autor LIKE '_____n';