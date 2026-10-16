USE coldbox_pentest_lab;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_demo VARCHAR(100) NOT NULL
);

SHOW TABLES;