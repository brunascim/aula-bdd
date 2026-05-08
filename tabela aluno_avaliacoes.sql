CREATE DATABASE 04102_avaliacoes_Bruna;
USE 04102_avaliacoes_Bruna;

SELECT * FROM alunos, professores, avaliacoes; 

CREATE TABLE alunos(
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(100),
    data_nascimento DATE,
    curso VARCHAR(45)
);

CREATE TABLE professores(
	id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(100),
    curso VARCHAR(45)
);

CREATE TABLE avaliacoes(
	id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    nota FLOAT,
    comentario TEXT(500),
    id_aluno INT,
    id_professor INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);

INSERT INTO alunos (nome_aluno, curso, data_nascimento) VALUES
('Mariana Silva', 'Banco de Dados', '2002-05-10'),
('Carlos Souza', 'Engenharia de Software', '2001-09-15'),
('Ana Oliveira', 'UX Design', '2000-11-22'),
('Lucas Pereira', 'Ciência de Dados', '2003-01-08');

INSERT INTO professores (nome_professor, curso) VALUES
('João Mendes', 'Banco de Dados'),
('Fernanda Lima', 'Engenharia de Software'),
('Ricardo Alves', 'UX Design'),
('Patricia Gomes', 'Ciência de Dados');

INSERT INTO avaliacoes (nota, comentario, id_aluno, id_professor) VALUES
(8.5, 'Ótimo desempenho nas atividades.', 1, 1),
(5.0, 'Precisa melhorar a participação.', 2, 2),
(9.2, 'Excelente criatividade nos projetos.', 3, 3),
(4.8, 'Dificuldade em compreender os conceitos.', 4, 4),
(7.0, 'Bom desempenho geral.', 1, 2),
(5.5, 'Necessita revisar os conteúdos.', 3, 1);

-- Listar todos os alunos e seus cursos
SELECT nome_aluno, curso
FROM alunos;

-- Lista todos os professores e cursos que lecionam
SELECT nome_professor, curso
FROM professores;

-- Listar comentários e notas dos alunos com nome do professor
SELECT nome_professor, nota, comentario
FROM professores, avaliacoes
WHERE professores.id_professor = avaliacoes.id_professor;
-- ou pode fazer desse jeito 
SELECT comentario, nota, id_professor
FROM avaliacoes;

-- Listar comentários com nota abaixo de 6.0
SELECT nota, comentario 
FROM avaliacoes 
WHERE nota<6.00;

-- Listar comentários com nota acima de 6.0
SELECT nota, comentario 
FROM avaliacoes 
WHERE nota>6.00;