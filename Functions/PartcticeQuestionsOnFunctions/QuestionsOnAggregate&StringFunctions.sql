
-- practice questions on   Aggregate & String Functions, including LPAD/RPAD

use linkedin;
-- PART 1: Aggregate Function Questions
-- 1) Count how many employees are in the company.
select count(*) as totalemployees from employees1;

-- 2)Find the total salary paid to all employees.
select sum(salary) as totalSalary from employees1;

-- 3)Find the average salary of all employees.
select avg(salary) as averageSalary from employees1;

-- 4)Find the highest salary and lowest salary.
select max(salary) as highestSalary from employees1;
select min(salary) as lowestSalary from employees1;

-- 5)Count number of employees in each department. (GROUP BY)
select department,count(*) as TotalEmployeesInDept from employees1 group by department; 

-- 6) Find the total salary paid for each department.
select department,sum(salary) as totalDeptSal from employees1 group by department;

-- 7) Find the department with the highest paid employee.
select department as deptWithHighestSal ,salary from employees1 where salary =(select max(salary) from employees1) ;

-- 8) Find how many employees have salary greater than 40,000.
select count(*) as employees from employees1 where salary>40000;

--  9)Find average salary of IT department only.
select avg(salary) as AverageSal_of_IT from employees1 where department='IT';

-- 10) Show departments having more than 2 employees. (HAVING)
select department,count(*) as Count_of_emply from employees1 group by department having Count_of_emply>2;

-- 11) Find the difference between highest and lowest salary.
select max(salary)-min(salary) as diff_btw_highlow_sal from employees1;

-- 12) Show department-wise highest and lowest salary.
select department,min(salary) as minSalary,max(salary) as maxSalary from employees1 group by department;

-- 13) Show overall company salary statistics

select count(*) as total_employees,
     sum(salary) as total_salary,
     avg(salary) as average_salary, 
     min(salary) as minSal,
     max(salary) as maxSal
     from employees1;
     

-- PART 2: String Function Questions

-- 1) Show employee names in uppercase.
select name,upper(name) as Name_in_uppercase from employees1;  

-- 2) Show employee names in lowercase.
select name,lower(name) as Name_in_Lowercase from employees1;  

-- 3) Display name and its character length.
select name,char_length(name) as char_len_in_name from employees1;

-- 4) Extract first 3 letters of all employee names.
select name,left(name,3) as firstThreeLetters from employees1;

-- 5️)Concatenate name and department like:Raj works in IT
select concat(name," works in ",department) from employees1;

-- 6) Replace letter a with @ in all names.
select name,replace(name,'a','@') as newName from employees1;

-- 7)Trim spaces from ' SQL Functions '.
select trim(' SQL Functions ') as trimmed;  -- remove spaces in both left,right
select ltrim(' SQL Functions ') as lift_trimmed;     -- remove spaces in left
select rtrim(' SQL Functions ') as right_trimmed;     -- remove spaces in right

-- 8) Show first 2 and last 2 characters of each name.
select name,left(name,2) as firstTwoLetter ,right(name,2) as lastTwoLetter from employees1;

-- 9) Find position of 'a' in each employee name.   
select name,instr(name,'a') as positionOf_a_InName from employees1;

-- 10)If a name has less than 5 characters, pad it with * on left to make it 5 chars. (LPAD)
select lpad(name,5,'*') as liftPaddedName from employees1 where char_length(name)<5;

-- 11) Mask employee names except first 2 letters (e.g., Ra*). 
select name,rpad(left(name,2),length(name),'*') as masked_name from employees1;

-- 12) Format salary with leading zeros (Example: 30000 → 00030000). (LPAD)
select salary ,lpad(salary,length(salary)+3,0) as formatted_sal from employees1;

-- 13) Create email addresses from names:name@company.com in lowercase. 
select name,lower(concat(name,'@company.com')) as email from employees1;

-- 14) Reverse employee names (if DB supports REVERSE() function)
select name,reverse(name) as name_reversed from employees;

-- 15) Extract last word from sentence:'Welcome to SQL World' → 'World'
select right('Welcome to SQL World',length('world')) as last_word;

-- or
select substring_index('Welcome to SQL World',' ',-1) as last_word;
-- Explanation:
-- SUBSTRING_INDEX(sentence, ' ', -1) → splits the string by spaces and returns the last part (-1 = last token).
-- Works for any sentence, not just hardcoded 'World'.


-- Bonus Questions (Mixed Functions)
-- * Show name, department and name length, sorted by length.
select name,department, length(name) as lengthOfName from employees1 order by lengthOfName;

-- 1)  Build employee codes: first 2 letters of dept + LPAD(id,3,'0')
-- Example: IT005, HR002
select name,concat(left(department,2),lpad(id,3,0)) as employee_code from employees1;

--  2) Display summary:
-- | Total Employees | Total Salary | Avg Salary | Highest | Lowest |
select count(*) as total_employees,
     sum(salary) as total_salary,
     avg(salary) as average_salary, 
     min(salary) as Highest,
     max(salary) as Lowest
     from employees1;

-- 3) Create a string like:
-- Raj-IT-30000 | Anita-HR-45000 | ... 
select group_concat(concat(name,'-',department,'-',salary)separator '|') as employee_summary 
from employees1;
-- 📌 Explanation
-- 1) CONCAT(name, '-', department, '-', salary) → combines each employee’s details into Name-Dept-Salary.
-- 2) GROUP_CONCAT(... SEPARATOR ' | ') → joins all rows into one string separated by |.

