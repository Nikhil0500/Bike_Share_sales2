
-- 1. Total Riders in 2021
SELECT SUM(riders) AS total_riders
FROM bike_share
WHERE yr = 0;

-- 2. Riders by Type (Registered vs Casual)
SELECT rider_type, SUM(riders) AS total_riders
FROM bike_share
WHERE yr = 0
GROUP BY rider_type;

-- 3. Total Riders Per Season
SELECT 
    CASE 
        WHEN season = 1 THEN 'Winter'
        WHEN season = 2 THEN 'Spring'
        WHEN season = 3 THEN 'Summer'
        WHEN season = 4 THEN 'Fall'
    END AS season_name,
    SUM(riders) AS total_riders
FROM bike_share
WHERE yr = 0
GROUP BY season;

-- 4. Hourly Average Riders
SELECT hr, AVG(riders) AS avg_hourly_riders
FROM bike_share
WHERE yr = 0
GROUP BY hr
ORDER BY hr;

-- 5. Estimated Revenue (Assuming $5 per Rider)
SELECT SUM(riders * 5) AS estimated_revenue
FROM bike_share
WHERE yr = 0;

-- 6. Estimated Profit and Profit Margin (Assuming $5 Price and $2 Cost per Rider)
SELECT 
    SUM(riders * (5 - 2)) AS estimated_profit,
    (SUM(riders * (5 - 2)) / SUM(riders * 5)) AS estimated_profit_margin
FROM bike_share
WHERE yr = 0;

-- 7. Revenue by Weekday
SELECT weekday, SUM(riders * 5) AS weekday_revenue
FROM bike_share
WHERE yr = 0
GROUP BY weekday
ORDER BY weekday;

-- 8. Riders Over Time (Monthly Trend)
SELECT mnth AS month, SUM(riders) AS total_riders
FROM bike_share
WHERE yr = 0
GROUP BY mnth
ORDER BY mnth;
