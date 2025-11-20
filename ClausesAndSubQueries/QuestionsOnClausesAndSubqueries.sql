-- topic:20 SQL Practice Problems (Clauses + Subqueries)

-- A) Clause-Based Questions (1–10)
-- 1)Write a query to display only the name and salary of employees who work in the IT department.
select name,salary from employees3 where dept='IT';

-- 2)Get all employee details sorted by salary in descending order.
select * from employees3 order by salary desc;

-- 3) Display unique department names from the employees table. (Use DISTINCT)
select distinct dept as unique_dept from employees3;

-- 4)Find all employees whose salary is between 50,000 and 90,000. (Use WHERE with AND)
select * from employees3 where salary between 50000 and 90000;

-- 5)Count how many employees are there in each department. (Use GROUP BY)
select dept,count(*) as count_of_employees from employees3 group by dept;

-- 6)Display departments where the average salary is more than 60,000. (Use HAVING)
select dept,avg(salary) as dept_average  from employees3 group by dept having avg(salary)>60000;

-- 7) Get the top 3 highest-salaried employees. (Use LIMIT)
select * from employees3 order by salary desc limit 3;

-- 8) Display employees whose name starts with the letter ‘N’. (Use LIKE)
select name as nameStartwithN,dept from employees3 where name like 'N%';

-- 9)Show total salary expenditure for each department. (Use GROUP BY with SUM)
select dept,sum(salary) as dept_expenditure from employees3 group by dept;

-- 10) Find employees older than 30 and order them by age.
select name,dept,salary,age from employees3 where age >30 order by age;

-- B) Subquery Questions (11–20)
-- 11)Find employees whose salary is equal to the highest salary in the company. (Single-row subquery)
select name,salary from employees3 
where salary = (select max(salary) from employees3);

-- 12) Display employees who work in departments that exist in the departments table. (IN subquery)
select name,dept,salary from employees3 
where dept in (select dept from departments);

-- 13)Find employees whose salary is higher than the average salary of all employees. (Single-row subquery)
select name,salary ,dept from employees3 where salary>(select avg(salary) from employees3);

-- 14) List employees who have a salary greater than all employees in the HR department. (ALL subquery)
select name,salary,dept from employees3 
where salary>all(select salary from employees3 where dept='HR');

-- 15) Show employees whose salary is greater than at least one salary in the Finance department. (ANY subquery)
select name,salary,dept from employees3 
where salary>any(select salary from employees3 where dept='Finance');

-- 16) Display employees who work in the same department as the employee named ‘Riya’.
select name,dept from employees3
where dept = (select dept from employees3 where name='Riya') and name<>'riya';

-- 17) Find the second-highest salary using a subquery.
select * from employees3 order by salary desc limit 1,1;

-- 18)Display employees whose salary is greater than the average salary of their own department. (Correlated subquery)
select name,salary,dept from employees3 e
where salary>(select avg(salary) from employees3 where dept=e.dept);

-- 19)List employees who belong to departments managed by ‘Mr. Vipul’. (Subquery + JOIN logic using dept_name)
select name from employees3 
where dept in (select dept_name from departments where manager='Mr. Vipul');

select e.name as employ_under_manager,e.dept,d.manager from employees3 e
 join departments d on e.dept=d.dept_name
where e.dept in (select dept_name from departments where manager='Mr. Vipul') ;

-- 20)From a subquery, create a temporary table that contains only employees earning above 60,000, and then select their names. (Inline view / subquery in FROM)
select name ,salary from (
select * from employees3 where salary>60000) as morethan60k;
