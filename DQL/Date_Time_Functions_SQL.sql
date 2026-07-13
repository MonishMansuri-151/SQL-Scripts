-- date and time method in sql 
select current_date();-- return current date 
select current_time(); -- return current_time 
select current_timestamp(); -- return both date and time()
select now(); -- it is also return current date time 
-- adddate() funtion in sql
use sakila;
show tables;
select payment_date, adddate(payment_date,3) from payment;-- add date in your existing date old date 
-- use interval add month,hour year,minuets,secound
select payment_date,adddate(payment_date, interval  2 hour) as update_Date from payment ; -- add more 2 hour in data
select payment_date,adddate(payment_date, interval  3 month) as update_Date from payment ; -- add month
select payment_date,adddate(payment_date, interval  -6 second) as update_Date from payment ; -- decrease 6  secound 
select payment_date,adddate(payment_date, interval  1 minute) as update_Date from payment ; -- increase one minute
select payment_date,adddate(payment_date, interval  4 year) as update_Date from payment ; -- add 4 year

-- datediff function are use to  calculate difference two dates 
select payment_date , datediff( now(), payment_date) from payment; -- check the diffrence two date date column now()-- ke alawa koi date bhi column name bhi de skete he  
-- using datediff ye batata he ki two date ke bich me kya difference he 
-- coman built function extract the yaer(),months(),hour(),minute(),secound(),week()
select payment_date , month(payment_date) as months -- extract only month
from payment where month(payment_date) = 2 ; -- only those payment print jinka payment 2 month me hua

select payment_date , year(payment_date) as years -- extract only year
from payment where year(payment_date) = 2006;

-- it is one coman method mix of all name is extract() all hour , year minute month every using extract 
select payment_date, extract(hour from payment_date)
from payment;
select payment_date, extract(year from payment_date)
from payment;
select payment_date, extract(month  from payment_date)
from payment;
select payment_date, extract(quarter from payment_date)
from payment;

-- advanced version of extract its name is dataformte  return stirng name of month year
select payment_date, date_format(payment_date,"%M") -- return month name july , may, etc
from payment;
select payment_date, date_format(payment_date,"%m") -- return  m numeric  etc
from payment;
select payment_date, date_format(payment_date,"%h") -- return hour etc
from payment;
select payment_date, date_format(payment_date,"%Y") -- return year  etc
from payment;


