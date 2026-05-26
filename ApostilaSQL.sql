CREATE DATABASE 04102_ApostilaSQL_Bruna; 
USE 04102_ApostilaSQL_Bruna; 

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(50),
    telefone VARCHAR(50),
    cidade VARCHAR(50),
    email VARCHAR(50),
    genero VARCHAR(50),
    endereco VARCHAR(50),
    renda FLOAT,
    data_nascimento DATE
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(50),
    data_nascimento DATE,
    genero VARCHAR(50),
    estado_civil VARCHAR(50),
    dependentes INT,
    cargo VARCHAR(50),
    salario FLOAT
);

CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(50),
    endereco VARCHAR(50),
    cnpj INT
);

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(50),
    preco FLOAT,
    id_categoria INT,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    id_cliente INT,
    id_funcionario INT,
    data DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO clientes (id_cliente, nome, telefone, cidade, email, genero, endereco, renda, data_nascimento)
VALUES
(1, 'João Silva', '(11) 98765-4321', 'São Paulo', 'joao@email.com', 'Masculino', 'Rua A, 123', 5000.00, '1980-05-10'),
(2, 'Maria Santos', '(21) 98765-5432', 'Rio de Janeiro', 'maria@email.com', 'Feminino', 'Av. B, 456', 4000.00, '1985-08-15'),
(3, 'Carlos Oliveira', '(31) 98765-6543', 'Belo Horizonte', 'carlos@email.com', 'Masculino', 'Rua C, 789', 4500.00, '1982-03-25'),
(4, 'Ana Souza', '(51) 98765-7654', 'Porto Alegre', 'ana@email.com', 'Feminino', 'Av. D, 987', 3800.00, '1990-12-08'),
(5, 'Pedro Santos', '(41) 98765-8765', 'Curitiba', 'pedro@email.com', 'Masculino', 'Rua E, 654', 6000.00, '1975-09-14'),
(6, 'Luciana Lima', '(11) 98765-9876', 'São Paulo', 'luciana@email.com', 'Feminino', 'Rua F, 321', 4200.00, '1987-06-30'),
(7, 'Rafael Costa', '(21) 98765-8765', 'Rio de Janeiro', 'rafael@email.com', 'Masculino', 'Av. G, 654', 5500.00, '1983-04-18'),
(8, 'Mariana Oliveira', '(31) 98765-7654', 'Belo Horizonte', 'mariana@email.com', 'Feminino', 'Rua H, 987', 4800.00, '1989-02-22'),
(9, 'Gustavo Martins', '(51) 98765-6543', 'Porto Alegre', 'gustavo@email.com', 'Masculino', 'Av. I, 234', 7000.00, '1980-10-15'),
(10, 'Camila Silva', '(41) 98765-5432', 'Curitiba', 'camila@email.com', 'Feminino', 'Rua J, 876', 3200.00, '1992-07-05'),
(11, 'Felipe Santos', '(11) 98765-4321', 'São Paulo', 'felipe@email.com', 'Masculino', 'Av. K, 567', 5800.00, '1986-11-28'),
(12, 'Carla Lima', '(21) 98765-3210', 'Rio de Janeiro', 'carla@email.com', 'Feminino', 'Rua L, 1098', 3900.00, '1995-03-14'),
(13, 'Bruno Oliveira', '(31) 98765-2109', 'Belo Horizonte', 'bruno@email.com', 'Masculino', 'Av. M, 432', 4500.00, '1984-08-07'),
(14, 'Patrícia Costa', '(51) 98765-1098', 'Porto Alegre', 'patricia@email.com', 'Feminino', 'Rua N, 765', 4200.00, '1981-12-31'),
(15, 'Rodrigo Martins', '(41) 98765-0987', 'Curitiba', 'rodrigo@email.com', 'Masculino', 'Av. O, 321', 6500.00, '1978-06-23'),
(16, 'Juliana Ferreira', '(11) 98765-9876', 'São Paulo', 'juliana@email.com', 'Feminino', 'Rua P, 876', 4800.00, '1987-09-17'),
(17, 'Gabriel Silva', '(21) 98765-8765', 'Rio de Janeiro', 'gabriel@email.com', 'Masculino', 'Av. Q, 543', 5500.00, '1982-02-19'),
(18, 'Vanessa Souza', '(31) 98765-7654', 'Belo Horizonte', 'vanessa@email.com', 'Feminino', 'Rua R, 234', 4000.00, '1990-04-03'),
(19, 'Fernando Oliveira', '(51) 98765-6543', 'Porto Alegre', 'fernando@email.com', 'Masculino', 'Av. S, 987', 7000.00, '1983-11-11'),
(20, 'Larissa Santos', '(41) 98765-5432', 'Curitiba', 'larissa@email.com', 'Feminino', 'Rua T, 432', 3200.00, '1993-08-25'),
(21, 'Ricardo Lima', '(11) 98765-4321', 'São Paulo', 'ricardo@email.com', 'Masculino', 'Av. U, 1098', 5800.00, '1988-12-05'),
(22, 'Amanda Costa', '(21) 98765-3210', 'Rio de Janeiro', 'amanda@email.com', 'Feminino', 'Rua V, 765', 3900.00, '1996-05-19'),
(23, 'Renato Oliveira', '(31) 98765-2109', 'Belo Horizonte', 'renato@email.com', 'Masculino', 'Av. W, 321', 4500.00, '1985-10-14'),
(24, 'Tatiana Costa', '(51) 98765-1098', 'Porto Alegre', 'tatiana@email.com', 'Feminino', 'Rua X, 876', 4200.00, '1982-01-27'),
(25, 'Marcos Santos', '(41) 98765-0987', 'Curitiba', 'marcos@email.com', 'Masculino', 'Av. Y, 987', 6500.00, '1979-07-21'),
(26, 'Isabela Ferreira', '(11) 98765-9876', 'São Paulo', 'isabela@email.com', 'Feminino', 'Rua Z, 234', 4800.00, '1988-10-03'),
(27, 'Lucas Silva', '(21) 98765-8765', 'Rio de Janeiro', 'lucas@email.com', 'Masculino', 'Av. A1, 543', 5500.00, '1983-03-25'),
(28, 'Natália Souza', '(31) 98765-7654', 'Belo Horizonte', 'natalia@email.com', 'Feminino', 'Rua B1, 987', 4000.00, '1991-05-08'),
(29, 'Leandro Oliveira', '(51) 98765-6543', 'Porto Alegre', 'leandro@email.com', 'Masculino', 'Av. C1, 321', 7000.00, '1984-12-17'),
(30, 'Julia Santos', '(41) 98765-5432', 'Curitiba', 'julia@email.com', 'Feminino', 'Rua D1, 876', 3200.00, '1994-09-10'),
(31, 'Marcelo Lima', '(11) 98765-4321', 'São Paulo', 'marcelo@email.com', 'Masculino', 'Av. E1, 1098', 5800.00, '1989-01-22'),
(32, 'Carolina Costa', '(21) 98765-3210', 'Rio de Janeiro', 'carolina@email.com', 'Feminino', 'Rua F1, 765', 3900.00, '1997-04-15'),
(33, 'Paulo Oliveira', '(31) 98765-2109', 'Belo Horizonte', 'paulo@email.com', 'Masculino', 'Av. G1, 321', 4500.00, '1986-11-18'),
(34, 'Fernanda Costa', '(51) 98765-1098', 'Porto Alegre', 'fernanda@email.com', 'Feminino', 'Rua H1, 876', 4200.00, '1983-02-09'),
(35, 'Gabriel Santos', '(41) 98765-0987', 'Curitiba', 'gabriel@email.com', 'Masculino', 'Av. I1, 987', 6500.00, '1980-08-13'),
(36, 'Vanessa Ferreira', '(11) 98765-9876', 'São Paulo', 'vanessa@email.com', 'Feminino', 'Rua J1, 234', 4800.00, '1989-11-26'),
(37, 'Eduardo Silva', '(21) 98765-8765', 'Rio de Janeiro', 'eduardo@email.com', 'Masculino', 'Av. K1, 543', 5500.00, '1984-04-30'),
(38, 'Renata Oliveira', '(31) 98765-7654', 'Belo Horizonte', 'renata@email.com', 'Feminino', 'Rua L1, 987', 4000.00, '1992-06-03'),
(39, 'Thiago Martins', '(51) 98765-6543', 'Porto Alegre', 'thiago@email.com', 'Masculino', 'Av. M1, 321', 7000.00, '1985-01-14'),
(40, 'Mariana Santos', '(41) 98765-5432', 'Curitiba', 'mariana@email.com', 'Feminino', 'Rua N1, 876', 3200.00, '1993-04-27');


