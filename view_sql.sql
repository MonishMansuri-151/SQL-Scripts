-- viwe in sql 
create database viewdb;

use viewdb;
create table emp (id int,name varchar(10),salary int);
insert into emp values(1,"rahul",1000),(2,"monish",20000),(3,"sohan",3000);

-- create is used to create view object 
-- object data strucute 

create view emp_v as select id,name from emp; -- simple view 

select * from emp_V;


-- insert row new reocrd emp 

insert into emp values(4,"abhi",8000);


select * from emp_v; -- base tabel change view alsot get new data

-- insert into view 
insert into emp_v values(4,"raj");

select * from emp;

select * from emp_V;-- ager view me change karenge to base table me  bhi chagne honge 


-- kis jgha viwe me insert nhi kar skte 
-- they are two category of view 
-- updateble and nonupdatabel




create table main (id int , name varchar(18)) ;
insert into main values(1,"rahul"), (2,"sohan"),(3,"mohan");

create table sam (id int, name varchar(10));
insert into sam values(1 , "kunal "),(2,"sam") ,(3,"bob");

select * from main as m join sam  as s on m.id = s.id ;  


-- create a view 
create view my_v as select m.id,m.name from main as m join sam  as s on m.id = s.id ;  

select * From my_v;
