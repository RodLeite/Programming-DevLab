-- ============================================
-- INNER JOIN Exercise – Authors & Books (MySQL)
-- ============================================

-- Optional: create and select a specific database
DROP DATABASE IF EXISTS activity_inner_join;
CREATE DATABASE activity_inner_join;
USE activity_inner_join;

-- 1) Parent table: authors
-- Each author can have many books (1:N relationship)
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- unique identifier for each author
    name VARCHAR(100) NOT NULL,              -- author full name
    nationality VARCHAR(50)                  -- country or nationality (optional)
);

-- 2) Child table: books
-- Each book belongs to exactly one author (via author_id)
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- unique identifier for each book
    title VARCHAR(200) NOT NULL,             -- book title
    year_published INT,                      -- publication year (optional)
    author_id INT NOT NULL,                  -- foreign key pointing to authors.id
    CONSTRAINT fk_books_authors
        FOREIGN KEY (author_id)
        REFERENCES authors(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT                  -- prevents deleting an author that still has books
);

-- 3) Insert sample data into authors
-- We insert two authors with their nationality
INSERT INTO authors (name, nationality) VALUES
('J.K. Rowling', 'British'),
('J.R.R. Tolkien', 'British');

-- 4) Insert sample data into books
-- Each book references an existing author_id from the authors table
INSERT INTO books (title, year_published, author_id) VALUES
('Harry Potter and the Philosopher''s Stone', 1997, 1),
('Harry Potter and the Chamber of Secrets',   1998, 1),
('Harry Potter and the Prisoner of Azkaban',  1999, 1),
('The Fellowship of the Ring',                1954, 2),
('The Two Towers',                            1954, 2),
('The Return of the King',                    1955, 2);

-- =====================================================
-- INNER JOIN examples
-- =====================================================

-- Example 1: basic INNER JOIN listing all books with their authors
-- INNER JOIN returns only rows where the relationship (author_id) matches
SELECT
    b.id,
    b.title,
    b.year_published,
    a.name        AS author,
    a.nationality
FROM books AS b
INNER JOIN authors AS a
    ON a.id = b.author_id
ORDER BY a.name, b.year_published;

-- Example 2: filter by a specific author using WHERE + INNER JOIN
SELECT
    b.title,
    b.year_published
FROM books AS b
INNER JOIN authors AS a
    ON a.id = b.author_id
WHERE a.name = 'J.K. Rowling'
ORDER BY b.year_published;

-- Example 3: count how many books each author has written
-- GROUP BY is used together with INNER JOIN to aggregate results
SELECT
    a.name AS author,
    COUNT(b.id) AS total_books
FROM authors AS a
INNER JOIN books AS b
    ON a.id = b.author_id
GROUP BY a.id, a.name
ORDER BY total_books DESC;