INSERT INTO funcionarios (id_funcionario, nome, data_nascimento, genero, estado_civil, dependentes, cargo, salario)
VALUES
(1, 'Fernando Silva', '1982-07-15', 'Masculino', 'Casado', 2, 'Vendedor', 3500.00),
(2, 'Aline Costa', '1980-12-20', 'Feminino', 'Solteira', 0, 'Gerente', 6000.00),
(3, 'Marcos Oliveira', '1975-03-10', 'Masculino', 'Divorciado', 1, 'Caixa', 2800.00),
(4, 'Patrícia Souza', '1988-06-05', 'Feminino', 'Solteira', 0, 'Vendedora', 3200.00),
(5, 'Rafael Martins', '1983-09-18', 'Masculino', 'Casado', 3, 'Gerente', 6500.00),
(6, 'Carla Lima', '1990-04-25', 'Feminino', 'Solteira', 0, 'Vendedora', 3000.00),
(7, 'Rodrigo Santos', '1977-11-30', 'Masculino', 'Divorciado', 2, 'Caixa', 2800.00),
(8, 'Mariana Ferreira', '1985-02-15', 'Feminino', 'Casada', 1, 'Gerente', 6000.00),
(9, 'Lucas Costa', '1989-08-10', 'Masculino', 'Solteiro', 0, 'Vendedor', 3400.00),
(10, 'Ana Oliveira', '1984-03-20', 'Feminino', 'Casada', 2, 'Caixa', 3000.00);

INSERT INTO fornecedores (id_fornecedor, nome, cidade, endereco, cnpj)
VALUES
(1, 'Fornecedor A', 'São Paulo', 'Rua G, 234', 1234),
(2, 'Fornecedor B', 'Rio de Janeiro', 'Av. H, 567', 9876),
(3, 'Fornecedor C', 'Belo Horizonte', 'Rua I, 890', 5678);

INSERT INTO categorias (id_categoria, nome)
VALUES
(1, 'Eletrônicos'),
(2, 'Roupas'),
(3, 'Alimentos'),
(4, 'Móveis'),
(5, 'Cosméticos');

