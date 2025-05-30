CREATE DATABASE IF NOT EXISTS alura;
USE alura;

-- > CRIAÇÃO DA TABELA DE CLIENTES
CREATE TABLE tabelaclientes (
    ID_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR (250),
    INFORMACOES_DE_Contato VARCHAR (250)
);

-- > ADD NOVA COLUNA NA TABELA 
ALTER TABLE tabelaclientes 
ADD Endereco_cliente VARCHAR (250);

-- > RENOMEAR TABELA DE CLIENTES
RENAME TABLE tabelaclientes TO tabela_clientes;

-- > RENOMEAR COLUNA
ALTER TABLE tabela_clientes 
CHANGE INFORMACOES_DE_Contato Informacoes_de_Contato VARCHAR (250);
 
-- > INCLUSÃO DE CLIENTES
INSERT INTO tabela_clientes (ID_Cliente, Nome_Cliente, Informacoes_de_contato, Endereco_cliente)
VALUES 
(1, 'Gegeba Jurubeba', 'Rua', 'Baixa da Égua, Salvador BA'),
(2, 'Ana', 'ana@ana.com.br', 'Rua Nova Constituinte'),
(3, 'Carlos Pereira', 'carlos.pereira@email.com', 'Avenida rio, 67'),
(4, 'Carlos Pedrosa', 'carlos.pedrosa@email.com', 'Avenida rio, 64'),
(5, 'Patrícia Lima', 'patricia.lima@email.com', 'Rua das Flores 123'),
(6, 'Rodrigo Almeida', 'rodrigo.almeida@email.com', 'Avenida Central 456'),
(7, 'André Oliveira', 'andre.oliveira@email.com', 'Travessa do Sol 789'),
(8, 'Isabela Rodrigues', 'isabela.rodrigues@email.com', 'Rua da Paz 321'),
(9, 'Ricardo Sousa', 'ricardo.sousa@email.com', 'Alameda dos Sonhos 654'),
(10, 'Luana Gomes', 'luana.gomes@email.com', 'Praceta das Estrelas 987'),
(11, 'Juliano Costa', 'juliano.costa@email.com', 'Av. Principal 234'),
(12, 'Sandra Ferreira', 'sandra.ferreira@email.com', 'Rua da Liberdade 567'),
(13, 'Roberto Barbosa', 'roberto.barbosa@email.com', 'Rua da Esquina 432'),
(14, 'Alice Santos', 'alice.santos@email.com', 'Largo da Amizade 765'),
(15, 'Gustavo Lima', 'gustavo.lima@email.com', 'Avenida das Árvores 876'),
(16, 'Carla Silva', 'carla.silva@email.com', 'Travessa das Aves 345'),
(17, 'Daniel Oliveira', 'daniel.oliveira@email.com', 'Alameda dos Bosques 678'),
(18, 'Luciana Almeida', 'luciana.almeida@email.com', 'Rua das Colinas 123'),
(19, 'Fernando Pereira', 'fernando.pereira@email.com', 'Avenida das Ondas 987'),
(20, 'Marina Lima', 'marina.lima@email.com', 'Praceta dos Girassóis 456'),
(21, 'Lucas Rodrigues', 'lucas.rodrigues@email.com', 'Rua das Montanhas 321'),
(22, 'Adriana Sousa', 'adriana.sousa@email.com', 'Travessa dos Rios 654'),
(23, 'Eduardo Gomes', 'eduardo.gomes@email.com', 'Avenida das Pedras 789'),
(24, 'Marcia Costa', 'marcia.costa@email.com', 'Largo das Praias 234'),
(25, 'José Silva', 'jose.silva@email.com', 'Av. dos Ventos 432'),
(26, 'Beatriz Alves', 'beatriz.alves@email.com', 'Rua dos Coqueiros 765'),
(27, 'André Santos', 'andre.santos@email.com', 'Avenida dos Lagos 876'),
(28, 'Carolina Lima', 'carolina.lima@email.com', 'Travessa das Neves 345'),
(29, 'Fábio Rodrigues', 'fabio.rodrigues@email.com', 'Alameda dos Campos 678');

ALTER TABLE tabela_clientes 
CHANGE INFORMACOES_DE_Contato Informacoes_de_Contato VARCHAR (250);

INSERT INTO tabela_clientes (ID_Cliente, Nome_Cliente, INFORMACOES_DE_Contato, Endereco_cliente)
VALUE (30, 'Luan Santos do Nascimento', 'Técnico de Informática', 'Do lado do Salão de Dona Amélia e de Duda');

SELECT* FROM tabela_clientes;

