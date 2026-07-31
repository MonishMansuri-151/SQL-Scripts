-- ===========================================================================================================
                               -- CORRLATED SUB QUERY IN SQL 
-- ============================================================================================================
-- A correlated subquery is a nested SQL query that depends on values from the outer query to execute.
--  Because it references columns from the outer query's 
--  row context, it cannot be run independently and must be evaluated 
--  repeatedly—once for each individual row processed by the outer query.


use corr_db;
create table order1(order_id int,name varchar(20),amount int); 
insert into order1  values(1,'a',100)  , (2,'a',200),(3,'a',300),(4,"b",400) , (5,"b",300); 
-- normal tarika ho phele apan karte the without use 
-- correlated 
select order_id ,name amount from order1 where name ="a" 
and amount = (select max(amount) from order1 where name = "a"); 

-- innner query normal query 
select max(amount) from order1 where name = 'a'; 
-- it is normal convert to the correlated query 
 select * from order1;
-- this is a correlated query of sql  ist depend on outer query 

select order_id,name,amount from order1 as o_outer 
where amount = (select max(amount) from order1 where name = o_outer.name);
