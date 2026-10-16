SELECT VERSION(), @@port, CURRENT_USER();

CREATE DATABASE coldbox_pentest_lab;
SHOW DATABASES LIKE 'coldbox_pentest_lab';
USE coldbox_pentest_lab;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_demo VARCHAR(100) NOT NULL
);
SHOW TABLES;