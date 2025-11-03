CREATE TABLE Produtos( /* Criando a tabela com os dados que quero registrar*/
id_produto integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome varchar(30),
preco decimal(5,2) NOT NULL,
estoque int NOT NULL,
perecivel char(1) NOT NULL,
marca varchar(30),
nacionalidade varchar(30)
);

INSERT INTO Produtos values (null , 'Garrafa', 5.90, 55, 'n', 'plastic', 'brasil');/*Inserindo dados na tabela*/
INSERT INTO Produtos values (null , 'mouse', 18.00, 180, 'n', 'dell', 'eua');
INSERT INTO Produtos values (null , 'arroz', 14.99, 46, 's', 'solito', 'brasil');
INSERT INTO Produtos values (null , 'chocolate', 9.99, 176, 's', 'milka', 'belgica');
INSERT INTO Produtos values (null , 'guardanapo', 2.70, 87, 'n', 'pape;ito', 'chile');

/*Verifique se todos os dados foram inseridos*/
SELECT * FROM Produtos;

/*Gere um relatório informando quantos produtos estão cadastrados*/
SELECT COUNT(id_produto) AS Quantidade_produtos FROM Produtos;

/*Gere um relatório informando o preço médio dos produtos*/
SELeCT AVG(preco) AS preco_media FROM Produtos;

/*Selecione a média dos preços dos produtos em 2 grupos: perecíveis e não perecíveis*/
SELeCT perecivel, preco, AVG(preco) AS media_preco FROM Produtos GROUP BY perecivel;

/*Selecione a média dos preços dos produtos agrupados pelo nome do produto*/
SELECT nome, preco, AVG(preco) AS media_preco FROM Produtos GROUP BY nome;

/*Selecione a média dos preços e total em estoque dos produtos*/
SELECT SUM(estoque) AS total_estoque, AVG(preco) AS media_preco  FROM Produtos;

/*Selecione o nome, marca e quantidade em estoque do produto mais caro*/
SELECT nome, marca, estoque, MAX(preco) FROM Produtos;

/*Selecione os produtos com preço acima da média*/
SELECT nome, preco FROM Produtos WHERE preco > (SELECT AVG(preco) FROM Produtos);

/*Selecione a quantidade de produtos de cada nacionalidade*/
SELECT nacionalidade, SUM(estoque) AS total_estoque FROM Produtos Group by nacionalidade;