INSERT INTO produtos (id_produto, nome, preco, id_categoria, id_fornecedor)
VALUES
(1, 'Smartphone X', 1500.00, 1, 1),
(2, 'Notebook Y', 3000.00, 1, 2),
(3, 'Camiseta Z', 50.00, 2, 3),
(4, 'Arroz Integral', 10.00, 3, 3),
(5, 'Sofá Confort', 2500.00, 4, 1),
(6, 'Shampoo Revitalizante', 20.00, 5, 2),
(7, 'Monitor LED 24"', 800.00, 1, 1),
(8, 'Calça Jeans', 120.00, 2, 3),
(9, 'Feijão Carioca', 8.00, 3, 3),
(10, 'Mesa de Jantar', 1500.00, 4, 1),
(11, 'Condicionador Hidratante', 25.00, 5, 2),
(12, 'Fone de Ouvido Bluetooth', 100.00, 1, 1),
(13, 'Vestido Floral', 150.00, 2, 3),
(14, 'Azeite de Oliva Extra Virgem', 15.00, 3, 3),
(15, 'Guarda-Roupa 6 Portas', 1800.00, 4, 1),
(16, 'Perfume Masculino', 80.00, 5, 2),
(17, 'Mouse Sem Fio', 50.00, 1, 1),
(18, 'Blusa de Frio', 80.00, 2, 3),
(19, 'Cereal Matinal', 12.00, 3, 3),
(20, 'Sapateira', 200.00, 4, 1);

INSERT INTO vendas (id_venda, id_produto, quantidade, id_cliente, id_funcionario, data)
VALUES
(1, 1, 2, 1, 1, '2024-07-01'),
(2, 3, 1, 2, 2, '2024-07-02'),
(3, 5, 1, 3, 1, '2024-07-03'),
(4, 2, 1, 4, 3, '2024-07-04'),
(5, 4, 3, 5, 2, '2024-07-05'),
(6, 6, 2, 6, 4, '2024-07-06'),
(7, 8, 1, 7, 5, '2024-07-07'),
(8, 10, 1, 8, 6, '2024-07-08'),
(9, 12, 3, 9, 7, '2024-07-09'),
(10, 14, 2, 10, 8, '2024-07-10'),
(11, 16, 1, 11, 9, '2024-07-11'),
(12, 18, 1, 12, 10, '2024-07-12'),
(13, 20, 2, 13, 1, '2024-07-13'),
(14, 7, 1, 14, 2, '2024-07-14'),
(15, 9, 3, 15, 3, '2024-07-15'),
(16, 11, 1, 16, 4, '2024-07-16'),
(17, 13, 1, 17, 5, '2024-07-17'),
(18, 15, 2, 18, 6, '2024-07-18'),
(19, 17, 1, 19, 7, '2024-07-19'),
(20, 19, 3, 20, 8, '2024-07-20'),
(21, 1, 1, 21, 9, '2024-07-21'),
(22, 3, 2, 22, 10, '2024-07-22'),
(23, 5, 1, 23, 1, '2024-07-23'),
(24, 7, 3, 24, 2, '2024-07-24'),
(25, 9, 1, 25, 3, '2024-07-25'),
(26, 11, 2, 26, 4, '2024-07-26'),
(27, 13, 1, 27, 5, '2024-07-27'),
(28, 15, 1, 28, 6, '2024-07-28'),
(29, 17, 3, 29, 7, '2024-07-29'),
(30, 19, 1, 30, 8, '2024-07-30'),
(31, 2, 1, 31, 9, '2024-07-31'),
(32, 4, 2, 32, 10, '2024-08-01'),
(33, 6, 1, 33, 1, '2024-08-02'),
(34, 8, 2, 34, 2, '2024-08-03'),
(35, 10, 1, 35, 3, '2024-08-04'),
(36, 12, 1, 36, 4, '2024-08-05'),
(37, 14, 3, 37, 5, '2024-08-06'),
(38, 16, 1, 38, 6, '2024-08-07'),
(39, 18, 1, 39, 7, '2024-08-08'),
(40, 20, 2, 40, 8, '2024-08-09'),
(41, 1, 1, 1, 9, '2024-08-10'),
(42, 3, 2, 2, 10, '2024-08-11'),
(43, 5, 1, 3, 1, '2024-08-12'),
(44, 7, 3, 4, 2, '2024-08-13'),
(45, 9, 1, 5, 3, '2024-08-14'),
(46, 11, 2, 6, 4, '2024-08-15'),
(47, 13, 1, 7, 5, '2024-08-16'),
(48, 15, 1, 8, 6, '2024-08-17'),
(49, 17, 3, 9, 7, '2024-08-18'),
(50, 19, 1, 10, 8, '2024-08-19'),
(51, 2, 1, 11, 9, '2024-08-20'),
(52, 4, 2, 12, 10, '2024-08-21'),
(53, 6, 1, 13, 1, '2024-08-22'),
(54, 8, 2, 14, 2, '2024-08-23'),
(55, 10, 1, 15, 3, '2024-08-24'),
(56, 12, 1, 16, 4, '2024-08-25'),
(57, 14, 3, 17, 5, '2024-08-26'),
(58, 16, 1, 18, 6, '2024-08-27'),
(59, 18, 1, 19, 7, '2024-08-28'),
(60, 20, 2, 20, 8, '2024-08-29'),
(61, 1, 1, 21, 9, '2024-08-30'),
(62, 3, 2, 22, 10, '2024-08-31'),
(63, 5, 1, 23, 1, '2024-09-01'),
(64, 7, 3, 24, 2, '2024-09-02'),
(65, 9, 1, 25, 3, '2024-09-03'),
(66, 11, 2, 26, 4, '2024-09-04'),
(67, 13, 1, 27, 5, '2024-09-05'),
(68, 15, 1, 28, 6, '2024-09-06'),
(69, 17, 3, 29, 7, '2024-09-07'),
(70, 19, 1, 30, 8, '2024-09-08'),
(71, 2, 1, 31, 9, '2024-09-09'),
(72, 4, 2, 32, 10, '2024-09-10'),
(73, 6, 1, 33, 1, '2024-09-11'),
(74, 8, 2, 34, 2, '2024-09-12'),
(75, 10, 1, 35, 3, '2024-09-13'),
(76, 12, 1, 36, 4, '2024-09-14'),
(77, 14, 3, 37, 5, '2024-09-15'),
(78, 16, 1, 38, 6, '2024-09-16'),
(79, 18, 1, 39, 7, '2024-09-17'),
(80, 20, 2, 40, 8, '2024-09-18'),
(81, 1, 1, 1, 9, '2024-09-19'),
(82, 3, 2, 2, 10, '2024-09-20'),
(83, 5, 1, 3, 1, '2024-09-21'),
(84, 7, 3, 4, 2, '2024-09-22'),
(85, 9, 1, 5, 3, '2024-09-23'),
(86, 11, 2, 6, 4, '2024-09-24'),
(87, 13, 1, 7, 5, '2024-09-25'),
(88, 15, 1, 8, 6, '2024-09-26'),
(89, 17, 3, 9, 7, '2024-09-27'),
(90, 19, 1, 10, 8, '2024-09-28'),
(91, 2, 1, 11, 9, '2024-09-29'),
(92, 4, 2, 12, 10, '2024-09-30'),
(93, 6, 1, 13, 1, '2024-10-01'),
(94, 8, 2, 14, 2, '2024-10-02'),
(95, 10, 1, 15, 3, '2024-10-03'),
(96, 12, 1, 16, 4, '2024-10-04'),
(97, 14, 3, 17, 5, '2024-10-05'),
(98, 16, 1, 18, 6, '2024-10-06'),
(99, 18, 1, 19, 7, '2024-10-07'),
(100, 20, 2, 20, 8, '2024-10-08'),
(101, 1, 1, 21, 9, '2024-10-09'),
(102, 3, 2, 22, 10, '2024-10-10'),
(103, 5, 1, 23, 1, '2024-10-11'),
(104, 7, 3, 24, 2, '2024-10-12'),
(105, 9, 1, 25, 3, '2024-10-13'),
(106, 11, 2, 26, 4, '2024-10-14'),
(107, 13, 1, 27, 5, '2024-10-15'),
(108, 15, 1, 28, 6, '2024-10-16'),
(109, 17, 3, 29, 7, '2024-10-17'),
(110, 19, 1, 30, 8, '2024-10-18'),
(111, 2, 1, 31, 9, '2024-10-19'),
(112, 4, 2, 32, 10, '2024-10-20'),
(113, 6, 1, 33, 1, '2024-10-21'),
(114, 8, 2, 34, 2, '2024-10-22'),
(115, 10, 1, 35, 3, '2024-10-23'),
(116, 12, 1, 36, 4, '2024-10-24'),
(117, 14, 3, 37, 5, '2024-10-25'),
(118, 16, 1, 38, 6, '2024-10-26'),
(119, 18, 1, 39, 7, '2024-10-27'),
(120, 20, 2, 40, 8, '2024-10-28'),
(121, 1, 1, 1, 9, '2024-10-29'),
(122, 3, 2, 2, 10, '2024-10-30'),
(123, 5, 1, 3, 1, '2024-10-31');

