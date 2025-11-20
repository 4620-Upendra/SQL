-- day 3:
-- topic:  DDL – Data Definition Language Commands:Used to define, modify, or remove the structure of databases, tables, and indexes.

-- type 1) create:Create a database, table, or index

-- I)syntax to create database : create database database_name;
create database schooldb;

-- II) create table
use schooldb;
create table students(
   StudentID int primary key,
   name varchar(50) not null,
   age int check(age>0),
   email varchar(50) unique
   );
   
-- III) create index
create index idx_name on students(name);

-- type 2) alter :Modify existing tables
-- i) add a column to existing table
alter table students add column phoneNumber varchar(15);

-- II)  Modify column datatype
alter table students modify column age smallint;

-- III) Drop a column
alter table students drop column phoneNumber; 

-- type 3) rename:change name of table or database or column
 -- I) rename table
 alter table students rename pupils;

 -- II)rename column 
 alter table pupils rename column name to fullName;
 
 -- III) rename database: cannot directly rename a database using a simple command in MySQL


-- type 4)drop table and database:Remove tables or databases permanently
-- I) drop table
drop table pupils; 

-- II) drop database 
drop database schooldb;
   
-- type 5) truncate:Remove all rows but keep table structure
insert into students values
    (1,"uppi",21,"uppi@gmail.com"),
    (2,"asmosh",22,"Amosh@gmail.com");
    
select * from students;
truncate table students; 
select * from students;

 
