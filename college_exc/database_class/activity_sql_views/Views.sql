CREATE TABLE marcas (
	mrc_id INT AUTO_INCREMENT PRIMARY KEY,
    mrc_nome VARCHAR(50) NOT NULL,
    mrc_nacionalidade VARCHAR(50)
);

CREATE TABLE produtos (
	prd_id INT AUTO_INCREMENT PRIMARY KEY,
	prd_nome VARCHAR(50) NOT NULL,
	prd_qtd_estoque INT NOT NULL DEFAULT 0,
	prd_estoque_mim INT NOT NULL DEFAULT 0,
	prd_data_fabricacao TIMESTAMP DEFAULT now(),
	prd_perecivel BOOLEAN,
	prd_valor DECIMAL(10,2),

	prd_marca_id INT,
    prd_frn_id INT,
	CONSTRAINT fk_marcas FOREIGN KEY(prd_marca_id) REFERENCES marcas(mrc_id),
    CONSTRAINT fk_fornecedor foreign key (prd_frn_id) references fornecedor(frn_id)
);

CREATE TABLE fornecedores (
	frn_id INT AUTO_INCREMENT PRIMARY KEY,
    frn_nome VARCHAR(50) NOT NULL,
    frn_email VARCHAR(50)
);

CREATE TABLE produto_fornecedor (
pf_prod_id INT REFERENCES produtos (prd_id),
pf_frn_id INT REFERENCES fornecedores (frn_id),

PRIMARY KEY (pf_prod_id, pf_frn_id)
);

INSERT INTO produtos VALUES (null, 'REFRIGERANTE', 500, 50, null, false, 8.32, null, null);
INSERT INTO produtos VALUES (null, 'PICANHA', 200, 50, '2023-10-16 15:30:00', true, 75.32, null, null);
INSERT INTO produtos VALUES (null, 'ARROZ', 1000, 200, '2023-08-11 10:50:00', true, 4.52, null, null);

INSERT INTO marcas VALUES (null, 'COCA-COLA', 'EUA');
INSERT INTO marcas VALUES (null, 'FRIBOI', 'BRASIL');
INSERT INTO marcas VALUES (null, 'CAMIL', 'BRASIL');

INSERT INTO fornecedores VALUES (null, 'Express', 'express@express.com');
INSERT INTO fornecedores VALUES (null, 'Sedex', 'Sedex@sedex.com');
INSERT INTO fornecedores VALUES (null, 'Azul Cargo', 'AzulCargo@AzulCargo.com');

/*Crie uma view que mostra todos os produtos e suas respectivas marcas*/
CREATE VIEW Produtos_E_Marcas as
SELECT prd_id, prd_nome, mrc_nome, mrc_id
FROM PRODUTOS
INNER JOIN marcas
ON mrc_id = prd_marca_id;

SELECT * FROM Produtos_E_Marcas;

/*Crie uma view que mostra todos os produtos e seus respectivos fornecedores*/
CREATE VIEW Produtos_E_Fornecdores as
SELECT prd_id, prd_nome, frn_nome, frn_id
FROM produtos
INNER JOIN fornecedores
ON frn_id = prd_frn_id;

SELECT * FROM Produtos_E_Fornecdores;

/*Crie uma view que mostra todos os produtos e seus respectivos fornecedores e marcas*/
CREATE VIEW Produtos_Fornecedores_Marcas as
SELECT prd_id, prd_nome, frn_nome, mrc_nome
FROM Produtos_E_Marcas
INNER JOIN Produtos_E_Fornecdores
ON prd_id = frc_id;

SELECT * FROM Produtos_Fornecedores_Marcas;

/*Crie uma view que mostra todos os produtos com estoque abaixo do mínimo*/
CREATE VIEW Produtos_Abaixo_Estoque_Minimo as
SELECT prd_id, prd_nome, prd_qtd_estoque, prd_estoque_min
FROM produtos
WHERE prd_qtd_estoque < prd_estoque_min;

SELECT * FROM Produtos_Abaixo_Estoque_Minimo;

/*Adicione o campo data de validade. Insira novos produtos com essa informação*/
ALTER TABLE produtos ADD COLUMN prd_data_validade timestamp;

INSERT INTO produtos VALUES (null, 'Fini', 100, 80, '2023-02-20', 0, 0.99, 3,3,'2020-05-10');

select * from produtos;

/*Crie uma view que mostra todos os produtos e suas respectivas marcas com validade vencida*/
CREATE VIEW Produtos_Marcas_Vencidos as
SELECT prd_id, prd_nome, mrc_nome, mrc_id, prd_data_validade
FROM PRODUTOS
INNER JOIN Marcas
ON mrc_id = prd_marca_id
WHERE prd_data_validade < NOW();

SELECT * FROM Produtos_Marcas_Vencidos;

/*Selecionar os produtos com preço acima da média*/
SELECT prd_id, prd_nome, prd_valor 
FROM PRODUTOS 
WHERE prd_valor > (select avg(prd_valor) from Produto);

DROP TABLE PRODUTOS;