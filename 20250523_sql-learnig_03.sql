-- > Exercício 3
USE streaming;

CREATE TABLE participantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE
);

INSERT INTO participantes (nome, data_nascimento) VALUES
('Alice Ferreira', '2007-04-15'),
('Bruno Lima', '1998-08-21'),
('Carla Souza', '2010-11-30'),
('Daniel Monteiro', '2003-01-09');

DELIMITER $$

CREATE FUNCTION verifica_maioridade (data_nasc DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE idade INT;
    SET idade = TIMESTAMPDIFF(YEAR, data_nasc, DATE(NOW()));
    IF idade >= 18 THEN
        RETURN 'Maior de idade';
    ELSE
        RETURN 'Menor de idade';
    END IF;
END $$

SELECT verifica_maioridade('2000-01-01');

-- Substitua '2000-01-01' pela data de nascimento desejada
-- ou
SELECT nome, data_nascimento, verifica_maioridade(data_nascimento) AS status_maioridade FROM participantes;

DELIMITER ;