-- SELECT é usado para recuperar dados de uma tabela
-- SINTAXE BÁSICA: SELECT coluna FROM tabela
	-- 1.1 Selecionar todos os clientes.
SELECT * FROM clientes;

	-- 1.2 Selecionar apenas nome e email dos clientes.
SELECT nome, email FROM clientes;

	-- 1.3 Selecionar produtos com o preço maior que 100
SELECT * FROM produtos 
WHERE preco > 100;

-- DISTINCT remove duplicatas e retorna apenas valores únicos
-- Útil para identificar categorias diferentes ou valores distintos
-- SINTAXE BÁSICA: SELECT DISTINCT coluna FROM tabela
	-- 2.1 Cidades distintas onde os clientes moram
SELECT  DISTINCT cidade FROM clientes;

	-- 2.2 Combinação única de cidade e gênero
SELECT DISTINCT cidade, genero FROM clientes;

	-- 2.3 Cargos distintos dos funcionários
SELECT DISTINCT cargo FROM funcionarios;

-- WHERE filtra registros baseado em condições específicas
-- Pode usar com operadores: =, <>, <, >, <=, >=, LIKE, IN, BETWEEN
-- SINTAXE BÁSICA: SELECT coluna FROM tabela WHERE = 'Condicao'
	-- 3.1 Clientes do Rio de Janeiro
SELECT * FROM clientes 
WHERE cidade = 'Rio de Janeiro';
	-- 3.2 Produtos entre 50 e 100
SELECT * FROM produtos 
WHERE preco BETWEEN 50 AND 100;
	-- 3.3 Funcionários com salário maior que 3000
SELECT * FROM funcionarios
WHERE salario > 3000;

-- LIMIT restringue o número de registro retornados
-- Útil para paginação ou vizualização rápida
-- SINTAXE BÁSICA: SELECT coluna FROM tabela LIMIT 1
	-- 4.1 Primeiros 5 clientes
SELECT * FROM clientes LIMIT 5;

	-- 4.2 5 clientes mais jovens
SELECT nome, data_nascimento 
FROM clientes 
ORDER BY data_nascimento DESC
LIMIT 5;

	-- 4.3 3 produtos mais caros
SELECT nome, preco
FROM produtos
ORDER BY preco DESC
LIMIT 3;

-- AS dá nomes temporários a coluna ou tabelas
-- SINTAXE BÁSICA: 
-- Melhora a legibilidade dos resultados
	-- 5.1 Renomear coluna salário para renda
SELECT salario AS renda
FROM funcionarios;

	-- 5.2 Apelido para tabela
SELECT nome AS f_nome
FROM funcionarios;

	-- 5.3 Apelido para cálculo
SELECT salario * '12' AS salario_anual 
FROM funcionarios;

-- Operadores Booleanos (AND, OR, NOT)
-- Combinam múltiplas condições na clausula WHERE
	-- 6.1: AND - Clientes mulheres de São Paulo
