-- topic:DQL – Data Query Language:DQL commands allow you to retrieve data from tables.
use schooldb;
INSERT INTO Students (StudentID, Name, Age, Email)
VALUES
(1, 'Upendra', 22, 'upendra@example.com'),
(2, 'Ravi', 23, 'ravi@example.com'),
(3, 'Sita', 24, 'sita@example.com'),
(4, 'Priya', 22, 'priya@example.com'),
(5, 'Karan', 25, 'karan@example.com'),
(6, 'Anu', 23, 'anu@example.com'),
(7, 'Mohan', 24, 'mohan@example.com');

-- 1) Select all columns
SELECT * FROM Students;
-- 2) Select specific columns
SELECT Name, Age FROM Students;
-- 3) Select with conditions
SELECT Name, Email FROM Students
WHERE Age > 22;
-- 4) Sorting results
SELECT Name, Age FROM Students
ORDER BY Age ASC;  -- ASC or DESC
-- 5)Grouping & aggregate functions
SELECT Age, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Age
HAVING COUNT(*) > 1;


