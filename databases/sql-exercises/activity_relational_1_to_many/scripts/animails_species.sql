-- ============================================================
-- Script: species_animals.sql
-- Goal: Species (1) -> (N) Animals
-- DB: MySQL / MariaDB
-- ============================================================

-- Optional:
-- CREATE DATABASE IF NOT EXISTS activity_db;
-- USE activity_db;

DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS species;

CREATE TABLE IF NOT EXISTS species (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    weight_kg DECIMAL(10,2) CHECK (weight_kg >= 0),
    species_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_animals_species
        FOREIGN KEY (species_id)
        REFERENCES species(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_animals_species_id ON animals(species_id);

-- Seed: species
INSERT INTO species (name, description) VALUES
    ('Lion',     'The king of the jungle.'),
    ('Elephant', 'The largest land mammal.'),
    ('Giraffe',  'Tallest land animal with a long neck.')
ON DUPLICATE KEY UPDATE
    description = VALUES(description);

-- Seed: animals
INSERT INTO animals (name, birth_date, weight_kg, species_id) VALUES
    ('Simba',  '2019-05-15',  150, 1),
    ('Nala',   '2020-02-20',  140, 1),
    ('Dumbo',  '2018-07-10', 3500, 2),
    ('Babar',  '2017-11-28', 3200, 2),
    ('Melman', '2021-03-03', 1800, 3),
    ('Gloria', '2020-11-12', 1700, 3),
    ('Zazu',   '2019-09-25',  120, 1),
    ('Rafiki', '2020-12-05',  110, 1);

-- Basic selects
SELECT * FROM species;
SELECT * FROM animals;

-- Example join: list animals with species
SELECT 
    a.id,
    a.name     AS animal,
    s.name     AS species,
    a.birth_date,
    a.weight_kg
FROM animals a
JOIN species s ON s.id = a.species_id
ORDER BY s.name, a.name;