SELECT * FROM clientes
WHERE cidade = 'São Paulo' AND genero = 'Feminino';

	-- 6.2 AND - Funcionarios homens e solteiros
SELECT * FROM funcionarios
WHERE genero = 'Masculino' AND estado_civil = 'Solteiro';

	-- 6.3 OR Clientes de São Paulo ou Rio de Janeiro
SELECT * FROM clientes
WHERE cidade = 'São Paulo' 
OR cidade = 'Rio de Janeiro';

	-- 6.4 OR Compras de calça jeans ou feijão carioca
SELECT * FROM vendas
WHERE id_produto = 8 
OR id_produto = 9;

	-- 6.5 NOT Produtos que não são da categoria Eletrônicos
SELECT nome FROM categorias
WHERE NOT nome = 'Eletrônicos';
	--
SELECT nome FROM categorias
WHERE nome <> 'Eletrônicos';

	-- 6.6 AND NOT Clientes mulheres que não moram no Rio
SELECT * FROM clientes
WHERE genero = 'Feminino' AND NOT cidade = 'Rio de Janeiro';

	-- 6.7 Funcionarios que não tem dependentes
SELECT * FROM funcionarios 
WHERE NOT dependentes;
	--
SELECT * FROM funcionarios 
WHERE dependentes = 0;

	-- 6.8 Vendas de calça jeans de clientes que não moram no Rio de Janeiro
SELECT * FROM vendas, produtos, clientes
WHERE vendas.id_produto = produtos.id_produto
AND vendas.id_cliente = clientes.id_cliente
AND produtos.nome = 'Calça Jeans'
AND clientes.cidade <> 'Rio de Janeiro';
	-- 
SELECT * FROM vendas
WHERE id_produto = (SELECT id_produto FROM produtos WHERE nome = 'Calça Jeans')
AND NOT id_cliente IN (SELECT id_cliente FROM clientes WHERE cidade = 'Rio de Janeiro');

-- 7 Funções de Agregação
-- AVG: média
	-- 7.1 Média salarial dos funcionários
SELECT AVG(salario)
FROM funcionarios;

	-- 7.2 Média de preço dos produtos
SELECT AVG(preco)
FROM produtos;

-- SUM: soma
	-- 7.3 Soma de todas as vendas
SELECT SUM(quantidade)
FROM vendas;

	-- 7.4 Soma das rendas dos clientes
SELECT SUM(renda)
FROM clientes;

-- MAX: máximo, MIN: mínimo
	-- 7.5 Produto mais caro
SELECT MAX(preco) 
FROM produtos;

	-- 7.6 Produto mais barato
SELECT MIN(preco)
FROM produtos;

	-- 7.7 Maior salario
SELECT MAX(salario)
FROM funcionarios;

	-- 7.8 Menor renda
SELECT MIN(renda)
FROM clientes;

-- GROUP BY
-- Agrupa dados
	-- 8.1 quantidade de clientes por cidade
SELECT cidade, COUNT(*)
FROM clientes
GROUP BY cidade;

	-- 8.2 Média salarial por cargo
SELECT cargo, ROUND(AVG(salario),2) AS Média_Salarial
FROM funcionarios
GROUP BY cargo;

	-- 8.3 total vendido por produto
SELECT id_produto, SUM(quantidade)
FROM vendas
GROUP BY id_produto;

	-- 8.4 quantidade de clientes por genero
SELECT genero, COUNT(*) AS quantidade 
FROM clientes
GROUP BY genero;

	-- 8.5 quantidade de funcionarios por estado civil
SELECT estado_civil, COUNT(*) AS estado_civil
FROM funcionarios
GROUP BY estado_civil;

-- HAVING
-- Filtra grupos criados pelo GROUP BY
	-- 9.1 Cidades com mais de 5 clientes
SELECT cidade, COUNT(*)
FROM clientes
GROUP BY cidade
HAVING COUNT(*) > 5;

	-- 9.2 Cargos com média salarial maior que 4000
SELECT cargo, ROUND(AVG(salario),2) AS media_salarial
FROM funcionarios 
GROUP BY cargo
HAVING ROUND(AVG(salario),2) > 4000;

	-- 9.3 Produtos com total vendido maior que 10
SELECT id_produto, SUM(quantidade) AS total_vendido
FROM vendas
GROUP BY id_produto
HAVING SUM(quantidade) > 10;

-- BETWEEN
-- Procura valores ENTRE dois valores
	-- 10.1 Produtos com preco entre 50 e 100
SELECT * FROM produtos
WHERE preco 
BETWEEN 50 AND 100;

	-- 10.2 Clientes com renda entre 3000 e 5000
SELECT * FROM clientes
WHERE renda
BETWEEN 3000 AND 5000;

	-- 10.3 Vendas feitas em julho de 2024
SELECT * FROM vendas
WHERE data 
BETWEEN '2024-07-01' AND '2024-07-31';

-- LIKE
-- Procura palavras ou letras
	-- 11.1 Clientes que começam com João
SELECT * FROM clientes
WHERE nome LIKE 'João%';

	-- 11.2 Produtos que possuem a palavra jeans
SELECT * FROM produtos
WHERE nome LIKE '%jeans%';

	-- 11.3 Emails que terminam com gmail.com
SELECT * FROM clientes
WHERE email LIKE '%gmail.com';

-- ORDER BY
-- Ordenar resultados, ASC = crescente, DESC = decrescente
	-- 12.1 Clientes em ordem alfabetica
SELECT * FROM clientes
ORDER BY nome ASC;

	-- 12.2 Produtos do mais caro para o mais barato
SELECT * FROM produtos
ORDER BY preco DESC;

	-- 12.3 Funcionários ordenados por cargo
SELECT nome, cargo FROM funcionarios
ORDER BY cargo ASC;

