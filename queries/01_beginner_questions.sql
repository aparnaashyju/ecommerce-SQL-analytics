select*from left_shopping1;
select*from right_shopping1;

1)List all customers with their age and gender.
select*from left_shopping1;

2)List all customers whose age is above 50.
select*from left_shopping1 where age>50;

3)Find the 10 purchases with the highest price.
select*from right_shopping1 order by price desc limit 10;

4) List all purchases made using 'Credit Card'.
select*from right_shopping1 where payment_method="credit card";

5) Find all female customers who made purchases.
select*from left_shopping1 where gender="female";
