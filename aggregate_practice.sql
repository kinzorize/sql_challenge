CREATE TABLE int_orders (
    order_number integer NOT NULL,
    order_date date NOT NULL,
    cust_id integer NOT NULL,
    salesperson_id integer NOT NULL,
    amount float NOT NULL
);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (30, DATE '1995-07-14', 9, 1, 460);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (10, DATE '1996-08-02', 4, 2, 540);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (40, DATE '1998-01-29', 7, 2, 2400);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (50, DATE '1998-02-03', 6, 7, 600);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (60, DATE '1998-03-02', 6, 7, 720);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (70, DATE '1998-05-06', 9, 7, 150);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (20, DATE '1999-01-30', 4, 8, 1800);


select order_number,order_date,cust_id,salesperson_id,amount from int_orders;
select sum(amount) as total_amount from int_orders;
select salesperson_id,sum(amount) as total_amount from int_orders
group by salesperson_id;
select order_number,order_date,salesperson_id,amount
,sum(amount) over() from int_orders;
select order_number,order_date,salesperson_id,amount
,sum(amount) over(partition by salesperson_id) from int_orders;
select order_number,order_date,salesperson_id,amount
,sum(amount) over(order by order_date) from int_orders;
select order_number,order_date,salesperson_id,amount
,sum(amount) over(partition by salesperson_id order by order_date) from int_orders;
select order_number,order_date,salesperson_id,amount
,sum(amount) over(order by order_date rows between 2 preceding and current row) from int_orders;
select order_number,order_date,salesperson_id,amount
,sum(amount) over(order by order_date rows between 2 preceding and 1 preceding ) from int_orders;
select order_number,order_date,salesperson_id,amount
,sum(amount) over(order by order_date rows between 1 preceding and 1 following ) from int_orders;
select order_number,order_date,salesperson_id,amount
,sum(amount) over(order by order_date rows between unbounded preceding and current row ) from int_orders;
select order_number,order_date,salesperson_id,amount
,sum(amount) over(order by order_date rows between 1 preceding and 1 preceding ) from int_orders;
