create database PizzaDB;

use PizzaDB;

select * from pizza_sales;

-- Total price of pizza orders 

select sum(total_price) as `Total Revenue` from pizza_sales;

-- Count of order_id 

select count(distinct order_id) from pizza_sales;

-- Average Order values dividing total_revenue by Total number of order 

select round(sum(total_price)/count(distinct order_id),5) as Average_Order_Value from pizza_sales;
 

-- Total Pizza Sold

select sum(quantity) as `Total Pizza Sold` from pizza_sales;

-- Total Orders Placed

select count(distinct order_id) as `Total Order Placed` from pizza_sales;

-- Average Pizza Per Order

select sum(quantity)/count(distinct order_id) from pizza_sales;

-- Daily trend for total order

SELECT 
    DAYNAME(order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    pizza_sales
GROUP BY 
    DAYNAME(order_date);

-- Converting text to Date form 

SELECT STR_TO_DATE(order_date, '%Y-%m-%d') AS order_date FROM pizza_sales;

alter table pizza_sales modify `order_date` date;


UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

ALTER TABLE pizza_sales MODIFY COLUMN order_date DATE;

select order_date from pizza_sales;

-- Daily Trend 
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);


-- Hourly trend

select hour(order_time) as order_hours, COUNT(DISTINCT order_id) AS Total_orders 
from pizza_sales
group by hour(order_time)
order by hour(order_time);

-- total percentage

SELECT pizza_category, 
       (SUM(total_price) * 100) / (SELECT SUM(total_price) FROM pizza_sales) AS Percentage_Sales 
FROM pizza_sales
GROUP BY pizza_category;


