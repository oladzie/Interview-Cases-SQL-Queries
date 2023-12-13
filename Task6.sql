'''
Question: You are a data scientist in a company that runs a social media platform.
		  The company wants to take a look at the level of participation across their platform.
		  Your task is to write a query to calculate the distribution of comments by the count of users
		  that joined the platform between 2018 and 2020 for the month of January 2020. 
		  The output should contain a count of comments and the corresponding number of users that made 
		  the number of comments. For example, you will be counting how many users made 
		  1 comment, 2 comment etc in Jan 2020.

Table: users
Columns: id int
		 name varchar
		 joined_at datetime
		 city_id varchar
		 device varchar
Table: comments
Columns: user_id int
		 body varchar
		 created_at datetime
		 
Way of thinking:
1. join users and comments
2. filter created_at january 2020
3. filter joined_at between 2018 and 2020
4. joined_at < created_at
5. user, count(comments)
6. group by count(comments)
7. count (users)
8. order by num_comments asc

Queries:
'''
WITH counts AS(
SELECT
	user_id
	, COUNT(body) AS num_comments
FROM interviews.users a
JOIN interviews.comments b
	ON a.id = b.user_id
WHERE created_at BETWEEN CAST('2020-01-01' AS date) AND CAST('2020-01-31' AS date)
AND joined_at BETWEEN CAST('2018-01-01' AS date) AND CAST('2020-01-31' AS date)
AND joined_at < created_at
GROUP BY 1
)
SELECT
	num_comments
	,COUNT(user_id) AS num_users
FROM counts
GROUP BY 1
ORDER BY 1
