-- in this multi sub query fillter one more rows they are use (in) opreator  this they are main use 
-- of 3 opreator (any,in,all) why use three opretor because innner query si multi rows query  
create database corr_db ;
use corr_db;
create table employee_c (id int, name varchar(20),salary int);
insert into employee_c values(1,'a',100) ,(2,"b",250),(3,"c",400),(4,"d",38);
-- multi row query 
select salary from employee_c where name = "a"; 

select * from employee_c where salary in (select salary from employee_c where name = "a"); 

select avg(salary) from employee 

-- sub query 
select emp_name ,department  ,salary fromm employee where salary > (slect avg(salary) from employee) 


normal query 
select max(salary) from employee 

sub query
select emp_name,department ,salary from employe where salary = (select max(salary) from employee) 



select hire_date from employee where hire_date = 2016 

-- subquery 

select emp_name,department, from  employee where 
hire_date =(select hire_date from employee where  name = "richle king") and name != "racial king" 

select avg(price) from product  

select product_name, price from product where price >(sect avg(price) from product)

-- 201 202 203 204 205 206 207 208 209 2010

select distinct(custromer_id) from orders; 
select customrer id , cut name ,city, whrere cusid in (select distinct(customer_id) from order );