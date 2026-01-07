CREATE DATABASE db_suivi_travaux;
USE db_suivi_travaux;

CREATE TABLE utilisateur (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(50)
);

CREATE TABLE chantier (
    id_chantier INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(200) NOT NULL,
    date_deb DATE,
    date_fin DATE,
    statut VARCHAR(55),
    id_responsable INT,
    FOREIGN KEY (id_responsable) REFERENCES utilisateur(id_user)
);

CREATE TABLE mission (
    id_mission INT PRIMARY KEY AUTO_INCREMENT,
    description TEXT,
    date_limite DATE,
    etat VARCHAR(50),
    priorite VARCHAR(20),
    id_user INT,
    id_chantier INT,
    FOREIGN KEY (id_user) REFERENCES utilisateur(id_user),
    FOREIGN KEY (id_chantier) REFERENCES chantier(id_chantier)
);

-- Utilisateurs
INSERT INTO utilisateur (nom, prenom, email, role) VALUES
('BENKIRANE', 'Rachid', 'r.benkirane@gmail.com', 'Développeur'),
('ALAMI', 'AHMED', 'ahmed.alami@gmail.com', 'Développeur'),
('CHAKIR', 'Imane', 'imane.chakir@gmail.com', 'Testeur'),
('ELALAOUI', 'Zineb', 'z.alaoui@gmail.com', 'Chef de projet');

-- Chantiers
INSERT INTO chantier (id_chantier, titre, date_deb, date_fin, statut, id_responsable) VALUES
(123, 'APP mobile', '2025-01-09', '2025-12-28', 'En cours', 4),
(234, 'Site E-commerce Beauty', '2025-02-12', '2026-01-28', 'En cours', 4),
(98, 'Plateforme RH', '2025-03-01', '2025-11-15', 'Terminée', 4);

-- Missions
INSERT INTO mission (description, date_limite, etat, priorite, id_chantier, id_user) VALUES
('Design interface utilisateur', '2025-03-20', 'Terminée', 'Haute', 234, 1),
('Développement backend', '2025-04-10', 'En cours', 'Moyenne', 234, 2),
('Tests fonctionnels', '2025-05-01', 'Terminée', 'Basse', 98, 3),
('Rédaction documentation', '2025-06-15', 'Non commencée', 'Basse', 123, 1);

-- 1. Afficher tous les chantiers
SELECT titre, date_deb, date_fin FROM chantier;

-- 2. Utilisateurs dont le nom commence par 'EL'
SELECT * FROM utilisateur WHERE nom LIKE 'EL%';

-- 3. Missions du chantier 234 par priorité croissante
SELECT * FROM mission
WHERE id_chantier = 234
ORDER BY priorite ASC;

-- 4. Chantiers se terminant avant Avril 2026
SELECT * FROM chantier
WHERE date_fin < '2026-04-01';

-- 5. Tous les développeurs
SELECT * FROM utilisateur
WHERE role = 'Développeur';

-- 6. Missions terminées du chantier 98
SELECT * FROM mission
WHERE id_chantier = 98
AND etat = 'Terminée';

-- 7. Chantiers avec leurs responsables
SELECT 
    c.titre,
    c.date_deb,
    c.date_fin,
    u.nom AS nomResponsable,
    u.prenom AS prenomResponsable
FROM chantier c
JOIN utilisateur u
ON c.id_responsable = u.id_user;

-- 8. Missions du chantier "Site E-commerce Beauty"
SELECT m.*
FROM mission m
JOIN chantier c
ON m.id_chantier = c.id_chantier
WHERE c.titre = 'Site E-commerce Beauty';

-- 9. Nombre de missions terminées du chantier "Site E-commerce Beauty"
SELECT COUNT(*) AS nb_missions_terminees
FROM mission m
JOIN chantier c
ON m.id_chantier = c.id_chantier
WHERE c.titre = 'Site E-commerce Beauty'
AND m.etat = 'Terminée';

-- 10. Nombre de chantiers terminés en 2025
SELECT COUNT(*) AS nb_chantiers_2025
FROM chantier
WHERE statut = 'Terminée'
AND YEAR(date_fin) = 2025;

-- Modifier la date de fin du chantier 234
UPDATE chantier
SET date_fin = '2026-05-16'
WHERE id_chantier = 234;

-- Modifier l'état de la mission 98
UPDATE mission
SET etat = 'Terminée'
WHERE id_mission = 98;

-- Supprimer les missions non commencées du chantier 123
DELETE FROM mission
WHERE id_chantier = 123
AND etat = 'Non commencée';

-- Supprimer l'utilisateur ALAMI AHMED
DELETE FROM utilisateur
WHERE nom = 'ALAMI'
AND prenom = 'AHMED';