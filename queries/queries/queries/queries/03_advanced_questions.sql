
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
