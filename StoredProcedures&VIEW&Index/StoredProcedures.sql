-- topic:Storeed procedure

-- Stored Procedure:
-- A Stored Procedure is a pre-written SQL code saved in the database.Instead of writing the same queries again and again, we store them once and call the procedure whenever needed. 
-- syntax:
-- DELIMITER $$
-- CREATE PROCEDURE procedure_name(IN input_param datatype , OUT output_param datatype )
-- BEGIN
--     -- SQL statements
-- END $$
-- DELIMITER ;


use linkedin;
-- 1)Stored Procedure WITHOUT Parameters
delimiter $$
 create procedure showEmployees()
 begin
    select * from employees3;
end $$
delimiter ;

call showEmployees();  -- call store procedure

-- 2)Stored Procedure WITH Parameters
delimiter $$
create procedure getEmployeesByDept(in deptname varchar(30))
begin
select  * from employees3 where dept=deptname;
end $$
delimiter ;

call getEmployeesByDept('HR');

-- 3)Stored Procedure with MULTIPLE Parameters
delimiter $$
create procedure empSalaryRange(in minSal int,in maxSal int)
begin
   select * from employees3 
   where salary between minSal and maxSal;
end  $$
delimiter ;

call empSalaryRange(30000,70000);

-- 4)Stored Procedure (UPDATE Query)
delimiter $$
create procedure updateSalary(in empId int,in newSalary int)
begin
    update employees3 set salary=newSalary where emp_id=empId;
end $$
delimiter ;

call updateSalary(2,80000);

-- 5)Stored Procedure with OUTPUT Parameter
delimiter $$
create procedure countEmployees(out total int)
begin
   select count(*) into total from employees3;
end$$
delimiter ;

call countEmployees(@x);     -- @x is variable store total value which returned by  store procedure countEmployees
select @x;


-- 6)Stored Procedure with both INPUT and OUTPUT parameters
delimiter $$ 
create procedure getSalaryById(in empid int,out empSal int)
begin
  SELECT salary INTO empSal
  from employees3
  where emp_id=empid;
end $$
delimiter ;

call getSalaryById(2,@employeeSalary);
select @employeeSalary;


-- 7) To get Stored Procedures in MySQL
-- i) Show all Stored Procedures in MySQL
show procedure status;

-- ii)Show Stored Procedures of a Specific Database
-- syntax:SHOW PROCEDURE STATUS WHERE Db = 'your_database_name';
show procedure status where db='linkedin';

-- iii) To see the actual SQL inside a procedure:
-- syntax:SHOW CREATE PROCEDURE procedure_name;
show create procedure getEmployeesBYDept;

-- 8)To delete (drop) a stored procedure in MySQL
-- syntax:DROP PROCEDURE procedure_name;
drop procedure getEmployeesBYDept;   -- or
DROP PROCEDURE IF EXISTS getEmployeesByDept;














