-- Criando o banco de dados 
CREATE DATABASE Empresa; 
USE Empresa;

-- Criando a tabela de Funcionários 
CREATE TABLE Funcionarios ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    data_nascimento DATE NOT NULL, 
    salario DECIMAL(10,2) NOT NULL, 
    departamento_id INT NOT NULL, 
    cargo_id INT NOT NULL, 
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id), 
    FOREIGN KEY (cargo_id) REFERENCES Cargos(id) 
);

-- Criando a tabela de Departamentos 
CREATE TABLE Departamentos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL 
    );

-- Criando a tabela de Cargos 
CREATE TABLE Cargos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    nivel VARCHAR(50) NOT NULL 
    );

-- Inserindo dados na tabela Departamentos 
INSERT INTO Departamentos (nome) VALUES ('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

-- Inserindo dados na tabela Cargos 
INSERT INTO Cargos (nome, nivel) VALUES 
('Analista', 'Pleno'), 
('Gerente', 'Sênior'), 
('Assistente', 'Júnior'), 
('Coordenador', 'Sênior'), 
('Desenvolvedor', 'Pleno');

-- Inserindo dados na tabela Funcionarios 
INSERT INTO Funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id) VALUES 
('Ana Silva', '1985-06-15', 5500.00, 1, 5), 
('Carlos Santos', '1990-03-22', 4800.00, 2, 1), 
('Bruna Costa', '1987-12-10', 6000.00, 3, 2), 
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5), 
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2), 
('Helena Martins', '1983-11-17', 5300.00, 1, 4), 
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1), 
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2), 
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);

-- 1) Encontrando o maior salário usando MAX e ALIAS
SELECT MAX(salario) AS MaiorSalario FROM Funcionarios;

-- 2) Encontrando o menor salário usando MAX e ALIAS
SELECT MIN(salario) AS MenorSalario FROM Funcionarios;

-- 3) Contando os funcionários usando COUNT e o coringa "*"
SELECT COUNT(*) AS QuantidadeFuncionarios FROM Funcionarios;

-- 4) Filtando todos os funcionários nascidos a partir de 1990 usando WHERE, o coringa "*", e operadoradores de comparação
SELECT * FROM Funcionarios 
WHERE data_nascimento >= '1990-01-01';

-- 5) Encontreando a média salarial usando a função AVERAGE pra calcular a média 
SELECT AVG(salario) AS MediaSalarial FROM Funcionarios;

-- 6) Extrando dos três primeiros caracteres de um funcionário usando SUBSTRING pra extração e COUNT
SELECT SUBSTRING('Ana Silva', 1, 3) AS ExtractString;
SELECT COUNT(column_name) FROM table_name; COUNT(column_name)


-- 7) Contando os guncionários por departamento usando ALIAS, JOIN E GROUP BY
SELECT DPTO.nome AS Departamento, COUNT(FUNC.id) AS Quantidade 
FROM Funcionarios FUNC
JOIN Departamentos DPTO ON FUNC.departamento_id = DPTO.id
GROUP BY DPTO.nome;

-- 8) Contar quantos funcionários existem ousando COUNT e FROM
SELECT COUNT(*) AS QuantidadeFuncionarios
FROM Funcionarios;

-- 9) Contando quantos funcionários ganham acima de R$ 5.000,00 usando COUNT e operador de comparação
SELECT COUNT(*) AS QuantidadeFuncionarios
FROM Funcionarios
WHERE salario > 5300;

-- 10) Contando quantos funcionários ganham abao de de R$ 4.000,00 usando COUNT e operador de comparação
SELECT COUNT(*) AS QuantidadeFuncionarios
FROM Funcionarios
WHERE salario < 5200;

-- A partir do script acima responda as questões abaixo:
-- 1) Encontre o maior salário 
-- 2) Encontre o menor salário 
-- 3) Qual a quantidade de funcionários?
-- 4) Filtre os funcionários nascidos a partir de 1990
-- 5) Encontre a média salarial
-- 6) Extraia os 3 primeiros caracteres do nome (SUBSTRING)
-- 7) Contar quantos funcionários por departamento 
-- 8) Contar quantos funcionários existem