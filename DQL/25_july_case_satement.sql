-- case statement / and if else 
use world; 
select name,population,indepyear ,if(indepyear > 1947,True,False) from country; 
-- true false se 0 or 1 output aata he 
select name,population,indepyear ,if(indepyear > 1947,"After_India","Before india") from country;
-- multiple if 
select name,population,indepyear ,if(indepyear > 1947 ,"After india", if(indepyear > 1930 , "just_before india","Before india")) from country;
-- case statement 
select population,indepyear ,
case 
   when indepyear > 1947 then "After india 1947"
   when indepyear > 1930 then "jus before india 1930" 
   else "no conditions" 
End as status
from country;
-- Ex 
SELECT Name,Continent,Population,
case
 when Population > 200000 and Population < 500000 then "average population" 
 when Population > 500000 then "large population"
 else "small population"
 End as Category
 from country ;
-- ex 2 
select Continent,count(*) as c,
case 
 when count(*) > 25 then "large scale" 
 when count(*) > 15 then "avg scale"
 else "small scale"
 End as  categories
 from country group by Continent;







