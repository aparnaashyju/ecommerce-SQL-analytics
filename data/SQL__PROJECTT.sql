create database sql_project;
use sql_project;
select*from left_shopping1;
select*from right_shopping1;

describe right_shopping1;
ALTER TABLE right_shopping1
DROP COLUMN `MyUnknownColumn`;


-- ------------------------------------
create database sql_project;
use sql_project;
select*from left_shopping1;
select*from right_shopping1;

-- Beginner — SELECT, WHERE, ORDER BY, LIMIT
-- 1)List all customers with their age and gender.
select*from left_shopping1;

-- 2)List all customers whose age is above 50.
select*from left_shopping1 where age>50;

-- 3)Find the 10 purchases with the highest price.
select*from right_shopping1 order by price desc limit 10;

-- 4) List all purchases made using 'Credit Card'.
select*from right_shopping1 where payment_method="credit card";

-- 5) Find all female customers who made purchases.
select*from left_shopping1 where gender="female";


-- Intermediate — JOINs, GROUP BY, HAVING, Aggregates

-- 6) Display customer details along with their purchase details using INNER JOIN.
select l.*,r.* from left_shopping1 as l inner join right_shopping1 as r on l.customer_id=r.customer_id;

-- 7) Calculate the total amount spent on all purchases.
select sum(price*quantity) as total_amount_spent from right_shopping1;

-- 8) Which product category has sold the most units?
select category,sum(quantity) as total_units from right_shopping1 group by category order by total_units desc limit 1;

-- 9) List the top 5 customers by total amount spent.
select customer_id,sum(price*quantity) as total_spent from right_shopping1 group by customer_id order by total_spent desc limit 5;

-- 10) Which shopping malls earned more than ₹10000 in total revenue?”
select shopping_mall,sum(price*quantity) as total_revenue from right_shopping1 group by shopping_mall having sum(price*quantity)>10000;

-- 11) How many purchases did each payment type handle?  and what's the average payment value per type?
select payment_method,count(*) as total_purchases,avg(price*quantity) as avg_payment from right_shopping1 group by payment_method;

-- 12) Find the average price of products in each category.
select category,avg(price) from right_shopping1 group by category;

-- 13) Find the customers who have made more than 10 purchases.
select customer_id,count(*) as total_purchases from right_shopping1 group by customer_id having count(*)>10;

-- Advanced — Subqueries, CTEs, Window Functions, Views

-- 14) Find the customer who has spent the highest total amount.
select customer_id,sum(price*quantity) as highest_total from right_shopping1 group by customer_id order by highest_total desc limit 1;

-- 15) Identify repeat customers (customers with more than 20 orders) using GROUP BY + HAVING.
select customer_id,count(*) as total_orders from right_shopping1 group by customer_id having count(*)>20;

--  16) Create a view called monthly_sales_summary that a dashboard tool could read directly.
create view monthly_sales_summaryy as select*from right_shopping1;
select* from monthly_sales_summaryy;

-- 17) Write a stored procedure get_customer_history(customer_id) that returns a customer's full purchase history using JOIN.
delimiter //
create procedure get_customer_history(in p_customer_id int) begin 
select l.customer_id,l.gender,l.age,r.category,r.quantity,r.price,r.payment_method from left_shopping1 as l inner join right_shopping1 as r
on l.customer_id=r.customer_id where l.customer_id=p_customer_id;
end//
delimiter ;
call get_customer_history(1);