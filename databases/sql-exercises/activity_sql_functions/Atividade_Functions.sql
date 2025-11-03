
CREATE DATABASE Universidade;
USE Universidade;



-- Criando a tabela Areas
CREATE TABLE IF NOT EXISTS Areas (
  id_area INT NOT NULL AUTO_INCREMENT,
  nome_area VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_area)
);

-- Criando tabela cursos
CREATE TABLE IF NOT EXISTS Cursos (
  id_curso INT NOT NULL AUTO_INCREMENT,
  nome_curso VARCHAR(45) NOT NULL,
  duracao_meses_curso INT NOT NULL,
  area_id INT NOT NULL,
  PRIMARY KEY (id_curso),
  FOREIGN KEY (area_id) REFERENCES Areas (id_area)
);

-- Criando tabela alunos
CREATE TABLE IF NOT EXISTS Alunos (
  id_aluno INT NOT NULL AUTO_INCREMENT,
  nome_aluno VARCHAR(45) NOT NULL,
  sobrenome_aluno VARCHAR(45) NOT NULL,
  cpf_aluno VARCHAR(45) NOT NULL UNIQUE,
  email_aluno VARCHAR(45),
  PRIMARY KEY (id_aluno)
);

-- Criando tabela matriculas
CREATE TABLE IF NOT EXISTS Matriculas (
  id_matricula INT NOT NULL AUTO_INCREMENT,
  aluno_id INT NOT NULL,
  curso_id INT NOT NULL,
  PRIMARY KEY (id_matricula),
  FOREIGN KEY (aluno_id) REFERENCES Alunos (id_aluno),
  FOREIGN KEY (curso_id) REFERENCES Cursos (id_curso)
);

-- Criando a Stored procedure para adicionar o aluno e gera e-mail automaticamente
delimiter $
create procedure insert_aluno(
	id_aluno int,
    nome_aluno VARCHAR(45),
	sobrenome_aluno VARCHAR(45),
    cpf_aluno varchar(45)
)
begin
	DECLARE email_base VARCHAR(255);
    DECLARE email VARCHAR(255);
    DECLARE i INT;
	
    SET email_base  = CONCAT (nome_aluno, ".", sobrenome_aluno, "@dominio.com");
    
    SET i = 0;
    REPEAT
        SET i = i + 1;
        SET email = IF (i = 1, email_base, CONCAT(i, email_base));
		UNTIL NOT EXISTS (SELECT 1 FROM Alunos WHERE email_aluno = email) 
    END REPEAT;
    
	INSERT INTO Alunos (id_aluno, nome_aluno, sobrenome_aluno, cpf_aluno, email_aluno)
    VALUES (null, nome_aluno, sobrenome_aluno, cpf_aluno, email);
end$
delimiter ;


call insert_aluno(null, 'Rodrigo', 'Martins', '123');
call insert_aluno(null, 'Martins', 'Rodrigo', '456');
call insert_aluno(null, 'Marcello', 'Martins', '789');
call insert_aluno(null, 'Martins', 'Marcello', '101');
call insert_aluno(null, 'Thaigo', 'Ramiro', '321');

SELECT * from Alunos;

-- Stored para automatizar a denominação area;
delimiter $
create procedure insert_area(
	id_area int,
    nome_area VARCHAR(45)
)
begin
	   
	INSERT INTO Areas (id_area, nome_area)
    Values (null, nome_area);
end$
delimiter ;

call insert_area (null, 'Area 1');
call insert_area (null, 'Area 2');
call insert_area (null, 'Area 3');
call insert_area (null, 'Area 4');
call insert_area (null, 'Area 5');

Select * from Areas;

-- Stored automatizar a denominação dos cursos;

delimiter $
create procedure insert_curso(
	id_curso int,
    nome_curso VARCHAR(45),
	duracao_meses_curso VARCHAR(45),
    area_id varchar(45)
)
begin
	   
	INSERT INTO Cursos (id_curso, nome_curso, duracao_meses_curso, area_id)
    Values (null, nome_curso, duracao_meses_curso, area_id);
end$
delimiter ;

call insert_curso (null, 'Curso 1', 20 , 1);
call insert_curso (null, 'Curso 2', 52 , 3);
call insert_curso (null, 'Curso 3', 75 , 2);
call insert_curso (null, 'Curso 4', 12 , 4);
call insert_curso (null, 'Curso 5', 36 , 4);

select * from Cursos;

-- View da seleção dos cursos.

CREATE VIEW Cursos_e_Areas as
SELECT Areas.nome_area as Area, Cursos.nome_curso, Cursos.duracao_meses_curso
FROM Cursos
INNER JOIN Areas
ON area_id = id_area;

SELECT * FROM Cursos_e_Areas;



-- Stored recebe os dados do aluno e faz sua matrícula. 

delimiter $
create procedure nova_matricula (
  id_aluno INT,
  nome_aluno VARCHAR(45),
  sobrenome_aluno VARCHAR(45),
  cpf VARCHAR(45),
  id_matricula INT,
  curso_id INT
)
begin
	DECLARE alunoID INT;
    DECLARE cursoID INT;

    SELECT id_aluno INTO alunoID
    FROM Alunos
    WHERE Email = email_aluno;

    IF alunoID IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O aluno já está matriculado em outro curso';
    END IF;

    call insert_aluno (id_aluno, nome_aluno, sobrenome_aluno, cpf_aluno, null);
    SET alunoID = LAST_INSERT_ID();

    SET curso_id = ObterIDCurso(nome_curso, area_id);

    IF id_curso IS NOT NULL THEN
        INSERT INTO Matriculas (id_matricula, aluno_id, curso_id) VALUES (null, id_aluno, id_curso);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Esse curso não existe';
    END IF;
    
end$
delimiter ;

   
call nova_matricula (1,'Rodrigo','Martinsss','512', NULL, 1);
drop procedure nova_matricula;





-- Function recebe o os dados da matricula, e retorna id do curso 

CREATE FUNCTION obter_ID_curso (
	novo_nome_curso VARCHAR(100),
    novo_nome_area VARCHAR(50)
) 
    RETURNS INT
    
BEGIN
    
    DECLARE novo_curso_id INT;

    SELECT id_curso INTO novo_curso_id
    FROM Cursos
    JOIN Areas 
    ON Cursos.area_id = Areas.id_area
    WHERE Cursos.nome_curso = novo_nome_curso AND Areas.nome = novo_nome_area;

    RETURN novo_curso_id;
    
END;

select obter_ID_curso ('Curso 1', 'Area 1');