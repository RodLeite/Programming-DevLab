-- Criando a tabela Especies
CREATE TABLE especies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT
);

-- Criando a tabela Animais
CREATE TABLE animais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nasc DATE,
    peso DECIMAL(10,2),
    especie_id INT,
    FOREIGN KEY (especie_id) REFERENCES especies(id)
);

-- Inserindo dados na tabela animais
INSERT INTO especies (nome, descricao) VALUES
    ('Leão', 'O rei da selva.'),
    ('Elefante', 'Maior mamífero terrestre.'),
    ('Girafa', 'Maior animal terrestre com pescoço longo.');

-- Inserindo dados na tabela animais
INSERT INTO animais (nome, data_nasc, peso, especie_id) VALUES
    ('Simba', '2019-05-15', 150, 1),  -- Leão
    ('Nala', '2020-02-20', 140, 1),  -- Leão
    ('Dumbo', '2018-07-10', 3500, 2),  -- Elefante
    ('Babar', '2017-11-28', 3200, 2),  -- Elefante
    ('Melman', '2021-03-03', 1800, 3),  -- Girafa
    ('Gloria', '2020-11-12', 1700, 3),  -- Girafa
    ('Zazu', '2019-09-25', 120, 1),  -- Leão
    ('Rafiki', '2020-12-05', 110, 1);
    
    SELECT * FROM Animais;
    SELECT * FROM Especies;