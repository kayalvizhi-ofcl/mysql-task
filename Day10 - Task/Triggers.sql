-- Create Database
CREATE DATABASE company_management;
USE company_management;

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Ajith', 50000),
(2, 'Rahul', 45000),
(3, 'Priya', 60000);

-- Stock Table
CREATE TABLE stock (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT
);

INSERT INTO stock VALUES
(1, 'Laptop', 20),
(2, 'Mouse', 50),
(3, 'Keyboard', 30);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT
);

INSERT INTO orders VALUES
(101, 1, 2),
(102, 2, 5);

-- Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    role VARCHAR(20)
);

INSERT INTO users VALUES
(1, 'admin1', 'admin'),
(2, 'admin2', 'admin'),
(3, 'user1', 'user');

-- 1. Stored Procedure to Insert a New Employee

DELIMITER //

CREATE PROCEDURE AddEmployee(
    IN p_id INT,
    IN p_name VARCHAR(50),
    IN p_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO employees
    VALUES (p_id, p_name, p_salary);
END //

DELIMITER ;

-- Call Procedure

CALL AddEmployee(4, 'Kiran', 55000);

-- 2. Stored Procedure to Update Salary by ID

DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN p_id INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = p_salary
    WHERE emp_id = p_id;
END //

DELIMITER ;

-- Call Procedure

CALL UpdateSalary(2, 50000);

-- 3. Trigger to Update Stock When New Order is Placed

DELIMITER //

CREATE TRIGGER trg_update_stock
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE stock
    SET quantity = quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

-- Test Trigger

INSERT INTO orders VALUES (103, 1, 3);

SELECT * FROM stock;

-- 4. Trigger to Prevent Deleting the Last Admin

DELIMITER //

CREATE TRIGGER trg_prevent_last_admin
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF OLD.role = 'admin'
       AND (SELECT COUNT(*) FROM users WHERE role='admin') = 1
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete the last admin';
    END IF;
END //

DELIMITER ;

-- Test Trigger

DELETE FROM users WHERE user_id = 1;

-- 5. Procedure to Fetch Employees

DELIMITER //

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;

-- Call Procedure

CALL GetEmployees();

-- 6. Drop Procedure and Trigger

DROP PROCEDURE AddEmployee;
DROP PROCEDURE UpdateSalary;
DROP PROCEDURE GetEmployees;

DROP TRIGGER trg_update_stock;
DROP TRIGGER trg_prevent_last_admin;

SHOW PROCEDURE STATUS
WHERE Db = 'company_management';

SHOW TRIGGERS;