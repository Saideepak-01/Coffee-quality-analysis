-- Coffee Quality Analysis Project
-- Description: SQL analysis to identify key factors affecting coffee quality
-- Dataset: Coffee Quality Institute (CQI)
-- Tools: MySQL
 
USE coffee_analysis;

-- 1. Preview Data (LIMIT 5)
-- Displays sample records to understand dataset structure
SELECT * FROM coffee_data LIMIT 5;

-- 2. Average Score by Country
-- Calculates average coffee quality score for each country
SELECT Country_of_Origin,
ROUND(AVG(Total_Cup_Points),2) AS avg_score
FROM coffee_data
GROUP BY Country_of_Origin
ORDER BY avg_score DESC;

-- 3. Top 5 Countries by Quality
-- Identifies top 5 countries with highest average coffee quality
SELECT Country_of_Origin,
ROUND(AVG(Total_Cup_Points),2) AS avg_score
FROM coffee_data
GROUP BY Country_of_Origin
ORDER BY avg_score DESC
LIMIT 5;

-- 4. Processing Method Impact
-- Evaluates impact of processing methods on coffee quality
SELECT Processing_Method,
ROUND(AVG(Total_Cup_Points),2) AS avg_score
FROM coffee_data
GROUP BY Processing_Method
ORDER BY avg_score DESC;

-- 5. Country + Processing Combination
-- Analyzes combined effect of country and processing method on quality
SELECT Processing_Method,
Country_of_Origin,
ROUND(AVG(Total_Cup_Points),2) AS avg_score
FROM coffee_data
GROUP BY Processing_Method, Country_of_Origin
ORDER BY avg_score DESC;

-- 6. High Quality Coffee (>84)
-- Filters and analyzes high-quality coffee samples above 84 points
SELECT Processing_Method,
Country_of_Origin,
ROUND(AVG(Total_Cup_Points),2) AS avg_score
FROM coffee_data
WHERE Total_Cup_Points > 84
GROUP BY Processing_Method, Country_of_Origin
ORDER BY avg_score DESC;

-- 7. High Performing Groups (HAVING)
-- Identifies country and processing combinations with average score above 84
SELECT Processing_Method,
Country_of_Origin,
ROUND(AVG(Total_Cup_Points),2) AS avg_score
FROM coffee_data
GROUP BY Processing_Method, Country_of_Origin
HAVING AVG(Total_Cup_Points) > 84
ORDER BY avg_score DESC;

-- 8. Defects Impact
-- Examines how defects affect overall coffee quality
SELECT Category_One_Defects,
ROUND(AVG(Total_Cup_Points),2) AS avg_score
FROM coffee_data
GROUP BY Category_One_Defects
ORDER BY avg_score DESC;

-- 9. Aroma vs Quality
-- Analyzes relationship between aroma scores and overall coffee quality
SELECT Aroma,
ROUND(AVG(Total_Cup_Points),2) AS avg_score
FROM coffee_data
GROUP BY Aroma
ORDER BY Aroma;