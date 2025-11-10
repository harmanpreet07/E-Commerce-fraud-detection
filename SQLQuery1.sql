use [e-commerce fraud detection]

select * 
from transactions



update transactions 
set shipping_distance_km = round(shipping_distance_km, 2) 


select count(*) as total_transactions
from transactions


select sum(amount) as total_revenue, count(transaction_id) as total_fraud
from transactions;


SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS total_frauds,
    ROUND((SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) * 100) / COUNT(*), 2) AS fraud_rate_percent
FROM transactions



SELECT 
    DATEPART(HOUR, Transaction_time) AS transaction_hour,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        (SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS fraud_percentage
FROM transactions
GROUP BY DATEPART(HOUR, Transaction_time)
ORDER BY fraud_transactions DESC;

select country, sum(case when is_fraud = 1 then 1 else 0 end) as fraud_cases
from transactions
group by country 
order by fraud_cases desc

select
    case 
    when is_fraud = 1 
    then 'Fraud'
    else 'Not_Fraud' end as transaction_type,
round(avg(amount), 2) as avg_amount,
count(*) as total_transactions
from transactions
group by is_fraud





SELECT 
    format(Transaction_time,  'yyyy-MM') AS month,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS fraud_rate_percent
FROM transactions
GROUP BY format(Transaction_time,  'yyyy-MM')
ORDER BY month;




SELECT 
    user_id,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions
FROM transactions
GROUP BY user_id
ORDER BY fraud_transactions DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;  -- top 10 risky customers





select sum(amount) as total_fraud_revenue
from transactions
where is_fraud = 1

select merchant_category, round(sum(amount),1) as total_amount,
sum(case when is_fraud = 1 then 1 else 0 end) fraud_transaction
from transactions
group by merchant_category
order by total_amount desc






