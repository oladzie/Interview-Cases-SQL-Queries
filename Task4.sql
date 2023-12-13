'''
Question: Find top 3 unique salaries of each department.
		  Revert the results alphabetically by department and by highest to lowest salary.

Table: twitter_employee
Columns: id int
		 first_name varchar
		 last_name varchar
		 age int
		 sex varchar
		 employee_title varchar
		 deparment varchar
		 salary int
		 target int
		 bonus int
		 email varchar
		 city varchar
		 address varchar
		 manager_id int

Way of thinking:
1. Dense rank partition by daperttment and order by salary desc
2. Rank_id <= 3
3. Unique
4. Order by department, salary desc
   department || salary || rank_id
   
 '''
WITH ranked AS(
SELECT department
	   , salary
	   , DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_id

FROM interviews.twitter_employee
)
SELECT DISTINCT department
	   ,salary
	   ,rank_id
FROM ranked
WHERE rank_id <= 3
AND salary IS NOT NULL
ORDER BY 1,2 DESC