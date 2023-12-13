'''
Question: We woluld like to track month over month percentage change in revenue.
		  Your output should be in the form the year and the month and the percentage
		  change, round 2 decimal points, and sort from the beginning of the year
		  to the end of the year

Table: transactions
Columns: id int
		 created_at datetime
		 value int
		 purchase_id int
		 
Way of thinking:
1. date trunc
2. perc change over month(window)
3. round to 2 decimal points
4. sort by beginning to the end of year

Queries:
'''
SELECT 
	DATE_TRUNC('month', created_at) AS month_year
	, ROUND(CAST((SUM(value) - LAG(SUM(value),1) OVER (ORDER BY DATE_TRUNC('month', created_at)))/ 
	  LAG(SUM(value),1) OVER (ORDER BY DATE_TRUNC('month', created_at)) * 100 AS decimal),2) 
	  AS perc_change
FROM interviews.transactions
GROUP BY 1
ORDER BY 1
 