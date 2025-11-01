Relational Database Activity (MySQL)

This repository contains three exercises focused on relational database modeling and data manipulation using MySQL, demonstrating one-to-many (1:N) relationships with FOREIGN KEY.

📌 Overview
Activity	Theme	Main Tables	Relationship
1	Brands & Products	marcas → produtos	1 brand → many products
2	Movie Categories	categorias → filmes	1 category → many movies
3	Animal Species	especies → animais	1 species → many animals
🗂️ Activity 1 — Brands & Products
🔹 Table Structure
CREATE TABLE marcas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    site_oficial VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco_custo DECIMAL(10, 2),
    preco_venda DECIMAL(10, 2),
    data_validade DATE,
    marca_id INT,
    FOREIGN KEY (marca_id) REFERENCES marcas(id)
);

🔹 Relationship

A brand can have many products
marcas (1) ---- (N) produtos

🎬 Activity 2 — Categories & Movies
🔹 Table Structure
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    publico_alvo VARCHAR(255)
);

CREATE TABLE filmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    sinopse TEXT,
    estudio VARCHAR(255),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

🔹 Relationship

categorias (1) ---- (N) filmes

🦁 Activity 3 — Species & Animals
🔹 Table Structure
CREATE TABLE especies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT
);

CREATE TABLE animais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nasc DATE,
    peso DECIMAL(10,2),
    especie_id INT,
    FOREIGN KEY (especie_id) REFERENCES especies(id)
);

🔹 Relationship

especies (1) ---- (N) animais

▶️ How to Run the Project

Install MySQL or use a client such as MySQL Workbench, DBeaver, XAMPP, etc.

Create a database:

CREATE DATABASE activity_db;
USE activity_db;


Copy and run the SQL scripts for the desired activity

Query the tables:

SELECT * FROM <table_name>;