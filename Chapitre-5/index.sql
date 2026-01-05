CREATE DATABASE users;
USE users;

CREATE TABLE Utilisateur(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(200)
);

INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES 
('Mehdi', 'mehdi@mail.com', 'mehdi_pass'),
('Lina', 'lina@mail.com', 'lina123'),
('Karim', 'karim@mail.com', 'karim_pwd');

UPDATE Utilisateur
SET nom = 'Mehdi El Amrani', email = 'mehdi.elamrani@mail.com'
WHERE id = 1;

DELETE FROM Utilisateur
WHERE id = 2;