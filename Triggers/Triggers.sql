-- topic:Triggers in sql
use linkedin;
show tables;
create table employees4(
id int primary key auto_increment,
name varchar(50),
role varchar(30),
salary decimal(10,2)
);
create table employee_log(
log_ic int primary key auto_increment,
emp_id int,
action varchar(50),
`time` datetime
);
create table salary_log(
login_id int primary key auto_increment,
emp_id int,
old_salary decimal(10,2),
new_salary decimal(10,2),
`time` datetime
);


create table users(
id int primary key auto_increment,
username varchar(50),
email varchar(100)
);
create table delete_log(
log_id int primary key auto_increment,
user_id int,
username varchar(50),
`time` datetime);

CREATE TABLE employee_basic (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE employee_salary (
    id INT PRIMARY KEY,
    salary DECIMAL(10,2)
);
CREATE VIEW employee_view AS
SELECT b.id, b.name, s.salary
FROM employee_basic b
JOIN employee_salary s ON b.id = s.id;

-- topic:Triggers in sql
-- Trigger: A trigger is a special type of stored program in the database that automatically runs when a specific action happens on a table.
-- Think of it like a hidden alarm that activates when INSERT, UPDATE, or DELETE occurs on table.

-- 1)BEFORE INSERT Trigger:
-- When it runs?: Before inserting data into a table.
-- use case:To validate or modify data before it is inserted. 
-- example:Validation: Salary should not be less than 0.
delimiter $$
create trigger validate_salary
before insert on employees4
for each row
begin
   if new.salary<0 then
        set new.salary = 0;   -- overwrite invalid value
	end if;
end$$
delimiter ;

insert into employees4(name,role,salary)
values('upendra','software enginner',700000);
insert into employees4(name,role,salary)
values('amosh','manager',40000);
select * from employees4;

-- 2) AFTER INSERT Trigger
-- When it runs?:After data is inserted into a table.
-- use case:To keep logs or history.
-- example:Create a log record when an employee is added.
delimiter $$
create trigger log_employee_insert
after insert on employees4
for each row
begin
   insert into employee_log(emp_id,action,`time`)
   values(new.id,'Inserted',now());
end$$
delimiter ;

insert into employees4(name,role,salary)       -- insert data into employees4 table after createing log_employee_insert trigger
values('kumar','manager',400000);
select * from employees4;
select * from employee_log;         -- checking trigger is working or not
show triggers;

-- 3)BEFORE UPDATE Trigger
-- When it runs?:Before an update happens.
-- use case: Validate or restrict updates.
-- example:Do not allow salary decrease.
delimiter $$
create trigger prevent_salary_decrease
before update on employees4
for each row
begin 
  if new.salary<old.salary then
     set new.salary=old.salary;
  end if;
end$$
delimiter ;

update employees4 set salary=80000 where id=5;   -- updating salary after creating prevent_salary_decrease trigger
select * from employees4;                       -- checking trigger is working or not

-- 4) AFTER UPDATE Trigger
-- When it runs?After a row is updated.
-- Use Case:To track changes (audit).     
-- example:Record the old and new salary values.
delimiter $$
create trigger log_salary_update
after update on employees4
for each row
begin 
    insert into salary_log(emp_id,old_salary,new_salary,`time`)
    values(old.id,old.salary,new.salary,now());
end$$
delimiter ;

UPDATE employees4
SET salary = 999999 where id=5;  -- update salary after creating log_salary_update trigger
select * from employees4;          -- checking salary is updated or not
select * from salary_log;          -- checking updated salary data is inserted or not

-- 5)BEFORE DELETE Trigger
-- When it runs?:Before deleting a row.
-- Use Case:Prevent illegal deletions.
-- example:Do not allow deleting manager rows.
delimiter $$
create trigger stop_manager_delete
before delete on employees4
for each row
begin
     if old.role='manager' then                          -- then belongs to if statement
         signal sqlstate '45000'                         -- SIGNAL is used to throw an error manually inside triggers, procedures, or functions.
         set message_text='Managers cannot be deleted';  -- SQLSTATE '45000' : 45000 is a generic error code  and It tells MySQL: to Stop the operation and show a custom error message
     end if;
end $$

delete from employees4 where id=7;    -- it donot delete manager role employee gives an error beacuse of trigger
delete from employees4;
select * from employees4;           -- checking manager employee is deleted or not

-- 6)AFTER DELETE Trigger
-- When it runs?After a row is deleted.
-- Use Case:Log the deleted data.
-- example:Log information when a user is deleted.
delimiter $$
create trigger log_user_deleted
after delete on users
for each row
begin 
    insert into delete_log(user_id,username,`time`)
    values(old.id,old.username,now());
end$$
delimiter ;

insert into users (username,email)values('uppi','uppi@gmail.com'),
('amosh','amosh@gmail.com');
delete from users where id=1;     -- deleting row from users table after creating log_user_deleted trigger
select * from delete_log;         -- checking creating log_user_deleted trigger is working or not



-- Show all triggers in the current database
show triggers;

-- show triggers from specific employees4 table
SHOW TRIGGERS LIKE 'employees4';

-- Show the creation code of a specific trigger
SHOW CREATE TRIGGER log_salary_update;

-- Drop a trigger
drop trigger log_user_deleted;
DROP TRIGGER IF EXISTS log_salary_update;







