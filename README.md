# Interview-Cases-SQL-Queries
## CASE I:
#### Questions: 
What information would you like to start off by pulling to get an overall understanding of the post feature?  What are the success rate by day? Which day of week has the lowest success rate?  
#### Table: 
* Post_events
#### Columns: 
* user_id int
* created_at datetime
* event_name varchar (enter, post, cancel)
#### Answer: 
Overal health: 
* total numbers of posts(number of enters);
* posts made by date;
* success rate;
* cancel rate.
#### Way of thinking:
1. Succes rate by date
	date || success_rate = number of posts/ number of enter
2. group by date
3. group by date extracted dow
4. average success_rate
5. day || success_rate
6. min success_rate   
#### Queries:
<img width="674" alt="Screenshot 2023-12-12 201825" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/13603b62-b747-42f9-8c23-ed9db5eab26d">
<img width="679" alt="Screenshot 2023-12-12 201837" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/27b932c3-f806-4701-8849-ad18871ed4cf">

#### Result:
<img width="728" alt="Screenshot 2023-12-12 201902" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/62adf303-dac6-46dd-a3cf-66ff11938e97">


## CASE II:

#### Question: 
Find the date with the highest total energy consumption from our data centers.
Output the data along with the total energy consumption across all data centers.
#### Table1: 
* eu_energy
##### Columns: 
* date datetime
* consumption int
#### Table2: 
* asia_energy
##### Columns: 
* date datetime
* consumption int
#### Table3: 
* na_energy
##### Columns:
* date datetime
* consumption int
#### Way of thinking:
1. join tables by union all
2.  group by date, total_consumption
3. max
4. filter max = maximum_consumption
#### Queries:
<img width="683" alt="Screenshot 2023-12-12 201940" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/b28597b7-8527-4d2e-9f5e-e465a63253dc">

##### Result:
<img width="716" alt="Screenshot 2023-12-12 210524" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/e7f2448e-eaf7-4756-977d-8337bcf24d26">


## CASE III:

There are patient accounts that were open and closed by the date in the account status table.
Compute the percentage of accounts that were closed on January 10th 2020.
#### Table : 
* account_status
#### Columns: 
* acc_id int
* date datetime
* status varchar (open, close)
 ##### Way of thinking:
1. Filter by date 2020-01-10
2. close_rate = closed_accounts / total_accounts * 100
#### Queries:
<img width="677" alt="Screenshot 2023-12-12 204215" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/6926d61c-3c6a-4e6c-bfec-5aa7de7bbba8">
<img width="681" alt="Screenshot 2023-12-12 204225" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/3a23903c-6db6-4dbe-8924-474920c9445b">

#### Result:
<img width="716" alt="Screenshot 2023-12-12 210739" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/3abb19fb-a170-4c3f-a811-3860a1d02f7c">

## CASE IV:
#### Question:
Find top 3 unique salaries of each department.
Revert the results alphabetically by department and by highest to lowest salary.
#### Table: 
* twitter_employee
#### Columns: 
* id int
* first_name varchar
* last_name varchar
* age int
* sex varchar
* employee_title varchar
* deparment varchar
* salary int
* target int
* bonus int
* email varchar
* city varchar
* address varchar
* manager_id int
#### Way of thinking:
1. Dense rank partition by daperttment and order by salary desc
2. Rank_id <= 3
3. Unique
4. Order by department, salary desc
   department || salary || rank_id 
#### Queries:
<img width="681" alt="Screenshot 2023-12-13 101221" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/68c6a5dc-92ce-482e-94c0-5138c97faaf8">

#### Result:
<img width="713" alt="Screenshot 2023-12-13 101242" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/22fa430c-88fa-4474-94d6-4bc80bad103b">

