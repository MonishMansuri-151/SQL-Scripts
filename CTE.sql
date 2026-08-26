-- CTE 
use viewdb;
-- CTAS - create table as select statement 
create table city_2 as select * from world.city;  -- create table as select statement 
select * from city_2 ; 
-- with correlated query 
select name, population from city_2 as c where population = (select max(population) from city  as c1 where c.district = c1.district); 

with district_max as (
select district,max(population ) as d_population
from city_2 group by district)

-- join 
select * from city_2 as c join district_max as d 
on c.district = d.district and 
c.population = d.population;


-- which city 3 hightes population ho city me se 
with max_p as (
select *,dense_rank() over(order by population desc) as p from city_2)


select * from max_p where p = 3;

