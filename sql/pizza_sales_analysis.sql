create database PIZZA_DB;

SELECT count(*) FROM pizza_sales;

-- TOTAL REVENUE
SELECT round(SUM(total_price),2) as TOTAL_REVENUE FROM pizza_sales;

-- AVERAGE ORDER VALUE 
SELECT round((SUM(total_price)/COUNT(DISTINCT order_id)),2) as AVERAGE_ORDER_VALUE FROM pizza_sales;

-- TOTAL PIZZAS SOLD
SELECT SUM(quantity) AS TOTAL_PIZZAS_SOLD FROM pizza_sales;

-- TOTAL ORDERS
SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM PIZZA_SALES;

-- AVERAGE PIZZAS PER ORDER
SELECT round((SUM(quantity)/COUNT(DISTINCT ORDER_ID)),2) as AVERAGE_PIZZAS_PER_ORDER FROM pizza_sales;

-- DAILY TREND FOR TOTAL ORDERS
SELECT distinct dayname(str_to_date(ORDER_DATE,'%d-%m-%Y')) DAYNAME, COUNT(DISTINCT order_id) TOTAL_ORDERS FROM pizza_sales
GROUP BY dayname
;

-- MONTHLY TREND FOR TOTAL ORDERS
SELECT distinct monthname(str_to_date(ORDER_DATE,'%d-%m-%Y')) MONTH, COUNT(DISTINCT order_id) TOTAL_ORDERS FROM pizza_sales
GROUP BY MONTH
ORDER BY COUNT(DISTINCT order_id) DESC;


-- PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT PIZZA_CATEGORY, ROUND(SUM(total_price) * 100/ 
(SELECT SUM(TOTAL_PRICE) FROM PIZZA_SALES),2) AS PER_SALES
FROM pizza_sales
GROUP BY PIZZA_CATEGORY;

-- PERCENTAGE OF SALES BY PIZZA SIZE
SELECT pizza_size, ROUND(SUM(total_price) * 100/ 
(SELECT SUM(TOTAL_PRICE) FROM PIZZA_SALES),2) AS PER_SALES
FROM pizza_sales
GROUP BY pizza_size;

-- TOP 5 BEST SELLERS BY REVENUE
SELECT 
pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY REVENUE
SELECT 
pizza_name, ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- TOP 5 PIZZAS BY TOTAL QUANTITY
SELECT 
pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY TOTAL QUANTITY
SELECT 
pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;


-- Top 5 Pizzas by Total Orders
SELECT
pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- Bottom 5 Pizzas by Total Orders
SELECT 
pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;


