CREATE DATABASE eventdb;
USE eventdb;
CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE
);

INSERT INTO events (id, event_name, event_date) VALUES
(1, 'Tech Conference', '2026-07-15'),
(2, 'Music Festival', '2026-08-20'),
(3, 'Sports Meet', '2026-09-10'),
(4, 'Workshop', '2026-10-05'),
(5, 'Annual Day', '2026-11-25');

SELECT NOW();

SELECT event_name,
       DATE_FORMAT(event_date, '%d-%m-%Y') AS formatted_date
FROM events;

SELECT event_name,
       YEAR(event_date) AS event_year,
       MONTH(event_date) AS event_month
FROM events;

SELECT CONCAT(event_name, ' - ', event_date) AS event_details
FROM events;

