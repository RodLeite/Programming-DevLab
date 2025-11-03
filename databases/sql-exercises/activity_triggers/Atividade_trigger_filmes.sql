-- Criando a tabela Filmes
CREATE TABLE Filmes (
id int primary key auto_increment,
titulo varchar(60),
minutos int
);

-- criando trigger que não aceita numero negativo, se caso o usuario inserir ele envia um aviso de erro.

DELIMITER $
CREATE TRIGGER  check_mimnutos 
	BEFORE INSERT ON Filmes
    for each row
    begin
		if new.minutos < 0 then 
			
            -- enviando o erro
			signal SQLSTATE '45000'  -- exceção 
            set message_text = 'Valor inválido para minutos',
            MYSQL_ERRNO = 2022;    -- código do erro 
			
		end if;
	end$
DELIMITER ;

-- Inserindo dados
INSERT INTO Filmes (titulo, minutos) VALUES ("The terrible trigger", 120);
INSERT INTO Filmes (titulo, minutos) VALUES ("O alto da compadecida", 135);
INSERT INTO Filmes (titulo, minutos) VALUES ("Faroeste caboclo", 240);
INSERT INTO Filmes (titulo, minutos) VALUES ("The matrix", 90);
INSERT INTO Filmes (titulo, minutos) VALUES ("O labirinto do Fauno", 110);
INSERT INTO Filmes (titulo, minutos) VALUES ("Metropole", 0);
INSERT INTO Filmes (titulo, minutos) VALUES ("A lista", 120);
INSERT INTO Filmes (titulo, minutos) VALUES ("Blade runner", -88);

SELECT * FROM Filmes;
    
-- criar tabela de log para verificar os erros
CREATE TABLE Log_deletion(
id int primary key auto_increment,
titulo varchar(60),
quando datetime,
quem varchar(40)
);

DELIMITER $
create trigger log_deletions 
after delete on Filmes
	for each row 
    begin 
		insert into Log_deletion values (null, old.titulo, sysdate(), user());
	end$
DELIMITER ;

-- deletando os filmes para testar a trigger de ocorrências
delete from Filmes where id = 2;
delete from Filmes where id = 4;

select * from Log_deletion;