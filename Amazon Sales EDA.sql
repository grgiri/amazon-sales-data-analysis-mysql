

/* What is the count of distinct cities in the dataset? */
SELECT 
	DISTINCT City
FROM sales;

/* For each branch, what is the corresponding city? */
SELECT 
	DISTINCT City,Branch
FROM sales;

/*What is the count of distinct product lines in the dataset?*/
SELECT
	COUNT(DISTINCT Product_Line) AS No_of_Product_line
FROM sales;

/*Which payment method occurs most frequently?*/
SELECT 
	Payment, COUNT(*) AS Most_Used 
FROM sales 
GROUP BY Payment 
ORDER BY Most_Used DESC;

/*Which product line has the highest sales?*/
SELECT
	Product_Line,SUM(Quantity) as Qty_Sold    
FROM sales
GROUP BY Product_Line
ORDER BY Qty_Sold DESC;

/*How much revenue is generated each month?*/
SELECT
	Month_Name as Month,SUM(Total) AS Revenue_by_Month
FROM sales
GROUP BY Month 
ORDER BY Revenue_by_Month DESC;


/*In which month did the cost of goods sold reach its peak?*/
SELECT
	Month_Name AS Month,SUM(cogs) AS cost_of_goods_solds
FROM sales
GROUP BY Month_Name 
ORDER BY cost_of_goods_solds DESC;

/*Which product line generated the highest revenue?*/
SELECT
	Product_Line,SUM(Total) as Product_Line_Revenue
FROM sales
GROUP BY Product_Line
ORDER BY Product_Line_Revenue DESC;

/*In which city was the highest revenue recorded?*/
SELECT
	City,SUM(Total) AS Revenue_by_City
FROM sales
GROUP BY City 
ORDER BY Revenue_by_City DESC;

/*Which product line incurred the highest Value Added Tax?*/
SELECT
	Product_Line,
	ROUND(AVG(Tax),2) as Avg_Tax_Perc
FROM sales
GROUP BY Product_Line
ORDER BY Avg_Tax_Perc DESC;

/*For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."*/
SELECT
	Product_Line,
	CASE
		WHEN SUM(Quantity) > (SELECT SUM(Quantity)/ COUNT(*) FROM sales)  THEN "Good"
        ELSE "Bad"
    END AS Sales_Remark
FROM sales
GROUP BY Product_Line;

/*Identify the branch that exceeded the average number of products sold.*/
SELECT 
	Branch, 
    SUM(Quantity) AS Quantity_Sold
FROM sales
GROUP BY Branch
HAVING SUM(Quantity) > (SELECT AVG(Quantity) FROM sales);

/*Which product line is most frequently associated with each gender?*/
WITH new AS
(
SELECT 
	Gender, Product_Line, COUNT(*) AS count 
FROM sales
GROUP BY Gender, Product_Line
),
max_count AS 
(
SELECT 
	MAX(count) 
FROM new 
GROUP BY Gender
)

SELECT 
	Gender, Product_Line, count
FROM new
WHERE count IN (SELECT * FROM max_count) LIMIT 2;

/*Calculate the average rating for each product line.*/
SELECT
	ROUND(AVG(Rating), 2) as Avg_Rating,
    Product_Line
FROM sales
GROUP BY Product_Line
ORDER BY Avg_Rating DESC;

/*Count the sales occurrences for each time of day on every weekday.*/
SELECT
	Day_Name,
	COUNT(*) AS Total_Sales
FROM sales
WHERE Day_Name NOT IN  ("Sunday","Saturday")
GROUP BY Day_Name 
ORDER BY Total_Sales DESC;

/*Identify the customer type contributing the highest revenue.*/
SELECT
	Customer_Type,
	SUM(Total) AS Revenue_by_Customer
FROM sales
GROUP BY Customer_Type
ORDER BY Revenue_by_Customer DESC;

/*Determine the city with the highest VAT percentage.*/
SELECT
	City,
	MAX(Tax) as High_Tax
FROM sales
GROUP BY City
ORDER BY High_Tax DESC;

/*Identify the customer type with the highest VAT payments.*/
SELECT
	Customer_Type,
	MAX(Tax) as High_Tax
FROM sales
GROUP BY Customer_Type
ORDER BY High_Tax DESC;

/*What is the count of distinct customer types in the dataset?*/
SELECT
	Customer_Type,
	COUNT(*) as Customer_occurance
FROM sales
GROUP BY Customer_Type
ORDER BY Customer_occurance DESC;

/*What is the count of distinct payment methods in the dataset?*/
SELECT
	Payment,
	COUNT(*) as Payment_occurance
FROM sales
GROUP BY Payment
ORDER BY Payment_occurance DESC;

/*Identify the customer type with the highest purchase frequency.*/
SELECT
	Customer_Type,
	COUNT(*) as Purchase_Frequency
FROM sales
GROUP BY Customer_Type
ORDER BY Purchase_Frequency DESC
LIMIT 1;

/*Determine the predominant gender among customers.*/
SELECT
	Gender,COUNT(*) as Frequency
FROM sales
GROUP BY Gender
ORDER BY Frequency DESC 
LIMIT 1;

/*Examine the distribution of genders within each branch.*/
SELECT 
    Branch,Gender,
    COUNT(*) AS Frequency
FROM sales
GROUP BY Branch,Gender
ORDER BY Branch,Gender;

/*Identify the time of day when customers provide the most ratings.*/
SELECT
	Time_of_Day,AVG(rating) AS Customer_Rating
FROM sales
GROUP BY Time_of_Day
ORDER BY Customer_Rating DESC;

/*Determine the time of day with the highest customer ratings for each branch.*/
WITH ranked_ratings AS 
(
    SELECT 
        Branch,Time_of_Day,
        ROUND(AVG(Rating), 2) AS avg_rating,
        RANK() OVER (PARTITION BY Branch ORDER BY AVG(Rating) DESC) AS rating_rank
    FROM sales
    GROUP BY Branch,Time_of_Day
) 
SELECT 
	Branch,Time_of_Day, avg_rating
FROM ranked_ratings
WHERE rating_rank = 1;

/*Identify the day of the week with the highest average ratings.*/
SELECT 
	Day_Name,
	AVG(Rating) AS Rating
FROM sales
GROUP BY Day_Name 
ORDER BY Rating DESC;

/*Determine the day of the week with the highest average ratings for each branch. */
WITH day_ratings AS 
(
    SELECT 
        Branch,Day_Name,
        ROUND(AVG(Rating), 2) AS avg_rating,
        RANK() OVER (PARTITION BY Branch ORDER BY AVG(Rating) DESC) AS day_rank
    FROM sales
    GROUP BY Branch,Day_Name
) 
SELECT 
	Branch,Day_Name, avg_rating
FROM day_ratings
WHERE day_rank = 1;

/*
          Product Analysis: 
-- Highest Sales Product Line: Electronic Accessories 
-- Highest Revenue Product Line: Food and Beverages 
-- Lowest Sales Product Line: Health and Beauty 
-- Lowest Revenue Product Line: Health and Beauty 

*/
/*         
              Sales Analysis: 
-- Month With Highest Revenue: January 
-- City  With Highest Revenue: Naypyitaw
-- Month With Lowest Revenue: February 
-- City  With Lowest Revenue: Mandalay
-- Peak Sales Time Of Day: Afternoon 
-- Peak Sales Day Of Week: Saturday 

*/

/*
               Customer Analysis: 
-- Most Predominant Gender: Male
-- Most Predominant Customer Type: Member 
-- Most Popular Product Line (Male): Health and Beauty 
-- Most Popular Product Line (Female): Fashion Accessories 

*/
