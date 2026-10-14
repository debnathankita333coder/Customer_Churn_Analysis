create database churndb;
use churndb;

select * from customer_churn limit 10;

select count(*) from customer_churn;

-- 1) Total Churn
select count(*) from customer_churn
where Churn = "Yes";

-- 2) Churn Rate
select round(sum(case when Churn = "Yes" then 1 else 0 end)*100/count(*),2) as Churn_Rate
from customer_churn;

-- 3) Average Monthly Charges
select round(avg(Monthly_Charges), 2) as Average_Monthly_Charges
from customer_churn;

-- 4) Average Tenure
select round(avg(Tenure_Months), 2) as Average_Tenure_Months
from customer_churn;

-- 5) Churn by Contract Type
select Contract_Type, count(*) as total_churn
from customer_churn
group by Contract_Type;

-- 6) Churn by Internet Service
select Internet_Service, count(*) as total_churn
from customer_churn
group by Internet_Service;

-- 7) Churn by State
select State, count(*) as total_churn
from customer_churn
group by State
order by 2 desc;

-- 8) Payment Method wise Customer
select Payment_Method, count(*) as total_churn
from customer_churn
group by Payment_Method
order by 2 desc;

-- 9) Subscription type wise customers
select Subscription_type, count(*) as total_churn
from customer_churn
group by Subscription_type
order by 2 desc;

-- 10) Highest Revenue States
select State, sum(Total_Charges) as Total_Revenue
from customer_churn
group by State
order by 2 desc;

-- 11) Average Charges by Contract
select Contract_Type, avg(Monthly_Charges) as Average_Charges
from customer_churn
group by Contract_Type
order by 2 desc;

-- 12) Senior Citizens Churn
select Senior_Citizen, count(*) as Senior_Citizens_Churn
from customer_churn
group by Senior_Citizen
order by 2 desc;

-- 13) Top 10 High Value Customer
select Customer_Name, Customer_Value
from customer_churn
order by 2 desc
limit 10;

-- 14) Customer Without Tech Support
select *
from customer_churn
where Tech_Support = "No";

