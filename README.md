# Interview-Cases-SQL-Queries
### CASE I:
## Questions: 
What information would you like to start off by pulling to get an overall understanding of the post feature?  What are the success rate by day? Which day of week has the lowest success rate?  
## Table: 
Post_events
## Columns: 
user_id int
created_at datetime
event_name varchar (enter, post, cancel)
## Answer: 
Overal health: 
* total numbers of posts(number of enters);
* posts made by date;
* success rate;
* cancel rate.
## Way of thinking:
1. Succes rate by date
	date || success_rate = number of posts/ number of enter
2. group by date
3. group by date extracted dow
4. average success_rate
5. day || success_rate
6. min success_rate   
## Queries:

<img width="674" alt="Screenshot 2023-12-12 201825" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/13603b62-b747-42f9-8c23-ed9db5eab26d">

<img width="679" alt="Screenshot 2023-12-12 201837" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/27b932c3-f806-4701-8849-ad18871ed4cf">

<img width="728" alt="Screenshot 2023-12-12 201902" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/62adf303-dac6-46dd-a3cf-66ff11938e97">


CASE II:

<img width="683" alt="Screenshot 2023-12-12 201940" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/b28597b7-8527-4d2e-9f5e-e465a63253dc">

<img width="716" alt="Screenshot 2023-12-12 210524" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/e7f2448e-eaf7-4756-977d-8337bcf24d26">


CASE III:

<img width="677" alt="Screenshot 2023-12-12 204215" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/6926d61c-3c6a-4e6c-bfec-5aa7de7bbba8">

<img width="681" alt="Screenshot 2023-12-12 204225" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/3a23903c-6db6-4dbe-8924-474920c9445b">

<img width="716" alt="Screenshot 2023-12-12 210739" src="https://github.com/oladzie/Interview-Cases-SQL-Queries/assets/141512778/3abb19fb-a170-4c3f-a811-3860a1d02f7c">

