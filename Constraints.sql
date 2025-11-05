-- day2
-- topic :Constraints 
show databases;
use linkedin;

-- Sample Table ( base structure )
create table students(
 studentID int auto_increment primary key ,          -- PRIMARY KEY + AUTO_INCREMENT
 name varchar(100) not null,                         -- NOT NULL
 email varchar(150) ,
 age int,
 city varchar(100) DEFAULT 'Not Mentioned'           -- DEFAULT
 );
 
 INSERT INTO Students (Name, Email, Age, City)
VALUES 
('Rahul Sharma', 'rahul@gmail.com', 21, 'Delhi'),
('Aditi Mehra', 'aditi@yahoo.com', 19, 'Mumbai'),
('Karthik Rao',  NULL, 22, 'Bangalore'); 

--  Add Constraint
-- syntsx:  ALTER TABLE table_name
-- ADD CONSTRAINT constraint_name constraint_type (column_name);

-- add unique Constraint to email column 
ALTER TABLE Students
ADD CONSTRAINT unique_email UNIQUE (Email);

--  add check Constraint to age column 
ALTER TABLE Students
ADD CONSTRAINT check_age CHECK (Age >= 18);

INSERT INTO Students (StudentID, Name, Email, Age, City)       -- inserting data after adding Constraints to tables
VALUES
(5, 'Upendra', 'uppi@gmail.com', 22, 'vizag');        --  Valid row

-- INSERT INTO Students (StudentID, Name, Email, Age, City)
-- VALUES
-- (8, 'Reena', 'reena@gmail.com', 16, 'Delhi');             --  CHECK violation (Age < 18)


-- Drop constraint
-- syntax: ALTER TABLE table_name
-- DROP CONSTRAINT constraint_name;

alter table students drop constraint unique_email,drop constraint check_age;

select * from students;

