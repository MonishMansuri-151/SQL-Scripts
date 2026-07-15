-- Group by 
-- why use group by 
-- group by help to calculate the multiple task in one time based on duplicate column 
-- without group by write teh multiple time where coluse to fillter the value 
 
use world;
select distinct(continent) from country;
-- calculate without repting task one using group by 

select continent, count(name)from country group by continent;
-- group by usi per lagy jisme duplicate value ho name duplicate 
select name, count(name)from country group by name;
-- count the AFG city
select count(name) from city where CountryCode = 'AFG';
-- kevel whi coloum print hoga jispe group by kiya he vo otherwise error aayega

select CountryCode,count(name) from city group by CountryCode;
-- count do not count the null values 
-- Q1  count the no of country life expectancy 70.1 to 83.5 
select count(name),count(surfaceArea) from country where LifeExpectancy between 70.1 and 83.5;
-- Q2 get  the total population  of country there indipendent year 1990
select sum(population ) from country where IndepYear = 1990;

-- Q3 count the no of country which are not slaved(gulami) by  any community 
select count(name) from country where IndepYear is null;
-- Q4 get the total no of country no and surfaceArea according to rigion
select region ,count(name),sum(surfaceArea) from country group by Region;
-- Q5 get the total country each  continent 
select continent,count(name) from  country group by continent; 
-- Q6 get the total country for each region for each continent 
select region, continent ,count(name) from country group by region,continent; 



