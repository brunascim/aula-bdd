CREATE DATABASE 04102_locadora_Bruna;
USE 04102_locadora_Bruna;

CREATE TABLE Clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    cpf INT,
    endereco VARCHAR(50)
);

CREATE TABLE Automoveis (
	id_automovel INT AUTO_INCREMENT PRIMARY KEY ,
    nome_automovel VARCHAR(45),
    ano YEAR,
    marca VARCHAR(45),
    cor VARCHAR(20)
);

CREATE TABLE Locacoes (
	id_locacao INT AUTO_INCREMENT PRIMARY KEY ,
    data_locacao DATE,
    tempo_locacao VARCHAR(20),
    id_cliente INT,
    id_automovel INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_automovel) REFERENCES Automoveis(id_automovel)
);

INSERT INTO Clientes (nome_cliente, email, telefone, cpf, endereco) VALUES
('Marcos Silva', 'marcos@gmail.com', '1499812-4567', 123456789, 'Rua das Flores'),
('Ana Souza', 'ana@gmail.com', '1499777-1234', 987654321, 'Av. Brasil'),
('Carlos Lima', 'carlos@gmail.com', '1499654-7890', 456123789, 'Rua Central'),
('Fernanda Rocha', 'fernanda@gmail.com', '1499888-1122', 741852963, 'Rua São Paulo');

INSERT INTO Automoveis (nome_automovel, ano, marca, cor) VALUES
('Onix', 2020, 'Chevrolet', 'Prata'),
('HB20', 2021, 'Hyundai', 'Branco'),
('Corolla', 2019, 'Toyota', 'Preto'),
('Civic', 2022, 'Honda', 'Cinza');

INSERT INTO Locacoes (data_locacao, tempo_locacao, id_cliente, id_automovel) VALUES
('2026-05-01', '3 dias', 1, 2),
('2026-05-03', '1 semana', 2, 1),
('2026-05-05', '2 dias', 3, 4),
('2026-05-06', '5 dias', 4, 3);

-- Consultar todos os clientes cadastrados.
SELECT nome_cliente FROM Clientes;
SELECT * FROM Clientes;
-- Consultar todos os automóveis disponíveis.
SELECT nome_automovel FROM Automoveis;
SELECT * FROM Automoveis;
-- Consultar informações sobre o cliente e o automóvel locado, incluindo a data de início e fim da locação, a marca e o modelo do automóvel.
SELECT nome_cliente, nome_automovel, marca, ano , data_locacao, tempo_locacao
FROM Clientes, Automoveis, Locacoes
WHERE Clientes.id_cliente = Locacoes.id_cliente; 
-- Consultar informações sobre os automóveis locados em uma data específica, incluindo a marca e o modelo.
SELECT nome_automovel, ano
FROM Automoveis, Locacoes
WHERE data_locacao = 2026-05-05;
