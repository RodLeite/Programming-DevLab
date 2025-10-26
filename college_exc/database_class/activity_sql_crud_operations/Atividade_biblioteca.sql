CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Criando as tabelas
CREATE TABLE IF NOT EXISTS Editoras (
  id_editora INT NOT NULL AUTO_INCREMENT,
  nome_editora VARCHAR(45) NOT NULL,
  endereco_editora VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_editora)
);

-- Criando a tabela Livros
CREATE TABLE IF NOT EXISTS Livros (
  id_livro INT NOT NULL AUTO_INCREMENT,
  titulo_livro VARCHAR(45) NOT NULL,
  isbn_num VARCHAR(45) NOT NULL UNIQUE,
  ano_publi_livro DATE NOT NULL,
  editora_id INT NOT NULL,
  PRIMARY KEY (id_livro),
  FOREIGN KEY (editora_id) REFERENCES Editoras (id_editora)
);

-- Criando a tabela Autores
CREATE TABLE IF NOT EXISTS Autores (
  id_autor INT NOT NULL AUTO_INCREMENT,
  nome_autor VARCHAR(45) NOT NULL,
  data_nascimento_autor DATE NOT NULL,
  nacionalidade_autor VARCHAR(45) DEFAULT 'Brasil',
  PRIMARY KEY (id_autor)
);

-- Criando a tabela Emprestimos
CREATE TABLE IF NOT EXISTS Emprestimos (
  id_emprestimo INT NOT NULL AUTO_INCREMENT,
  data_emprestimo DATE NOT NULL, 
  data_devolucao DATE NOT NULL, 
  status ENUM ('pendente', 'devolvido', 'atrasado'),
  livro_id INT NOT NULL,
  cliente_id INT NOT NULL,
  multa_emprestimo DECIMAL (10,2),
  PRIMARY KEY (id_emprestimo),
  FOREIGN KEY (cliente_id) REFERENCES Clintes (id_cliente),
  FOREIGN KEY (livro_id) REFERENCES Livros (id_livro),
  CHECK (data_devolucao > data_emprestimo)
);

-- Criando a tabela Livros_Autores
CREATE TABLE IF NOT EXISTS Livros_Autores (
  la_livro_id INT NOT NULL,
  la_autor_id INT NOT NULL,
  PRIMARY KEY (la_livro_id, la_autor_id),
  FOREIGN KEY (la_livro_id) REFERENCES Livros (id_livro),
  FOREIGN KEY (la_autor_id) REFERENCES Autores (id_autor)
);

-- Criando a tabela Clientes
CREATE TABLE IF NOT EXISTS Clientes (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nome_cliente VARCHAR(45) NOT NULL,
  cpf_cliente VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_cliente)
);


-- Criando a tabela Emprestimos_Clientes
CREATE TABLE IF NOT EXISTS Emprestimos_Clientes (
  ec_emprestimo_id INT NOT NULL,
  ec_cliente_id INT NOT NULL,
  PRIMARY KEY (ec_emprestimo_id, ec_cliente_id),
  FOREIGN KEY (ec_emprestimo_id) REFERENCES Emprestimo (id_emprestimo),
  FOREIGN KEY (ec_cliente_id) REFERENCES Clientes (id_cliente)
);


-- verificando tabelas criadas
desc autores;
desc clientes;
desc emprestimos_clientes;
desc emprestimos;
desc livros;
desc editoras;
desc livros_autores;



-- Inserindo os dados

INSERT INTO Editoras VALUES (null, "Editora 1", "end 1");
INSERT INTO Editoras VALUES (null, "Editora 2", "end 2");
INSERT INTO Editoras VALUES (null, "Editora 3", "end 3");
INSERT INTO Editoras VALUES (null, "Editora 4", "end 4");
INSERT INTO Editoras VALUES (null, "Editora 5", "end 5");

select * from editoras;

INSERT INTO Livros VALUES (null, "Livro A", "7070", "2026-04-27", 1);
INSERT INTO Livros VALUES (null, "Livro B", "2704", "2025-03-27", 2);
INSERT INTO Livros VALUES (null, "Livro C", "0810", "2024-02-27", 3);
INSERT INTO Livros VALUES (null, "Livro D", "1309", "2023-01-27", 2);
INSERT INTO Livros VALUES (null, "Livro E", "1905", "2022-10-27", 4);
INSERT INTO Livros VALUES (null, "Livro F", "2110", "2021-11-27", 5);

select * from livros;

INSERT INTO Autores VALUES (null, "Autor 1", "1970-10-21", "Esloveno");
INSERT INTO Autores VALUES (null, "Autor 2", "1998-04-01", "Ucraniano");
INSERT INTO Autores VALUES (null, "Autor 3", "2001-01-14", "Tailandês");
INSERT INTO Autores VALUES (null, "Autor 4", "1834-04-13", "Quirguiz");
INSERT INTO Autores VALUES (null, "Autor 5", "1500-12-27", "Uzbeque");

select * from autores;

INSERT INTO Clientes VALUES (null, "Cliente A", "512");
INSERT INTO Clientes VALUES (null, "Cliente B", "123");
INSERT INTO Clientes VALUES (null, "Cliente C", "321");
INSERT INTO Clientes VALUES (null, "Cliente D", "457");
INSERT INTO Clientes VALUES (null, "Cliente E", "654");

select * from clientes;

