create database superstoreDataset;
use superstoreDataset;

--Step 1: Setup Data 

--Import the Superstore dataset into a table named superstore_raw.  

--Create these 3 tables from it:  

--customers  
--orders  
--products  

--Insert data into these tables using SELECT DISTINCT. 

select * from superstore_raw;
select count(*) from superstore_raw;

CREATE TABLE customers (
    Customer_ID VARCHAR(50) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50)
);

INSERT INTO customers
SELECT DISTINCT
    Customer_ID,
    Customer_Name,
    Segment
FROM superstore_raw;

CREATE TABLE products (
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),

    PRIMARY KEY (Product_ID, Product_Name)
);

INSERT INTO products
SELECT DISTINCT
    Product_ID,
    Category,
    Sub_Category,
    Product_Name
FROM superstore_raw;

CREATE TABLE orders (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Product_ID VARCHAR(50),
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT
);

INSERT INTO orders
SELECT DISTINCT
    Row_ID,
    Order_ID,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Customer_ID,
    Product_ID,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;