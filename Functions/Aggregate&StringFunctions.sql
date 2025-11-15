-- topic :functions in sql
-- 1) aggregate functions
-- 2) string functions 

show databases;
use linkedin;
show tables;

create table employees1(
   id int primary key,
   name varchar(50),
   department varchar(50),
   salary int
   );

INSERT INTO Employees1 (id, name, department, salary) VALUES
(1, 'Raj',    'IT',        30000),
(2, 'Anita',  'HR',        45000),
(3, 'Mohan',  'IT',        50000),
(4, 'Sneha',  'HR',        35000),
(5, 'Pooja',  'Finance',   60000),
(6, 'Amit',   'Finance',   40000),
(7, 'Ravi',   'IT',        55000),
(8, 'Meera',  'HR',        30000);
select * from employees1;

-- 1) aggregate functions
-- i)count(): Counts total records
select count(*) as TotalEmployees from employees1;

-- ii)sum(): Returns total sum
select sum(salary) as TotalSalary from employees1;

-- iii)avg(): Returns average value
select avg(salary) as AverageSalary from employees1;

-- iv)min(): Returns smallest value
select min(salary) as minimumSalary from employees1;

-- v)max():  Returns largest value
select max(salary) as MaximumSalary from employees1;


-- 2)String functions

 -- i)upper():Convert to uppercase
 select name,upper(name) as UpperName from employees1;
 
 -- ii)lower(): Convert to lowercase
 select name,lower(name) as LowerName from employees1;
 
 -- iii)length()/len(): find string length
 select name,length(name) as NameLength from employees1;
 
 -- iv)substring:Extract substring  (index starts from 1 and end index includes)
 select name,substr(name,1,3) as ShortName from employees1;
 
 -- v)concat():Join strings
 select concat(name,' works in ',department) as Info from employees1;
 
 -- vi)replace():replace text  (replace(string,charToReplace,newChar))
 select name,replace(name,'a','@') as updatedName from employees1;
 
 -- vii)trim() / ltrim() / rtrim():Remove spaces
 select trim('  sql  ') as trimmed;
 select ltrim('  sql') as LTrimmed;
 select rtrim('sql  ') as RTrimmed;
 
 -- viii)left()/ right(): Take characters from left/right
 select name,left(name,2) as FirstTwoLetter from employees1;
 select name,right(name,2) as LastTwoLetter from employees1;
 
 -- ix)instr() / charindex(): Find position :instr(string,string to find)
 select instr("Hello Sql","Sql") as position;
  
 -- x)lpad():Pad left side
 select lpad(name,10,'*') as LPaddedName from employees1;
 
 -- xi)rpad():Pad right side
 select rpad(name,10,'*') as RPaddedName from employees1;
