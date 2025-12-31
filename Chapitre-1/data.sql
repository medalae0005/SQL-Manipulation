CREATE DATABASE my_db;
USE my_db;

CREATE TABLE Article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255),
    contenu TEXT,
    date_pub DATE
);

INSERT INTO Article (titre, contenu, date_pub) VALUES
('Article 1', 'Contenu 1', '2023-12-20'),
('Article 2', 'Contenu 2', '2024-01-10'),
('Article 3', 'Contenu 3', '2024-02-05'),
('Article 4', 'Contenu 4', '2024-03-01'),
('Article 5', 'Contenu 5', '2024-04-15'),
('Article 6', 'Contenu 6', '2024-05-01');

SELECT * FROM Article;

SELECT titre, contenu FROM Article;

SELECT titre, date_pub
FROM Article
WHERE date_pub >= '2024-01-01';

SELECT titre, date_pub
FROM Article
ORDER BY date_pub DESC;

SELECT titre
FROM Article
ORDER BY date_pub DESC
LIMIT 5;