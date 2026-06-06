CREATE DATABASE customerdb;
USE customerdb;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Madurai'),
(3, 'Karthik', 'Coimbatore'),
(4, 'Divya', 'Trichy'),
(5, 'Vijay', 'Salem');

INSERT INTO orders VALUES
(101, 1, 'Laptop', 55000),
(102, 2, 'Mobile', 20000),
(103, 3, 'Headphones', 2500),
(104, 1, 'Keyboard', 1500),
(105, 5, 'Monitor', 12000);

SELECT c.customer_name,
       o.product_name,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name,
       o.product_name,
       o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE student_subjects (
    student_id INT,
    subject_name VARCHAR(100),
    PRIMARY KEY(student_id, subject_name),
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

CREATE TABLE departments (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    dept_id VARCHAR(10),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
('D01', 'HR'),
('D02', 'Finance');

INSERT INTO employees VALUES
(101, 'Ravi', 'D01'),
(102, 'Priya', 'D02');

SELECT * FROM departments;
SELECT * FROM employees;