-- > CRIAÇÃO DA TABELA DE CATEGORIAS
CREATE TABLE tabela_categorias (
 	ID_categoria INT AUTO_INCREMENT PRIMARY KEY,
	Nome_categoria VARCHAR (250),
	Descricao_categoria TEXT
);

INSERT INTO tabela_categorias (ID_categoria, Nome_categoria, Descricao_categoria)
VALUES 
(1, 'Periféricos', 'Dispositivos como mouses, teclados, headsets'),
(2, 'Monitores', 'Monitores de vídeo diversos'),
(3, 'Hardware', 'Componentes internos do computador'),
(4, 'Notebooks', 'Computadores portáteis'),
(5, 'Impressoras', 'Impressoras e multifuncionais'),
(6, 'Mobiliário', 'Mesas, cadeiras e suportes');

SELECT*FROM tabela_categorias;

-- > CRIAÇÃO DA TABELA DE FORNECEDORES
CREATE TABLE tabela_fornecedores (
	ID_fornecedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Pais_de_origem VARCHAR (50),
	Informacoes_de_contato VARCHAR (50),
	Data_de_inicio DATE
);

INSERT INTO tabela_fornecedores (ID_fornecedor, Pais_de_origem, Informacoes_de_contato, Data_de_inicio)
VALUES 
(1, 'Brasil', 'contato@fornecedor1.com', '2023-01-01'),
(2, 'China', 'contato@fornecedor2.com', '2022-12-01'),
(3, 'EUA', 'contato@fornecedor3.com', '2023-03-15'),
(4, 'Alemanha', 'contato@fornecedor4.com', '2023-02-10');

SELECT*FROM tabela_fornecedores;

-- > CRIAÇÃO DA TABELA DE PRODUTOS
CREATE TABLE tabela_produtos (
 	ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
 	Nome_do_Produto VARCHAR (250),
 	Descricao TEXT,
 	Categoria INT,
 	Preco_de_Compra DECIMAL (10,2),
 	Unidade VARCHAR (50),
 	Fornecedor INT,
 	Data_de_Inclusao DATE,
  FOREIGN KEY (Categoria) REFERENCES tabela_categorias (ID_categoria),
  FOREIGN KEY (Fornecedor) REFERENCES tabela_fornecedores (ID_fornecedor)
);

