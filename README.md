# Walmart-Sales-Data-Analysis
## About 
This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products and customer behaviour. The end goal is to know how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

"In this recruiting competition, job-seekers are provided with historical sales data for 45 Walmart stores located in different regions. Each store contains many departments, and participants must project the sales for each department in each store. To add to the challenge, selected holiday markdown events are included in the dataset. These markdowns are known to affect sales, but it is challenging to predict which departments are affected and the extent of the impact
## Purpose of the project 
The main goal of this project is to obtain insight into Walmart's sales data in order to comprehend the various factors that influence sales at various branches.

## List of Analysis:
Product analysis:
This involves examining the data to determine which product lines are the most successful, which need improvement, and which are not.

Sales Analysis: 
This analysis attempts to address the query of what the product's sales trends are. This will enable us to assess the success of every sales technique the company employs and determine what adjustments are required to increase sales.

Customer Analysis:
The objectives of this analysis are to identify the various customer segments, purchase patterns, and profitability of each customer segment.

# Approach Used
## 1. Feature engineering:
This will enable us to create new columns out of preexisting ones.

1.Add a new column called time_of_day to provide insight into sales in the morning, afternoon, and evening. This will assist in providing an answer to the query of what time of day most sales occur.

2.Create a new column called day_name and fill it with the extracted weekdays (Mon, Tue, Wed, Thur, Fri) that the specified transaction occurred on. This will assist in providing an answer to the query of which day of the week each branch is busiest.

3.Create a new column called month_name and enter the extracted months (Jan, Feb, Mar) of the year that the given transaction occurred in. Assist in identifying the month with the highest profit and sales for the year.

# Business Questions To Answer
## Generic Question
1.How many unique cities does the data have?

2.In which city is each branch?
## Product
1.How many unique product lines does the data have?

2.What is the most common payment method?

3.What is the most selling product line?

4.What is the total revenue by month?

5.What month had the largest COGS?

6.What product line had the largest revenue?

7.What is the city with the largest revenue?

8.What product line had the largest VAT?

9.Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

10.Which branch sold more products than average product sold?

11.What is the most common product line by gender?

12.What is the average rating of each product line?
## Sales
1.Number of sales made in each time of the day per weekday

2.Which of the customer types brings the most revenue?

3.Which city has the largest tax percent/ VAT (Value Added Tax)?

4.Which customer type pays the most in VAT?
## Customer
1.How many unique customer types does the data have?

2.How many unique payment methods does the data have?

3.What is the most common customer type?

4.Which customer type buys the most?

5.What is the gender of most of the customers?

6.What is the gender distribution per branch?

7.Which time of the day do customers give most ratings?

8.Which time of the day do customers give most ratings per branch?

9.Which day fo the week has the best avg ratings?

10.Which day of the week has the best average ratings per branch?
