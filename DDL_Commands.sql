-- DDL command 
create database tempdb;
use tempdb ;

-- DDL (alter) 
create table tempdb.employee( id int); 

alter table tempdb.employee add column name varchar(20); 
alter table tempdb.employee drop column id ; 


select * from tempdb.employee; 

desc tempdb.employee;
alter table tempdb.employee modify  column name varchar(10); -- add column 
alter table tempdb.employee add   empid int;  -- add column 

desc tempdb.employee;
alter table tempdb.employee modify  column name int ; -- add column 
alter table tempdb.employee add   empid int ; -- add column 

-- ------------------------------- 
-- constraint in  sql 

desc tempdb.employee;
alter table tempdb.employee add constraint unique (name ); -- add column 
alter table tempdb.employee modify column empid int not null ; -- not null  
alter table tempdb.employee add primary key(empid); 

-- coumn rename 
desc tempdb.employee;
alter table tempdb.employee rename column empid to id ; -- rename name of 
 
alter table tempdb.employee rename to emp; 
desc tempdb.emp;
-- rename the table 

-- truncate 
select * from tempdb.emp; 
insert into tempdb.emp values ("s",20) ;

truncate tempdb.emp; -- remove the inside the of table 
select * from emp; 
desc emp; 

alter table emp drop empid; 

select * from emp;
insert into  emp  values (10,"hh"), (20,"ee");

update emp set name = "rr" where id = 10;
-- not update primary key of emp name 
desc emp;
-- change the constraint of name of emp  

select * from emp; 
delete from emp where id = 20;





