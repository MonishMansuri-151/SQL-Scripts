-- ifnull and coalesce()  functions 
# todays i learn ifnull() and coalesce() function 
-- ifnull() 
use sakila;
-- Display the title and description. If description is NULL, display 'No Description' instead.
select city_id,city,ifnull(city,0) from city ; 
-- coalesce funcitnos 

SELECT title,
       COALESCE(description, title, 'No Data Available') AS film_details
FROM film
WHERE replacement_cost > 20; 

-- Create a new column named film_details that returns the first non-NULL value from:
-- description
-- title
-- 'No Data Available' 

select description,title ,coalesce(description,title,"no") from film 

