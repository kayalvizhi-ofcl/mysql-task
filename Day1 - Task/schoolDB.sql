CREATE DATABASE schoolDB;

USE schoolDB;

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    grade VARCHAR(10)
);

INSERT INTO students VALUES
(1, 'Arun', 18, 'A'),
(2, 'Priya', 19, 'B'),
(3, 'Kavin', 17, 'A'),
(4, 'Divya', 18, 'C'),
(5, 'Rahul', 20, 'B');

SELECT * FROM students;

DROP DATABASE schoolDB;