-- multirows functions 
-- distinct()
-- count ()
use world;
select (name) from country;
select distinct(name) from country;
select distinct(continent) from country;
-- agregate function multirow function 
-- string per 3 funtions use hote he count(),min(),max()

select count(population ),sum(population) from country;
select count(surfacearea), sum(surfacearea),max(surfacearea) from country;
select count(continent),max(continent) from country; -- continent 
select count(continent),min(continent) from country; -- continent 
select max(current_date()) from country;
-- aggregate funtion ke sath ham normal name,contine ya column print nhi kar skte 
-- aggregate ke sath multiple aggregate laga skte he 
-- ex 
select continent , max(continent) from country; -- error aa gya 
select avg(population) from  country;
select avg(population),avg(replace(population, 1,4)) from  country;

-- sort data 
-- order by clause 
select name, continent,region,population from country
order by name;
-- desc desending country name print 
select name, continent,region,population from country
order by name desc;
-- by defalut asending 
select name, continent,region,population from country
order by population;
-- country name asending also 

select name, continent,region,population from country
order by population,name;

select name, continent,region,population from country
order by continent,name; -- similer contry continent matlab continent ke hisab se country sort hui he asia a start and europ ke liye waps a start

-- in each region we sort the data based on population in descending order
select name, continent,region,population from country
order by region ,population desc;


