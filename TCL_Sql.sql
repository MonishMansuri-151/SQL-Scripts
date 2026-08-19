-- root concection 
drop database tcldb;
create database tcldb; 
use tcldb; 
create table tcldb.test(id int,name varchar(20));
insert into tcldb.test values(18,"abhinav");

select @@autocommit; -- by default autocommit is 1 mean file  will be automatically save 
start transaction;
insert into  tcldb.test values(19,"raj") ;  
insert into tcldb.test values(33,"monish");
select * from tcldb.test;   
commit; -- you saved the change in the database paramantly save the database 


start transaction; 
insert into  tcldb.test value (20,"mohan");
insert into  tcldb.test value (21,"japan");
insert into tcldb.test value(22,"sohan");
select * from tcldb.test ; 
rollback; -- to revert the data rollback extra two line inserted in your databases 

start transaction; 
update tcldb.test set name = "japan";
select * from tcldb.test ; 
rollback; -- to revert the data rollback extra two line inserted in your databases 
select * from tcldb.test; 
-- alwasy use start tranction its help of after delete the all data in your database 

start transaction; 
insert into  tcldb.test value (220,"sir");
delete from tcldb.test ;
select * from tcldb.test ; 
rollback; -- to revert the data rollback extra two line inserted in your databases 
  