## CASE V:
#### Question: 
For each date find the difference between the distance per dollar for that date and the average distance per dollar for that year/month.
#### Table: 
* uber_rides
#### Columns: 
* request_id int
* request_date datetime
* request_status varchar (canceled_by_driver, canceled_by_client, success)
* distance_to_travel float
* monetary_cost float
* driver_to_client_distance float
#### Way of thinking I (with subqueries):
1. date_request || difference
2. each_day distance_per_dollar
3. each month_year distance_per_dollar
4. join
5. difference
6. absolute value, round to 2 decimals
7. order by request_date asc
#### Queries:
<img width="636" alt="Screenshot 2023-12-13 104726" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/a86065f4-b5df-46ad-bc32-c14c78229da0">

#### Way of thinking II (no subqueries):
1. request_date
2. window function: distance_to_travel /  monetary_cost - AVG(distance_to_travel /  monetary_cost)
   partitioned over the month_year
3. absolute value, round to 2 decimals
4. order by request_date asc
#### Queries:
<img width="638" alt="Screenshot 2023-12-13 104738" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/d2d5651e-0ce1-4989-bf71-a58e8a708d59">

#### Result:
<img width="655" alt="Screenshot 2023-12-13 104817" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/c2fb19e4-883a-42f6-8dcb-100de85eebed">

## CASE VI:
#### Question:
You are a data scientist in a company that runs a social media platform. The company wants to take a look at the level of participation across their platform. Your task is to write a query to calculate the distribution of comments by the count of users that joined the platform between 2018 and 2020 for the month of January 2020. The output should contain a count of comments and the corresponding number of users that made the number of comments. For example, you will be counting how many users made 1 comment, 2 comment etc in Jan 2020.
#### Table1: 
* users
#### Columns: 
* id int
* name varchar
* joined_at datetime
* city_id varchar
* device varchar
#### Table2: 
* comments
#### Columns: 
* user_id int
* body varchar
* created_at datetime 
#### Way of thinking:
1. join users and comments
2. filter created_at january 2020
3. filter joined_at between 2018 and 2020
4. joined_at < created_at
5. user, count(comments)
6. group by count(comments)
7. count (users)
8. order by num_comments asc
#### Queries:
<img width="634" alt="Screenshot 2023-12-13 122332" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/21c4a895-9d79-42ee-b66f-feee6e1901da">

#### Result:
<img width="662" alt="Screenshot 2023-12-13 122347" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/383b4b5c-86a9-48ff-aaee-edbc535ad921">


## CASE VII:
#### Question:
We woluld like to track month over month percentage change in revenue. Your output should be in the form the year and the month and the percentage change, round 2 decimal points, and sort from the beginning of the year to the end of the year.
#### Table: 
* transactions
#### Columns: 
* id int#
* created_at datetime
* value int
*  purchase_id int
#### Way of thinking:
1. date trunc
2. perc change over month(window)
3. round to 2 decimal points
4. sort by beginning to the end of year
#### Queries:
<img width="638" alt="Screenshot 2023-12-13 125014" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/032aeaf8-3a7a-423a-997a-9baad3905fa7">

#### Result:
<img width="663" alt="Screenshot 2023-12-13 125033" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/b369511a-5d26-4166-9ba1-5ac64c8628e9">

## CASE VIII:
#### Question:
Our goal is to develop a naive forecast for a new metric called monhly distance_per_dollar defined as the (distance_to_travel / monetary_cost) in our dataset and measure its accuracy. Use RSME to evaluate accuracy.
#### Table: 
* request_logs
#### Columns: 
* request_id int
* request_date datetime
* request_status varchar (success, fail)
* distance_to_travel float
* monetary_cost float
* driver_to_client_distance float
#### Way of thinking:
1. actual distance_per_dollar per month(distance_to_travel/monetary_cost)
2. model distance per dollar : window function with LAG from previous monyh
3. RSME between actual and model
#### Queries:
<img width="633" alt="Screenshot 2023-12-13 131411" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/b5524dd9-9ab7-460e-a6de-51c19bbbf879">

#### Result:
<img width="662" alt="Screenshot 2023-12-13 131423" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/e0be16b6-d98a-4a7b-864e-56f06ab5664d">
