# We are looking for new_customers,repeated_customer in this scenario.
CREATE TABLE customer_orders (
    order_id integer,
    customer_id integer,
    order_date date,
    order_amount integer
);

INSERT INTO customer_orders VALUES
    (1, 100, '2022-01-01', 2000),
    (2, 200, '2022-01-01', 2500),
    (3, 300, '2022-01-01', 2100),
    (4, 100, '2022-01-02', 2000),
    (5, 400, '2022-01-02', 2200),
    (6, 500, '2022-01-02', 2700),
    (7, 100, '2022-01-03', 3000),
    (8, 400, '2022-01-03', 1000),
    (9, 600, '2022-01-03', 3000);
select * from customer_orders;

#Using Common Table Expression

#First Logic
with first_visit as (
select customer_id, min(order_date) as first_visit_date from customer_orders
group by customer_id)
, visit_flag as (  
select co.*,fv.first_visit_date 
,CASE WHEN co.order_date=fv.first_visit_date then 1 else 0 end as first_visit_flag
,CASE WHEN co.order_date!=fv.first_visit_date then 1 else 0 end as repeat_visit_flag
from customer_orders co
inner join first_visit fv on co.customer_id = fv.customer_id
order by customer_id) 
select order_date, sum(first_visit_flag)as no_of_new_customers, sum(repeat_visit_flag) as no_of_repeat_customers
from visit_flag
group by order_date

#Second Logic

with first_visit as (
select customer_id, min(order_date) as first_visit_date
from customer_orders
group by customer_id)

select co.order_date
,sum(CASE WHEN co.order_date=fv.first_visit_date then 1 else 0 end) as first_visit_flag
,sum(CASE WHEN co.order_date!=fv.first_visit_date then 1 else 0 end) as repeat_visit_flag
from customer_orders co
inner join first_visit fv on co.customer_id=fv.customer_id
group by co.order_date

# Third Logic

Select a.order_date,
Sum(Case when a.order_date = a.first_order_date then 1 else 0 end) as new_customer,
Sum(Case when a.order_date != a.first_order_date then 1 else 0 end) as repeat_customer
from(
Select customer_id, order_date, min(order_date) over(partition by customer_id) as first_order_date from customer_orders) a 
group by a.order_date;



