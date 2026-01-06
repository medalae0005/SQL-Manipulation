CREATE DATABASE social_db;
USE social_db;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL
);

CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(40) NOT NULL,
    auteur VARCHAR(40),
    contenu TEXT NOT NULL,
    datePub DATE,
    vues INT,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, nom)
VALUES
(1,'Yassine'),
(2,'Salma'),
(3,'Anas'),
(4,'Meryem');

INSERT INTO posts (id, titre, auteur, contenu, datePub, vues, user_id)
VALUES
(1, 'Introduction SQL', 'Salma',
 'Apprendre les commandes SQL essentielles pour gérer une base de données',
 '2024-01-15', 120, 2),

(2, 'Programmation Python', 'Yassine',
 'Découvrir les bases de Python pour les débutants',
 '2024-03-22', 210, 1),

(3, 'Développement Web', 'Anas',
 'Créer des sites web dynamiques avec PHP et MySQL',
 '2024-06-05', 175, 3),

(4, 'Framework Laravel', 'Yassine',
 'Développer des applications web modernes avec Laravel',
 '2023-10-08', 290, 1);

START TRANSACTION;

INSERT INTO posts (titre, auteur, contenu, datePub, vues, user_id)
VALUES (
    'API REST avec Django',
    'Meryem',
    'Créer des API performantes avec Django Rest Framework',
    '2025-02-18',
    45,
    4
);

UPDATE users
SET nom = 'Amina'
WHERE id = 4;

COMMIT;