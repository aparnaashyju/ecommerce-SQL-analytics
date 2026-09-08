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
