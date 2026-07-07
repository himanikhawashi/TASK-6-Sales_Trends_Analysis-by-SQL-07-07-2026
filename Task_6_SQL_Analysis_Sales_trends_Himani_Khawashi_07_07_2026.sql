/*
==========================================================
Name        : Himani Khawashi
Internship  : Data Analyst Internship
Task        : Task 6 - Sales Trend Analysis Using Aggregations
Objective   : Analyze monthly revenue and order volume
Database    : MySQL
==========================================================
*/
-- STEP 1: Create Database

CREATE DATABASE sales_analysis;
USE sales_analysis;

-- STEP 2: Create Table

CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);
-- STEP 3: Insert Sample Data
INSERT INTO online_sales (order_id, order_date, amount, product_id)
VALUES
(1,'2025-01-05',500.00,101),
(2,'2025-01-10',700.00,102),
(3,'2025-02-02',450.00,103),
(4,'2025-02-15',900.00,101),
(5,'2025-03-05',600.00,104),
(6,'2025-03-18',750.00,102),
(7,'2025-03-25',1200.00,105),
(8,'2025-04-08',800.00,101),
(9,'2025-04-20',950.00,103),
(10,'2025-05-01',1100.00,104);

-- STEP 4: View Data
SELECT * FROM online_sales;

-- Sales Trend Analysis Using Aggregations

SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    SUM(amount) AS Total_Revenue,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM online_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    Year,
    Month;

-- Sales Analysis for a Specific Time Period

SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    SUM(amount) AS Total_Revenue,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM online_sales
WHERE order_date BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    Year,
    Month;

-- Top 3 Months by Revenue

SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    SUM(amount) AS Total_Revenue
FROM online_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    Total_Revenue DESC
LIMIT 3;