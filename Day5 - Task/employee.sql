CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
CREATE DATABASE company_db;
USE company_db;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
INSERT INTO employee VALUES
(1, 'Arun', 'HR', 25000),
(2, 'Priya', 'IT', 40000),
(3, 'Karthik', 'IT', 45000),
(4, 'Divya', 'Finance', 35000),
(5, 'Rahul', 'HR', 30000);
SELECT COUNT(*) AS total_employees
FROM employee;
SELECT SUM(salary) AS total_salary
FROM employee;
SELECT AVG(salary) AS average_salary
FROM employee;
SELECT department,
       SUM(salary) AS total_salary
FROM employee
GROUP BY department;
SELECT MAX(salary) AS max_salary,
       MIN(salary) AS min_salary
FROM employee;
SELECT department,
       SUM(salary) AS total_salary
FROM employee
GROUP BY department
ORDER BY total_salary DESC;