'''
Questions: What information would you like to start off by pulling
		  to get an overall understanding of the post feature?
		  What are the success rate by day?
		  Which day of week has the lowest success rate?
		  
Table: Post_events
Columns: user_id int
		 created_at datetime
		 event_name varchar (enter, post, cancel)
Answear: Overal health: total numbers of posts(number of enters);
						posts made by date;
						success rate;
						cancel rate.
Way of thinking:
1. Succes rate by date
	date || success_rate = number of posts/ number of enter
2. group by date
3. group by date extracted dow
4. average success_rate
5. day || success_rate
6. min success_rate
Queries:
'''
WITH created_events AS(
SELECT 
	created_at AS date
	, COUNT(CASE WHEN event_name = 'post' THEN 1 ELSE NULL END) * 1.00/
	COUNT(CASE WHEN event_name = 'enter' THEN 1 ELSE NULL END) * 100 AS success_rate
FROM interviews.post_events
GROUP BY date
ORDER BY date
)
SELECT
	EXTRACT(DOW FROM date) AS day_of_week
	, AVG(success_rate)
FROM created_events
GROUP BY 1
ORDER BY 2 DESC

--other approach:

SELECT
	EXTRACT(DOW FROM created_at) AS day_of_week
	, COUNT(CASE WHEN event_name = 'post' THEN 1 ELSE NULL END) * 1.00/
	COUNT(CASE WHEN event_name = 'enter' THEN 1 ELSE NULL END) * 100 AS success_rate
FROM interviews.post_events
GROUP BY 1
ORDER BY 2 DESC