-- UNION
-- Combina resultados de duas ou mais consultas SELECT
-- As consultas devem ter o mesmo número de colunas e tipos compatíveis
-- 13.1. Todos os nomes (clientes e funcionários) em ordem alfabética
SELECT nome, 'Cliente' AS TIPO
FROM clientes
UNION
SELECT nome, 'Funcionario' AS funcionario
FROM funcionarios;

-- 13.2. Cidades de clientes e fornecedores
SELECT cidade, 'Cliente' AS TIPO
FROM clientes
UNION
SELECT cidade, 'Fornecedores' AS TIPO
FROM fornecedores;

-- 13.3. Produtos baratos e caros
SELECT nome, preco, 'Barato' AS Categoria
FROM produtos
WHERE preco < 50
UNION
SELECT nome, preco, 'Caro' AS Categoria
FROM produtos
WHERE preco > 50;

-- NULL E NOT NULL
-- Verifica se valores são nulos ou não nulos
-- Observação: No seu banco, todas colunas são NOT NULL
-- 14.1: Clientes com email nulo
SELECT * FROM clientes
WHERE email IS NULL;
-- 14.2: Clientes com email preenchido
SELECT * FROM clientes 
WHERE email IS NOT NULL;
 
-- -- TRIM - Remoção de espaços
-- Remove espaços em branco no início e fim de strings
-- Útil para limpar dados importados
-- 15.1 Remover espaços do nome
SELECT TRIM(nome)
FROM clientes;
-- 15.2 Remover espaços do endereço
SELECT TRIM(endereco)
FROM clientes;
-- 15.3. Nomes sem espaços extras
SELECT nome, TRIM(nome) AS nome_limpo
FROM clientes;
-- 15.4. Endereços formatados
SELECT endereco, TRIM(endereco) AS endereco_limpo
FROM clientes;
-- 15.5. Emails limpos
 SELECT email, TRIM(email) AS email_limpo
FROM clientes;
 
-- 15. REPLACE
-- Troca um texto por outro
-- SINTAXE BÁSICA:
-- SELECT REPLACE(coluna, 'texto_antigo', 'texto_novo')
-- FROM tabela;
-- 15.1: Substituindo gêneros por siglas
SELECT nome, REPLACE(REPLACE(genero, 'Masculino', 'M'), 'Feminino', 'F') AS genero
FROM clientes;

-- 15.2: Formatando telefones
SELECT nome, REPLACE(telefone, '-', ' ') AS telefone_novo
FROM clientes;

-- 15.3: Substituir 'Av.' por 'Avenida' nos endereços
SELECT endereco, REPLACE(endereco, 'Av.', 'Avenida') AS endereco_atualizado
FROM clientes;

-- 15.4: Substituir domínio de email
 SELECT email, REPLACE(email, 'email.com','gmail.com') AS dominio_atualizado
 FROM clientes;
 
-- LPAD
-- 16.1 IDs formatados com zeros
SELECT LPAD(id_cliente, 5, '0') AS id_formatado
FROM clientes;

-- 16.2 Códigos de produto
SELECT LPAD(id_produto, 5, 'cdg') AS cdg_produto
FROM produtos;

-- 16.3 Formatar telefones
SELECT LPAD(telefone, 18, '+55') AS telefone_atualizado
FROM clientes;
 
-- SUBSTRING - Extrair parte do texto
-- Extrai uma parte de uma string baseada em posição e tamanho
-- 17.1. Iniciais dos clientes
SELECT SUBSTRING(nome, 1, 2) AS inicial
FROM clientes;

-- 17.2 Mês de nascimento dos funcionários
SELECT nome, SUBSTRING(data_nascimento, 6, 2) AS mes_nascimento
FROM clientes;

-- 17.3. Domínio de emails
SELECT email, SUBSTRING(email, POSITION('@' IN email) +1) AS dominio
FROM clientes;
 
-- 18. UPPER/LOWER
-- 18.1. Nomes em maiúsculo
SELECT UPPER(nome) AS nome_maiusculo
FROM clientes;
 
SELECT LOWER(nome) AS nome_minusculo
FROM clientes;
-- 18.2. Cargos em maiúsculo
SELECT UPPER(cargo) AS cargo_maiusculo
FROM funcionarios;

SELECT LOWER(cargo) AS cargo_minusculo
FROM funcionarios;

-- 18.3. Categorias em maiúsculo
 SELECT UPPER(nome) AS categoria_maiusculo
FROM categorias;

SELECT LOWER(nome) AS categoria_minusculo
FROM categorias;
 
-- 19. LENGTH
-- 19.1. Tamanho dos nomes dos produtos
SELECT nome, LENGTH(nome) AS tamanho_nome
FROM produtos;

-- 19.2. Endereços mais longos
SELECT endereco, LENGTH(endereco) AS endereco_longo
FROM clientes
ORDER BY endereco_longo DESC;

-- 19.3. Média de tamanho de emails
 SELECT AVG(LENGTH(email))AS media_email 
 FROM clientes;

-- 20. CAST
-- 20.1. Preços como inteiros
SELECT nome, CAST(preco AS SIGNED) AS preco_int
FROM produtos;

-- 20.2. Datas como strings
SELECT data, CAST(data AS CHAR) AS data_texto
FROM vendas;

-- 20.3. Convertendo string para data
 SELECT CAST('2026-05-15' AS DATE) AS data_convertida
 FROM vendas;
 
-- 21. CONCAT
-- 21.1. Nome completo com cidade
SELECT CONCAT(nome, ' - ', cidade) AS cliente_cidade
FROM clientes;

-- 21.2. Descrição de produtos
SELECT CONCAT(nome, ' - Custa R$ ', preco) AS nome_preco
FROM produtos;

