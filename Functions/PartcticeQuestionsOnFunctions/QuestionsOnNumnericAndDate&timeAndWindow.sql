use linkedin;
DROP TABLE IF EXISTS employees2;
CREATE TABLE employees2 (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    hire_date DATE,
    sales DECIMAL(10,2),
    discount DECIMAL(5,2),
    quantity INT
);

INSERT INTO employees2 (emp_id, first_name, last_name, department_id, salary, bonus, hire_date, sales, discount, quantity)
VALUES
(1, 'Alice', 'Smith', 10, 50000, 5000, '2020-01-15', 2000, 5.5, 12),
(2, 'Bob', 'Johnson', 20, 60000, 7000, '2019-03-10', 3000, 3.2, 7),
(3, 'Charlie', 'Williams', 10, 55000, 6000, '2021-07-20', 2500, 4.8, 15),
(4, 'David', 'Brown', 30, 45000, 4000, '2018-11-05', 1500, 2.5, 20),
(5, 'Eva', 'Davis', 20, 70000, 8000, '2022-02-28', 4000, 6.0, 8),
(6, 'Frank', 'Miller', 10, 48000, 5000, '2020-09-12', 1800, 3.5, 10),
(7, 'Grace', 'Wilson', 30, 52000, 5500, '2021-05-25', 2200, 4.0, 18),
(8, 'Hannah', 'Moore', 20, 65000, 7500, '2019-08-18', 3500, 5.0, 11);

-- topic :problems on Numeric, Date/Time, and Window functions in SQL 

-- 1)Numeric Functions
-- i)Find the square root of all salaries in the employees table.
select first_name,salary,sqrt(salary) as squareRoot_of_salary from employees2;

-- ii)Round all salary values to 2 decimal places.
select first_name,salary,round(sqrt(salary),2) as rounded_salary from employees2;

-- iii)Find the ceiling and floor of a discount column.
select emp_id,first_name,discount,ceil(discount) as in_ceilingpoint,
floor(discount) as in_flooringPoint from employees2;

-- iv) Calculate the absolute difference between salary and bonus.
select emp_id,salary,bonus,abs(salary-bonus) as absolute_diff from employees2;

-- v)Find the average, minimum, and maximum salary in the company.
select avg(salary),max(salary), min(salary) from employees2;

-- vi)Increase all price or salary values by 10% and round them.
select emp_id, round(salary+(salary*0.1),2) as salary_rounded from employees2;

-- vii) Find the modulus of quantity divided by 5.
select quantity ,mod(quantity,5) AS modulus_value from employees2;

-- 2)Date/Time Functions:
-- i) Extract the year, month, and day from the hire_date column.
select hire_date,day(hire_date) as hired_day, month(hire_date) as hired_month,
year(hire_date) as hired_year from employees2;

-- ii)Find the current date and current timestamp.
select  curdate() as currentDate ,current_timestamp() as currenttime_withDate;

-- iii)Calculate the number of days an employee has worked (today - hire_date).
select datediff(curdate(),hire_date) as workedDays from employees2;

-- iv)Add 30 days to order_date or hire_date
select hire_date as initial_date ,date_add(hire_date,interval 30 day) as days_added from employees2;

-- v) Find the day of the week for each hire_date.
select hire_date,dayofweek(hire_date) as dayOfWeek from employees2;
select hire_date,dayname(hire_date) as dayName from employees2;

-- vi) Calculate the number of months between hire_date and today.
-- TIMESTAMPDIFF(unit, start_date, end_date) → returns the difference in the specified unit (YEAR, MONTH, DAY, etc.).
select hire_date,timestampdiff(month,hire_date,curdate()) as noOfMonths from employees2;

-- 3)window function
-- i)Find the rank of employees based on salary.
select emp_id,first_name,salary,rank() over(order by salary desc) as rank_basedSal from employees2;

-- ii)Find the dense rank of employees by salary.
select emp_id,first_name,salary,dense_rank() over(order by salary desc) as rank_basedSal from employees2;

-- iii)Compute the cumulative sum of sales ordered by hire_date
select emp_id,hire_date,sales,sum(sales) over(order by hire_date)as  cumulative_sum from employees2;

-- iv)Find the moving average of sales over the last 3 rows.
select sales,avg(sales) over(order by hire_date rows between 2 preceding and current row) 
as moving_avg from employees2;

-- v)Find the previous salary of an employee using LAG
select emp_id,first_name ,salary,lag(salary) over() as previous_salary from employees2;
select emp_id,first_name ,salary,lag(salary,1,0) over() as previous_salary from employees2;

-- vi)Find the next hire date using LEAD.
select emp_id,hire_date,lead(hire_date) over() as next_employHireDate from employees2;

-- vii)Assign row numbers to employees ordered by salary.
select emp_id,first_name,salary,row_number() over(order by salary)as rowNumber from employees2;

-- viii)Partition employees by department_id and find average salary per department.
select emp_id,first_name,department_id,avg(salary) over(partition by department_id)
AS avg_salary_per_dept from employees2;


-- 4)Combination Problems (Numeric + Date + Window)
-- i) Calculate salary + 10% per year of experience, and rank employees by the updated salary.
select emp_id,first_name,salary,salary+((0.1*salary)*timestampdiff(year,hire_date,curdate())) as updated_sal ,
rank() over(order by salary+((0.1*salary)*timestampdiff(year,hire_date,curdate())) desc) as rankOnupdatedSal from employees2;

-- ii)Find cumulative sales per department and calculate difference from department average.
select emp_id,department_id,sales,sum(sales) over(partition  by department_id order by hire_date) as cumulative ,
sales-avg(sales) over(partition by department_id) as diff
from employees2 ; 

-- iii)Compute the difference between current salary and previous salary, ordered by hire date.
select emp_id,salary,hire_date,lag(salary) over(order by hire_date) as previous_sal,
salary-lag(salary) over(order by hire_date)  as diff from employees2;

-- iv)Find the number of days worked and rank employees by days worked.
select emp_id,first_name,datediff(curdate(),hire_date)  as workedDays ,
rank() over(order by datediff(curdate(),hire_date) desc) as rankOfemp from employees2 ;

-- v)Calculate bonus + 5% of salary, and find employees whose updated salary is above the department average.
SELECT *
FROM (
    SELECT 
        emp_id,
        first_name,
        department_id,
        salary,
        bonus,
        bonus + (0.05 * salary) AS updated_salary,
        AVG(salary) OVER (PARTITION BY department_id) AS dept_avg_salary
    FROM employees2
) AS sub
WHERE updated_salary > dept_avg_salary;







