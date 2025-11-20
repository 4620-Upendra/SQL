-- topic:DML – Data Manipulation Language:Used to insert, update, and delete data in tables.
-- type 1)INSERT – Add new rows 
-- i)   Single row
INSERT INTO Students (StudentID, Name, Age, Email)
VALUES (1, 'Upendra', 22, 'upendra@example.com');

-- II) Multiple rows
INSERT INTO Students (StudentID, Name, Age, Email)VALUES 
(2, 'Ravi', 21, 'ravi@example.com'),
(3, 'Sita', 23, 'sita@example.com');

-- type 2: UPDATE – Modify existing rows
-- I) Update single row
UPDATE Students
SET Age = 23
WHERE StudentID = 1;

-- II) Update multiple rows
UPDATE Students
SET Age = Age + 1
WHERE Age < 25;

-- type 3:DELETE – Remove rows
 -- i) Delete specific rows
DELETE FROM Students
WHERE StudentID = 3;

-- ii)Delete all rows
DELETE FROM Students;



select * from students;