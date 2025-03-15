CREATE DATABASE loja;
USE loja;

CREATE TABLE clientes (
    cod_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    cep CHAR(8)
);

CREATE TABLE pedidos (
    num_pedido INT NOT NULL,
    data_pedido DATE,
    item VARCHAR(255),
    valor DECIMAL(10, 0),
    cod_cliente INT NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente)
);

INSERT INTO clientes (nome, endereco, cidade, cep)
VALUES ('Juca Machuca','Cabrobó da Serra','Ximbicas','66666-666');

INSERT INTO pedidos (num_pedido, data_pedido, item, valor, cod_cliente)
VALUES (1,'2025-10-05','Livro', 50, 1);

SELECT *FROM clientes;
SELECT *FROM pedidos;