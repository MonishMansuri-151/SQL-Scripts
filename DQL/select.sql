use world;
show tables;
-- select * from country
select * from country;
select Name from country;
select name , continent from country;
select name , continent , population + 100 as popu from country;

select * from country where continenet = "Europe"
and indepyear >1900;
-- get the country code and country name where the serface > 1900
select * from country;
-- where clause 
select code , name from country  where SurfaceArea > 1900;
select name , code  from country where Region = 'Southern Europe';
select * from country where continent ='Africa'and region ='central africa';
select name, continent from country where population = 'asia' or 'africa';
select name , population,region from country  where population * 1.10 and  indepyear > 1950;
select * from country where name =localname;select * from country;
-- between opreator 
select * from country where capital between 20 and 200;
-- question based on like opreator 
select * from country where name like '%A';
select name , population from city where name like '%e%';
select name , population from city where name like '%B_';-- secound last element b
select name , population from city where name like '_a%r_';
select name , population from city where name like 'aa%';
select name , population from city where name like '%e_e%';

