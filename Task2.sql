'''
Question: Find the date with the highest total energy consumption from our data centers.
		  Output the data along with the total energy consumption across all data centers.
Table1: eu_energy
Columns: date datetime
		 consumption int
Table2: asia_energy
Columns: date datetime
		 consumption int
Table3: na_energy
		date datetime
		consumption int
		
Way of thinking:
1. join tables by union all
2.  group by date, total_consumption
3. max
4. filter max = maximum_consumption

Queries:
'''
WITH joined AS(
SELECT * FROM interviews.eu_energy
UNION ALL
SELECT * FROM interviews.asia_energy
UNION ALL
SELECT * FROM interviews.na_energy
)
,
total_consumption AS(
SELECT date
		, SUM(consumption) AS total_consumption
FROM joined
GROUP BY 1
)
SELECT date
		, total_consumption
FROM total_consumption
WHERE total_consumption = (SELECT max(total_consumption) FROM total_consumption)
