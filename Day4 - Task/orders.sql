CREATE TABLE orders (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);
INSERT INTO orders VALUES
(1, 'Apple Juice', 5, 150),
(2, 'Banana Chips', 2, 80),
(3, 'Almonds', 3, 450),
(4, 'Cookies', 1, 120),
(5, 'Aloe Vera Gel', 4, 300);
SELECT * FROM orders;
SELECT * FROM orders
WHERE quantity > 2;
SELECT * FROM orders
WHERE price BETWEEN 100 AND 500;
SELECT * FROM orders
WHERE product_name LIKE 'A%';
SELECT * FROM orders
ORDER BY quantity DESC;
