-- Criando a tabela de Marcas
CREATE TABLE marcas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    site_oficial VARCHAR(255),
    telefone VARCHAR(20)
);

-- Criando a tabela de Produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco_custo DECIMAL(10, 2),
    preco_venda DECIMAL(10, 2),
    data_validade DATE,
    marca_id INT,
    FOREIGN KEY (marca_id) REFERENCES marcas(id)
);

-- Inserindo os dados das marcas
INSERT INTO marcas (nome, site_oficial, telefone) VALUES
    ('Nike', 'https://www.nike.com', '+1 (800) 344-6453'),
    ('Adidas', 'https://www.adidas.com', '+1 (800) 982-9337'),
    ('Apple', 'https://www.apple.com', '+1 (800) 692-7753');

-- Inserindo os produtos na tabela
INSERT INTO produtos (nome, preco_custo, preco_venda, data_validade, marca_id) VALUES
    ('Tênis Nike Air Max', 80.00, 150.00, '2024-12-31', 1),
    ('Tênis Adidas Ultraboost', 90.00, 160.00, '2024-11-30', 2),
    ('iPhone 13 Pro', 900.00, 1200.00, '2025-06-30', 3),
    ('Camiseta Nike Dri-FIT', 15.00, 30.00, '2024-08-31', 1),
    ('Calça Adidas Essentials', 25.00, 50.00, '2024-10-31', 2),
    ('iPad Air', 400.00, 600.00, '2025-05-31', 3),
    ('Sapatênis Nike', 70.00, 130.00, '2024-09-30', 1),
    ('Bola de Futebol Adidas', 10.00, 20.00, '2024-12-31', 2);
    
    SELECT * FROM marcas;
    SELECT * FROM produtos;