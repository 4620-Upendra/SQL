show databases;
use linkedin;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary INT,
    experience INT,
    age INT,
    bonus INT,
    phone VARCHAR(15)
);

INSERT INTO Employees (emp_id, name, department, city, salary, experience, age, bonus, phone) VALUES
(1, 'Amit', 'HR', 'Delhi', 30000, 5, 28, 2000, '9876543210'),
(2, 'Sneha', 'IT', 'Mumbai', 45000, 7, 30, 3000, '9876501234'),
(3, 'Raj', 'Sales', 'Chennai', 25000, 3, 26, 1500, NULL),
(4, 'Priya', 'Finance', 'Delhi', 50000, 10, 35, 4000, '9898989898'),
(5, 'Vikram', 'HR', 'Bangalore', 28000, 2, 25, 2000, '9876001111'),
(6, 'Neha', 'IT', 'Hyderabad', 52000, 8, 32, 3500, '9876012345'),
(7, 'Ravi', 'Admin', 'Delhi', 40000, 6, 29, 2500, NULL),
(8, 'Kiran', 'Sales', 'Mumbai', 23000, 1, 23, 1000, '9856789012'),
(9, 'Divya', 'IT', 'Chennai', 48000, 4, 27, 3200, '9812345678'),
(10, 'Anil', 'Finance', 'Hyderabad', 55000, 9, 33, 4200, '9823456789');

select * from employees;

-- topic:SQL Operators – Practice Questions

-- I).Arithmetic Operators :Used for performing mathematical calculations.
-- 1)Display each employee’s annual salary (Salary × 12).
 select name,salary,salary*12 as annual_salary from employees;
 
 -- 2)Show each employee’s total earnings (Salary + Bonus).
 select name,salary,bonus,salary+bonus as total_earnings from employees; 
 
 -- 3)Find the difference between Salary and Bonus for each employee.
select name,salary,bonus,salary-bonus as diff_btn_sal_and_bonus from employees; 

-- 4)Calculate 10% of Salary as Tax for each employee.
select name,salary,(salary/100)*10 as tax from employees;
select name,salary,salary*0.10 as tax from  employees;

-- 5)Find the remainder when Salary is divided by 10000.
select name ,salary,salary%10000 as remainder from employees;

-- 6)Show Salary after adding 5000 increment for all employees.
 select name ,salary,salary+5000 as salary_after_increment from employees;
 
 -- 7)Calculate how many times Bonus fits into Salary using division (/).
 select name,salary,bonus,salary/bonus as times_bonus_fits_intoSalary from employees;


--  II)Comparison Operators (=, !=, <, >, <=, >=) :Used for comparing two values.
--  8)List employees whose Salary is greater than 50,000.
select name ,salary from employees where salary>50000;

-- 9)Show employees whose Age is less than 30.
select name,age as age_lessthan_30 from employees where age<30;

-- 10) Display employees whose Department is equal to “IT”.
select name,department as employees_from_IT from employees where department='IT';

-- 11) Find employees whose Salary is not equal to 40,000.
select name,salary from employees where salary<>40000;

-- 12)Show employees whose Experience is greater than or equal to 5 years.
select name,experience from employees where experience>=5;

-- 13) Find employees whose Bonus is less than or equal to 5000.
select name,bonus from employees where bonus<=5000;

-- ️III)Logical Operators (AND, OR, NOT): Combine multiple conditions.
-- 14) Show employees who work in IT department AND have experience > 5 years.
select name,department as employees_from_IT ,experience  from employees where department='IT' and experience>5;

-- 15) Find employees who belong to Finance OR HR department.
select name,department  from employees where department = 'finance' or department = 'hr';

-- 16) Display employees whose City is not “Delhi”.
select name,city as employees_NotFrom_Delhi from employees where not city='delhi';

-- 17) Find employees who are from Mumbai AND have Salary > 45,000
select name,city as employees_From_Mumbai ,salary from employees where salary > 45000 and city='mumbai';

-- 18) List employees who are NOT in Sales department.
select * from employees where not department = 'sales';

-- IV) BETWEEN Operator: Used to check if a value lies within a range.
-- 19)  Display employees whose Salary is between 30,000 and 50,000.
select name,salary from employees where salary between 30000 and 50000;

-- 20) Show employees whose Age is between 25 and 35.
select name ,age from employees where age between 25 and 35;

-- 21) Find employees whose Experience is between 2 and 10 years.
select name,experience from employees where experience between 2 and 10;

