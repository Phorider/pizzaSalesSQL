# pizzaSalesSQL


Sure, here's how you can structure the README file with a question followed by the corresponding SQL query:

Pizza Sales Analysis Project
This project involves analyzing pizza sales data that was provided in an Excel file and imported into MySQL. Below are some key questions answered by the SQL queries used in this analysis.

1. What is the total revenue generated from pizza sales?

SELECT SUM(total_price) AS `Total Revenue` FROM pizza_sales;

2. How many unique orders were placed?

SELECT COUNT(DISTINCT order_id) FROM pizza_sales;

3. What is the average value of an order?

SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 5) AS Average_Order_Value FROM pizza_sales;

4. How many pizzas were sold in total?

SELECT SUM(quantity) AS `Total Pizza Sold` FROM pizza_sales;

5. How many orders were placed in total?

SELECT COUNT(DISTINCT order_id) AS `Total Orders Placed` FROM pizza_sales;

6. What is the average number of pizzas per order?

SELECT SUM(quantity) / COUNT(DISTINCT order_id) FROM pizza_sales;

7. What are the daily trends in total orders?

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

8. How to convert the text order_date to date format in MySQL?

SELECT STR_TO_DATE(order_date, '%Y-%m-%d') AS order_date FROM pizza_sales;

ALTER TABLE pizza_sales MODIFY `order_date` DATE;

UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

9. What are the daily trends in total orders after converting the date?

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

10. What are the hourly trends in total orders?

SELECT HOUR(order_time) AS order_hours, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);

11. What percentage of sales does each pizza category contribute?

SELECT pizza_category, 
       (SUM(total_price) * 100) / (SELECT SUM(total_price) FROM pizza_sales) AS Percentage_Sales 
FROM pizza_sales
GROUP BY pizza_category;
