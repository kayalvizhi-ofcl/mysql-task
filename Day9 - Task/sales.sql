-- Create Database
CREATE DATABASE sales_db;
USE sales_db;

-- 1. Create sales table

CREATE TABLE sales (
    id INT PRIMARY KEY,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1, 'Laptop', 50000),
(2, 'Mouse', 500),
(3, 'Keyboard', 1200),
(4, 'Monitor', 10000),
(5, 'Printer', 8000),
(6, 'Tablet', 10000);

-- 2. Use ROW_NUMBER() to rank sales by amount

SELECT
    id,
    product,
    amount,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM sales;

-- 3. Use RANK() to assign ranks with ties

SELECT
    id,
    product,
    amount,
    RANK() OVER (ORDER BY amount DESC) AS rank_num
FROM sales;

-- 4. Use DENSE_RANK() to avoid gaps in ranking

SELECT
    id,
    product,
    amount,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank_num
FROM sales;

-- 5. Use SUM() OVER() to calculate running totals

SELECT
    id,
    product,
    amount,
    SUM(amount) OVER (ORDER BY id) AS running_total
FROM sales;

-- 6. Create a CTE to fetch sales above average

WITH avg_sales AS (
    SELECT AVG(amount) AS avg_amount
    FROM sales
)
SELECT *
FROM sales
WHERE amount > (
    SELECT avg_amount
    FROM avg_sales
);