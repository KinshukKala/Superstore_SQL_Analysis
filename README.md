# Superstore SQL Analysis Project

## Project Overview

This project uses the Superstore dataset to demonstrate SQL concepts including:

* Database normalization
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* Joins
* Ranking and analytical queries

The raw Superstore dataset was imported into SQL Server and transformed into normalized tables for customer and sales analysis.

---

## Dataset

Source:

https://www.kaggle.com/datasets/vivek468/superstore-dataset-final

Dataset contains information about:

* Customers
* Orders
* Products
* Sales
* Profit
* Discounts
* Regions

---

## Database Design

### customers

| Column        |
| ------------- |
| Customer_ID   |
| Customer_Name |
| Segment       |

### products

| Column       |
| ------------ |
| Product_ID   |
| Category     |
| Sub_Category |
| Product_Name |

### orders

| Column      |
| ----------- |
| Row_ID      |
| Order_ID    |
| Order_Date  |
| Ship_Date   |
| Ship_Mode   |
| Customer_ID |
| Product_ID  |
| Sales       |
| Quantity    |
| Discount    |
| Profit      |

---

## SQL Concepts Demonstrated

### Subqueries

* Orders with sales above average
* Highest sales order per customer

### Common Table Expressions (CTEs)

* Customer total sales
* Customers with above-average sales

### Window Functions

* RANK()
* ROW_NUMBER()
* PARTITION BY

### Joins

* Customer sales aggregation
* Customer ranking analysis

---

## Business Insights

### Top Customers

Identified the highest revenue-generating customers using ranking functions.

### Bottom Customers

Identified customers with the lowest total sales.

### One-Time Customers

Detected customers who placed only one order.

### Above-Average Customers

Analyzed customers whose total sales exceeded the overall customer sales average.

### Highest Order Value

Determined the maximum order value achieved by each customer.

---

## Technologies Used

* SQL Server
* SQL Server Management Studio (SSMS)
* Kaggle Superstore Dataset

---

## Project Structure

sql/

* 01_database_setup.sql
* 02_required_queries.sql
* 03_customer_sales_insights.sql

screenshots/

* results.pdf

Query outputs and result screenshots

---

## Author

Kinshuk
