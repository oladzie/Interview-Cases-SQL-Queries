'''
Case: There are patient accounts that were open and closed by the date in the account status table.
	  Compute the percentage of accounts that were closed on January 10th 2020.
Table : account_status
Columns: acc_id int
		 date datetime
		 status varchar (open, close)
Way of thinking:
1. Filter by date 2020-01-10
2. close_rate = closed_accounts / total_accounts * 100

Queries:
'''
SELECT 
	COUNT(CASE WHEN status = 'closed' THEN 1 ELSE NULL END) * 1.00/
	(COUNT(CASE WHEN status = 'closed' THEN 1 ELSE NULL END) +
	COUNT(CASE WHEN status = 'open' THEN 1 ELSE NULL END) * 100) AS closed_rate

FROM interviews. account_status
WHERE date = '2020-01-10' 

'''
Task: Get closure rates for every single day.
	  Spot anomalies
Way of thinking:
1. Get general form
2. Filter by date
'''

WITH closed AS(
SELECT 
	date
	, COUNT(CASE WHEN status = 'closed' THEN 1 ELSE NULL END) * 1.00/
	  (COUNT(CASE WHEN status = 'closed' THEN 1 ELSE NULL END) +
	  COUNT(CASE WHEN status = 'open' THEN 1 ELSE NULL END) * 100) AS closed_rate

FROM interviews. account_status
GROUP BY 1
)
SELECT closed_rate
FROM closed
WHERE date = '2020-01-10'
		