CREATE DATABASE IF NOT EXISTS knowledge_center;
USE knowledge_center;

CREATE TABLE IF NOT EXISTS User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    body TEXT NOT NULL,
    publish_date DATE NOT NULL,
    views INT DEFAULT 0,
    author_id INT NOT NULL,
    CONSTRAINT fk_article_author FOREIGN KEY (author_id)
        REFERENCES User(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    INDEX idx_author (author_id),
    INDEX idx_publish_date (publish_date)
);

INSERT INTO User (fullname) VALUES
('Adam'),
('Sara'),
('Yassine'),
('Nour');

INSERT INTO Article (title, body, publish_date, views, author_id) VALUES
('Lesson1', 'How to select filter and sort data from a table', '2023-08-21', 7, 2),
('Lesson2', 'How to select filter and sort data from a table', '2025-12-26', 6, 1),
('Lesson3', 'How to select filter and sort data from a table', '2025-10-04', 7, 3),
('Lesson4', 'How to select filter and sort data from a table', '2023-06-26', 8, 1);

SELECT a.title, u.fullname AS author
FROM Article a
INNER JOIN User u ON a.author_id = u.id
WHERE u.fullname = 'Adam';

SELECT 
    a.title,
    a.publish_date,
    u.fullname AS author
FROM Article a
INNER JOIN User u ON a.author_id = u.id
ORDER BY a.publish_date DESC;