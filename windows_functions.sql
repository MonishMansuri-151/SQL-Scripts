create database windows10db;
use windows10db;
-- windows statement 
select * , sum(sales_amount) over(partition by department) from employee_sales;

select * from employee_sales; 
-- sum sales amount emp name 
select * , sum(sales_amount) over(partition by employee_name) from employee_sales;
-- sum of sales amount 
select * , sum(sales_amount) over() from employee_sales;
-- max and sales amount 
select * , sum(sales_amount) over(),max(sales_amount) over() from employee_sales;

-- diffrence total sales amount 
select * , sum(sales_amount) over() - sales_amount as diffrence  from employee_sales;
-- avg sales amount 
select * , avg(sales_amount) over() from employee_sales;
-- sum and avg diffenrence 
select * , sum(sales_amount) over(partition by department) as total_sales, avg(sales_amount) over(partition by department) as avg_sales,
total_sales - avg_sales over() from employee_sales;

-- deaprtment sales and percentage of overall sales 

select * , sum(sales_amount) over(partition by department) as sum_dept, sum(sales_amount) over() as sum_All from employee_sales; 








