-- topic : TCL (Transaction Control Language)

show databases;
use linkedin;
create table Accounts(
    acc_id int primary key,
    acc_holder varchar(50),
    balance decimal(10,2)
    );
    
insert into  Accounts (acc_id,acc_holder,balance)
values
(101,'uppi',5000.00),
(102,'amosh',3000.00),
(103,'kumar',8000.00);
   
-- TCL (Transaction Control Language)
select * from accounts;
set autocommit=0;     -- to perfrom TCL step1:  set autocommit=0

update accounts set balance=balance-1000 where acc_id=101;
update accounts set balance=balance+1000 where acc_id=102;
select * from accounts;
rollback;     -- it rollback to where autocommit=0 or to savepoint 
select * from accounts;

 savepoint step1; 
 delete from accounts where acc_id=103;
 select * from accounts;
 rollback to step1;     -- it will undo's chnages from savepoint step1
 select * from accounts;
 
commit;    -- all change are finaled means then run commit command to save all changes permentaly 

set autocommit=1;   -- after that set autocommit=1; 


-- topic: DCL Commands (Data Control Language)

select user();   -- give user name: root@localhost

-- 1) grant:
grant select ,update on accounts to root@localhost;   -- root@localhost(username)  and allowing select ,update operation to perfrom on table by grant
select * from accounts;
update accounts set balance=600 where acc_id=102;

-- insert into accounts (acc_id,acc_holder,balance)   -- here we inserting data into table after not grant to insert data into table but here it will work because 
-- values                         --     here we are using root user, and root already has all privileges in MySQL by default.  so GRANT does not restrict or reduce existing permissions.
-- (104,'murthy',7000.00);
-- delete from accounts where acc_id=104;

-- 2)  revoke
revoke update on accounts from root@localhost;        -- removing permission to perfrom update operation to root@localhost(user)
update accounts set balance=6000 where acc_id=102;     -- but here it will work because here we are using root user, and root already has all privileges in MySQL by default.  so GRANT does not restrict or reduce existing permissions.
select * from accounts;    