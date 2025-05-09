--> Exercícios DDL  

--> a.  Criar o banco de dados 
CREATE DATABASE escola;

--> b.   Criar as tabelas 
-- Tabela de alunos
CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    email VARCHAR(100)
);

-- Tabela de cursos
CREATE TABLE cursos (
    id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

-- Tabela de matrículas
CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

--> c. Adicione uma coluna telefone na tabela alunos
ALTER TABLE alunos ADD telefone VARCHAR(20)

--> d.  Modifi que o tipo da coluna carga_horaria para SMALLINT
ALTER TABLE cursos MODIFY COLUMN carga_horaria SMALLINT;

--> e. Exclua a tabela matriculas. (Apenas para treinar DROP, recrie depois se quiser continuar)
-- DROP TABLE matriculas; "Não fiz isso pra não dar erro na hora de inserir"

--> Exercícios DML

--> a. Inserir Registros
-- Inserir alunos
INSERT INTO alunos (id_aluno, nome, data_nascimento, email, telefone)
VALUES
(1, 'Ana Souza', '2000-05-10', 'ana@email.com', '11999990000'),
(2, 'Carlos Lima', '1999-11-22', 'carlos@email.com', '11988887777');

-- Inserir cursos
INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES
(101, 'Lógica de Prog.', 60),
(102, 'Banco de Dados', 80);

-- Inserir matrículas
INSERT INTO matriculas (id_matricula, id_aluno, id_curso, data_matricula)
VALUES
(1001, 1, 101, '2024-03-10'),
(1002, 2, 102, '2024-03-12');

--> b. Atualize o telefone de Ana Souza para '11911112222'
UPDATE alunos SET telefone = '11911112222' WHERE id_aluno = 1;

--> c. Remova o curso de nome 'Lógica de Programação'
DELETE FROM cursos WHERE nome_curso = 'Lógica de Prog.';

--> d. Reinsira esse curso com ID 103 e carga horária 75
INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES (103, 'Lógica de Prog.', 75);

--> Exercícios DQL (Data Query Language)

--> a. Consultas básicas
-- Todos os alunos
SELECT * FROM alunos;

-- Todos os cursos com mais de 70 horas
SELECT * FROM cursos WHERE carga_horaria > 70;

-- Matrículas feitas após 01/03/2024
SELECT * FROM matriculas WHERE data_matricula > '2024-03-01';

--> b. Liste os nomes dos alunos com suas respectivas datas de nascimento.
SELECT nome, data_nascimento FROM alunos;

--> c. Liste os cursos ordenados pela carga horária (do maior para o menor).
SELECT * FROM cursos ORDER BY carga_horaria DESC;

--> d. Exiba os nomes dos alunos e os nomes dos cursos em que estão matriculados.
SELECT a.nome AS aluno, c.nome_curso AS curso
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN cursos c ON c.id_curso = m.id_curso;
