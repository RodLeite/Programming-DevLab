-- Criando a tabela Autores
CREATE TABLE Autores (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Criando a tabela Livros
CREATE TABLE Livros (
    id INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    ano_publicacao INT,
    autor_id INT,
    FOREIGN KEY(autor_id) REFERENCES Autores(id)
);

-- Inserindo dados na tabela Autores
INSERT INTO Autores VALUES (1, 'J.K. Rowling', 'Britânica');
INSERT INTO Autores VALUES (2, 'J.R.R. Tolkien', 'Britânico');

-- Inseridndo dados na tabela Livros
INSERT INTO Livros VALUES (1, 'Harry Potter e a Pedra Filosofal', 1997, 1);
INSERT INTO Livros VALUES (2, 'Harry Potter e a Câmara Secreta', 1998, 1);
INSERT INTO Livros VALUES (3, 'Harry Potter e o Prisioneiro de Azkaban', 1999, 1);
INSERT INTO Livros VALUES (4, 'O Senhor dos Anéis: A Sociedade do Anel', 1954, 2);
INSERT INTO Livros VALUES (5, 'O Senhor dos Anéis: As Duas Torres', 1954, 2);
INSERT INTO Livros VALUES (6, 'O Senhor dos Anéis: O Retorno do Rei', 1955, 2);


SELECT *
	FROM Livros inner 
	join Autores
    on Autores.id = Livros.autor_id