CREATE DATABASE users;
USE users;

CREATE TABLE Utilisateurs(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(200)
);

INSERT INTO Utilisateurs (nom, email, mot_de_passe)
VALUES 
('Yassine', 'yassine@mail.com', 'yass123'),
('Sara', 'sara@mail.com', 'sara_pass'),
('Omar', 'omar@mail.com', 'omar2024');

SELECT * FROM Utilisateurs;