-- topic:Common SQL Clauses and Subqueries (Nested Queries)
show databases;
use linkedin;
show tables;

CREATE TABLE employees3 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(30),
    salary INT,
    age INT
);
INSERT INTO employees3 (emp_id, name, dept, salary, age) VALUES
(1, 'Amit',   'HR',        50000, 25),
(2, 'Riya',   'IT',        75000, 28),
(3, 'Suresh', 'IT',        90000, 32),
(4, 'Pooja',  'Finance',   65000, 29),
(5, 'Karan',  'HR',        48000, 24),
(6, 'Neha',   'Finance',   85000, 35);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    manager VARCHAR(50)
);
INSERT INTO departments (dept_id, dept_name, manager) VALUES
(1, 'HR',      'Mr. Arjun'),
(2, 'IT',      'Ms. Kavya'),
(3, 'Finance', 'Mr. Vipul');


-- 1)SQL Clauses (Very Important):Clauses are keywords used inside a SQL query to filter, sort, group, or limit data.
-- i) select :Used to fetch specific columns.
-- syntax:SELECT column1, column2 FROM table_name;
select name ,salary from employees3;

-- ii)From Clause:Specifies the table to retrieve data from.
-- syntax:SELECT * FROM table_name;
select * from employees3;

-- iii)WHERE Clause:Filters rows based on a condition.
-- syntax:SELECT * FROM table_name WHERE condition;
select * from employees3 where salary>60000;

-- iv)ORDER BY:Sorts the output (ASC / DESC).
-- syntax:SELECT * FROM table_name ORDER BY column_name ASC;
select * from employees3 order by salary ;
select * from employees3 order by salary desc;

-- v)GROUP BY:Used with aggregate functions (COUNT, SUM, AVG…).
-- syntax:SELECT column, COUNT(*) FROM table_name GROUP BY column;
select dept,count(*) as no_of_employees from employees3 group by dept;

-- vi)HAVING:Filters groups created by GROUP BY.
-- syntax:SELECT column, COUNT(*) FROM table_name GROUP BY column HAVING COUNT(*) > value;
select dept,avg(salary) as average_dept from employees3 group by dept having avg(salary)>60000;

-- vii)LIMIT / TOP:Restricts number of rows.
-- syntax:SELECT * FROM table_name LIMIT 5;
select * from employees3 limit 3;

-- viii)DISTINCT:Removes duplicate rows.
-- syntax:SELECT DISTINCT column FROM table_name;
select distinct dept from employees3;


-- 2)SUBQUERIES:A subquery is a query inside another query.
-- types of subqueries:
-- i)Single-row Subquery:Returns one value and Used with =, <, >
select * from employees3 where salary=(select max(salary) from employees3);

-- ii) Multi-row Subquery:Returns multiple values and Used with IN, ANY, ALL
-- in:
select name,dept from employees3 
where dept in(select dept_name from departments);

-- ANY Subquery:
select * from employees3 
where salary> any(select salary from employees3 where dept='HR');

-- ALL Subquery:
select * from employees3 
where salary> all(select salary from employees3 where dept='HR');

-- iii)Nested Subquery (Multiple Levels):A subquery inside another subquery.
select name ,salary from employees3 
where emp_id in (select emp_id from employees3 where salary=(select max(salary) from employees3));

-- iv)Correlated Subquery (Runs row-by-row):Inner query depends on outer query.
select name,dept,salary from employees3 e
where salary>(select avg(salary) from employees3 where dept=e.dept);

-- v)Subquery in FROM (Inline View):Treats subquery result as a temporary table.
select name,salary 
from(select emp_id,name,salary,dept from employees3 where salary >60000) as high_salary;     -- (high_salary(temporary table name))








