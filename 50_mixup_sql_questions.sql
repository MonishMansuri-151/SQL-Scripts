DROP DATABASE IF EXISTS sql_practice;
CREATE DATABASE sql_practice;
USE sql_practice;
CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(100) NOT NULL,
 email VARCHAR(120) UNIQUE NOT NULL,
 city VARCHAR(50) NOT NULL,
 signup_date DATE NOT NULL,
 status ENUM('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE'
);
CREATE TABLE products (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(100) NOT NULL,
 category VARCHAR(50) NOT NULL,
 price DECIMAL(10,2) NOT NULL,
 stock_qty INT NOT NULL,
 supplier VARCHAR(80),
 created_at DATE NOT NULL
);
CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 customer_id INT NOT NULL,
 order_date DATE NOT NULL,
 status ENUM('PENDING','SHIPPED','DELIVERED','CANCELLED') NOT NULL,
 shipping_city VARCHAR(50) NOT NULL,
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
 order_item_id INT PRIMARY KEY,
 order_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL,
 unit_price DECIMAL(10,2) NOT NULL,
 discount_pct DECIMAL(5,2) NOT NULL DEFAULT 0,
 FOREIGN KEY (order_id) REFERENCES orders(order_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers VALUES
(1,'Aarav Sharma','aarav@example.com','Jaipur','2024-01-15','ACTIVE'),
(2,'Diya Verma','diya@example.com','Delhi','2024-02-10','ACTIVE'),
(3,'Kabir Khan','kabir@example.com','Mumbai','2024-03-05','ACTIVE'),
(4,'Meera Joshi','meera@example.com','Pune','2024-03-22','INACTIVE'),
(5,'Rohan Gupta','rohan@example.com','Jaipur','2024-04-11','ACTIVE'),
(6,'Anaya Singh','anaya@example.com','Delhi','2024-05-01','ACTIVE'),
(7,'Vivaan Patel','vivaan@example.com','Ahmedabad','2024-05-19','ACTIVE'),
(8,'Sara Ali','sara@example.com','Mumbai','2024-06-07','ACTIVE'),
(9,'Arjun Mehta','arjun@example.com','Pune','2024-06-25','INACTIVE'),
(10,'Ishita Roy','ishita@example.com','Kolkata','2024-07-12','ACTIVE');
INSERT INTO products VALUES
(101,'Laptop Pro 14','Electronics',85000.00,12,'TechSource','2024-01-01'),
(102,'Wireless Mouse','Electronics',1200.00,80,'TechSource','2024-01-05'),
(103,'Mechanical Keyboard','Electronics',4500.00,35,'KeyWorks','2024-01-10'),
(104,'USB-C Hub','Electronics',2800.00,50,'HubWorld','2024-01-12'),
(105,'Office Chair','Furniture',12000.00,20,'ComfortCo','2024-02-01'),
(106,'Standing Desk','Furniture',22000.00,10,'ComfortCo','2024-02-05'),
(107,'Notebook Set','Stationery',600.00,100,'PaperPlus','2024-02-10'),
(108,'Desk Lamp','Furniture',2500.00,40,'BrightHome','2024-02-15'),
(109,'Water Bottle','Lifestyle',900.00,70,'DailyLife','2024-03-01'),
(110,'Backpack','Lifestyle',3200.00,45,'DailyLife','2024-03-05'),
(111,'Webcam HD','Electronics',3500.00,25,'VisionTech','2024-03-10'),
(112,'Headphones','Electronics',6000.00,30,'SoundMax','2024-03-15');
INSERT INTO orders VALUES
(1001,1,'2024-07-01','DELIVERED','Jaipur'),
(1002,2,'2024-07-03','DELIVERED','Delhi'),
(1003,1,'2024-07-08','SHIPPED','Jaipur'),
(1004,3,'2024-07-10','DELIVERED','Mumbai'),
(1005,4,'2024-07-12','CANCELLED','Pune'),
(1006,5,'2024-07-15','DELIVERED','Jaipur'),
(1007,6,'2024-07-18','PENDING','Delhi'),
-- MySQL SQL Practice & Interview Set Page 3
(1008,7,'2024-07-20','DELIVERED','Ahmedabad'),
(1009,8,'2024-07-22','SHIPPED','Mumbai'),
(1010,2,'2024-07-25','DELIVERED','Delhi'),
(1011,10,'2024-08-01','DELIVERED','Kolkata'),
(1012,3,'2024-08-03','PENDING','Mumbai'),
(1013,5,'2024-08-05','DELIVERED','Jaipur'),
(1014,6,'2024-08-08','CANCELLED','Delhi'),
(1015,7,'2024-08-10','DELIVERED','Ahmedabad');
INSERT INTO order_items VALUES
(1,1001,101,1,85000,5),
(2,1001,102,2,1200,0),
(3,1002,105,1,12000,10),
(4,1002,108,2,2500,0),
(5,1003,103,1,4500,5),
(6,1003,112,1,6000,0),
(7,1004,110,2,3200,0),
(8,1004,109,3,900,5),
(9,1005,106,1,22000,0),
(10,1006,106,1,22000,10),
(11,1006,108,1,2500,0),
(12,1007,111,1,3500,0),
(13,1008,105,2,12000,15),
(14,1008,107,5,600,0),
(15,1009,101,1,85000,0),
(16,1009,104,1,2800,0),
(17,1010,112,2,6000,5),
(18,1010,102,1,1200,0),
(19,1011,103,2,4500,0),
(20,1011,110,1,3200,10),
(21,1012,109,4,900,0),
(22,1012,107,3,600,0),
(23,1013,101,1,85000,8),
(24,1013,111,1,3500,0),
(25,1014,106,1,22000,5),
(26,1015,104,2,2800,0),
(27,1015,108,1,2500,10);

-- 4 tabels availabel for pratice 

select * from customers;
select * from orders;
select * from products;
select * from order_items;

-- Q1. DQL + SELECT (Intermediate)
-- Display all customers whose status is ACTIVE, sorted by signup_date from newest

select * from customers where status = 'ACTIVE' order by signup_date desc;

-- Q2. String functions (Intermediate)
-- Show each customer's name in uppercase, email in lowercase, and a generated label like 'Aarav Sharma - Jaipur
select upper(customer_name),lower(email),concat(customer_name,'-',city) as label from customers;

-- Q3. Date functions (Intermediate)
-- Find customers who signed up during the first half of 2024. Return customer name and the month name of signup.
select customer_id, customer_name,signup_date,month(signup_date) as months from customers where year(signup_date) = 2024 and 
month(signup_date) <= 6;

-- Q4. INNER JOIN (Intermediate)
-- List every order with customer_name, order_id, order_date, and order status. 
select c.customer_name,o.order_id,o.order_date,o.status from orders as o
inner join customers as c
on o.customer_id = c.customer_id;


-- Q5. LEFT JOIN (Intermediate)
-- List all customers and the number of orders each customer has placed, including customers with zero orders.
-- Expected output: Expected output: every customer exactly once with order_count; zero for customers with no matching order.
select customer_name,count(o.order_id) as order_count from customers as c 
left join orders as o on c.customer_id = o.customer_id group by customer_name; 

-- Q6. GROUP BY (Intermediate)
-- Calculate total quantity sold for each product, excluding cancelled orders.
-- Expected output: Expected output: product_id, product_name, total_quantity_sold. Include products with zero sales if possible

select p.product_id,p.product_name,coalesce(sum(o.quantity),0) as total_quntity from products as p left join order_items as o 
on p.product_id = o.product_id 
left join orders as o1 
on o1.order_id = o.order_id 
and o1.status <> "CANCELLED"
group by product_id,product_name ; 


-- Q7. HAVING (Intermediate)
-- Find cities having at least 2 non-cancelled orders.
-- Expected output: Expected output: city and order_count, only cities with count >= 2.
-- Hint: GROUP BY shipping_city, then HAVING. 

select o.shipping_city, count(o.order_id) as order_count from  orders as o 
group by o.shipping_city having order_count > 2;

-- Q8. Aggregate + CASE (Intermediate)
-- For every order, calculate gross item value, discount amount, and net order value. Exclude cancelled orders.
-- Expected output: Expected output: order_id, gross_value, discount_amount, net_value.
-- Hint: Use SUM(quantity * unit_price), and SUM(quantity * unit_price * discount_pct/100).


select oi.order_id, sum(quantity * unit_price) as gross_value ,sum(quantity * unit_price * discount_pct/100) as discount_amount,
sum(quantity * unit_price) - sum(quantity * unit_price * discount_pct/100) as net_value 
from order_items oi join orders as o on oi.order_id = o.order_id and o.status <> "CANCELLED"
group by oi.order_id;

-- Q9. Multi-table JOIN (Intermediate)
-- Show each delivered order line with customer_name, product_name, quantity, unit_price, and line_total after discount.
-- Expected output: Expected output: one row per order item belonging to DELIVERED orders.
-- Hint: Join orders → customers and orders → order_items → products.

select customer_name product_name,quantity,unit_price,quantity * unit_price as line_total
from orders as o join customers as c on o.customer_id = c.customer_id
join order_items as oi 
on oi.order_id = o.order_id 
join products as p 
on oi.product_id = p.product_id and 
o.status = "DELIVERED";

-- Q10. Subquery — scalar (Intermediate)
-- Find products priced above the overall average product price.
-- Expected output: Expected output: product_id, product_name, price for products above AVG(price).
-- Hint: Use a scalar subquery in WHERE

select * from products where price > (select avg(price) from products);

-- Q11. Subquery — IN (Intermediate)
-- Find customers who have placed at least one DELIVERED order.
-- Expected output: Expected output: unique customer rows for customers appearing in delivered orders.
-- Hint: Use IN with a subquery on orders

select * from customers where customer_id in   (select status  from orders where status = "DELIVERED");


-- Q12. Subquery — NOT EXISTS (Intermediate)
-- Find products that have never appeared in any order item.
-- Expected output: Expected output: products with no matching order_items.
-- Hint: NOT EXISTS is often safer than NOT IN when NULLs are possible.

select p.product_name,p.price,p.category,p.stock_qty from products as p 
where not exists (select 1 from order_items as o where p.product_id = o.product_id);

-- Q13. Correlated subquery (Intermediate)
-- For each product, show its price and the average price of products in the same category.
-- Expected output: Expected output: product_name, category, price, category_avg_price.
-- Hint: The inner AVG query should reference the outer product's category.

select p.product_name,p.category,p.price,
(select avg(p2.price) from products as p2 where p.category = p2.category) as category_avg_price
 from products as p ;


-- Q14. Conditional aggregation (Intermediate)
-- For each customer, show counts of DELIVERED, SHIPPED, PENDING, and CANCELLED orders.
-- Expected output: Expected output: one row per customer with four status-count columns.
-- Hint: Use SUM(CASE WHEN ... THEN 1 ELSE 0 END).

select c.customer_name ,
SUM(case when o.status = "DELIVERED" THEN 1
else 0 
end )as sum_deliver,
sum(case when o.status = "SHIPPED" then 1 
else 0 
end) as sum_shipped,
sum(case when o.status = "PENDING" then 1 
else 0 
end) as sum_pending,
sum(case when o.status = "CANCELLED" then 1
else  0 
END ) as sum_cancelled
from orders as o join customers as c on o.customer_id = c.customer_id 
group by c.customer_name;

-- Q15. NULL handling (Intermediate)
-- Show every product and a stock flag: 'LOW' if stock < 20, 'OK' otherwise. Also display 'No Supplier' when supplier is
-- NULL.
-- Expected output: Expected output: product_name, stock_qty, stock_flag, supplier_display.
-- Hint: Use CASE and COALESCE().
select product_name , stock_qty ,
case 
     when stock_qty < 20 then "low" 
     else "ok"
     end as stock_flag ,
case 
    when supplier is null then "no supplier" 
    else coalesce(supplier,"no supplier")
    end as supplier_display 
    from products; 
  
  
-- Q16. Numeric functions (Intermediate)
-- Show product_name, original price, price rounded to nearest hundred, and price after a 7.5% increase rounded to 2
-- decimals.
-- Expected output: Expected output: product_name, price, rounded_price, increased_price.
-- Hint: Use ROUND(); calculate the percentage increase
    
select product_name ,price , round(price,-2) as rounded_price ,  round(price * 1.075,2) as increase_pricea from products;


-- Q17. Date arithmetic (Intermediate)
-- For every order, show order_id, order_date, and the date 7 days after the order.
-- Expected output: Expected output: order_id, order_date, follow_up_date.
-- Hint: Use DATE_ADD().

select order_id,order_date, adddate(order_date,7) follow_up_date from orders;


-- Q18. FULL OUTER JOIN simulation (Intermediate)
-- Produce a result that represents a FULL OUTER JOIN between customers and orders using MySQL-compatible SQL.
-- Match on customer_id.
-- Expected output: Expected output: all customers and all orders, including unmatched rows.
-- Hint: MySQL has no native FULL OUTER JOIN. Combine LEFT JOIN and reversed LEFT JOIN with UNION/UNION ALL carefully.

select * from customers as c  left join orders as o 
on o.customer_id = c.customer_id 
union all
select * from customers as c  left join orders as o 
on o.customer_id = c.customer_id 
where c.customer_id is null; 


-- Q19. SELF JOIN (Intermediate)
-- Create all unique pairs of customers living in the same city.
-- Expected output: Expected output: customer_name_1, customer_name_2, city; no duplicate reversed pairs.
-- Hint: Join customers to itself and use c1.customer_id < c2.customer_id.
select c.customer_name,c1.customer_name,c.city from customers as c  join customers as c1
on c.city = c1.city and c.customer_id < c1.customer_id;


-- Q20. View (Intermediate)
-- Create a view named v_order_totals that returns order_id, customer_id, order_date, status, and net_order_value.
-- Exclude cancelled orders.
-- Expected output: Expected output: the VIEW should expose one row per non-cancelled order.
-- Hint: Use CREATE VIEW with a grouped order_items calculation.


alter view v_order_total as
select o.order_id,o.customer_id,o.order_date,o.status,
sum(unit_price * quantity) - sum(quantity * unit_price * discount_pct/100) as net_order_value from 
order_items as oi join orders as o on o.order_id = oi.order_id and o.status <> "CANCELLED" 
group by o.order_id,o.customer_id,o.order_date,o.status;

-- select * from v_order_total;

-- Q21. CTE (Intermediate)
-- Using a CTE, calculate total revenue per customer from non-cancelled orders, then return customers whose revenue
-- exceeds 50,000.
-- Expected output: Expected output: customer_id, customer_name, total_revenue for qualifying customers
 
with first_cte as (
select c.customer_id,c.customer_name, sum(oi.quantity * oi.unit_price) as total_revenue
from orders as o  join order_items as oi on oi.order_id = o.order_id  
join customers as c on o.customer_id = c.customer_id and o.status <> "CANCELLED"
group by c.customer_id,c.customer_name 
)

select * from first_cte where total_revenue >= 50000;

-- Q22. DML — UPDATE (Intermediate)
-- Increase prices by 5% for products in the Electronics category. Write the UPDATE statement and then verify the changed
-- rows.
-- Expected output: Expected output: Electronics prices become 1.05 × original price.
-- Hint: Practice UPDATE ... WHERE and a SELECT verification.

update  products set price = 1.05 * price where category = "Electronics";


-- Q23. DML — DELETE (Intermediate)
-- Delete CANCELLED orders safely in a transaction. Consider the foreign-key rows in order_items.
-- Expected output: Expected output: cancelled orders and their dependent items are removed only after the transaction is confirmed.
-- Hint: Delete child rows first, then parent rows; use START TRANSACTION and ROLLBACK/COMMIT.

start transaction ;
delete oi from order_items as oi join orders as o 
on o.order_id = oi.order_id  where o.status  = "CANCELLED";

select * from order_items;
delete from orders where status = "CANCELLED";
select  * from orders;
commit;

-- Q24. DDL (Intermediate)
-- Add a NOT NULL-safe column last_reviewed DATE to products with a default value of '2024-08-31'. Then remove the
-- default without removing the column.
-- Expected output: Expected output: column exists, then remains but has no DEFAULT constraint.
-- Hint: Use ALTER TABLE ... ADD COLUMN and ALTER TABLE ... ALTER/MODIFY COLUMN

alter table  products  add last_reviwed date not null  default '2024-08-31';
alter table products modify column last_reviwed date not null;

select * from products;
desc products;


-- Q25. DCL + TCL (Intermediate)
-- Write MySQL statements to (a) create a practice user, (b) grant SELECT on sql_practice to it, (c) revoke SELECT, and
-- (d) demonstrate COMMIT and ROLLBACK with a small test UPDATE.
-- Expected output: Expected output: privilege changes succeed with appropriate administrative permissions; transaction demonstrates both
-- commit and rollback behavior.
-- Hint: DCL syntax depends on your MySQL account privileges. TCL is for transaction control; DCL is privilege control.

create user monish99 identified by 'm123';


grant select on newdb.* to monish99;

show grants for monish99;

revoke selete on newdb.* from monish99;
--  Advanced Questions
 
-- Q26. Window — ROW_NUMBER (Advanced)
-- For every customer, rank their non-cancelled orders from newest to oldest using ROW_NUMBER().
-- Expected output: Expected output: customer_id, order_id, order_date, row_number within each customer.
-- Hint: PARTITION BY customer_id ORDER BY order_date DESC, order_id DESC
select c.customer_id,o.order_id,order_date,row_number() over(partition by customer_id order by order_date desc,o.order_id desc) as row_numbers
 from customers as c  join orders as o
 on o.customer_id = c.customer_id ;

-- Q27. Window — RANK (Advanced)
-- Rank products by price within each category using RANK().
-- Expected output: Expected output: product_id, product_name, category, price, price_rank; tied prices share rank with gaps.
-- Hint: Compare RANK() with DENSE_RANK()

SELECT product_id,product_name,category,price,rank() over(partition by category order by price desc) as ranks FROM  products ;

-- Q28. Window — DENSE_RANK (Advanced)
-- Find the top 2 priced products in each category using DENSE_RANK().
-- Expected output: Expected output: at most the products whose dense rank <= 2 within each category.
-- Hint: Filter the window result in an outer query/CTE.
with cte as(
select *,dense_rank() over( order by price desc) as dens_rank from products)

select * from cte where dens_rank =2;

-- Q29. Window — NTILE (Advanced)
-- Divide products into 4 price bands using NTILE(4), ordered from cheapest to most expensive.
-- Expected output: Expected output: product_name, price, price_quartile (1–4).
-- Hint: NTILE distributes ordered rows as evenly as possible 

select product_name,price,ntile(4) over(order by price) as ntiles from products;

-- Q30. Window — LAG (Advanced)
-- For each customer's non-cancelled order, show the previous order date and days since the previous order.
-- Expected output: Expected output: customer_id, order_id, order_date, previous_order_date, days_since_previous.
with cte as (
select customer_id,order_id,order_date,lag(order_date) over(partition by customer_id order by order_date) as previous_date from orders
where status <> "CANCELLED")

select customer_id,order_id,order_date,previous_date,datediff(order_date,previous_date) as date_diff from cte  ;

-- Q31. Window — LEAD (Advanced)
-- For each customer's non-cancelled order, show the next order date.
-- Expected output: Expected output: customer_id, order_id, order_date, next_order_date; last order per customer has NULL next date.
-- Hint: Use LEAD(order_date).

select *,lead(order_date) over(partition by customer_id order by order_date)as following_date from orders
where status <> "CANCELLED";


-- Q32. Window — SUM running total (Advanced)
-- For each customer, calculate a running revenue total across non-cancelled orders in chronological order.
-- Expected output: Expected output: customer_id, order_id, order_date, order_value, running_revenue.
-- Hint: SUM(order_value) OVER (PARTITION BY customer_id ORDER BY order_date, order_id ROWS UNBOUNDED PRECEDING).
with cte as 
(select o.customer_id,o.order_id,order_date,(oi.quantity * oi.unit_price ) as order_value
from  orders as o join order_items as oi on o.order_id = oi.order_id and o.status <> "CANCELLED") 

select customer_id,order_id,order_value, sum(order_value) over(partition by customer_id order by order_date,order_id rows unbounded preceding) as 
running_sum
 from cte ;
 

-- Q33. Window — AVG moving average (Advanced)
-- Calculate a 3-order moving average of order revenue for each customer.
-- Expected output: Expected output: customer_id, order_id, order_date, order_value, moving_avg_3.
-- Hint: Use AVG(...) OVER with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW. 

show TABLES;
with cte2 as
(SELECT o.customer_id,o.order_id,o.order_date, (oi.quantity * oi.unit_price) as revenue 
from orders as o join order_items as oi on oi.order_id = o.order_id )


select customer_id,order_id, revenue , avg(revenue) over(partition by customer_id rows between 2 preceding and current row  ) as 
moving_avg_3 from cte2;

-- Q34. Window — FIRST_VALUE (Advanced)
-- For each customer order, show that customer's first non-cancelled order date beside every order.
-- Expected output: Expected output: customer_id, order_id, order_date, first_order_date.
-- Hint: Use FIRST_VALUE() with a customer partition and a deterministic order.

select customer_id,order_id,order_date, first_value(order_date) over(partition by customer_id order by order_date,order_id) as first_order_date 
from orders as o where o.status <> "CANCELLED";

-- Q35. Window — LAST_VALUE (Advanced)
-- For each customer order, show the customer's latest non-cancelled order date beside every order.
-- Expected output: Expected output: customer_id, order_id, order_date, latest_order_date.
-- Hint: LAST_VALUE often needs an explicit frame ending at UNBOUNDED FOLLOWING.
SELECT customer_id,order_id,order_date, last_value(order_date) over(partition by customer_id ORDER BY order_date, order_id rows between current row and unbounded following ) as latest_Date
 from orders 