-- > INCLUSÃO DE VALORES
INSERT INTO tabela_produtos (ID_Produto, Nome_do_Produto, Descricao, Categoria, Preco_de_Compra, Unidade, Fornecedor, Data_de_Inclusao)
VALUES
(1, 'Mouse Gamer RGB', 'Mouse com iluminação RGB e 6 botões programáveis', 1, 120.00, 'unidade', 1, '2024-01-15'),
(2, 'Teclado Mecânico', 'Teclado mecânico com switches azuis', 1, 250.00, 'unidade', 2, '2024-02-10'),
(3, 'Monitor 24 Polegadas', 'Monitor LED Full HD 75Hz', 2, 899.90, 'unidade', 3, '2024-03-05'),
(4, 'HD Externo 1TB', 'HD portátil USB 3.0', 3, 340.00, 'unidade', 1, '2024-04-01'),
(5, 'Notebook Lenovo Ideapad', 'Notebook com i5, 8GB RAM e SSD 256GB', 4, 1950.00, 'unidade', 4, '2024-01-20'),
(6, 'Webcam Full HD', 'Webcam 1080p com microfone embutido', 1, 180.00, 'unidade', 2, '2024-02-28'),
(7, 'Switch Gigabit 8 portas', 'Switch de rede 10/100/1000 Mbps', 3, 420.00, 'unidade', 3, '2024-03-15'),
(8, 'Impressora Multifuncional', 'Impressora, scanner e copiadora', 5, 820.00, 'unidade', 4, '2024-04-10'),
(9, 'Memória RAM 8GB DDR4', 'Módulo de memória RAM para desktop', 3, 230.00, 'unidade', 1, '2024-01-25'),
(10, 'Fonte ATX 600W', 'Fonte de alimentação certificada 80 Plus', 3, 360.00, 'unidade', 2, '2024-03-20'),
(11, 'Gabinete Gamer Mid Tower', 'Gabinete com lateral de vidro temperado e RGB frontal', 3, 390.00, 'unidade', 3, '2024-02-05'),
(12, 'SSD 480GB SATA', 'Unidade de estado sólido 480GB para desktops e notebooks', 3, 270.00, 'unidade', 2, '2024-01-18'),
(13, 'Placa Mãe B450M', 'Placa mãe compatível com AMD Ryzen', 3, 550.00, 'unidade', 4, '2024-02-22'),
(14, 'Headset Gamer com Microfone', 'Fone de ouvido com áudio estéreo e cancelamento de ruído', 1, 210.00, 'unidade', 1, '2024-03-01'),
(15, 'Pen Drive 64GB USB 3.1', 'Pen Drive de alta velocidade', 3, 75.00, 'unidade', 2, '2024-04-04'),
(16, 'Placa de Vídeo GTX 1660', 'GPU dedicada com 6GB GDDR5', 3, 1980.00, 'unidade', 4, '2024-02-15'),
(17, 'Cadeira Gamer Reclinável', 'Cadeira ergonômica com apoio lombar', 6, 940.00, 'unidade', 1, '2024-03-18'),
(18, 'Leitor de Cartão SD USB-C', 'Leitor de cartão compatível com SD, microSD', 3, 89.90, 'unidade', 2, '2024-01-12'),
(19, 'Adaptador HDMI para VGA', 'Conversor de vídeo HDMI para VGA com áudio', 3, 65.00, 'unidade', 3, '2024-01-30'),
(20, 'Carregador Universal para Notebook', 'Fonte ajustável com várias voltagens', 4, 155.00, 'unidade', 2, '2024-02-14'),
(21, 'Suporte Articulado para Monitor', 'Suporte de mesa com ajuste de altura e inclinação', 2, 180.00, 'unidade', 1, '2024-03-08'),
(22, 'Kit Teclado e Mouse Wireless', 'Combo sem fio com alcance de até 10 metros', 1, 140.00, 'unidade', 2, '2024-04-02'),
(23, 'Roteador Dual Band 1200Mbps', 'Roteador com duas bandas de frequência, ideal para streaming e jogos', 3, 310.00, 'unidade', 3, '2024-04-12'),
(24, 'Estabilizador 500VA', 'Proteção contra surtos elétricos para PCs', 3, 210.00, 'unidade', 1, '2024-01-09'),
(25, 'Controle Xbox Wireless', 'Controle para PC e Xbox com conexão Bluetooth', 1, 350.00, 'unidade', 2, '2024-04-15'),
(26, 'Cooler para Processador', 'Sistema de resfriamento com dissipador e fan', 3, 140.00, 'unidade', 4, '2024-03-11'),
(27, 'Filtro de Linha com 5 Tomadas', 'Extensão elétrica com proteção contra surtos', 3, 65.00, 'unidade', 3, '2024-02-08'),
(28, 'Hub USB 3.0 com 4 portas', 'Expansão de USB com alimentação externa', 3, 110.00, 'unidade', 2, '2024-01-16'),
(29, 'Projetor Portátil HDMI', 'Projetor para apresentações e vídeos Full HD', 2, 1850.00, 'unidade', 4, '2024-03-25'),
(30, 'Tablet Android 10"', 'Tablet com 64GB, Wi-Fi e câmera frontal', 4, 970.00, 'unidade', 2, '2024-04-18');

CREATE TABLE tabela_pedidos (
 	id INT AUTO_INCREMENT PRIMARY KEY,
	data_do_pedido DATE,
	status_pedido VARCHAR(50),
	total_do_pedido DECIMAL (10, 2),
	cliente INT,
	data_de_envio_estimada DATE,
	FOREIGN KEY (cliente) REFERENCES tabela_clientes(ID_Cliente)
);

