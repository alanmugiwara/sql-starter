CREATE DATABASE db_escola;
USE db_escola;

CREATE TABLE cursos (
	id INT PRIMARY KEY,
    nome VARCHAR(50),
    duracao_meses INT
);

CREATE TABLE alunos (
	id INT PRIMARY KEY,
    nome VARCHAR (100),
    idade INT,
    curso_id INT,
	FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO cursos (id, nome, duracao_meses)
VALUES 
(1, 'Engenharia de Software', 48),
(2, 'Administração', 36),
(3, 'Arquitetura', 60),
(4, 'Marketing', 24),
(5, 'Direito', 48);

INSERT INTO alunos (id, nome, idade, curso_id)
VALUES 
(1, 'Jujuh do Caruru', 20, 1),
(2, 'Juca Machuca', 22, 2),
(3, 'Carlos Oliveira', 25, 1),
(4, 'Beti Fortalece', 23, 3),
(5, 'Pedro Costa', 21, 2);

CREATE USER 'analista_bi'@'localhost' IDENTIFIED BY 'user1234';
CREATE USER 'sistema'@'localhost' IDENTIFIED BY 'user_root';

GRANT SELECT ON db_escola.* TO 'analista_bi'@'localhost';
GRANT SELECT, UPDATE,  DELETE ON db_escola.* TO 'sistema'@'localhost'; 

CREATE USER 'sistema_SELECT'@'localhost' IDENTIFIED BY 'user8888'; 
GRANT SELECT ON db_escola.* TO 'sistema_SELECT'@'localhost';

REVOKE SELECT ON db_escola.* FROM 'sistema'@'localhost';