create  table Animais(
id    int, 
nome  varchar(50),
nasc  date, 
peso  decimal(10,2),
cor   varchar(50)
);

INSERT INTO Animais VALUES (01, 'Ágata','2015-04-09', 13.9, 'branco');
INSERT INTO Animais VALUES (02, 'Félix', '2016-06-06', 14.3, 'preto');
INSERT INTO Animais VALUES (03, 'Tom', '2013-02-08', 11.2, 'azul');
INSERT INTO Animais VALUES (04, 'Garfield', '2015-07-06', 17.1, 'laranja');
INSERT INTO Animais VALUES (05, 'Frajola', '2013-08-01', 13.7, 'preto');
INSERT INTO Animais VALUES (06, 'Manda-chuva', '2012-02-03', 12.3, 'amarelo');
INSERT INTO Animais VALUES (07, 'Snowball', '2014-04-06', 13.2, 'preto');
INSERT INTO Animais VALUES (10, 'Agata', '2015-08-03', 11.9, 'azul');
INSERT INTO Animais VALUES (11, 'Gato de Botas', '2012-12-10', 11.6, 'amarelo');
INSERT INTO Animais VALUES (12, 'Kitty', '2020-04-06', 11.6, 'amarelo');
INSERT INTO Animais VALUES (13, 'Milu', '2012-01-03', 12.3, 'amarelo');
INSERT INTO Animais VALUES (14, 'Pluto', '2013-02-04', 17.9, 'branco');
INSERT INTO Animais VALUES (15, 'Pateta', '2015-05-01', 17.7, 'preto');
INSERT INTO Animais VALUES (16, 'Snoopy', '2013-07-02', 18.2, 'branco');
INSERT INTO Animais VALUES (17, 'Rex', '2019-11-03', 19.7, 'bege');
INSERT INTO Animais VALUES (20, 'Bidu', '2012-09-08', 12.4, 'azul');
INSERT INTO Animais VALUES (21, 'Dum Dum', '2015-04-06', 11.2, 'laranja');
INSERT INTO Animais VALUES (22, 'Muttley', '2011-02-03', 14.3, 'laranja');
INSERT INTO Animais VALUES (23, 'Scooby', '2012-01-02', 19.9, 'marrom');
INSERT INTO Animais VALUES (24, 'Rufus', '2014-04-05', 19.7, 'branco');
INSERT INTO Animais VALUES (25, 'Rex', '2021-08-19', 19.7, 'branco');

select * from Animais;
SELECT * FROM Animais WHERE peso < 13.1 ORDER By peso DESC;
SELECT * FROM Animais WHERE nasc BETWEEN '2015-02-01' AND '2015-12-31';
SELECT * FROM Animais WHERE cor = 'branco' and peso < 15.0;
SELECT nome, cor, peso FROM Animais  WHERE nome LIKE 'B%';
SELECT nome, cor, peso FROM Animais  WHERE cor in ('vermelha', 'amarelo','marrom','laranja');
SELECT nome, cor, nasc AS Data_Nascimento, peso FROM Animais  ORDER BY nasc DESC;
SELECT * FROM Animais  WHERE nome LIKE 'C%' and cor != 'branco';
SELECT * FROM Animais  WHERE nome LIKE '%jo%';
SELECT * FROM Animais WHERE peso BETWEEN 13.0 AND 15.0;
SELECT * FROM Animais WHERE peso < 30 and cor IN ('amarelo', 'roxo') and nasc > '2012-12-31';
UPDATE Animais SET nome = 'Goofy' WHERE id = 15;
SELECT id, nome FROM Animais WHERE id = 15;
UPDATE Animais SET peso = 10.0 WHERE id = 4;
SELECT id, nome, peso FROM Animais WHERE id = 4;
ALTER TABLE Animais ADD especies varchar(50);
UPDATE Animais SET especies = 'Gato';
UPDATE Animais set cor = 'laranja' WHERE especies = 'Gato';
ALTER TABLE Animais ADD altura decimal(10,2);
ALTER TABLE Animais ADD obs varchar(50);
delete FROM Animais where peso > 200;
select nome, peso FROM Animais where peso > 200;
UPDATE Animais SET nome = "Catapimbas" WHERE id = 7;
select * FROM Animais where nome LIKE 'C%';
delete FROM Animais where nome LIKE 'C%';
select * FROM Animais where nome LIKE 'C%';
ALTER TABLE Animais DROP COLUMN cor;
ALTER TABLE Animais MODIFY nome VARCHAR(80);
UPDATE Animais SET especies = "Cachorro" WHERE id = 15;
SELECT * FROM Animais where especies = "Cachorro";
DELETE FROM Animais WHERE especies IN ('Gato', 'Cachorro');
ALTER TABLE Animais DROP COLUMN nasc;
DELETE FROM Animais;
DROP TABLE especies;