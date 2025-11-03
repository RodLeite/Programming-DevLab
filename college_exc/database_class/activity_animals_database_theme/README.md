# Relational Database Exercises (MySQL)

This repository contains three independent SQL exercises designed to practice relational database modeling, table creation, foreign keys, data insertion, and basic `JOIN` queries using **MySQL / MariaDB**.

Each exercise demonstrates a **one-to-many (1:N)** relationship between a parent table and a child table.

---

## 📌 Overview

| Exercise | Theme | Tables | Relationship |
|----------|--------|---------|--------------|
| 1 | Brands & Products | `brands` → `products` | 1 brand → many products |
| 2 | Categories & Movies | `categories` → `movies` | 1 category → many movies |
| 3 | Species & Animals | `species` → `animals` | 1 species → many animals |

All scripts include:

✅ `CREATE TABLE` with primary & foreign keys  
✅ `INSERT` statements with sample data  
✅ Example `SELECT` and `JOIN` queries  
✅ `DROP TABLE IF EXISTS` for safe re-execution  
✅ Optional `CREATE DATABASE` section  
✅ Indexes and constraints (`CHECK`, `UNIQUE`, `ON DELETE / UPDATE`)  

---

## 🗂️ Folder Structure

📦 relational-database-exercises
┣ 📂 scripts
┃ ┣ brands_products.sql
┃ ┣ categories_movies.sql
┃ ┗ species_animals.sql
┣ README.md

yaml
Copiar código

---

## 🧠 Exercise 1 — Brands & Products

brands (parent table)
products (child table, FK → brand_id)

yaml
Copiar código

Key concepts covered:

- `PRIMARY KEY`, `FOREIGN KEY`, `ON DELETE RESTRICT`
- `INSERT` with multiple rows
- `JOIN` to combine brand + product info

---

## 🎬 Exercise 2 — Categories & Movies

categories (parent)
movies (child, FK → category_id)

yaml
Copiar código

Introduces:

- Text fields (`TEXT`)
- Filtering and sorting data by category
- Aliasing tables (`m`, `c`) in queries

---

## 🦁 Exercise 3 — Species & Animals

species (parent)
animals (child, FK → species_id)

sql
Copiar código

Highlights:

- `CHECK` constraint for numeric validation
- `DATE` and `DECIMAL` types
- Example `JOIN` to list animals with their species

---

## ▶️ How to Run the SQL Scripts

### Option A — MySQL Workbench / DBeaver / TablePlus
1. Create a new connection to your MySQL server  
2. Open any `.sql` file from `/scripts`  
3. Execute the full script or run section by section  

### Option B — Terminal

```sh
mysql -u root -p
CREATE DATABASE activity_db;
USE activity_db;
SOURCE scripts/brands_products.sql;
Option C — Execute with a single command
sh
Copiar código
mysql -u root -p activity_db < scripts/brands_products.sql


🔍 Example Query (from Exercise 1)
sql
Copiar código
SELECT 
    p.id,
    p.name       AS product,
    b.name       AS brand,
    p.cost_price,
    p.sale_price
FROM products p
JOIN brands b ON b.id = p.brand_id
ORDER BY b.name, p.name;


🎯 Learning Outcomes
After completing the exercises, you should be able to:

✅ Create relational tables with primary & foreign keys
✅ Insert and query data using SQL
✅ Perform JOIN operations between related tables
✅ Understand referential integrity (ON DELETE, ON UPDATE)
✅ Use aliases, constraints, and indexes in SQL