INSERT INTO tabela_pedidos (data_do_pedido, status_pedido, total_do_pedido, cliente, data_de_envio_estimada)
VALUES
('2024-05-01', 'Concluído', 400.00,  1,  '2024-05-03'),
('2024-05-02', 'Concluído', 415.50,  2,  '2024-05-04'),
('2024-05-03', 'Pendente', 500.00,  3,  '2024-05-06'),
('2024-05-04', 'Concluído', 620.00,  4,  '2024-05-07'),
('2024-05-05', 'Cancelado', 750.00,  5,  '2024-05-10'),
('2024-05-06', 'Concluído', 900.00,  6,  '2024-05-09'),
('2024-05-07', 'Pendente', 410.00,  7,  '2024-05-11'),
('2024-05-08', 'Concluído', 430.00,  8,  '2024-05-12'),
('2024-05-09', 'Concluído', 550.00,  9,  '2024-05-14'),
('2024-05-10', 'Pendente', 800.00, 10,  '2024-05-13'),
('2024-05-11', 'Concluído', 420.00, 11,  '2024-05-15'),
('2024-05-12', 'Concluído', 480.00, 12,  '2024-05-16'),
('2024-05-13', 'Cancelado', 610.00, 13,  '2024-05-17'),
('2024-05-14', 'Concluído', 999.99, 14,  '2024-05-18'),
('2024-05-15', 'Pendente', 450.00, 15,  '2024-05-19'),
('2024-05-16', 'Concluído', 775.00, 16,  '2024-05-20'),
('2024-05-17', 'Concluído', 880.00, 17,  '2024-05-21'),
('2024-05-18', 'Pendente', 405.00, 18,  '2024-05-22'),
('2024-05-19', 'Concluído', 560.00, 19,  '2024-05-23'),
('2024-05-20', 'Cancelado', 430.00, 20,  '2024-05-24'),
('2024-05-01', 'Concluído',  50.00,  1, '2024-05-03'),
('2024-05-02', 'Pendente', 120.00,  2, '2024-05-04'),
('2024-05-03', 'Concluído', 210.00,  3, '2024-05-06'),
('2024-05-04', 'Cancelado',  80.00,  4, '2024-05-07'),
('2024-05-05', 'Pendente',  95.50,  5, '2024-05-10'),
('2024-05-06', 'Concluído', 300.00,  6, '2024-05-09'),
('2024-05-07', 'Pendente', 255.00,  7, '2024-05-11'),
('2024-05-08', 'Concluído', 350.00,  8, '2024-05-12'),
('2024-05-09', 'Cancelado', 330.00,  9, '2024-05-14'),
('2024-05-10', 'Concluído',  15.00, 10, '2024-05-13'),
('2024-05-11', 'Pendente', 200.00, 11, '2024-05-15'),
('2024-05-12', 'Concluído', 375.00, 12, '2024-05-16'),
('2024-05-13', 'Cancelado',  60.00, 13, '2024-05-17'),
('2024-05-14', 'Pendente', 150.00, 14, '2024-05-18'),
('2024-05-15', 'Concluído', 299.99, 15, '2024-05-19'),
('2024-05-16', 'Cancelado', 100.00, 16, '2024-05-20'),
('2024-05-17', 'Pendente',  85.00, 17, '2024-05-21'),
('2024-05-18', 'Concluído', 345.00, 18, '2024-05-22'),
('2024-05-19', 'Pendente', 275.00, 19, '2024-05-23');

SELECT * FROM tabela_pedidos;

-- > CRIAÇÃO DA TABELA DE PEDIDOS GOLD
CREATE TABLE tabela_pedidos_gold (
 	ID_pedido_gold INT AUTO_INCREMENT PRIMARY KEY,
	Data_pedido_gold DATE,
	Status_pedido_gold VARCHAR(50),
	Total_pedido_gold DECIMAL (10, 2),
	Cliente_gold INT,
	Data_De_Envio_Estimada_gold DATE,
-- > Liga a coluna "Cliente_gold" à tabela externa "tabela_clientes", especificamente à coluna (id_cliente) dessa tabela de clientes
FOREIGN KEY (cliente_gold) REFERENCES tabela_clientes(id_cliente)
);

INSERT INTO tabela_pedidos_gold (
ID_pedido_gold,
Data_pedido_gold,
Status_pedido_gold,
Total_pedido_gold,
Cliente_gold,
Data_De_Envio_Estimada_gold)
SELECT id, 
data_do_pedido,
status_pedido,
total_do_pedido,
cliente,
data_de_envio_estimada -- > Seleciona todas as colunas da tabela que serão chamadas
FROM tabela_pedidos -- > Espefifica que a origem das colunas citadas acima será a "tabela_pedidos"
WHERE total_do_pedido >=400;  -- > Defone como origem somente o que estiver na coluna "total_do_pedido" +  o parâmetro

SELECT * FROM tabela_pedidos_gold;

CREATE TABLE funcionarios (
	id_func INT PRIMARY KEY AUTO_INCREMENT,
    nome_func VARCHAR(250),
    idade_func INT,
    email_func VARCHAR(100),
    endereco_func VARCHAR(250)
);

RENAME TABLE funcionarios TO tabela_funcionarios;

INSERT INTO tabela_funcionarios (
id_func,
nome_func,
idade_func,
email_func,
endereco_func)

VALUES
('55', 'Zeca Goiabão', 70, 'zequinha@gmail.com', 'Rua Monte Formoso');

SELECT* FROM tabela_funcionarios;

-- > Verificar estrutura das tabelas
DESCRIBE tabela_clientes;
DESCRIBE tabela_categorias;
DESCRIBE tabela_fornecedores;
DESCRIBE tabela_produtos;

-- > Consultas
SELECT * FROM tabela_clientes;
SELECT * FROM tabela_categorias;
SELECT * FROM tabela_fornecedores;
SELECT * FROM tabela_produtos;