-- 21.3. Endereço completo
 SELECT CONCAT(endereco, ' - ', cidade) AS endereco_completo
 FROM clientes;
 
-- 22. CASE WHEN
-- 22.1. Faixa etária dos clientes
SELECT nome, data_nascimento,
	CASE
		WHEN TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) < 18 THEN 'Jovem'
        WHEN TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) BETWEEN 18 AND 40 THEN 'Adulto'
        ELSE 'Adulto +'
	END AS faixa_etaria
FROM clientes;
-- 22.2. Classificação de produtos
SELECT nome, preco,
    CASE
        WHEN preco < 50 THEN 'Barato'
        WHEN preco BETWEEN 50 AND 100 THEN 'Médio'
        ELSE 'Caro'
    END AS classificacao
FROM produtos;

-- 22.3. Status de clientes
 SELECT nome, renda,
    CASE
        WHEN renda < 2000 THEN 'Baixa renda'
        WHEN renda BETWEEN 2000 AND 5000 THEN 'Média renda'
        ELSE 'Alta renda'
    END AS status_cliente
FROM clientes;
 
-- 23. VIEWS
-- 23.1. View de clientes premium
CREATE VIEW clientes_premium AS
SELECT nome, renda
FROM clientes
WHERE renda > 5000;
 
SELECT *
FROM clientes_premium;

-- 23.2. View de produtos por categoria
CREATE VIEW produtos_categoria AS
SELECT nome, preco,
    CASE
        WHEN preco < 50 THEN 'Barato'
        WHEN preco BETWEEN 50 AND 100 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria
FROM produtos;

SELECT *
FROM produtos_categoria;

-- 23.3. View de desempenho de vendas
CREATE VIEW desempenho_vendas AS
SELECT vendas.id_venda, produtos.nome 
AS produto, vendas.quantidade, produtos.preco,
    (vendas.quantidade * produtos.preco) 
AS total_venda
FROM vendas, produtos
WHERE vendas.id_produto = produtos.id_produto;

SELECT *
FROM desempenho_vendas;

-- 
 CREATE VIEW desempenho_vendas1 AS
SELECT id_produto, quantidade
FROM vendas;

SELECT *
FROM desempenho_vendas1;

ALTER TABLE produtos
ADD estoque INT;

UPDATE produtos SET estoque = 15 WHERE id_produto = 1;
UPDATE produtos SET estoque = 60 WHERE id_produto = 2;
UPDATE produtos SET estoque = 25 WHERE id_produto = 3;
UPDATE produtos SET estoque = 100 WHERE id_produto = 4;
UPDATE produtos SET estoque = 8 WHERE id_produto = 5;
UPDATE produtos SET estoque = 35 WHERE id_produto = 6;
UPDATE produtos SET estoque = 50 WHERE id_produto = 7;
UPDATE produtos SET estoque = 18 WHERE id_produto = 8;
UPDATE produtos SET estoque = 90 WHERE id_produto = 9;
UPDATE produtos SET estoque = 5 WHERE id_produto = 10;
UPDATE produtos SET estoque = 45 WHERE id_produto = 11;
UPDATE produtos SET estoque = 70 WHERE id_produto = 12;
UPDATE produtos SET estoque = 20 WHERE id_produto = 13;
UPDATE produtos SET estoque = 110 WHERE id_produto = 14;
UPDATE produtos SET estoque = 12 WHERE id_produto = 15;
UPDATE produtos SET estoque = 40 WHERE id_produto = 16;
UPDATE produtos SET estoque = 65 WHERE id_produto = 17;
UPDATE produtos SET estoque = 22 WHERE id_produto = 18;
UPDATE produtos SET estoque = 85 WHERE id_produto = 19;
UPDATE produtos SET estoque = 7 WHERE id_produto = 20;

INSERT INTO clientes VALUES
(41, 'Paula Mendes', '(11)99999-0001', 'Campinas',
'paula@email.com', 'Feminino',
'Rua Nova, 10', 4500, '1990-01-01'),

(42, 'Ricardo Alves', '(11)99999-0002', 'Sorocaba',
'ricardo@email.com', 'Masculino',
'Rua Azul, 20', 7000, '1985-03-15');

INSERT INTO funcionarios VALUES
(11, 'Márcia Lima', '1992-05-20',
'Feminino', 'Solteira', 0,
'Vendedora', 3100),

(12, 'João Pedro', '1995-08-11',
'Masculino', 'Solteiro', 0,
'Caixa', 2800);

INSERT INTO fornecedores VALUES
(4, 'Fornecedor D', 'Curitiba',
'Rua Nova Esperança', 4567);

INSERT INTO categorias VALUES
(6, 'Brinquedos');

INSERT INTO produtos VALUES
(21, 'Tablet Gamer', 2200, 1, 1, 10),
(22, 'Perfume Floral', 180, 5, 2, 30),
(23, 'Boneca Infantil', 90, 6, 1, 50);

ALTER TABLE produtos
DROP FOREIGN KEY produtos_ibfk_1;

INSERT INTO produtos VALUES
(24, 'Produto Sem Fornecedor',
150, 2, NULL, 12);

ALTER TABLE produtos
DROP FOREIGN KEY produtos_ibfk_2;

INSERT INTO produtos VALUES
(25, 'Produto Sem Categoria',
300, NULL, 1, 9);

-- INNER JOIN
-- 1)Mostrar nome do cliente e produto comprado
SELECT c.nome,  p.nome, p.preco
FROM clientes c
INNER JOIN vendas v ON c.id_cliente = v.id_cliente
INNER JOIN produtos p ON p.id_produto = v.id_produto;


-- 2) Mostrar funcionário e data da venda
SELECT f.nome, v.data
FROM funcionarios f 
INNER JOIN vendas v ON f.id_funcionario = v.id_funcionario; 

