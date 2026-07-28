-- SUB QUERY  
create database corr_db ;
use corr_db;
create table employee_c (id int, name varchar(20),salary int);
insert into employee_c values(1,'a',100) ,(2,"b",250),(3,"c",400),(4,"d",380); 
insert into employee_c value(5,"aman",250);
select max(salary)from employee_c;
select * from employee_c where salary = 400;
-- sub query 
-- max salary 
select * from employee_c where salary=(select max(salary) from employee_c);
-- min salary 
select * from employee_c where salary=(select min(salary) from employee_c);

-- find the salary using sub query 
select * from employee_c ;
-- find the emp salary jiski slary b ke equal ho 
select salary from employee_c where name = b ;

select * from employee_c where salary = (select salary from employee_c where name = "b") ;

-- find the avg 
-- normal ko sub me daal do to vo ban jayegi sab query 
select  avg(salary) from employee_c ;
-- abb ban gyi sab query 
select id, name ,salary from employee_c where salary > (select  avg(salary) from employee_c ); 
-- use of world database 
use world;
select * from city; 
-- Q1 get the name of the city where district is same for the city abudabhi 
-- normal query 
select District  from city where Name = "Abu dhabi";
-- normal query convert the sub qurey 
select  Name  from city where District =(select District from city where Name = "Abu dhabi") ;

-- Q2 get the columns from the city table where population is max 
-- normal query 
select  max(Population) from city ;
-- sub query   
select * from city where Population =(select  max(Population) from city); 

-- Q3 get the district and name of the city where the country code is same for (herat)
-- normal query
select * from city where Name = 'herat';
-- sub query
select Name,District from city where CountryCode = (select CountryCode from city where Name = 'herat');

-- Q4 get District City and Population for all the countries where (Amsterdam) is persent and  sort this data by the population 
-- normal query
select * from city where Name= "Amsterdam";
-- sub query
select Name,District,Population,CountryCode From city where CountryCode= (select  CountryCode from city where Name= "Amsterdam") order by population;



