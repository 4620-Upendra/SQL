-- topic:View
-- View :An Index is a special data structure in a database that makes searching and querying faster.
-- It works just like an index in a book — instead of reading every page, the index helps jump directly to the needed page.
-- Without index → MySQL scans full table (slow)
-- With index → MySQL jumps directly to matching rows (fast)

-- i)Create an Index
-- syntax:CREATE INDEX index_name ON table_name(column_name);
create index idx_emp_name
on employees3(name);

-- ii)Create Index on Multiple Columns (Composite Index)
create index idx_emp_dept_sal
on employees3(dept,salary);

select * from employees3 where dept='it' and salary >50000;

-- iii)Check Existing Indexes
show indexes from employees3;

-- iv)Delete (Drop) an Index
drop index idx_emp_name on employees3;
