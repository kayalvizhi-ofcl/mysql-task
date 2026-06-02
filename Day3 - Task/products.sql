CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2)
);
ALTER TABLE products
ADD stock INT;
ALTER TABLE products
RENAME COLUMN price TO unit_price;
INSERT INTO products (id, name, unit_price, stock)
VALUES
(1, 'Laptop', 50000, 10),
(2, 'Mouse', 500, 50),
(3, 'Keyboard', 1200, 30),
(4, 'Monitor', 15000, 15),
(5, 'Printer', 8000, 8);
SELECT * FROM products;
UPDATE products
SET stock = 20
WHERE id = 1;
SELECT * FROM products;
DELETE FROM products
WHERE id = 5;
SELECT * FROM products;