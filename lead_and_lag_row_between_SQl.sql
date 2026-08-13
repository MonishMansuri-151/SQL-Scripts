-- lead and lag in windows sql functions 
use windowsdb;
select *, lead(amount,1) over() from orders ;  
-- The SQL LEAD() function is a window function that allows you to look ahead and access data 
-- from a subsequent row in the same result set without using a self-join 
select *, lead(amount,1) over(),lag(amount,1) over() from orders ;  
-- The LAG() function in SQL is a built-in window function that 
-- allows you to look back at a previous row in your result set to pull its dat 

-- calculate the 3 prves sum using lag windows built in functions 

select * , amount + perv1 + perv2 as sum_last_3
from 
       (select *,
            lag(amount,1,0) over(partition by customer_id order by order_date) as perv1,
			 lag(amount,2,0) over(partition by customer_id order by order_date) as perv2 
             from orders
         ) t;

SELECT 
    sale_date, 
    amount,
    SUM(amount) OVER (
        ORDER BY sale_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM sales;


-- 2. Rolling Average (Moving Window)To calculate a 3-day moving average,
-- configure the window to calculate the average using the current row and its 2 preceding record

SELECT 
    sale_date, 
    amount,
    AVG(amount) OVER (
        ORDER BY sale_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_3_days
FROM sales;



-- Boundary OptionsYou can configure the <start_boundary> and <end_boundary>
 -- using five parameters based on physical row placement:UNBOUNDED PRECEDING: 
 -- The very first row of the partition.n PRECEDING: Exactly n rows before the 
 -- current row.CURRENT ROW: The row currently being processed.n FOLLOWING: Exactly n 
 -- rows after the current row.UNBOUNDED FOLLOWING: The very last row of the partition






