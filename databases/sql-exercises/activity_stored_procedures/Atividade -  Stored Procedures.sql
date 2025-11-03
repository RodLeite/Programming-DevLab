

-- Crianado tabela Curso
CREATE TABLE IF NOT EXISTS Curso (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_curso`)
)ENGINE = InnoDB;


-- Criando tabela Aluno
CREATE TABLE IF NOT EXISTS Aluno (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(45) NOT NULL,
  `sobrenome_aluno` VARCHAR(45) NOT NULL,
  `email_aluno` VARCHAR(45) DEFAULT '',
  `id_curso_aluno` INT NOT NULL,
  PRIMARY KEY (`id_aluno`),
  INDEX `id_curso_aluno_idx` (`id_curso_aluno` ASC) VISIBLE,
  CONSTRAINT `id_curso_aluno`
    FOREIGN KEY (`id_curso_aluno`)
    REFERENCES Curso (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;


-- Criando tabela Professor
CREATE TABLE IF NOT EXISTS Professor (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_professor`)
)ENGINE = InnoDB;


-- Criando tabela Professor_Curso
CREATE TABLE IF NOT EXISTS Professor_Curso (
  `pc_id_professor` INT NOT NULL,
  `pc_id_curso` INT NOT NULL,
  PRIMARY KEY (`pc_id_professor`, `pc_id_curso`),
  INDEX `pc_id_curso_idx` (`pc_id_curso` ASC) VISIBLE,
  CONSTRAINT `pc_id_curso`
    FOREIGN KEY (`pc_id_curso`)
    REFERENCES Curso (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pc_id_professor`
    FOREIGN KEY (`pc_id_professor`)
    REFERENCES Professor (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;


-- Criando stored procedure para inserir dados do curso

delimiter $
create procedure insert_curso(
	`id_curso` INT,
	`nome_curso` VARCHAR(45)
)
begin
	INSERT INTO Curso Values (null, nome_curso);
end$
delimiter ;

call insert_curso(null, 'ADS');
call insert_curso(null, 'Direito');
call insert_curso(null, 'Nutri');
call insert_curso(null, 'Educação Fisica');
call insert_curso(null, 'Engenharia Civil');

SELECT * from Curso;

-- Criando stored procedure para inserir dados do aluno e tratando o email duplicado
DELIMITER $
CREATE PROCEDURE insert_aluno(
  nome_aluno VARCHAR(45),
  sobrenome_aluno VARCHAR(45),
  id_curso_aluno INT
)
BEGIN
  DECLARE email VARCHAR(45); -- Declarando uma variável email para tratar o campo
  DECLARE suffix INT; -- Essa variável serve para adicionar números sequenciais ao email, em caso de duplicidade.
  SET email = CONCAT(nome_aluno, '.', sobrenome_aluno, '@dominio.com'); -- Atribuindo valor às variáveis
  SET suffix = 1; -- Atribuindo valor
  WHILE EXISTS (SELECT 1 FROM Aluno WHERE email_aluno = email) DO -- Esse loop verifica se existe emails duplicados enquanto essa condição for verdadeira o loop continua caso encontre adiciona o sufixo numerico
    SET email = CONCAT(nome_aluno, '.', sobrenome_aluno, suffix, '@dominio.com');
    SET suffix = suffix + 1;
  END WHILE;
  INSERT INTO Aluno (nome_aluno, sobrenome_aluno, email_aluno, id_curso_aluno)
  VALUES (nome_aluno, sobrenome_aluno, email, id_curso_aluno); -- Atribui o valor da variavel email no campo email_aluno
END$
DELIMITER ;

CALL insert_aluno('Carlos', 'Silva', 1);
CALL insert_aluno('Rodrigo', 'Martins', 2);
CALL insert_aluno('Gabrielle', 'Santiago', 3);
CALL insert_aluno('Gledson', 'Torres', 5);
CALL insert_aluno('Isabela', 'Souza', 3);
CALL insert_aluno('Henrique', 'Alvez', 4);
CALL insert_aluno('Rodrigo', 'Martins', 2);

SELECT * from Aluno;

-- Criando stored procedure para inserir dados do Professor

delimiter $
create procedure insert_professor(
	`id_professor` INT,
	`nome_professor` VARCHAR(45)
)
begin
	INSERT INTO Professor Values (null, nome_professor);
end$
delimiter ;


call insert_professor(null, 'Daniel');
call insert_professor(null, 'Fabio');
call insert_professor(null, 'Eliney');
call insert_professor(null, 'Ricardo');
call insert_professor(null, 'Lucas');
call insert_professor(null, 'Neto');

select * from Professor;


-- Criando stored procedure para inserir dados da tabela Professor_Curso

delimiter $
create procedure insert_professor_curso(
	`pc_id_professor` INT,
	`pc_id_curso` INT
)
begin
	INSERT INTO Professor_Curso Values (pc_id_professor, pc_id_curso);
end$
delimiter ;

call insert_professor_curso(1,2);
call insert_professor_curso(1,3);
call insert_professor_curso(2,1);
call insert_professor_curso(3,4);
call insert_professor_curso(4,5);
call insert_professor_curso(3,2);
call insert_professor_curso(1,1);
call insert_professor_curso(5,4);
call insert_professor_curso(3,3);
call insert_professor_curso(5,2);

select * from Professor_Curso;


-- Criando stored procedure para seleção de alunos com curso

delimiter $
create procedure select_aluno_curso(id_aluno int)
begin
	SELECT id_aluno, nome_aluno, nome_curso
	FROM Aluno
	INNER JOIN Curso
	ON id_curso_aluno = id_curso
    where aluno.id_aluno = id_aluno;
end$
delimiter ;

call select_aluno_curso(5);


-- Criando stored procedure para seleção de professor com curso

delimiter $
create procedure select_professor_curso(id_professor int)
begin
	SELECT id_professor, nome_professor, nome_curso
	FROM Professor
	INNER JOIN Professor_Curso
	ON pc_id_professor = id_professor
    JOIN Curso
    ON curso.id_curso = pc_id_curso
    where professor.id_professor = id_professor;
end$
delimiter ;

call select_professor_curso(3);