-- V) IN Operator:Used to check if a value matches any value in a list.
-- 22) Display employees who work in (‘IT’, ‘Finance’, ‘HR’).
select name,department from employees where department in ('IT','finance','HR');

-- 23) Show employees whose City is in (‘Delhi’, ‘Hyderabad’, ‘Mumbai’)
select name,city from employees where city in ('Delhi', 'Hyderabad', 'Mumbai');

-- 24) Find employees whose Department is not in (‘Sales’, ‘Support’).
select name,department from employees where  department not in ('sales','support');

-- VI) LIKE Operator :Used for pattern matching.
-- 25) Find employees whose Name starts with ‘A’.
select name as name_startsWith_a from employees where name like 'a%';

-- 26) Show employees whose Name ends with ‘n’.
select name name_endsWith_n from employees where name like '%n';

-- 27) Display employees whose Name contains ‘vi’ anywhere.
select name name_containes_vi from employees where name like '%vi%';

-- 28) Find employees whose City name has exactly 5 letters.
select name,city from employees where length(city)=5;

-- 29) Show employees whose Name starts with ‘S’ and ends with ‘h’.
select name from employees where name like 'S%h';

-- VII)IS NULL / IS NOT NULL : Used to check for missing data.
-- 30)Display employees whose Phone number is NULL. 
select name ,phone from employees where phone is null;

-- 31)Show employees whose Bonus is NOT NULL.
select name,bonus from employees where bonus is not null;

-- 32) Find employees who have missing department information.
select name, department from employees where department is null;

-- VIII) ANY Operator: Compares a value to any value in a subquery.
-- 33) Find employees whose Salary is greater than ANY employee in HR
select name ,salary from employees where salary> any(select salary from employees where department ='hr');

-- 34) Display employees whose Age is less than ANY employee in IT department.
select name,age from employees where age< any(select age from employees where department ='IT'); 

-- IX)ALL Operator: Compares a value to all values in a subquery.
-- 35) Find employees whose Salary is greater than ALL employees in Sales.
select name,salary from employees where salary> all(select salary from employees where department='sales');

-- 36)Show employees whose Age is less than ALL employees in Finance.
select name,age from employees where age< all(select age from employees where department='finance'); 


-- X)Combined Challenges (Logic + Comparison + Special Operators)
-- 37) Show employees who are in IT or Finance and have Salary > 45,000.
select name,department,salary from employees where department in ('IT','finance') and salary>45000; 

-- 38) Display employees whose Name starts with ‘P’ AND City is not ‘Delhi’.
select name,city from employees where name like 'P%' and not city='delhi'; 

-- 39)Find employees who are not from Mumbai AND Salary between 30k and 50k.
select name,salary,city from employees where city<>'mumbai' and salary between 30000 and 50000;

-- 40) Show employees with Experience > 5 years AND Bonus > 5000.
select name,bonus,experience from employees where experience>5 and bonus>5000;

-- 41)Find employees whose Salary is greater than average Salary of all employees.
select name,salary from employees where salary>(select avg(salary) from employees); 

-- 42) Display employees who have the same Salary as someone in the IT department.
select name,salary from employees where salary=any(select salary from employees where department='IT');

-- 43) Find employees whose Experience is greater than ANY employee in Sales.
select name,experience from employees where experience>any(select experience from employees where department='Sales');

-- 44)Display employees who earn more than ALL employees in HR.
select name ,salary from employees where salary>all(select salary from employees where department='HR'); 

-- 45)Show employees whose Name contains “a” and Phone number is not null.
select name,phone from employees where name like '%a%' and phone is not null; 

-- XI)Bonus Real-Time Scenarios
-- 46)Find the second-highest Salary using comparison operators.
select name,salary from employees where salary<(select max(salary) from employees )order by salary desc limit 1;   

-- 47) Display all employees who earn above company average salary.
select name ,salary from employees where salary>(select avg(salary) from employees);

-- 48)Find employees whose Salary + Bonus > 60,000.
select name,salary,bonus ,salary+bonus as total_salary from employees where salary+bonus>60000; 

-- 49)List employees whose Salary after 10% increment > 50,000.
select name,salary,salary+salary*0.10 as salary_after_10perIncrement from employees where salary+salary*0.10>50000;

-- 50)  Display employees whose Salary is not between the min and max salary of HR.
select name,salary from employees
 where salary not between 
 (select min(salary) from employees where department='HR')
 and (select max(salary) from employees where department='HR');