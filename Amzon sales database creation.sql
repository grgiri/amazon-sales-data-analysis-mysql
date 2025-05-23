-- Create database
CREATE DATABASE IF NOT EXISTS AmazonSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	Invoice_Id VARCHAR(30) NOT NULL PRIMARY KEY,
    Branch VARCHAR(5) NOT NULL,
    City VARCHAR(30) NOT NULL,
    Customer_Type VARCHAR(30) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Product_Line VARCHAR(100) NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    Tax FLOAT(6,4) NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    Gross_Margin_pct FLOAT(11,9),
    Gross_income DECIMAL(12, 4),
    Rating FLOAT(2, 1)
);

 SET SQL_SAFE_UPDATES = 0;
 
#-------------------- Adding new column -------------------#
-- timeofday,dayname,monthname
ALTER TABLE sales
ADD Time_of_Day VARCHAR(15) NOT NULL;

UPDATE sales 
SET Time_of_Day =
		CASE 
			WHEN Time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
			WHEN Time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
			ELSE "Evening"
		END;
        
ALTER TABLE sales ADD COLUMN Day_Name VARCHAR(10);

UPDATE sales
SET Day_Name = DAYNAME(Date);

ALTER TABLE sales ADD COLUMN Month_Name VARCHAR(10);

UPDATE sales
SET Month_Name = MONTHNAME(Date);




