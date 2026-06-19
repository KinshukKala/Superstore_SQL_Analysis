--Answer the following using SQL: 

--1.) Who are the top 5 customers?  

with sum_sales as(
    select c.customer_name,
    o.customer_id,
    sum(o.sales) as total_sales
    from orders o
    join customers c
    on o.customer_id = c.customer_id
    group by c.customer_name,o.customer_id
),
rnk_sales as(
    select customer_name,
    customer_id,
    total_sales,
    ranK() over (order by total_sales desc) as rnk
    from sum_sales
)
select customer_name,
customer_id,
total_sales
from rnk_sales
where rnk <= 5;

--2.) Who are the bottom 5 customers?  

with sum_sales as(
    select c.customer_name,
    o.customer_id,
    sum(o.sales) as total_sales
    from orders o
    join customers c
    on o.customer_id = c.customer_id
    group by c.customer_name,o.customer_id
),
rnk_sales as(
    select customer_name,
    customer_id,
    total_sales,
    ranK() over (order by total_sales asc) as rnk
    from sum_sales
)
select customer_name,
customer_id,
total_sales
from rnk_sales
where rnk <= 5;

--3.) Which customers made only one order?  

select c.customer_name,
o.customer_id,
count(distinct o.order_id) as order_count
from orders o
join customers c
on c.customer_id = o.customer_id
group by c.customer_name,o.customer_id
having count(distinct o.order_id) = 1;

--4.) Which customers have above-average sales?  

with sum_sales as(
    select customer_id,
           sum(sales) as total_sales
    from orders 
    group by customer_id
)
select * 
from sum_sales 
where total_sales > (select avg(total_sales) 
                    from sum_sales);

--5.) What is the highest order value per customer? 

select o.customer_id,
c.customer_name,
max(o.sales) as highest_order 
from orders o
join customers c
on c.customer_id = o.customer_id
group by o.customer_id,c.customer_name
order by highest_order desc;
