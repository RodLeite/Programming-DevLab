-- ============================================================
-- Script: brands_products.sql
-- Goal: Brands (1) -> (N) Products
-- DB: MySQL / MariaDB
-- ============================================================

-- Optional: choose/create a database
-- CREATE DATABASE IF NOT EXISTS activity_db;
-- USE activity_db;

-- Drop tables in the correct order (children before parent)
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS brands;

-- Create table: brands
CREATE TABLE IF NOT EXISTS brands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    official_website VARCHAR(255),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create table: products (FK to brands)
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    cost_price DECIMAL(10,2) NOT NULL CHECK (cost_price >= 0),
    sale_price DECIMAL(10,2) NOT NULL CHECK (sale_price >= 0),
    valid_until DATE NULL,
    brand_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_products_brand
        FOREIGN KEY (brand_id)
        REFERENCES brands(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Helpful index for lookups by brand
CREATE INDEX idx_products_brand_id ON products(brand_id);

-- Seed data: brands
INSERT INTO brands (name, official_website, phone) VALUES
    ('Nike',   'https://www.nike.com',   '+1 (800) 344-6453'),
    ('Adidas', 'https://www.adidas.com', '+1 (800) 982-9337'),
    ('Apple',  'https://www.apple.com',  '+1 (800) 692-7753')
ON DUPLICATE KEY UPDATE
    official_website = VALUES(official_website),
    phone = VALUES(phone);

-- Seed data: products
INSERT INTO products (name, cost_price, sale_price, valid_until, brand_id) VALUES
    ('Nike Air Max Shoes',       80.00, 150.00, '2024-12-31', 1),
    ('Adidas Ultraboost Shoes',  90.00, 160.00, '2024-11-30', 2),
    ('iPhone 13 Pro',           900.00,1200.00, '2025-06-30', 3),
    ('Nike Dri-FIT T-Shirt',     15.00,  30.00, '2024-08-31', 1),
    ('Adidas Essentials Pants',  25.00,  50.00, '2024-10-31', 2),
    ('iPad Air',                400.00, 600.00, '2025-05-31', 3),
    ('Nike Casual Shoes',        70.00, 130.00, '2024-09-30', 1),
    ('Adidas Soccer Ball',       10.00,  20.00, '2024-12-31', 2);

-- Basic selects
SELECT * FROM brands;
SELECT * FROM products;

-- Example join: list products with brand name
SELECT 
    p.id,
    p.name       AS product,
    b.name       AS brand,
    p.cost_price,
    p.sale_price,
    p.valid_until
FROM products p
JOIN brands b ON b.id = p.brand_id
ORDER BY b.name, p.name;
