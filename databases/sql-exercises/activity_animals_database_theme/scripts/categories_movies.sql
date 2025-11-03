-- ============================================================
-- Script: categories_movies.sql
-- Goal: Categories (1) -> (N) Movies
-- DB: MySQL / MariaDB
-- ============================================================

-- Optional:
-- CREATE DATABASE IF NOT EXISTS activity_db;
-- USE activity_db;

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS categories;

CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    target_audience VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    synopsis TEXT,
    studio VARCHAR(255),
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_movies_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_movies_category_id ON movies(category_id);

-- Seed: categories
INSERT INTO categories (name, target_audience) VALUES
    ('Action',  'Adults'),
    ('Comedy',  'Family'),
    ('Drama',   'Adults')
ON DUPLICATE KEY UPDATE
    target_audience = VALUES(target_audience);

-- Seed: movies
INSERT INTO movies (title, synopsis, studio, category_id) VALUES
    ('Avengers',     'Heroes assemble to face Thanos.',                            'Marvel',      1),
    ('Toy Story',    'The adventures of Andy’s toys.',                             'Pixar',       2),
    ('Parasite',     'A poor family infiltrates a wealthy household.',             'CJ',          3),
    ('The Lion King','Simba’s journey to become king of the savannah.',            'Walt Disney', 2),
    ('Joker',        'An origin story of one of the greatest villains.',           'Warner',      3),
    ('Frozen',       'Elsa and Anna embark on a journey to uncover the past.',     'Walt Disney', 2),
    ('Mad Max',      'A post-apocalyptic action story.',                           'Warner',      1),
    ('Forrest Gump', 'The life and adventures of Forrest Gump.',                   'Paramount',   3);

-- Basic selects
SELECT * FROM categories;
SELECT * FROM movies;

-- Example join: movies with category
SELECT 
    m.id,
    m.title,
    c.name AS category,
    m.studio
FROM movies m
JOIN categories c ON c.id = m.category_id
ORDER BY c.name, m.title;
