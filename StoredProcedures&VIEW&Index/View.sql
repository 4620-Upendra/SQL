-- topic:view
 
-- View:A View is a virtual table created from a SQL SELECT query.
-- It does not store data physically — it displays data fetched from one or more tables. Think of a view as a saved SQL query that acts like a table.
-- syntax:
-- CREATE VIEW view_name AS
-- SELECT columns
-- FROM table
-- WHERE condition;

-- i) creating view:
create view empView as 
select name,dept,salary from employees3;

-- Use (fetch) view
select * from empView;   

-- ii) View with WHERE Condition
 create view itEmployees as
 select name ,salary from employees3
 where dept="hr";
 
 select * from itEmployees;

-- iii)View using JOIN
CREATE VIEW empWithDept AS
SELECT e.name, d.dept_name
FROM employees3 e
JOIN departments d
ON e.dept = d.dept_name;

select * from empWithDept;    -- reading data  frim view

-- iv) Update Operations on Views:If a view represents a single table without complex operations, we can update the data through the view.
update empView 
set salary=77000
where name='amit'; 

-- v) Changing VIEW structure (table will NOT change)
alter view empView as
select emp_id ,name ,salary from employees3;
select * from empView;   

-- v)INSERT through VIEW
insert into empview(emp_id,name,salary)
values(7,'teja',55000);
select * from empView; 

-- vi) delete through view
delete from empview
where emp_id=1;
select * from empView; 

-- vii) droping view
drop view empview;

-- viii)Get List of Views in MySQL
show full tables where table_type='VIEW';

-- ix)Syntax to rename a view:
-- RENAME TABLE old_view_name TO new_view_name;
rename table empview to employeeDetailsView;


