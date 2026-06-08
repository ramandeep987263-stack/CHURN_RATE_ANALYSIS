
SELECT COUNT(*) AS total_customers
FROM customer;

#2 TOTAL CHURNED CUSTOMER 
SELECT COUNT(*) AS churned_customer
FROM customer
WHERE churn ='yes';

#3 TOTAL CHURNED CUSTOMERS 
SELECT ROUND(COUNT( CASE WHEN Churn ='yes' THEN 1 END)*100.0/COUNT(*),2) AS churn_rate
FROM customer;

#4 TOTAL ACTIVE CUSTOMERS
SELECT COUNT(*) AS active_customer
FROM customer
WHERE churn ='no';

#5 CHURN BY GENDER
SELECT
gender,
COUNT(*) AS customers,
SUM(CASE WHEN Churn='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY gender;

#6. CHURN BY CONTRACT TYPE
SELECT
Contract,
COUNT(*) AS customers,
SUM(CASE WHEN Churn='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY Contract;

#7. CHURN BY PAYMENT METHOD
SELECT
PaymentMethod,
COUNT(*) AS customers,
SUM(CASE WHEN Churn ='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY PaymentMethod;

#8. CHURN BY INTERNET SERVICE
SELECT
InternetService,
COUNT(*) AS customers,
SUM(CASE WHEN Churn ='yes' THEN 1 ELSE 0 END) AS Churned
FROM customer
GROUP BY InternetService;

#9 . AVERAGE MONTHLY CHARGES 
SELECT 
ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charges
FROM customer;

#10. AVERAGE TENURE
SELECT 
ROUND(AVG(tenure),2) AS avg_tenure
FROM customer;

#11. CHURN BY SENIOR CUSOTMER 
SELECT
SeniorCitizen,
COUNT(*) AS customers,
SUM(CASE WHEN churn ='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY SeniorCitizen;

#12. CHURN BY PARTNER STATUS
SELECT
Partner,
COUNT(*) AS customers,
SUM(CASE WHEN churn='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY Partner;

#13. CHURN BY DEPENDENTS
SELECT
Dependents,
COUNT(*) AS customers,
SUM(CASE WHEN churn='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY Dependents;

#14. CHURN BY TECH SUPPORT
SELECT
TechSupport,
COUNT(*) AS customers,
SUM(CASE WHEN churn ='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY TechSupport;

#15. REVENUE LOST DUE TO CHURN
SELECT
ROUND(SUM(MonthlyCharges),2) AS monthly_charges
FROM customer
WHERE churn= 'Yes';

#16. CHURN BY TENURE GROUP
SELECT 
CASE 
WHEN tenure <=12 THEN '0-1 Year'
WHEN tenure <=24 THEN '1-2 Year'
WHEN tenure <=48 THEN '2-4 Year'
ELSE '4+ Year'
END AS tenure,
COUNT(*) AS customer,
SUM(CASE WHEN churn='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY tenure;

#17 .TOP HIGH RISK CUSTOMER SEGMENT
SELECT 
InternetService,
Contract,
COUNT(*) AS customer,
SUM(CASE WHEN churn = 'yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY InternetService,Contract
ORDER BY churned;

#18 . MOTHLY CHARGES
SELECT
Churn,
ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charges
FROM customer
GROUP BY churn;

#19. CUSTOMER LIFETIME VALUE
SELECT
customerID,
ROUND(MonthlyCharges*tenure,2) AS customer_lifetime_value
FROM customer
ORDER BY customer_lifetime_value DESC
LIMIT 10;

#20.TOP CHURN DRIVERS
SELECT
Contract,
TechSupport,
PaperlessBilling,
COUNT(*) AS Customers,
SUM(CASE WHEN Churn='yes' THEN 1 ELSE 0 END) AS churned
FROM customer
GROUP BY Contract, TechSupport, PaperlessBilling
ORDER BY churned  DESC;






