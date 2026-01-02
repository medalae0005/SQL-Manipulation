CREATE DATABASE gestion_des_articles;
USE gestion_des_articles;

CREATE TABLE Article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(80),
    auteur VARCHAR(45),
    contenu TEXT,
    date_de_pub DATE,
    vues INT DEFAULT 0
);

INSERT INTO Article (titre, auteur, contenu, date_de_pub, vues) VALUES
('Bases de donnees', 'Omar', 'Notions generales sur les bases de donnees', '2024-01-08', 45),
('Requetes simples', 'Nadia', 'Utilisation de SELECT et WHERE', '2024-02-12', 70),
('Fonctions SQL', 'Omar', 'COUNT AVG MAX', '2024-03-18', 90),
('Groupement des donnees', 'Hassan', 'GROUP BY et HAVING', '2024-04-03', 55);

SELECT * FROM Article;

SELECT COUNT(*) AS nombre_total
FROM Article;

SELECT MAX(date_de_pub) AS article_recent
FROM Article;

SELECT auteur, COUNT(*) AS nombre_articles
FROM Article
GROUP BY auteur
HAVING COUNT(*) >= 2;

SELECT AVG(vues) AS moyenne_vues
FROM Article;

SELECT auteur, SUM(vues) AS total_vues
FROM Article
GROUP BY auteur
ORDER BY total_vues DESC;