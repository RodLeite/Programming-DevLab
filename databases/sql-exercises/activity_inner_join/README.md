# INNER JOIN Exercise — Authors & Books

This exercise practices the basic use of **INNER JOIN** in a relational database using MySQL.

We work with a simple scenario:

- One table for **authors**  
- One table for **books**  
- Each book belongs to exactly one author → **1:N relationship**

---

## 📚 Tables

### `authors` (parent table)

| Column       | Type           | Description                 |
|--------------|----------------|-----------------------------|
| `id`         | INT PK         | Unique identifier           |
| `name`       | VARCHAR(100)   | Author full name            |
| `nationality`| VARCHAR(50)    | Country / nationality       |

### `books` (child table)

| Column          | Type           | Description                          |
|-----------------|----------------|--------------------------------------|
| `id`            | INT PK         | Unique identifier                    |
| `title`         | VARCHAR(200)   | Book title                           |
| `year_published`| INT            | Publication year                     |
| `author_id`     | INT FK         | References `authors.id` (1:N link)   |

Foreign key:

```sql
FOREIGN KEY (author_id) REFERENCES authors(id)
