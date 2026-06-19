--Step 2: Perform Required Queries 

--Write and execute SQL queries for each of the following: 

--1.) Find all orders where sales are greater than the average sales. (Subquery) 

select * 
from orders 
where sales > (select avg(sales) from orders);

--2.) Find the highest sales order for each customer. (Subquery)  

select *
from orders o1
where Sales = (select max(sales) from orders o2 where o1.Customer_ID = o2.Customer_ID);

--3.) Calculate total sales for each customer. (CTE)  

with sum_sales as(
    select customer_id,
    sum(sales)
    over (partition by customer_id) as total_sales
    from orders)
select distinct customer_id,
total_sales
from sum_sales;

--4.) Find customers whose total sales are above average. (CTE + Subquery)  

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



--5.) Rank all customers based on total sales. (Window Function)  

with sum_sales as(
    select customer_id,
    sum(sales) as total_sales
    from orders
    group by customer_id)
select customer_id,
total_sales,
rank() over (order by total_sales desc)
from sum_sales;

--6.) Assign row numbers to each order within a customer. (Window Function + PARTITION BY)  

select *,
row_number() over(partition by customer_id order by order_date) as order_number
from orders;

--7.) Display top 3 customers based on total sales. (Window Function)  

with sum_sales as(
    select customer_id,
    sum(sales) as total_sales
    from orders
    group by customer_id
),
rnk_sales as(
    select customer_id,
    total_sales,
    ranK() over (order by total_sales desc) as rnk
    from sum_sales
)
select *
from rnk_sales
where rnk <= 3;

--Step 3: Final Combined Query 

--Write one final query that shows: 

--Customer Name  
--Total Sales  
--Rank  

--(Use JOIN + CTE + Window Function together) 

with sum_sales as(
     select c.customer_name,
     o.customer_id,
     sum(o.sales) as total_sales
     from customers c
     join orders o
     on c.customer_id = o.customer_id
     group by o.customer_id,c.customer_name
)
select customer_name,
total_sales,
rank() over (order by total_sales) as rnk
from sum_sales;