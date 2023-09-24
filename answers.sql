use assessment;


-- 1. Write a query to get the sum of impressions by day.
SELECT date as Date, SUM(impressions) as 'Total Impressions'
FROM marketing_performance
GROUP BY date
ORDER BY date DESC;

-- 2. Write a query to get the top three revenue-generating states in order of best to worst. 
SELECT state, SUM(revenue) AS 'Total Revenue'
FROM website_revenue
GROUP BY state
ORDER BY SUM(revenue) DESC
LIMIT 3;

-- How much revenue did the third best state generate? Ohio
SELECT state, SUM(revenue) AS 'Total Revenue'
FROM website_revenue
GROUP BY state
ORDER BY SUM(revenue) DESC
LIMIT 2,1;



-- 3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
SELECT DISTINCT campaign_info.name, SUM(cost) AS 'Total Cost' , SUM(clicks) AS 'Total Clicks', 
SUM(impressions) AS 'Total Impressions', SUM(revenue) AS 'Total Revenue'
FROM campaign_info, website_revenue, marketing_performance
WHERE campaign_info.id = marketing_performance.campaign_id
AND marketing_performance.campaign_id = website_revenue.campaign_id
GROUP BY campaign_info.name
ORDER BY name;

-- 4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
SELECT campaign_info.name AS 'Campaign Name' , marketing_performance.geo AS State, SUM(marketing_performance.conversions) as 'Total Conversions' 
FROM marketing_performance, campaign_info
WHERE campaign_info.id = marketing_performance.campaign_id
AND name = 'Campaign5'
GROUP BY marketing_performance.geo;
-- Which state generated the most conversions for this campaign? Georgia


-- 5. In your opinion, which campaign was the most efficient, and why?
-- I believe Campaign3 was the most efficient since they had the highest total revenue. 


