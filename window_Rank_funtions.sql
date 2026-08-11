-- windows funtions 
-- rank() 
-- dense rank() 
-- row number 

use subdb;  
-- row number using rownumber() function 

select *, row_number() over() from employees;  
-- partition by departmetn use and assing the row number 

select *, row_number() over(partition by department) from employees;  
-- use of rank function use with order by provide the rank numeric column 
select *, rank() over() from employees; 
-- provide the rank based on salary max using order by desc
select *, rank() over(order by salary desc) from employees; 

-- with partitiion and order by rank department wise 
select *, rank() over(partition by department order by salary desc) from employees; 

-- dense rank 
select *, dense_rank() over(order by salary desc) from employees; 


