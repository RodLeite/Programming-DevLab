-- Criando a tabela categorias
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    publico_alvo VARCHAR(255)
);

-- Criando a tabela Filmes
CREATE TABLE filmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    sinopse TEXT,
    estudio VARCHAR(255),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);
-- Inserindo dados na tabela categorias
INSERT INTO categorias (nome, publico_alvo) VALUES
    ('Ação', 'Adulto'),
    ('Comédia', 'Família'),
    ('Drama', 'Adulto');

-- Inserindo dados na tabela filmes
INSERT INTO filmes (titulo, sinopse, estudio, categoria_id) VALUES
    ('Vingadores', 'Os heróis se reúnem para enfrentar Thanos.', 'Marvel', 1),
    ('Toy Story', 'As aventuras dos brinquedos de Andy.', 'Pixar', 2),
    ('Parasita', 'Uma família desempregada se infiltra em uma casa rica.', 'CJ', 3),
    ('O Rei Leão', 'A jornada de Simba para se tornar rei da savana.', 'Walt Disney', 2),
    ('Coringa', 'A história de um dos maiores vilões.', 'Warner', 3),
    ('Frozen', 'Elsa e Anna embarcam em uma jornada para descobrir a verdade sobre o passado.', 'Walt Disney', 2),
    ('Mad Max', 'Uma história de ação pós-apocalíptica.', 'Warner', 1),
    ('Forrest Gump', 'A vida de Forrest Gump e suas aventuras.', 'Paramount', 3);
    
    select * FROM categorias;
    select * FROM filmes;