USE company_db;

SELECT emp_id, emp_name, department, salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 2
);

SELECT *
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
);

SELECT customer_id,
       SUM(order_amount) AS total_order_value
FROM orders
GROUP BY customer_id;

select * from employees;

ALTER TABLE employees
ADD manager_id INT;

UPDATE employees SET manager_id = 1 WHERE emp_id = 2;
UPDATE employees SET manager_id = 1 WHERE emp_id = 6;
UPDATE employees SET manager_id = 3 WHERE emp_id = 4;

SELECT emp_id, emp_name, salary
FROM employees e
WHERE salary >
(
    SELECT salary
    FROM employees m
    WHERE m.emp_id = e.manager_id
);

DESC products;
DESC orders;

ALTER TABLE orders
ADD product_id INT;

SELECT *
FROM products p
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.product_id
);
