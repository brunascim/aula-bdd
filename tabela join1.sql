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
