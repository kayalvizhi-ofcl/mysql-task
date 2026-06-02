CREATE DATABASE companyDB;
USE companyDB;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000
);
INSERT INTO employees (id, name, email, salary) VALUES
(1, 'Arun', 'arun@gmail.com', 45000),
(2, 'Priya', 'priya@gmail.com', 50000),
(3, 'Kavin', 'kavin@gmail.com', 35000),
(4, 'Divya', 'divya@gmail.com', 40000),
(5, 'Rahul', 'rahul@gmail.com', 30000);
SELECT * FROM employees;
INSERT INTO employees (id, name, email, salary)
VALUES (6, 'Anu', 'arun@gmail.com', 32000);
SELECT * FROM employees;
DROP TABLE employees;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000,
    CHECK (salary > 0)
);
SHOW TABLES;