INSERT INTO  livros_autores VALUES (1,2);
INSERT INTO  livros_autores VALUES (2,2);
INSERT INTO  livros_autores VALUES (1,1);
INSERT INTO  livros_autores VALUES (1,3);
INSERT INTO  livros_autores VALUES (5,3);
INSERT INTO  livros_autores VALUES (5,4);
INSERT INTO  livros_autores VALUES (4,5);

select * from livros_autores;


INSERT INTO Emprestimos VALUES (null, "2023-01-01", "2023-11-30", "pendente", 3, 2, null);
INSERT INTO Emprestimos VALUES (null, "2023-04-15", "2023-04-30", "devolvido", 1, 2, null);
INSERT INTO Emprestimos VALUES (null, "2023-08-05", "2023-08-20", "atrasado", 4, 3, null);
INSERT INTO Emprestimos VALUES (null, "2023-10-05", "2023-10-15", "pendente", 5, 4, null);
INSERT INTO Emprestimos VALUES (null, "2023-09-10", "2023-09-16", "devolvido", 1, 4, null);
INSERT INTO Emprestimos VALUES (null, "2023-11-02", "2023-11-08", "pendente", 2, 5, null);

select * from emprestimos;


-- Criando as Stored Procedures:

-- Função: Registra um novo empréstimo e verifica a disponibilidade.
delimiter $
create procedure novo_emprestimo (
  novo_id_emprestimo int,
  novo_data_emprestimo DATE,
  novo_data_devolucao DATE,
  novo_status ENUM ('pendente', 'devolvido', 'atrasado'),
  novo_livro_id INT,
  novo_cliente_id INT
)
BEGIN
	-- Faz a verificação se o livro está disponível
    DECLARE estoque int;
    select count(*) into estoque 
    from Emprestimos
    WHERE livro_id = novo_livro_id AND (status = 'pendente' OR 'atrasado');
    
    -- Se disponível, registra o empréstimo
    IF estoque = 0 THEN
		INSERT INTO Emprestimos (id_emprestimo, data_emprestimo, data_devolucao, status, livro_id, cliente_id)
        VALUES (novo_id_emprestimo, novo_data_emprestimo, novo_data_devolucao, novo_status, novo_livro_id, novo_cliente_id);
	
		-- Mensagem informando se registrou ou não
		SELECT 'Empréstimo realizado' AS mensagem;
    ELSE
		SELECT 'Livro não disponível' AS mensagem;
	END IF;

END$
DELIMITER ;

CALL novo_emprestimo (NULL, "2022-05-15", "2023-06-21", "pendente", 4, 1);

CALL novo_emprestimo (NULL, "2023-06-01", "2023-06-20", "pendente", 1, 1);

-- Recupera a lista de livros emprestados por cliente.
delimiter $
create procedure emprestimos_por_cliente (
	cliente_id int
)
BEGIN
	SELECT Emprestimos.data_emprestimo, Emprestimos.data_devolucao, Emprestimos.status, Livros.id_livro
	FROM Emprestimos
    INNER JOIN Livros 
    ON Emprestimos.livro_id = Livros.id_livro
    WHERE Emprestimos.cliente_id = cliente_id;
    
END$
DELIMITER ;

call emprestimos_por_cliente (1);

-- Calculador de multas devoluções atrasadas.
DELIMITER $
CREATE PROCEDURE calcular_multas (
	consulta_cliente_id int
)
BEGIN
	-- Setando valor da multa por dia
    DECLARE multa DECIMAL (10,2);
    SET multa = 1.25; 
    
    -- primeiro: alterar o pendente para atrasado se for necessário
    UPDATE Emprestimos
    SET status = 'atrasado'
    WHERE data_devolucao < now() 
    AND status = 'pendente' 
    AND consulta_cliente_id = cliente_id;
          
    -- Calcula multa 
    UPDATE Emprestimos
    SET multa = DATEDIFF(CURDATE(), data_devolucao) * multa
    WHERE status = 'atrasado'
    AND cliente_id = consulta_cliente_id;
           
    -- Mostra o valor da multa.
    SELECT Emprestimos.multa, Emprestimos.status, Emprestimos.data_devolucao, Clientes.nome, Livros.titulo
	FROM Emprestimos
    JOIN Clientes 
    ON Emprestimos.cliente_id = Clientes.id_cliente
    JOIN Livros
	ON Emprestimos.livro_id = Livros.id_livro
	WHERE Emprestimos.cliente_id = consulta_cliente_id
    AND Emprestimos.status = "atrasado";    
END$
DELIMITER ;

call calcular_multas(3);

-- 1- View: Exibindo os livros disponíveis para empréstimo, não exibindo os que não tem disponibilidade.



	SELECT Livros.titulo, Livros.numero_isbn, Livros.ano_publicacao
	FROM Livros
	WHERE Livros.id_livro NOT IN (
        SELECT livro_id
		FROM Emprestimos
		WHERE status = 'pendente' OR status = 'atrasado'
);

Select * from livros_disponiveis;

-- Fornecendo lista de todos os empréstimos, incluindo os dados dos livros e dos clientes.

CREATE VIEW lista_emprestimos AS
	SELECT Emprestimos.id_emprestimo, Livros.titulo, Clientes.nome AS cliente, 
    Emprestimos.data_emprestimo, Emprestimos.data_devolucao, Emprestimos.status
	FROM Emprestimos
	JOIN Livros
    ON Emprestimos.livro_id = Livros.id_livro
	JOIN Clientes 
    ON Emprestimos.cliente_id = Clientes.id_cliente;

select * from lista_emprestimos;