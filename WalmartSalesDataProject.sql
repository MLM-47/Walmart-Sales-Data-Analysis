 
  ---Feature Enginerring 

SELECT Time AS Converted_Time, CONVERT(time, TIME)
FROM WalmartSalesData

ALTER TABLE WalmartSalesData
Add Converted_Time TIME 

Update WalmartSalesData
SET Converted_Time  =  CONVERT(time, TIME)

  ---Time of day---

  SELECT Time, 
  (CASE
     WHEN Time between '00:00:00' and '12:00:00' then 'Morning'
	 WHEN Time between '12:01:00' and '16:00:00' then 'Afternoon'
	 ELSE 'Evening'
  END ) AS Time_Of_Day 
  FROM WalmartSalesData

ALTER TABLE WalmartSalesData
ADD Time_Of_Day varchar(20);

UPDATE WalmartSalesData
SET Time_Of_Day =
(CASE
     WHEN Time between '00:00:00' and '12:00:00' then 'Morning'
	 WHEN Time between '12:01:00' and '16:00:00' then 'Afternoon'
	 ELSE 'Evening'
  END ) 

 ---Adding the day name---
SELECT Date,
DATENAME(WEEKDAY,Date) as Day_Name 
FROM WalmartSalesData

ALTER TABLE WalmartSalesData
Add Day_Name Varchar(10)

Update WalmartSalesData
SET Day_Name =DATENAME(WEEKDAY,Date) 

---Adding Month-name

SELECT Date,
DATENAME (MONTH,date)
FROM WalmartSalesData

ALTER TABLE WalmartSalesData 
ADD Month varchar(10)

UPDATE WalmartSalesData
SET  Month = DATENAME (MONTH,date)


---GENERIC QUESTIONS FROM THE DATA---
--1. How many unique cities does the data have?
SELECT Distinct(city)
FROM WalmartSalesData

--2.How many unique branches we have in the data?
SELECT Distinct(Branch)
FROM WalmartSalesData

--3. In which city does each unique branch belong?
SELECT Distinct city,Branch
FROM WalmartSalesData

---PRODUCT QUESTIONS---
--1. How many unique product lines does the date have?
SELECT DiStinct [Product line] 
FROM WalmartSalesData

--2.What is the most common payment method?
SELECT Payment, COUNT(Payment) AS CountPaymentMthods
FROM WalmartSalesData
GROUP BY Payment
ORDER BY CountPaymentMthods DESC 

--3. What is the most selling product line 
SELECT [Product line],COUNT([Product line]) AS Productlinesales 
FROM WalmartSalesData
GROUP BY [Product line]
ORDER BY Productlinesales DESC 

--4. What is the total revenue by month?
SELECT month, SUM(Total) AS Total Revenue 
FROM WalmartSalesData
GROUP BY Month
ORDER BY Total Revenue DESC 

--5. What month had the largest COGs?
SELECT Month, SUM (cogs) As Max_Cogs
FROM WalmartSalesData
GROUP BY Month 
ORDER BY Max_Cogs DESC 

--6. What product line had the highest revenue?
SELECT [Product line], SUM(Total) As SalesRevenue 
FROM WalmartSalesData
GROUP BY [Product line]
ORDER BY SalesRevenue  DESC 

--7.What city and branch has the highest revenue?
SELECT City,Branch, SUM(Total) AS TotalRevenue 
FROM WalmartSalesData
GROUP BY City,Branch 
ORDER BY TotalRevenue DESC 

--8. Which product line had the largest VAT?
SELECT [Product line],AVG(VAT) AS AvgTax 
FROM WalmartSalesData
GROUP BY [Product line]
ORDER BY AvgTax DESC 

--9. Which branch sold more products than the average product sold
SELECT Branch, SUM([Quantity])AS QTY
FROM WalmartSalesData
GROUP BY Branch
HAVING SUM([Quantity]) > AVG([Quantity])
ORDER BY  QTY DESC 

