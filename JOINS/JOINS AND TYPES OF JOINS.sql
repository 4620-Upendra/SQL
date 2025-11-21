-- 23-11-25: topic:SQL JOINS
-- join:To retrieve related data from two or more tables, we use JOIN. JOIN links tables using a common column (usually a primary key and foreign key).
use linkedin;
show tables;
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

CREATE TABLE Fees (
    fee_id INT PRIMARY KEY,
    student_id INT,
    amount INT,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(id)
);
INSERT INTO Students VALUES
(1, 'Raju', 'Hyderabad'),
(2, 'Kiran', 'Mumbai'),
(3, 'Manu', 'Hyderabad'),
(4, 'Sanjay', 'Delhi');

INSERT INTO Courses VALUES
(101, 1, 'Java'),
(102, 2, 'Python'),
(103, 2, 'C++'),
(104, 4, 'SQL'); -- No matching student

INSERT INTO Fees VALUES
(201, 1, 5000, 'Paid'),
(202, 2, 4500, 'Pending'),
(203, 4, 4800, 'Paid');

-- topic:SQL JOINS
-- join:To retrieve related data from two or more tables, we use JOIN. JOIN links tables using a common column (usually a primary key and foreign key).

-- Types of SQL Joins:
-- i)INNER JOIN:Returns only matching rows from both tables
select students.name,courses.course_name from students 
inner join Courses  
on students.id=Courses.student_id;

-- ii)LEFT JOIN (LEFT OUTER JOIN):Returns all records from LEFT table, and matched records from right.
select students.name,courses.course_name
from students left join courses
on students.id=courses.student_id;

-- iii)RIGHT JOIN (RIGHT OUTER JOIN):Returns all records from RIGHT table, and matched records from left.
select students.name,courses.course_name
from students right join courses
on students.id=courses.student_id; 

-- iv)FULL OUTER JOIN:Returns all records(from both table) when there is a match in either table.
-- FULL OUTER JOIN is not supported in MYSQL, so we create the equivalent using: LEFT JOIN + RIGHT JOIN + UNION

select students.name,courses.course_name
from students left join courses
on students.id=courses.student_id
union
select students.name,courses.course_name
from students right join courses
on students.id=courses.student_id; 

-- v)CROSS JOIN:Returns every possible combination of rows.
select students.name,courses.course_name
from students cross join courses;

-- v)self join(join):A SELF JOIN is when a table is joined with itself.
SELECT s1.id AS student_id,s1.name AS student_name,
s2.id AS other_student_id,s2.name AS other_student_name, s1.city
FROM Students s1
JOIN Students s2
ON s1.city = s2.city
AND s1.id <> s2.id;





