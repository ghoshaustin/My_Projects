-- Step 1: Create the database
CREATE DATABASE retail_sales_data;

-- Step 2: Use the created database
USE retail_sales_data;

-- Step 3: Create the table with columns matching your Python DataFrame
CREATE TABLE retail_data (
    Transaction_ID FLOAT,
    Customer_ID INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zipcode VARCHAR(20),
    Country VARCHAR(100),
    Age FLOAT,
    Gender VARCHAR(10),
    Income VARCHAR(20),
    Customer_Segment VARCHAR(50),
    Date DATE,
    Year INT,
    Month VARCHAR(20),
    Time TIME,
    Total_Purchases FLOAT,
    Amount FLOAT,
    Total_Amount FLOAT,
    Product_Category VARCHAR(100),
    Product_Brand VARCHAR(100),
    Product_Type VARCHAR(100),
    Feedback VARCHAR(50),
    Shipping_Method VARCHAR(50),
    Payment_Method VARCHAR(50),
    Order_Status VARCHAR(50),
    Ratings FLOAT,
    products VARCHAR(255),
    Phone_Length INT
);
select * from retail_data;


-- 1. Write a query to determine the top 5 most frequently purchased products.
SELECT Product_Brand, COUNT(*) AS purchase_count
FROM retail_data
GROUP BY Product_Brand
ORDER BY purchase_count DESC
LIMIT 5;

-- 2. Group customers by Customer_Segment and calculate the average Total_Amount for each group.
SELECT Customer_Segment, AVG(Total_Amount) AS avg_total_amount
FROM retail_data
GROUP BY Customer_Segment;

-- 3. Analyze total sales per Country and rank countries by sales.
SELECT Country, SUM(Total_Amount) AS total_sales
FROM retail_data
GROUP BY Country
ORDER BY total_sales DESC;

-- 4. Identify which Product_Category contributes the most to total sales.
SELECT Product_Category, SUM(Total_Amount) AS total_sales
FROM retail_data
GROUP BY Product_Category
ORDER BY total_sales DESC
LIMIT 1;

-- 5. Write a query to list customers who haven't made purchases in the last 12 months.
SELECT Customer_ID, Name
FROM retail_data
WHERE Date < DATE_SUB(CURDATE(), INTERVAL 12 MONTH);

-- 6. Query the top 5 regions (by State) with the highest sales.
SELECT State, SUM(Total_Amount) AS total_sales
FROM retail_data
GROUP BY State
ORDER BY total_sales DESC
LIMIT 5;

-- 7. Query and filter orders based on negative feedback scores to analyze product issues.
SELECT *
FROM retail_data
WHERE Feedback = 'Bad';

-- 8. Compare sales under promotion and non-promotion (Order_Status = Promo).
SELECT Order_Status, SUM(Total_Amount) AS total_sales
FROM retail_data
WHERE Order_Status IN ('Promo', 'Non-Promo')
GROUP BY Order_Status;

-- 9. Analyze customer spending behavior based on Income and Total_Purchases.
SELECT Income, AVG(Total_Amount) AS avg_spending, AVG(Total_Purchases) AS avg_purchases
FROM retail_data
GROUP BY Income;

-- 10. Calculate the total number of purchases for each Product_Type.
SELECT Product_Type, COUNT(*) AS total_purchases
FROM retail_data
GROUP BY Product_Type
ORDER BY total_purchases DESC;

-- 11. Write a query to calculate the average Age of customers in each Country.
SELECT Country, ROUND(AVG(Age)) AS avg_age
FROM retail_data
GROUP BY Country;

-- 12. Identify the top 3 Payment_Methods used by customers.
SELECT Payment_Method, COUNT(*) AS usage_count
FROM retail_data
GROUP BY Payment_Method
ORDER BY usage_count DESC
LIMIT 3;

-- 13. Calculate the percentage of customers who gave 'Excellent' feedback out of the total feedback received.
SELECT 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM retail_data)) AS excellent_feedback_percentage
FROM retail_data
WHERE Feedback = 'Excellent';


-- 14. Write a query to find customers who have made more than 10 purchases.
SELECT Customer_ID, Name, Total_Purchases
FROM retail_data
WHERE Total_Purchases > 10;

-- 15. Identify the top-selling products in the Electronics Product_Category.
SELECT Product_Brand, round(SUM(Total_Amount)) AS total_sales
FROM retail_data
WHERE Product_Category = 'Electronics'
GROUP BY Product_Brand
ORDER BY total_sales DESC
LIMIT 5;

-- 16. Query to get the total sales for each Shipping_Method.
SELECT Shipping_Method, round(SUM(Total_Amount)) AS total_sales
FROM retail_data
GROUP BY Shipping_Method;

-- 17. List the customers who have spent more than 5000 in Total_Amount.
SELECT Customer_ID, Name, Total_Amount
FROM retail_data
WHERE Total_Amount > 5000;

-- 18. Query to calculate the average Ratings for each Product_Type.
SELECT Product_Type, round(AVG(Ratings)) AS avg_ratings
FROM retail_data
GROUP BY Product_Type;

-- 19. Write a query to find customers who have not made purchases using Credit Card.
SELECT Customer_ID, Name
FROM retail_data
WHERE Payment_Method != 'Credit Card';

-- 20. Query to analyze the number of customers by Gender and Customer_Segment.
SELECT Gender, Customer_Segment, COUNT(*) AS customer_count
FROM retail_data
GROUP BY Gender, Customer_Segment;

-- 21. Write a query to calculate the average total amount spent by customers, grouped by income level.
SELECT Income, round(AVG(Total_Amount)) AS avg_total_amount
FROM retail_data
GROUP BY Income;

-- 22. Write a query to find the number of purchases made in each month of the current year.
SELECT Month, COUNT(*) AS total_purchases
FROM retail_data
WHERE Year = 2023
GROUP BY Month;

-- 23. Write a query to calculate the percentage of Premium segment customers in the entire customer base.
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM retail_data)) AS premium_customer_percentage
FROM retail_data
WHERE Customer_Segment = 'Premium';

-- 24. Write a query to list all unique product categories sold.
SELECT DISTINCT Product_Category
FROM retail_data;

-- 25. Write a query to calculate the total number of orders that have been shipped.
SELECT COUNT(*) AS total_shipped_orders
FROM retail_data
WHERE Order_Status = 'Shipped';

-- 26. Write a query to calculate the minimum, maximum, and average rating for each product category.
SELECT Product_Category, 
       MIN(Ratings) AS min_rating, 
       MAX(Ratings) AS max_rating, 
       AVG(Ratings) AS avg_rating
FROM retail_data
GROUP BY Product_Category;

-- 27. Write a query to identify customers who have given at least 5 ratings.
SELECT Customer_ID, COUNT(Ratings) AS rating_count
FROM retail_data
GROUP BY Customer_ID
HAVING rating_count >= 5;

-- 28. Write a query to count the number of orders placed in each quarter of the year.
SELECT QUARTER(Date) AS quarter, COUNT(*) AS total_orders
FROM retail_data
GROUP BY quarter;

-- 29. Write a query to calculate the total amount spent by each customer across all their purchases.
SELECT Customer_ID, round(SUM(Total_Amount)) AS total_spent
FROM retail_data
GROUP BY Customer_ID
ORDER BY total_spent DESC;

-- 30. Write a query to list customers who purchased Electronics products and have given an Excellent feedback.
SELECT Customer_ID, Product_Category, Feedback
FROM retail_data
WHERE Product_Category = 'Electronics' AND Feedback = 'Excellent';

