'''
Question: Our goal is to develop a naive forecast for a new metric called monhly
		  distance_per_dollar defined as the (distance_to_travel / monetary_cost)
		  in our dataset and measure its accuracy. Use RSME to evaluate accuracy.
		  
Table: request_logs
Columns: request_id int
		 request_date datetime
		 request_status varchar (success, fail)
		 distance_to_travel float
		 monetary_cost float
		 driver_to_client_distance float
		 
Way of thinking:
1. actual distance_per_dollar per month(distance_to_travel/monetary_cost)
2. model distance per dollar : window function with LAG from previous monyh
3. RSME between actual and model

Queries:
'''
WITH actual AS(
SELECT
	DATE_TRUNC('month', request_date) AS month_year
	, SUM(distance_to_travel) / SUM(monetary_cost) AS distance_per_dollar
FROM interviews.request_logs
GROUP BY 1
)
,
model AS(
SELECT 
	month_year
	, distance_per_dollar AS distance_per_dollar_actual
	, LAG(distance_per_dollar, 1) OVER (ORDER BY month_year) AS distance_per_dollar_model
FROM actual
GROUP BY 1, 2
)
SELECT 
	SQRT(AVG(POWER(distance_per_dollar_actual - distance_per_dollar_model, 2))) AS RSME
FROM model