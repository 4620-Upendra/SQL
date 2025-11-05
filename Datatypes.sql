show databases;
create database linkedin;
use linkedin;
-- 1) creating table of employees 
create table Employees(
    id int primary key,
    name varchar(50),
    age int,
    salary decimal(10,2),
    is_active boolean,
    joining_date date
    );

-- 2)inserting data into employees table
-- I)inserting single row   
insert into employees (id,name,age,salary,is_active,joining_date) 
values (1, 'upendra', 22, 55000.75, TRUE, '2003-12-08');

-- II)inserting mutiple row   
insert into employees (id,name,age,salary,is_active,joining_date) 
values (2, 'Amosh', 21, 62000.50, TRUE, '2003-6-01'),
(3, 'kumar', 20, 48000.00, FALSE, '2002-11-03');

select * from employees;