--10. What is the most common product line by gender 
SELECT [Product line], Gender, COUNT(Gender) AS CTN_Gender 
FROM WalmartSalesData
GROUP BY Gender,[Product line]
ORDER BY CTN_Gender DESC 

--11. What is the evarage rating of each product line 
SELECT [Product line], ROUND(AVG(Rating),2) AS AVGRating 
FROM WalmartSalesData
GROUP BY [Product line]
ORDER BY AVGRating DESC 


---SALES QUESTIONS---
--1. What is the nuimber of sales made each time of the day 
SELECT Time_Of_Day, COUNT(*) AS TotalSales 
FROM WalmartSalesData
GROUP BY Time_Of_Day
ORDER BY TotalSales DESC 

--2. Which customer type brings most revenue 
SELECT [Customer type], SUM(Total) AS TotalRevenue 
FROM WalmartSalesData
GROUP BY [Customer type]
ORDER BY TotalRevenue DESC 

--3. Which city has the highest VAT 
SELECT City,ROUND(AVG(VAT),2) AS MaxVat
FROM WalmartSalesData
GROUP BY City
ORDER BY MaxVat DESC 

--4. Which customer type pays the highest VAT 
SELECT [Customer type],ROUND(AVG(VAT),2) AS MaxVat
FROM WalmartSalesData
GROUP BY [Customer type]
ORDER BY MaxVat DESC 

---CUSTOMER QUESTIONS---
--1. How many unique customer types does the data have?
SELECT DISTINCT([Customer type])
FROM WalmartSalesData

--2. How many unique payment methods does the data have?
SELECT DISTINCT(Payment)
FROM WalmartSalesData

--3. What is the most common customer type?
SELECT [Customer type], COUNT([Customer type]) AS CTN 
FROM WalmartSalesData
GROUP BY [Customer type]
ORDER BY CTN DESC 

--4. which customer type buys the most 
SELECT [Customer type], COUNT([Customer type])AS CTN
FROM WalmartSalesData
GROUP BY [Customer type]
ORDER BY CTN DESC 

--5. What is the gender of the most customers 
SELECT Gender, COUNT(Gender) AS MaxGender 
FROM WalmartSalesData
GROUP BY Gender
ORDER BY MaxGender DESC 


--6. What is the gender distrubution per branch 
SELECT Gender, COUNT(Gender) AS CTNGender
FROM WalmartSalesData 
WHERE Branch = 'C'
GROUP BY Gender

--7. what time of the day do customers give more ratings 
SELECT Time_Of_Day, AVG(Rating) as TotalRatings 
FROM WalmartSalesData
GROUP BY Time_Of_Day
ORDER BY  TotalRatings DESC 

--8. what time of the day do customers give more ratings per branch 
SELECT Time_Of_Day, ROUND(AVG(Rating),2) as TotalRatings 
FROM WalmartSalesData
WHERE Branch ='b'
GROUP BY Time_Of_Day
ORDER BY TotalRatings DESC


--9.Which day of the week had the best avg ratings
SELECT Day_Name,ROUND( AVG(Rating),2) as TotalRatings 
FROM WalmartSalesData
GROUP BY Day_Name
ORDER BY TotalRatings DESC 

--10. Which day of the week had the best avg ratings per branch 
SELECT Day_Name, AVG(Rating) as TotalRatings 
FROM WalmartSalesData
WHERE Branch = 'B'
GROUP BY Day_Name
ORDER BY TotalRatings DESC 


---renaming column ---
SELECT *
FROM WalmartSalesData
EXEC sp_rename 'WalmartSalesData.Tax 5%','VAT' 

SELECT *
FROM WalmartSalesData
EXEC sp_rename 'WalmartSalesData.Converted_Time','Time'

---Converting the date column ---
SELECT CAST(Time AS TIME) AS ConvertedTime
FROM WalmartSalesData



SELECT *
FROM WalmartSalesData

