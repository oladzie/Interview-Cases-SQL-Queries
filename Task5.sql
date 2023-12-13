'''
Question: For each date find the difference between the distance per dollar
		  for that date and the average distance per dollar for that year/month.

Table: uber_rides
Columns: request_id int
		 request_date datetime
		 request_status varchar (canceled_by_driver, canceled_by_client, success)
		 distance_to_travel float
		 monetary_cost float
		 driver_to_client_distance float

Way of thinking I (with subqueries):
1. date_request || difference
2. each_day distance_per_dollar
3. each month_year distance_per_dollar
4. join
5. difference
6. absolute value, round to 2 decimals
7. order by request_date asc

Way of thinking II (no subqueries):
1.request_date
2. window function: distance_to_travel /  monetary_cost - AVG(distance_to_travel /  monetary_cost)
   partitioned over the month_year
3. absolute value, round to 2 decimals
4. order by request_date asc
'''

WITH each_day AS(
SELECT 
	request_date
	,AVG(distance_to_travel / monetary_cost) AS distance_per_dollar
FROM interviews.uber_rides
GROUP BY 1
)
,
per_month_year AS(
SELECT
	DATE_TRUNC('month', request_date) AS month_year
	, AVG(distance_to_travel / monetary_cost) AS distance_per_dollar
FROM interviews.uber_rides
GROUP BY 1
)
SELECT 
	a.request_date
	,ROUND(ABS(CAST(a.distance_per_dollar - b.distance_per_dollar AS decimal)),2) AS difference
FROM each_day a
JOIN per_month_year b
ON DATE_TRUNC('month', a.request_date) = b.month_year
ORDER BY request_date


SELECT 
	request_date
	, ROUND(ABS(CAST(distance_to_travel /  monetary_cost - AVG(distance_to_travel /  monetary_cost)
	  OVER(PARTITION BY DATE_TRUNC('month', request_date)) AS decimal)),2) AS difference
FROM interviews.uber_rides
ORDER BY request_date