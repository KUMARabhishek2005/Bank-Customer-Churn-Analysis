--1. total customer
SELECT COUNT(*) AS total_customers FROM customer_churn;

--2. Total Churned Customers
SELECT COUNT(*) AS churned_customers FROM customer_churn WHERE "Exited" = 1;

--3. Churn Rate
SELECT ROUND(AVG("Exited") * 100, 2) AS churn_rate
FROM customer_churn;

--4. Churn by Geography
SELECT "Geography", COUNT(*) AS total_customers, SUM("Exited") AS churned_customers,
ROUND(AVG("Exited") * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY "Geography";

--5.Churn by Gender
SELECT "Gender", ROUND(AVG("Exited") * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY "Gender";

--6.Age-wise Churn
SELECT "Age",
COUNT(*) AS total_customers,
SUM("Exited") AS churned_customers
FROM customer_churn
GROUP BY "Age"
ORDER BY churned_customers DESC;

--7. Age Group Analysis
SELECT 
CASE 
WHEN "Age" < 30 THEN 'Young'
WHEN "Age" BETWEEN 30 AND 50 THEN 'Adult'
ELSE 'Senior'
END AS age_group,
ROUND(AVG("Exited") * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY age_group;

--8.Active Member vs Churn
SELECT "IsActiveMember",
ROUND(AVG("Exited") * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY "IsActiveMember";

--9.Credit Card Holders
SELECT "HasCrCard", ROUND(AVG("Exited") * 100, 2) AS churn_rate FROM customer_churn
GROUP BY "HasCrCard";


--10.Balance Segment Analysis
SELECT 
CASE 
WHEN "Balance" > 100000 THEN 'High Balance'
WHEN "Balance" BETWEEN 50000 AND 100000 THEN 'Medium Balance'
ELSE 'Low Balance'
END AS balance_segment,
ROUND(AVG("Exited") * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY balance_segment;

--11.Number of Products Impact
SELECT "NumOfProducts", ROUND(AVG("Exited") * 100, 2) AS churn_rate FROM customer_churn
GROUP BY "NumOfProducts"
ORDER BY churn_rate DESC;

--12.Credit Score vs Churn
SELECT "Exited", ROUND(AVG("CreditScore"), 2) AS avg_credit_score FROM customer_churn
GROUP BY "Exited";Credit Score vs Churn


--13 High Balance Churned Customers
SELECT * FROM customer_churn WHERE "Exited" = 1
ORDER BY "Balance" DESC
LIMIT 10;

--14 Zero Balance Customers
SELECT COUNT(*) AS zero_balance_churned FROM customer_churn
WHERE "Balance" = 0 AND "Exited" = 1;

--15 Geography + Gender Risk
SELECT "Geography", "Gender", ROUND(AVG("Exited") * 100, 2) AS churn_rate FROM customer_churn
GROUP BY "Geography", "Gender";

--16 Total Balance Lost Due to Churn
SELECT SUM("Balance") AS total_lost_balance FROM customer_churn
WHERE "Exited" = 1;
