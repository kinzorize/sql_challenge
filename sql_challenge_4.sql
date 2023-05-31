-- Write a Query to provide for nth occurence of sunday in future from given date
-- datapart
-- sunday - 1
-- monday - 2
-- friday - 6
-- saturday - 7
declare @today_date date;
declare @n int;
set @today_date ='2022-01-01'; -- saturday
set @n = 3;
select dateadd(day,7,'2022-01-23')
select dateadd(day, 8 - datepart(weekday,@today_date),@today_date)
select datediff(week,'2022-01-01','2022-01-23')

select *, datediff(day,order_date,ship_date) as days_to_ship from customer_orders
select *, datediff(week,order_date,ship_date) as days_to_ship from customer_orders

-- The sql helps to get the weekdays in the number of days between order date and ship date.
select *, datediff(day,order_date,ship_date) as days_to_ship 
, datediff(day,order_date,ship_date) as week_between_days
, datediff(day,order_date,ship_date) - 2*datediff(week,order_date,ship_date) business_days_to_ship
from customer_orders

-- Get the age of the customer

select * from customer;

select *, 
datediff(year,dob,getdate()) as customer_age
from customer;

select getdate()