-- 3) Mostrar produto, categoria e fornecedor
SELECT p.nome AS Produto, 
		c.nome AS Categoria, 
        forn.nome AS Fornecedor
FROM produtos p 
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
INNER JOIN fornecedores forn ON forn.id_fornecedor = p.id_fornecedor;

-- LEFT JOIN
-- 1) Mostrar todos os clientes incluindo os que nunca compraram
SELECT c.*
FROM clientes c 
LEFT JOIN vendas v ON c.id_cliente = v.id_cliente;

-- 2) Mostrar todos os produtos incluindo os que nunca foram vendidos
SELECT p.*
FROM produtos p 
LEFT JOIN vendas v ON p.id_produto = v.id_produto;

-- 3) Mostrar todas as categorias incluindo categorias sem produtos
SELECT DISTINCT c.* 
FROM categorias c
LEFT JOIN produtos p ON p.id_categoria = c.id_categoria;

-- RIGHT JOIN
-- 1) Mostrar todas as vendas incluindo vendas sem cliente correspondente
SELECT v.*, c.nome
FROM clientes c 
RIGHT JOIN vendas v ON v.id_cliente = c.id_cliente;


-- 2) Mostrar todos os fornecedores incluindo os que não possuem produtos
SELECT forn.*
FROM produtos p 
RIGHT JOIN fornecedores forn ON p.id_fornecedor = forn.id_fornecedor;


-- 3) Mostrar todos os funcionários incluindo os que nunca realizaram vendas
SELECT f.* 
FROM vendas v 
RIGHT JOIN funcionarios f ON v.id_funcionario = f.id_funcionario; 


-- FULL JOIN
-- 1) Mostrar todos os clientes e todas as vendas, associados ou não
SELECT *
FROM clientes c
LEFT JOIN vendas v ON c.id_cliente = v.id_cliente
UNION
SELECT *
FROM clientes c
RIGHT JOIN vendas v ON c.id_cliente = v.id_cliente;

-- 2) Mostrar todos os produtos
-- e todas as categorias, associados ou não
SELECT *
FROM produtos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria
UNION
SELECT *
FROM produtos p
RIGHT JOIN categorias c ON p.id_categoria = c.id_categoria;

-- 3) Mostrar todos os fornecedores
-- e todos os produtos, associados ou não
SELECT *
FROM fornecedores f
LEFT JOIN produtos p ON f.id_fornecedor = p.id_fornecedor
UNION
SELECT *
FROM fornecedores f
RIGHT JOIN produtos p ON f.id_fornecedor = p.id_fornecedor;

-- ANTI JOIN
-- 1) Mostrar clientes que nunca compraram
SELECT c.* 
FROM clientes c 
LEFT JOIN vendas v ON v.id_cliente = c.id_cliente
WHERE v.id_venda IS NULL;


-- 2) Mostrar produtos que nunca foram vendidos
SELECT p.* 
FROM produtos p 
LEFT JOIN vendas v ON v.id_produto = p.id_produto
WHERE v.id_venda IS NULL;


-- 3) Mostrar funcionários que nunca fizeram vendas
SELECT f.* 
FROM funcionarios f 
LEFT JOIN vendas v ON v.id_funcionario = f.id_funcionario
WHERE v.id_venda IS NULL;


-- ANTI LEFT JOIN
-- 1) Mostrar categorias sem produtos
SELECT c.*
FROM categorias c 
LEFT JOIN produtos p ON p.id_categoria = c.id_categoria
WHERE p.id_produto IS NULL;


-- 2) Mostrar fornecedores sem produtos
SELECT forn.*
FROM fornecedores forn
LEFT JOIN produtos p ON p.id_fornecedor = forn.id_fornecedor
WHERE p.id_produto IS NULL;

-- 3) Mostrar clientes sem compras
SELECT c.*
FROM clientes c
LEFT JOIN vendas v ON v.id_cliente = c.id_cliente
WHERE v.id_venda IS NULL;

-- ANTI RIGHT JOIN
-- 1) Mostrar vendas sem clientes válidos
SELECT v.* 
FROM clientes c 
RIGHT JOIN vendas v ON v.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;

-- 2) Mostrar produtos sem categoria
SELECT p.* 
FROM categorias c 
RIGHT JOIN produtos p ON p.id_categoria = c.id_categoria
WHERE c.id_categoria IS NULL;

-- 3) Mostrar produtos sem fornecedor
SELECT p.* 
FROM fornecedores forn 
RIGHT JOIN produtos p ON p.id_fornecedor = forn.id_fornecedor
WHERE  forn.id_fornecedor IS NULL;

-- ANTI FULL JOIN
-- 1) Mostrar clientes sem vendas e vendas sem clientes
SELECT c.nome, v.id_venda 
FROM clientes c 
LEFT JOIN vendas v ON v.id_cliente = c.id_cliente
WHERE v.id_venda IS NULL
UNION
SELECT c.nome, v.id_venda 
FROM clientes c 
RIGHT JOIN vendas v ON v.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;

-- 2)Mostrar produtos sem categoria e categorias sem produtos
SELECT p.nome, c.nome 
FROM produtos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE c.id_categoria IS NULL
UNION 
SELECT p.nome, c.nome
FROM produtos p
RIGHT JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.id_produto IS NULL;


-- 3) Mostrar fornecedores sem produtos e produtos sem fornecedor
SELECT forn.nome, p.nome
FROM fornecedores forn
LEFT JOIN produtos p 
    ON p.id_fornecedor = forn.id_fornecedor
WHERE p.id_produto IS NULL
UNION
SELECT forn.nome, p.nome
FROM fornecedores forn
RIGHT JOIN produtos p 
    ON p.id_fornecedor = forn.id_fornecedor
WHERE forn.id_fornecedor IS NULL;