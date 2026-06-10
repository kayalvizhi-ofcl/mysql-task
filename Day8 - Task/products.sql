-- Create Database
CREATE DATABASE company_db;
USE company_db;

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Ajith', 'IT', 50000),
(2, 'Rahul', 'HR', 45000),
(3, 'Priya', 'IT', 60000),
(4, 'Anu', 'Finance', 55000),
(5, 'Kiran', 'HR', 48000);

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Ravi'),
(2, 'Meena'),
(3, 'Arjun'),
(4, 'Divya');

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101, 1, 1200),
(102, 2, 800),
(103, 1, 1500),
(104, 3, 600);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 50000),
(2, 'Mouse', 500),
(3, 'Keyboard', 1200),
(4, 'Monitor', 10000),
(5, 'Printer', 8000);

-- 1. Find employees with salary greater than the average salary

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 2. Select products with price higher than the cheapest order

SELECT *
FROM products
WHERE price > (
    SELECT MIN(order_amount)
    FROM orders
);

-- 3. Fetch customers with orders

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);

-- 4. Show order counts using a subquery in SELECT

SELECT
    customer_id,
    customer_name,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS order_count
FROM customers c;

-- 5. Find the highest salary per department

SELECT *
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- 6. Check if a product exists

SELECT product_name
FROM products
WHERE EXISTS (
    SELECT *
    FROM products
    WHERE product_name = 'Laptop'
);