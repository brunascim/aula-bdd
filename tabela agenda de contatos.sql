CREATE DATABASE 04102_agendadecontatos_Bruna;
USE 04102_agendadecontatos_Bruna;

CREATE TABLE Grupos_Contato (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nome_grupo VARCHAR(50) NOT NULL
);

CREATE TABLE Contatos (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(150),
    id_grupo INT,
    FOREIGN KEY (id_grupo) REFERENCES Grupos_Contato(id_grupo)
);

CREATE TABLE Telefones (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(20),
    id_contato INT,
    FOREIGN KEY (id_contato) REFERENCES Contatos(id_contato)
);

INSERT INTO Grupos_Contato(nome_grupo)
VALUES
('Família'),
('Trabalho'),
('Amigos');

INSERT INTO Contatos(nome, email, endereco, id_grupo)
VALUES
('Ana Silva', 'ana@gmail.com', 'Rua A, 120', 1),
('Carlos Souza', 'carlos@gmail.com', 'Av. Brasil, 450', 2),
('Mariana Lima', 'mariana@gmail.com', 'Rua Central, 89', 3);

INSERT INTO Telefones(numero, tipo, id_contato)
VALUES
('14998112233', 'Celular', 1),
('14997776655', 'Residencial', 1),
('14996554411', 'Celular', 2),
('14998887766', 'Comercial', 3);

SELECT * FROM Grupos_Contato;

SELECT * FROM Contatos;

SELECT * FROM Telefones;



