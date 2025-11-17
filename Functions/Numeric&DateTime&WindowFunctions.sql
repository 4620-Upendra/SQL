-- 17-11-2025 topics learned today :
-- 1)Numeric functions
-- 2)date & time functions
-- 3)Window functions

-- 1)Numberic functions
-- i)ABS(X):Returns absolute value of a number.
select abs(-10);  -- removes sings 

-- ii)ROUND(x, n) – Rounds a number to n decimal places.
select round(12.34567,2);

-- iii) CEIL(x) / CEILING(x) – Returns the smallest integer greater than or equal to x.
select ceil(4.7); -- o/t=5

-- iv) FLOOR(x) – Returns the largest integer less than or equal to x.
select floor(4.7);   -- o/t=4

-- v) POWER(x, y) – Returns x raised to the power y.
select pow(2,3);

-- vi) MOD(x, y) – Returns remainder of x/y.
select mod(10,3);    

-- vii) SQRT(x) – Returns square root of a number.
select sqrt(16);


-- 2) Date & Time Functions
-- i) NOW() / CURRENT_TIMESTAMP – Returns current date and time.
select now();
select current_timestamp();

-- ii)CURDATE() / CURRENT_DATE – Returns current date.
select current_date();
select curdate();

-- iii)DAY(date) – Returns day of the month.
select day('1990-11-17');

-- iv) MONTH(date) – Returns month number.
select  month('1990-12-20');
select monthname('1990-12-20');

-- v) YEAR(date) – Returns year number.
select year('1990-12-20');

-- vi) DATEDIFF(date1, date2) – Difference in days between two dates.
select datediff('1990-12-8','1990-12-2');

-- vii)DATE_ADD(date, INTERVAL n unit) – Add interval to a date.
select date_add('1990-12-8',interval 2 day);
select date_add('1990-12-8',interval 2 month);

-- viii) DATE_SUB(date, INTERVAL n unit) – Subtract interval from a date.
select date_sub('1990-12-8',interval 2 day);
select date_sub('1990-12-8',interval 2 month);
select date_sub('1990-12-8',interval 1 year);

use linkedin;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    region VARCHAR(50),
    product VARCHAR(50),
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (sale_id, region, product, sale_amount, sale_date) VALUES
(1, 'North', 'Laptop', 1200, '2025-11-01'),
(2, 'North', 'Tablet', 800, '2025-11-02'),
(3, 'South', 'Laptop', 1500, '2025-11-03'),
(4, 'East', 'Phone', 700, '2025-11-01'),
(5, 'North', 'Phone', 600, '2025-11-03'),
(6, 'South', 'Tablet', 900, '2025-11-04'),
(7, 'East', 'Laptop', 1300, '2025-11-02'),
(8, 'South', 'Phone', 500, '2025-11-05'),
(9, 'East', 'Tablet', 950, '2025-11-03'),
(10, 'North', 'Laptop', 1100, '2025-11-04');

-- 3)Window / Analytic Functions
-- i) ROW_NUMBER() – Assigns sequential row numbers within a partition.
-- Example: ROW_NUMBER() per region ordered by sale_amount
select region,sale_amount,row_number() over(partition by region order by sale_amount) from sales;


-- ii) RANK() – Assigns ranking with gaps for ties.
-- Example: RANK() per region ordered by sale_amount
select region,sale_amount ,rank() over(partition by region order by sale_amount) from sales;

-- iii) DENSE_RANK() – Assigns ranking without gaps.
-- Example: DENSE_RANK() per region ordered by sale_amount
select region,sale_amount ,dense_rank() over(partition by region order by sale_amount) from sales;

-- iv)SUM() / AVG() OVER(...) – Aggregate over a window without collapsing rows.
-- Example: SUM() OVER() to get total sales per region
select product,region,sale_amount,sum(sale_amount)
 over(partition by region) as total_sales_region,
round( avg(sale_amount) over(partition by region),2) as avg_sales_region
 from sales; 
 
 -- v) LAG() – Accesses value of a previous row in the same partition.
 select sale_id,product,region,sale_amount,lag(product) over() as privous_product from sales;
 select sale_id,product,region,sale_amount,lag(product) over(partition by region) as privous_region_product from sales;
 
 -- syntax :LAG(column, offset, default) OVER (PARTITION BY column ORDER BY column)
 select sale_id,product,region,sale_amount,sale_date,
 lag(sale_amount,1,0) over(partition by region  order by sale_date) as prev_sale 
 from sales;
 
 -- v) LEAD() – Accesses value of a following row in the same partition.
select sale_id,product,region,sale_amount,sale_date,
lead(sale_amount,1,0) over(partition by region  order by sale_date) as next_sale 
from sales;
   
select sale_id,product,region,sale_amount,lead(sale_amount,1,0) over(partition by region)
from sales;



