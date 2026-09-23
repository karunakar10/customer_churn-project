USE data_analysis;

-- Tables
SELECT * FROM customer;
SELECT * FROM subscription;
SELECT * FROM support;


-- LEVEL - 1 BASIC SQL

-- Q1. Display all customers.
 SELECT * FROM customer;

-- Q2. Display customer name, country, state and gender.
SELECT name, country, state, gender FROM customer;

-- Q3. Display all unique countries.
SELECT DISTINCT country FROM customer;

-- Q4. Display all unique subscription types.
SELECT DISTINCT subscription_type FROM subscription;

-- Q5. Display customer name, date of birth and interests.
SELECT name, dob, interests FROM customer;

-- Q6. Display customers who are from Maharashtra.
SELECT * FROM customer WHERE state = 'Maharashtra';

-- Q7. Display subscriptions where the monthly charges are greater than 1000.
SELECT customerid, plan_type, monthly_charges FROM subscription
WHERE monthly_charges > 1000;

-- Q8. Display support records where the CSAT score is less than 3.
SELECT customerid, complaint_date, csat_score FROM support
WHERE csat_score < 3;
 
-- Q9. Display customers who are from Delhi and are Female.
SELECT name, country, state, gender FROM customer
WHERE state = 'Delhi' AND gender = 'Female';

-- Q10. Display subscriptions where the plan type is 'Basic'.
SELECT customerid, plan_type, monthly_charges, contract_type FROM subscription
WHERE plan_type = 'Basic';

-- Q11. Display support records where the CSAT score is 4 or higher.
SELECT customerid, complaint_date, csat_score, escalations FROM support
WHERE csat_score >= 4;

-- LEVEL 2 — SORTING & FILTERING

-- Q12. Display all subscriptions ordered by monthly charges from highest to lowest.
SELECT * FROM subscription
ORDER BY monthly_charges DESC;

-- Q13. Display the top 5 customers with the highest churn score.
SELECT customerid, churn_score FROM subscription
ORDER BY churn_score DESC LIMIT 5;

-- Q14. Display subscriptions where monthly charges are between 50 and 100,
-- ordered by monthly charges from lowest to highest.
SELECT customerid, plan_type, monthly_charges FROM subscription
WHERE monthly_charges BETWEEN 50 AND 100
ORDER BY monthly_charges ASC;

-- Q15. Display the 5 subscriptions with the lowest monthly charges.
SELECT customerid, plan_type, monthly_charges FROM subscription
ORDER BY monthly_charges ASC LIMIT 5;

-- Q16. Display customers whose interests contain 'travel'.
SELECT name, country, state, interests FROM customer
WHERE interests LIKE '%travel%';

-- Q17. Display support records with a CSAT score between 3 and 5,
-- ordered from highest to lowest CSAT score.
SELECT customerid, complaint_date, csat_score FROM support
WHERE csat_score BETWEEN 3 AND 5
ORDER BY csat_score DESC;

-- Q18. Display subscriptions for customers whose contract type is 'Monthly'.
SELECT customerid, plan_type, contract_type, monthly_charges FROM subscription
WHERE contract_type = 'Monthly';

-- Q19. Display customers whose country is India and state is either Delhi or Maharashtra.
SELECT customerid, name, country, state FROM customer
WHERE country = 'India' AND state IN ('Delhi', 'Maharashtra');

-- Q20. Display support records with a CSAT score of 20 or lower,
-- ordered by CSAT score from lowest to highest.
SELECT customerid, complaint_date, csat_score, escalations FROM support
WHERE csat_score <= 20
ORDER BY csat_score ASC;

-- Q21. Display subscriptions where the subscription type is either 'organic' or 'paid'.
SELECT customerid, subscription_type, plan_type, monthly_charges FROM subscription
WHERE subscription_type IN ('organic', 'paid');

-- Q22. Display customers whose name starts with the letter 'A'.
SELECT customerid, name, country, state FROM customer
WHERE name LIKE 'A%';

-- Q23. Display the 5 support records with the highest CSAT scores.
SELECT customerid, complaint_date, csat_score, escalations FROM support
ORDER BY csat_score DESC LIMIT 5;

-- Q24. Display the 5 subscriptions with the highest CLTV.
SELECT customerid, plan_type, cltv FROM subscription
ORDER BY cltv DESC LIMIT 5;

-- Q25. Display subscriptions where the churn score is greater than 50,
-- ordered from highest to lowest churn score.
SELECT customerid, plan_type, churn_score FROM subscription
WHERE churn_score > 50
ORDER BY churn_score DESC;

-- LEVEL 3 — AGGREGATE FUNCTIONS

-- Q26. Find the total number of customers.
SELECT COUNT(*) AS total_customers FROM customer;

-- Q27. Find the average monthly charges of all subscriptions.
SELECT round(AVG(monthly_charges),2) AS avg_monthly_charges FROM subscription;

-- Q28. Find the highest CLTV among all subscriptions.
SELECT MAX(cltv) AS highest_cltv FROM subscription;

-- Q29. Find the average monthly charges for subscriptions
-- where the churn score is greater than 50.
SELECT ROUND(AVG(monthly_charges),2) AS avg_monthly_charges FROM subscription
WHERE churn_score > 50;

-- Q30. Find the total monthly charges for subscriptions
-- where the plan type is 'Basic'.
SELECT SUM(monthly_charges) AS total_monthly_charges FROM subscription
WHERE plan_type = 'Basic';

-- Q31. Find the average CLTV for subscriptions
-- where the churn score is greater than 50.
SELECT AVG(cltv) AS avg_cltv FROM subscription
WHERE churn_score > 50;

-- Q32. Find the minimum and maximum CSAT score
-- for support records where the escalation status is not empty.
SELECT MIN(csat_score) AS min_csat_score,MAX(csat_score) AS max_csat_score FROM support
WHERE escalations IS NOT NULL AND escalations != '';

 -- Q33. Find the total number of support complaints
-- where the CSAT score is greater than 3.

SELECT COUNT(*) AS total_complaints FROM support
WHERE csat_score >3;

-- Q34. Find the highest CLTV among subscriptions
-- where monthly charges are greater than 500.

SELECT MAX(cltv) AS highest_cltv FROM subscription
WHERE monthly_charges > 50;

-- Q35. Find the average monthly charges for subscriptions
-- where the churn score is greater than 50,
-- ordered by the average monthly charges from highest to lowest.
SELECT AVG(monthly_charges) AS avg_monthly_charges FROM subscription
WHERE churn_score > 50
ORDER BY avg_monthly_charges DESC;

 -- Q36. Find the average monthly charges, average CLTV,
-- and average churn score for subscriptions
-- where the churn score is greater than 50.
SELECT AVG(monthly_charges) AS avg_monthly_charges,AVG(cltv) AS avg_cltv,
AVG(churn_score) AS avg_churn_score FROM subscription
WHERE churn_score > 50;

-- LEVEL - 4 GROUP BY

-- Q37. Find the total monthly charges for each plan type.
SELECT plan_type, SUM(monthly_charges) AS total_monthly_charges FROM subscription
GROUP BY plan_type;

-- Q38. Find the average CLTV for each contract type
-- where monthly charges are less than 30.
SELECT contract_type, AVG(cltv) AS avg_cltv FROM subscription
WHERE monthly_charges < 30
GROUP BY contract_type;

-- Q39. Find the minimum, maximum, and average monthly charges
-- for each plan type where churn score is greater than 50.
SELECT plan_type,MIN(monthly_charges) AS min_monthly_charges,MAX(monthly_charges) AS max_monthly_charges,
AVG(monthly_charges) AS avg_monthly_charges FROM subscription
WHERE churn_score > 50
GROUP BY plan_type;

-- Q40. Find the total number of subscriptions and
-- the average monthly charges for each contract type
-- where plan_type is basic.
SELECT contract_type,COUNT(*) AS total_subscriptions,
AVG(monthly_charges) AS avg_monthly_charges FROM subscription
WHERE plan_type='basic'
GROUP BY contract_type;

-- Q41. Find the minimum, maximum, and average CSAT score
-- for each escalation status.
SELECT escalations,MIN(csat_score) AS min_csat_score,MAX(csat_score) AS max_csat_score,
AVG(csat_score) AS avg_csat_score FROM support
GROUP BY escalations;

-- Q42. Find the total number of complaints and
-- average CSAT score for each escalation status.
SELECT escalations,COUNT(*) AS total_complaints,AVG(csat_score) AS avg_csat_scor FROM support
GROUP BY escalations;

-- Q43. Find the total number of customers and
-- the number of customers for each gender.
SELECT gender,COUNT(*) AS total_customers FROM customer
GROUP BY gender;

-- Q44. Find the total number of customers for each country,
-- ordered by the total number of customers from highest to lowest.
SELECT country,COUNT(*) AS total_customers FROM customer
GROUP BY country
ORDER BY total_customers DESC;

-- Q45. Find the total number of complaints and
-- the highest CSAT score for each escalation status,
-- ordered by the highest CSAT score from highest to lowest.
SELECT escalations,COUNT(*) AS total_complaints,MAX(csat_score) AS highest_csat_score FROM support
GROUP BY escalations
ORDER BY highest_csat_score DESC;

-- Q46. Find the total number of customers for each state
-- where the country is India,
-- ordered by the total number of customers from highest to lowest.
SELECT state,COUNT(*) AS total_customers FROM customer
WHERE country = 'India'
GROUP BY state
ORDER BY total_customers DESC;

-- Q47. Find the total number of complaints and
-- average CSAT score for each escalation status
-- where CSAT score is greater than 2.
SELECT escalations,COUNT(*) AS total_complaints,AVG(csat_score) AS avg_csat_score FROM support
WHERE csat_score > 2
GROUP BY escalations;

-- Q48. Find the total number of subscriptions and
-- average monthly charges for each plan type
-- where monthly charges are less than 30.
SELECT plan_type,COUNT(*) AS total_subscriptions,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
WHERE monthly_charges < 30
GROUP BY plan_type;
 
-- Q49. Find the total number of customers for each country
-- where the gender is male,
-- ordered by the total number of customers from highest to lowest.
SELECT country,COUNT(*) AS total_customers FROM customer
WHERE gender = 'male'
GROUP BY country
ORDER BY total_customers DESC; 

-- Q50. Find the total number of complaints and
-- average CSAT score for each CSAT score
-- where CSAT score is greater than 3,
-- ordered by average CSAT score from lowest to highest.
SELECT csat_score,COUNT(*) AS total_complaints,AVG(csat_score) AS avg_csat_score FROM support
WHERE csat_score > 3
GROUP BY csat_score
ORDER BY avg_csat_score ASC;

-- LEVEL - 5 HAVING

-- Q51. Find the total number of customers for each state
-- where the country is India,
-- and show only states having more than 2 customer.
SELECT state,COUNT(*) AS total_customers FROM customer
WHERE country = 'India'
GROUP BY state
HAVING COUNT(*) > 2;

-- Q52. Find the average CSAT score for each escalation status
-- where CSAT score is greater than 2,
-- and show only escalation statuses with an average CSAT score greater than 3.
SELECT escalations,AVG(csat_score) AS avg_csat_score FROM support
WHERE csat_score > 2
GROUP BY escalations
HAVING AVG(csat_score) > 3;

-- Q53. Find the total CLTV for each plan type
-- where subscription_type is refferal
-- and show only plan types having total CLTV greater than 5000.
SELECT plan_type,SUM(cltv) AS total_cltv FROM subscription
WHERE subscription_type='Paid'
GROUP BY plan_type
HAVING SUM(cltv) > 5000;

-- Q54. Find the maximum churn score for each contract type,
-- and show only contract types having a maximum churn score greater than 70.
SELECT contract_type,MAX(churn_score) AS max_churn_score FROM subscription
GROUP BY contract_type
HAVING MAX(churn_score) > 70;

-- Q55. Find the average monthly charges for each subscription type,
-- and show only subscription types having an average monthly charge
-- greater than 10.
SELECT subscription_type,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
GROUP BY subscription_type
HAVING AVG(monthly_charges) > 10;

-- Q56. Find the total number of customers for each gender,
-- and show only gender having more than 3 customer.
SELECT gender,COUNT(*) AS total_customers FROM customer
GROUP BY gender
HAVING COUNT(*) > 3;

-- Q57. Find the minimum, maximum, and average CSAT score
-- for each escalation status,
-- and show only escalation statuses having an average CSAT score greater than 3.
SELECT escalations,MIN(csat_score) AS min_csat_score,MAX(csat_score) AS max_csat_score,
AVG(csat_score) AS avg_csat_score FROM support
GROUP BY escalations
HAVING AVG(csat_score) > 3;

-- Q58. Find the average CLTV for each plan type
-- where monthly charges are greater than 40,
-- and show only plan types having an average CLTV greater than 500.
SELECT plan_type,AVG(cltv) AS avg_cltv FROM subscription
WHERE monthly_charges > 40
GROUP BY plan_type
HAVING AVG(cltv) > 500;

-- Q59. Find the total number of customers for each state,
-- and show only states having more than 1 customer.
SELECT state,COUNT(*) AS total_customers FROM customer
GROUP BY state
HAVING COUNT(*) > 1;

-- Q60. Find the total number of customers for each country,
-- and show only countries having more than 5 customer.
SELECT country,COUNT(*) AS total_customers FROM customer
GROUP BY country
HAVING COUNT(*) > 5;

-- LEVEL - 6 CASE WHEN

-- Q61. Categorize customers based on their gender.
-- Display the customer name and gender category.
SELECT name,gender,CASE WHEN gender = 'Male' THEN 'Male Customer'
WHEN gender = 'Female' THEN 'Female Customer' ELSE 'Other'
END AS gender_category FROM customer;

-- Q62. Categorize subscriptions based on their monthly charges.
-- Display the customer ID, monthly charges, and charge category.
SELECT customerid,monthly_charges,CASE WHEN monthly_charges < 500 THEN 'Low'
WHEN monthly_charges BETWEEN 500 AND 1000 THEN 'Medium' ELSE 'High'
END AS charge_category FROM subscription;

-- Q63. Categorize support records based on CSAT score.
-- Display the customer ID, CSAT score, and CSAT category.
SELECT customerid,csat_score,CASE WHEN csat_score <= 2 THEN 'Poor'
WHEN csat_score = 30 THEN 'Average' ELSE 'Good'
END AS csat_category FROM support;

-- Q64. Categorize subscriptions based on churn score
-- for subscriptions where monthly charges are greater than 50.
-- Display the customer ID, churn score, and churn category.
SELECT customerid,churn_score,CASE WHEN churn_score <= 30 THEN 'Low Risk'
WHEN churn_score BETWEEN 31 AND 70 THEN 'Medium Risk' ELSE 'High Risk'
END AS churn_category FROM subscription
WHERE monthly_charges > 50;

-- Q65. Categorize customers based on their country.
-- Display the customer ID, country, and country category
-- for customers whose gender is Female.
SELECT customerid,country,CASE WHEN country = 'India' THEN 'Indian Customer'
ELSE 'International Customer' END AS country_category FROM customer
WHERE gender = 'Female';


-- Q66. Categorize support complaints based on CSAT score
-- where escalations are not empty.
-- Display the customer ID, CSAT score, and support category.
SELECT customerid,csat_score,CASE WHEN csat_score <= 2 THEN 'Poor'
WHEN csat_score = 3 THEN 'Average' ELSE 'Good'END AS support_category FROM support
WHERE escalations IS NOT NULL AND escalations !='';

-- Q67. Categorize subscriptions based on monthly charges
-- and display only subscriptions with a churn score greater than 50.
-- Display the customer ID, monthly charges, and charge category.
SELECT customerid,monthly_charges,CASE WHEN monthly_charges < 500 THEN 'Low Charges'
WHEN monthly_charges BETWEEN 500 AND 1000 THEN 'Medium Charges'
ELSE 'High Charges' END AS charge_category FROM subscription
WHERE churn_score > 50;

-- Q68. Categorize customers based on their state.
-- Display the customer ID, state, and state category
-- for customers from India.
SELECT customerid,state,CASE WHEN state IN ('Delhi', 'Maharashtra') THEN 'Major State'
ELSE 'Other State' END AS state_category FROM customer
WHERE country = 'India';

-- Q69. Categorize customers based on their interests.
-- Display the customer ID, interests, and interest category
-- for customers whose interests are not empty.
SELECT customerid,interests,CASE WHEN interests LIKE '%travel%' THEN 'Travel Interest'
WHEN interests LIKE '%movie%' THEN 'Entertainment Interest'
ELSE 'Other Interest'END AS interest_category FROM customer
WHERE interests IS NOT NULL AND interests != '';

-- Q70. Categorize customers based on their gender.
-- Display the customer ID, name, gender, and gender category
-- for customers from India.
SELECT customerid,name,gender,CASE WHEN gender = 'Male' THEN 'Male Customer'
WHEN gender = 'Female' THEN 'Female Customer' ELSE 'Other Customer'
END AS gender_categors FROM customer
WHERE country = 'Nepal';

-- LEVEL - 7 STRING FUNCTIONS & CONDITIONAL AGGREGATION

-- Q71. Display the customer name in uppercase
-- along with the first 3 characters of the customer name.
SELECT name,UPPER(name) AS uppercase_name,LEFT(name, 3) AS first_three_characters
FROM customer;

-- Q72. Display the customer name, state,
-- and the length of each customer name
-- for customers from India.
SELECT name,state,LENGTH(name) AS name_length FROM customer
WHERE country = 'India';

-- Q73. Display the customer ID, name,
-- and the first 5 characters of the customer name
-- for customers whose gender is Female.
SELECT customerid,name,LEFT(name, 5) AS first_five_characters FROM customer
WHERE gender = 'Female';

-- Q74. Display the customer ID, comment,
-- and the length of each support comment
-- for support records where the comment is not empty.
SELECT customerid,comment,LENGTH(comment) AS comment_length FROM support
WHERE comment IS NOT NULL AND comment != '';

-- Q75. Display the customer ID, plan type,
-- and plan type in uppercase for subscriptions
-- where monthly charges are greater than 50.
SELECT customerid,plan_type,UPPER(plan_type) AS uppercase_plan_type
FROM subscription
WHERE monthly_charges > 50;

-- Q76. Display the support comment in uppercase
-- along with the length of each comment
-- for comments that are not empty.
SELECT comment,UPPER(comment) AS uppercase_comment,LENGTH(comment) AS comment_length
FROM support
WHERE comment IS NOT NULL AND comment <> '';

-- Q77. Display the subscription type in lowercase
-- along with the length of each subscription type.
SELECT subscription_type,LOWER(subscription_type) AS lowercase_subscription_type,
LENGTH(subscription_type) AS subscription_type_length FROM subscription;

-- Q78. Display the cancellation reason in uppercase
-- along with the length of each cancellation reason.
SELECT cancellation_reason,UPPER(cancellation_reason) AS uppercase_reason,
LENGTH(cancellation_reason) AS reason_length FROM subscription
WHERE cancellation_reason IS NOT NULL AND cancellation_reason <> '';

-- Q79. Display the customer name in lowercase
-- along with the last 3 characters of the customer name.
SELECT name,LOWER(name) AS lowercase_name,RIGHT(name, 3) AS last_three_characters
FROM customer;

-- Q80. Display the support comment in uppercase
-- along with the length of each comment
-- for complaints with a CSAT score greater than 3.
SELECT comment,UPPER(comment) AS uppercase_comment,LENGTH(comment) AS comment_lengt FROM support
WHERE csat_score > 3 AND comment IS NOT NULL AND comment != '';

-- Q81. Display the plan type after removing
-- leading and trailing spaces using TRIM
-- for subscriptions with monthly charges greater than 10.
SELECT plan_type,TRIM(plan_type) AS trimmed_plan_type FROM subscription
WHERE monthly_charges > 10;

-- Q83. Display the customer name after removing
-- leading and trailing spaces and convert it to uppercase
-- for customers from India.
SELECT name,UPPER(TRIM(name)) AS cleaned_name FROM customer
WHERE country = 'India';

-- Q84. Display the support comment after replacing
-- spaces with hyphens for complaints with a CSAT score highest than 3.
SELECT comment,REPLACE(comment, ' ', '-') AS formatted_comment FROM support
WHERE csat_score > 3 AND comment IS NOT NULL AND comment != '';

-- Q85. Display the customer name and extract
-- the first 4 characters of the name for customers
-- whose gender is Female.
SELECT name,SUBSTRING(name, 1, 4) AS first_four_characters FROM customer
WHERE gender = 'Female';

-- Q86. Display the support comment and extract
-- the first 5 characters of each comment
-- for complaints with a CSAT score greater than 3.
SELECT comment,SUBSTRING(comment, 1, 5) AS first_five_characters FROM support
WHERE csat_score > 3 AND comment IS NOT NULL AND comment != '';

-- LEVEL - 8 JOINS
-- Q88. Display the customer name, country,
-- and subscription plan type for each customer.
SELECT c.name,c.country,s.plan_type FROM customer c
INNER JOIN subscription s ON c.customerid = s.customerid;

-- Q89. Display the customer name, state,
-- and monthly charges for customers from India
-- whose monthly charges are greater than 50.
SELECT c.name,c.state,s.monthly_charges FROM customer c
INNER JOIN subscription s
ON c.customerid = s.customerid
WHERE c.country = 'India' AND s.monthly_charges > 30;

-- Q90. Display the customer name, plan type,
-- and churn score for customers whose churn score is greater than 50.
SELECT c.name,s.plan_type,s.churn_score FROM customer c
INNER JOIN subscription s
ON c.customerid = s.customerid
WHERE s.churn_score > 50;

-- Q91. Display the customer name, subscription type,
-- and monthly charges for customers from Maharashtra.
SELECT c.name,s.subscription_type,s.monthly_charges FROM customer c
INNER JOIN subscription s
ON c.customerid = s.customerid
WHERE c.state = 'Maharashtra';

-- Q92. Display the customer name, plan type,
-- and CSAT score for customers who have submitted support records.
SELECT c.name,s.plan_type,sp.csat_score FROM customer c
INNER JOIN subscription s
ON c.customerid = s.customerid
INNER JOIN support sp
ON c.customerid = sp.customerid;

-- Q93. Find the average monthly charges for each plan type
-- for customers from India, and display only plan types
-- whose average monthly charges are greater than 20.
SELECT s.plan_type,AVG(s.monthly_charges) AS avg_monthly_charges FROM customer c
INNER JOIN subscription s
ON c.customerid = s.customerid
WHERE c.country = 'India'
GROUP BY s.plan_type
HAVING AVG(s.monthly_charges) > 20;

-- Q94. Find the total number of support complaints
-- for each state, for customers from India,
SELECT c.state,COUNT(*) AS total_complaints FROM customer c
INNER JOIN support sp
ON c.customerid = sp.customerid
WHERE c.country = 'India'
GROUP BY c.state;

-- Q95. Display all customers and their subscription plan type,
-- including customers who do not have a subscription.
SELECT c.name,c.country,s.plan_type FROM customer c
LEFT JOIN subscription s
ON c.customerid = s.customerid;

-- Q96. Find the average CSAT score for each plan type
-- for customers from India, and display only plan types
-- with an average CSAT score greater than 3.
SELECT s.plan_type,AVG(sp.csat_score) AS avg_csat_score FROM subscription s
LEFT JOIN support sp
ON s.customerid = sp.customerid
INNER JOIN customer c
ON s.customerid = c.customerid
WHERE c.country = 'India'
GROUP BY s.plan_type
HAVING AVG(sp.csat_score) > 3;

-- Q97. Display all support records and the customer name,
-- including support records that do not have a matching customer.
SELECT sp.customerid,c.name,sp.csat_score,sp.comment FROM support sp
LEFT JOIN customer c
ON sp.customerid = c.customerid;

-- Q98. Find the total number of subscriptions
-- and average monthly charges for each country,
-- considering only customers with monthly charges greater than 30.
SELECT c.country,COUNT(*) AS total_subscriptions,AVG(s.monthly_charges) AS avg_monthly_charges FROM customer c
RIGHT JOIN subscription s
ON c.customerid = s.customerid
WHERE s.monthly_charges > 30
GROUP BY c.country;
 
-- Q99. Display the customer name, subscription type,
-- and support CSAT score for customers from Delhi
-- who have a CSAT score greater than 3.
SELECT c.name,s.subscription_type,sp.csat_score FROM customer c
INNER JOIN subscription s
ON c.customerid = s.customerid
LEFT JOIN support sp
ON c.customerid = sp.customerid
WHERE c.state = 'Delhi' AND sp.csat_score > 3;

-- Q100. Display the customer name, plan type,
-- and CSAT score for all customers,
-- including customers who do not have a support record.
SELECT c.name,s.plan_type,sp.csat_score FROM customer c
INNER JOIN subscription s
ON c.customerid = s.customerid
RIGHT JOIN support sp
ON c.customerid = sp.customerid;

-- Q101. Display the customer name, plan type,
-- and support comment for all subscription records,
-- including subscriptions that do not have a matching customer.
SELECT c.name,s.plan_type,sp.comment
FROM customer c
RIGHT JOIN subscription s
ON c.customerid = s.customerid
LEFT JOIN support sp
ON s.customerid = sp.customerid;

-- Q102. Find the total number of support complaints
-- and average CSAT score for each plan type.
-- Include plan types even if they have no support records.
-- Display only plan types with more than 1 complaints.
SELECT s.plan_type,COUNT(sp.customerid) AS total_complaints,AVG(sp.csat_score) AS avg_csat_score FROM subscription s
LEFT JOIN support sp
ON s.customerid = sp.customerid
GROUP BY s.plan_type
HAVING COUNT(sp.customerid) > 1;

-- Q103. Display the customer name, country,
-- and support CSAT score for customers from India
-- who have submitted a support complaint with a CSAT score above 3.
SELECT c.name,c.country,sp.csat_score FROM customer c
LEFT JOIN support sp
ON c.customerid = sp.customerid
WHERE c.country = 'India' AND sp.csat_score > 3;

-- Q104. Find the total number of customers and
-- average monthly charges for each state,
-- considering only customers from India.
-- Display only states with less than 3 customers.
SELECT c.state,COUNT(DISTINCT c.customerid) AS total_customers,
AVG(s.monthly_charges) AS avg_monthly_charges FROM customer c
LEFT JOIN subscription s
ON c.customerid = s.customerid
WHERE c.country = 'India'
GROUP BY c.state
HAVING COUNT(DISTINCT c.customerid) < 3;

-- Q105. Display the customer name, plan type,
-- and support comment for all support records,
-- including records where the customer has no matching subscription.
SELECT c.name,s.plan_type,sp.comment FROM support sp
LEFT JOIN customer c
ON sp.customerid = c.customerid
LEFT JOIN subscription s
ON sp.customerid = s.customerid;

-- Q106. Find the total number of complaints and
-- average CSAT score for each subscription type
-- for customers from India.
-- Display only subscription types with less than 5 complaints.
SELECT s.subscription_type,COUNT(sp.customerid) AS total_complaints,
AVG(sp.csat_score) AS avg_csat_score FROM subscription s
INNER JOIN customer c
ON s.customerid = c.customerid
LEFT JOIN support sp
ON s.customerid = sp.customerid
WHERE c.country = 'India'
GROUP BY s.subscription_type
HAVING COUNT(sp.customerid) < 5;

-- Q107. Display the customer name, state,
-- and monthly charges for customers who have a subscription
-- but have not submitted any support complaint.
SELECT c.name,c.state,s.monthly_charges FROM customer c
INNER JOIN subscription s
ON c.customerid = s.customerid
LEFT JOIN support sp
ON c.customerid = sp.customerid
WHERE sp.customerid IS NULL;

-- SELF JOIN

-- Q108. Find pairs of customers who are from the same state
-- but have different customer IDs.
-- Display both customer names and their state.
SELECT c1.name AS customer_1,c2.name AS customer_2,c1.state FROM customer c1
INNER JOIN customer c2
ON c1.state = c2.state AND c1.customerid < c2.customerid;

-- Q109. Find pairs of customers who are from the same country
-- but have different genders.
-- Display both customer names, genders, and country.
SELECT c1.name AS customer_1,c2.name AS customer_2,c1.gender AS gender_1,
c2.gender AS gender_2,c1.country FROM customer c1
INNER JOIN customer c2
ON c1.country = c2.country AND c1.gender <> c2.gender AND c1.customerid < c2.customerid;

-- Q110. Find pairs of subscriptions with the same plan type
-- but different customer IDs.
-- Display both customer IDs, plan type, and monthly charges.
SELECT s1.customerid AS customer_1,s2.customerid AS customer_2,s1.plan_type,
s1.monthly_charges AS charges_1,s2.monthly_charges AS charges_2 FROM subscription s1
INNER JOIN subscription s2
ON s1.plan_type = s2.plan_type AND s1.customerid < s2.customerid;

-- Q111. Find pairs of support records with the same CSAT score
-- but different customer IDs.
-- Display both customer IDs, CSAT scores, and complaint dates.
SELECT sp1.customerid AS customer_1,sp2.customerid AS customer_2,sp1.csat_score,
sp1.complaint_date AS complaint_date_1,sp2.complaint_date AS complaint_date_2 FROM support sp1
INNER JOIN support sp2
ON sp1.csat_score = sp2.csat_score
AND sp1.customerid < sp2.customerid;

-- Q112. Find pairs of customers from the same state
-- whose names start with the same letter.
-- Display both customer names and the state.
SELECT c1.name AS customer_1,c2.name AS customer_2,c1.state FROM customer c1
INNER JOIN customer c2
ON c1.state = c2.state AND LEFT(c1.name, 1) = LEFT(c2.name, 1) AND c1.customerid < c2.customerid;

-- CROSS JOIN

-- Q113. Generate all possible combinations of
-- subscription plan types and contract types.
SELECT s1.plan_type,s2.contract_type FROM subscription s1
CROSS JOIN subscription s2;

-- Q114. Generate all possible combinations of
-- subscription types and plan types,
-- and display only combinations where the subscription type
-- is different from the plan type.
SELECT DISTINCT s1.subscription_type,s2.plan_type FROM subscription s1
CROSS JOIN subscription s2
WHERE s1.subscription_type != s2.plan_type;

-- Q115. Generate all possible combinations of
-- customer genders and subscription plan types.
-- Display only combinations where the gender is 'Female'.
SELECT DISTINCT c.gender,s.plan_type FROM customer c
CROSS JOIN subscription s
WHERE c.gender = 'Female';

-- Q116. Generate all possible combinations of
-- customer states and support CSAT scores.
-- Display only combinations where the CSAT score is greater than 3.
SELECT DISTINCT c.state,sp.csat_score FROM customer c
CROSS JOIN support sp
WHERE sp.csat_score > 3;

-- Q117. Generate combinations of customer genders and subscription types.
-- Display only combinations with more than 10 records.
SELECT c.gender,s.subscription_type,COUNT(*) AS total_combinations FROM customer c
CROSS JOIN subscription s
GROUP BY c.gender, s.subscription_type
HAVING COUNT(*) > 10;

-- LEVEL - 9 SUBQUERIES

-- Q118. Display the customer names and plan types
-- of customers whose monthly charges are greater than
-- the average monthly charges of all subscriptions.
SELECT c.name,s.plan_type,s.monthly_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
WHERE s.monthly_charges > (SELECT AVG(monthly_charges) FROM subscription);

-- Q119. Display the customer names and monthly charges
-- of customers whose monthly charges are greater than
-- the average monthly charges of their own plan type.
SELECT c.name,s.plan_type,s.monthly_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
WHERE s.monthly_charges > (SELECT AVG(s1.monthly_charges) FROM subscription s1
						   WHERE s1.plan_type = s.plan_type);

-- Q120. Display the customer names and CLTV
-- of customers whose CLTV is greater than
-- the maximum CLTV of customers with a Basic plan.
SELECT c.name,s.cltv,s.plan_type FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
WHERE s.cltv > (SELECT MAX(cltv) FROM subscription
                 WHERE plan_type = 'Basic');

-- Q121. Display the customer names and monthly charges
-- of customers whose monthly charges are greater than
-- the average monthly charges of customers from India.
SELECT c.name,c.country,s.monthly_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
WHERE s.monthly_charges > (SELECT AVG(s1.monthly_charges) FROM customer c1
						   JOIN subscription s1
                           ON c1.customerid = s1.customerid
                           WHERE c1.country = 'India');

-- Q122. Display the customer names and CSAT scores
-- of customers whose CSAT score is greater than
-- the average CSAT score of all support complaints.
SELECT c.name,sp.csat_score FROM customer c
JOIN support sp
ON c.customerid = sp.customerid
WHERE sp.csat_score > (SELECT AVG(csat_score) FROM support);

-- Q123. Display the customer names and support comments
-- of customers whose CSAT score is equal to the
-- maximum CSAT score given by support.
SELECT c.name,sp.comment,sp.csat_score FROM customer c
JOIN support sp
ON c.customerid = sp.customerid
WHERE sp.csat_score = (SELECT MAX(csat_score)FROM support);

-- Q124. Display the customer names and subscription types
-- of customers whose subscription type is the same as
-- at least one customer from Delhi.
SELECT c.name,s.subscription_type FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
WHERE s.subscription_type IN (SELECT s1.subscription_type FROM customer c1
                              JOIN subscription s1
                              ON c1.customerid = s1.customerid
                              WHERE c1.state = 'Delhi'  );

-- Q125. Display the customer names and support CSAT scores
-- of customers whose CSAT score is greater than the
-- average CSAT score of customers from India.
SELECT c.name,sp.csat_score FROM customer c
JOIN support sp
ON c.customerid = sp.customerid
WHERE sp.csat_score > (SELECT AVG(sp1.csat_score)FROM customer c1
                       JOIN support sp1
                       ON c1.customerid = sp1.customerid
					   WHERE c1.country = 'India');

-- Q126. Display each customer's name, monthly charges,
-- and the average monthly charges of all subscriptions.
SELECT c.name,s.monthly_charges,(SELECT AVG(monthly_charges)FROM subscription) AS avg_monthly_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q127. Display each plan type, its average monthly charges,
-- and the overall average monthly charges using a subquery in SELECT.
SELECT s.plan_type,AVG(s.monthly_charges) AS avg_plan_charges,(SELECT AVG(monthly_charges)FROM subscription) AS overall_avg_charges
FROM subscription s
GROUP BY s.plan_type;

-- Q128. Using a subquery in FROM, find the plan types
-- whose average monthly charges are less than 50.
SELECT plan_type,avg_monthly_charges FROM (SELECT plan_type,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
GROUP BY plan_type) AS plan_summary
WHERE avg_monthly_charges < 50;

-- Q129. Using a subquery in FROM, find each country
-- and the average monthly charges of its customers.
-- Display only countries with an average below 50.
SELECT country,avg_monthly_charges FROM (SELECT c.country,AVG(s.monthly_charges) AS avg_monthly_charges FROM customer c
                                         JOIN subscription s
                                         ON c.customerid = s.customerid
                                         GROUP BY c.country) AS country_summary
WHERE avg_monthly_charges < 50;

-- Q130. Using a subquery in FROM, find each CSAT score
-- and the number of support complaints for that score.
-- Display only CSAT scores with less than 2 complaints.
SELECT csat_score,complaint_count FROM (SELECT csat_score,COUNT(*) AS complaint_count FROM support
                                        GROUP BY csat_score) AS csat_summary
WHERE complaint_count < 2;

-- Q131. Display customer names and their support CSAT scores
-- for customers whose subscription monthly charges are
-- less than the average monthly charges.
SELECT c.name,sp.csat_score,s.monthly_charges FROM customer c
JOIN (SELECT customerid,monthly_charges FROM subscription
      WHERE monthly_charges < (SELECT AVG(monthly_charges)FROM subscription)) AS s
ON c.customerid = s.customerid
JOIN support sp
ON c.customerid = sp.customerid;

-- Q132. Using a subquery in JOIN, display the customer names
-- and support CSAT scores for customers who have a
-- CSAT score greater than the average CSAT score.
SELECT c.name,sp.csat_score FROM customer c
JOIN (SELECT customerid,csat_score FROM support
      WHERE csat_score > (SELECT AVG(csat_score)FROM support)) AS sp
ON c.customerid = sp.customerid;

-- Q133. Using a subquery in JOIN, display the customer names,
-- plan types, and monthly charges for customers whose
-- monthly charges are greater than the average charges
-- of their own plan type.
SELECT c.name,s.plan_type,s.monthly_charges FROM customer c
JOIN (SELECT customerid,plan_type,monthly_charges FROM subscription s1
      WHERE monthly_charges > (SELECT AVG(s2.monthly_charges) FROM subscription s2
                               WHERE s2.plan_type = s1.plan_type)) AS s
ON c.customerid = s.customerid;

-- Q134. Using a subquery in JOIN, display the customer names,
-- states, and support CSAT scores for customers whose CSAT
-- score is equal to the maximum CSAT score.
SELECT c.name,c.state,sp.csat_score FROM customer c
JOIN (SELECT customerid,csat_score FROM support
      WHERE csat_score = (SELECT MAX(csat_score) FROM support)) AS sp
ON c.customerid = sp.customerid;

-- Q135. Using a subquery in JOIN, display the customer names,
-- subscription types, and monthly charges for customers
-- whose CSAT score is greater than 3.
SELECT c.name,s.subscription_type,s.monthly_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
JOIN (SELECT customerid FROM support
      WHERE csat_score > 3) AS sp
ON c.customerid = sp.customerid;

-- Q136. Display the customer names and monthly charges
-- of customers whose monthly charges are greater than
-- the average monthly charges of customers whose churn score
-- is greater than 50.
SELECT c.name,s.monthly_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
WHERE s.monthly_charges > (SELECT AVG(monthly_charges)FROM subscription
                           WHERE churn_score > (SELECT AVG(churn_score)FROM subscription));
  
-- Q137. Display the customer names and CSAT scores
-- of customers whose CSAT score is greater than
-- the average CSAT score of customers whose
-- escalation is not empty.
SELECT c.name,sp.csat_score FROM customer c
JOIN support sp
ON c.customerid = sp.customerid
WHERE sp.csat_score > (SELECT AVG(csat_score)FROM support
                       WHERE csat_score > (SELECT AVG(csat_score)FROM support));

-- Q138. Display the customer names and CLTV
-- of customers whose CLTV is greater than the
-- average CLTV of customers whose monthly charges
-- are greater than the average monthly charges.
SELECT c.name,s.cltv FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
WHERE s.cltv > (SELECT AVG(cltv)FROM subscription
				WHERE monthly_charges > (SELECT AVG(monthly_charges)FROM subscription));

-- LEVEL - 10 CTEs

-- Q139. Find the average CSAT score for each escalation type.
-- Display only escalation types with an average CSAT score greater than 3.
WITH escalation_csat AS (SELECT escalations,AVG(csat_score) AS avg_csat_score FROM support
                         GROUP BY escalations)
SELECT escalations,avg_csat_score FROM escalation_csat
WHERE avg_csat_score > 3;

-- Q140. Find the average monthly charges for each contract type.
-- Display only contract types with an average monthly charge less than 50.
WITH contract_charges AS (SELECT contract_type,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
                          GROUP BY contract_type)
SELECT contract_type,avg_monthly_charges FROM contract_charges
WHERE avg_monthly_charges < 50;

-- Q141. Find the total number of support complaints for each CSAT score.
-- Display only CSAT scores having less than 2 complaints.
WITH csat_complaints AS (SELECT csat_score,COUNT(*) AS total_complaints FROM support
                         GROUP BY csat_score)
SELECT csat_score,total_complaints FROM csat_complaints
WHERE total_complaints < 2;

-- Q142. Find the average CLTV for each subscription type.
-- Display only subscription types whose average CLTV
-- is less than 3000.
WITH subscription_cltv AS (SELECT subscription_type,AVG(cltv) AS avg_cltv FROM subscription
                           GROUP BY subscription_type)
SELECT subscription_type,avg_cltv FROM subscription_cltv
WHERE avg_cltv < 3000;

-- Q143. Find the average monthly charges for each plan type
-- and display only plan types whose average monthly charges
-- are greater than the overall average monthly charges.
WITH plan_charges AS (SELECT plan_type,AVG(monthly_charges) AS avg_plan_charges FROM subscription
                      GROUP BY plan_type)
SELECT plan_type,avg_plan_charges FROM plan_charges
WHERE avg_plan_charges > (SELECT AVG(monthly_charges)FROM subscription);

-- Q144. Find the average CSAT score for each country.
-- Use customer and support tables.
-- Display only countries with an average CSAT score greater than 30.
WITH country_csat AS (SELECT c.country,AVG(sp.csat_score) AS avg_csat_score FROM customer c
                      JOIN support sp
                      ON c.customerid = sp.customerid
					  GROUP BY c.country)
SELECT country,avg_csat_score FROM country_csat
WHERE avg_csat_score >30 ;

-- Q145. Find the average monthly charges for each country.
-- Use customer and subscription tables.
-- Display only countries whose average monthly charges are greater than 20.
WITH country_charges AS (SELECT c.country,AVG(s.monthly_charges) AS avg_monthly_charges FROM customer c
                         JOIN subscription s
                         ON c.customerid = s.customerid
                         GROUP BY c.country)
SELECT country,avg_monthly_charges FROM country_charges
WHERE avg_monthly_charges >20;

-- Q146. Find the average CLTV for each plan type.
-- Display only plan types whose average CLTV is greater than
-- the overall average CLTV.
WITH plan_cltv AS (SELECT plan_type,AVG(cltv) AS avg_cltv FROM subscription
                   GROUP BY plan_type)
SELECT plan_type,avg_cltv FROM plan_cltv
WHERE avg_cltv > (SELECT AVG(cltv) FROM subscription);

-- Q147. Find the average churn score for each subscription type.
-- Display only subscription types whose average churn score
-- is greater than the overall average churn score.
WITH subscription_churn AS (SELECT subscription_type,AVG(churn_score) AS avg_churn_score FROM subscription
                            GROUP BY subscription_type)
SELECT subscription_type,avg_churn_score FROM subscription_churn
WHERE avg_churn_score > (SELECT AVG(churn_score)FROM subscription);

-- Q148. Find the maximum monthly charges for each plan type.
-- Display only plan types whose maximum monthly charges
-- are greater than the overall average monthly charges.
WITH plan_charges AS (SELECT plan_type,MAX(monthly_charges) AS max_monthly_charges FROM subscription
                      GROUP BY plan_type)
SELECT plan_type,max_monthly_charges FROM plan_charges
WHERE max_monthly_charges > (SELECT AVG(monthly_charges)FROM subscription);
  
-- Q149. Find the minimum CSAT score for each escalation type.
-- Display only escalation types whose minimum CSAT score
-- is less than the overall average CSAT score.
WITH escalation_csat AS (SELECT escalations,MIN(csat_score) AS min_csat_score FROM support
                         GROUP BY escalations)
SELECT escalations,min_csat_score FROM escalation_csat 
WHERE min_csat_score < (SELECT AVG(csat_score)FROM support);

-- Q150. Find the total monthly charges for each country.
-- Use customer and subscription tables.
-- Display only countries whose total monthly charges
-- are greater than the overall average monthly charges.
WITH country_charges AS (SELECT c.country,SUM(s.monthly_charges) AS total_monthly_charges FROM customer c
                         JOIN subscription s
                         ON c.customerid = s.customerid
                         GROUP BY c.country)
SELECT country,total_monthly_charges FROM country_charges
WHERE total_monthly_charges > (SELECT AVG(monthly_charges)FROM subscription);

-- Q151. Find the average CSAT score for each country.
-- Use customer and support tables.
-- Display only countries whose average CSAT score
-- is greater than the overall average CSAT score.
WITH country_csat AS (SELECT c.country,AVG(sp.csat_score) AS avg_csat_score FROM customer c
                      JOIN support sp
                       ON c.customerid = sp.customerid
                       GROUP BY c.country)
SELECT country,avg_csat_score FROM country_csat
WHERE avg_csat_score > (SELECT AVG(csat_score)FROM support);

-- Q152. Find the average CSAT score for each escalation type.
-- Display only escalation types whose average CSAT score is greater than 3.
WITH escalation_csat AS (SELECT escalations,AVG(csat_score) AS avg_csat_score FROM support
                         GROUP BY escalations)
SELECT escalations,avg_csat_score FROM escalation_csat
WHERE avg_csat_score > 3;

-- Q153. Find the average monthly charges for each subscription type.
-- Display only subscription types whose average monthly charges
-- are less than 20.
WITH subscription_charges AS (SELECT subscription_type,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
                               GROUP BY subscription_type)
SELECT subscription_type,avg_monthly_charges FROM subscription_charges
WHERE avg_monthly_charges < 20;

-- Q154. Find the average monthly charges for each subscription type.
-- Display only subscription types whose average monthly charges
-- are greater than the overall average monthly charges.
WITH subscription_charges AS (SELECT subscription_type,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
                              GROUP BY subscription_type)
SELECT subscription_type,avg_monthly_charges FROM subscription_charges
WHERE avg_monthly_charges > (SELECT AVG(monthly_charges) FROM subscription);

-- Q155. Find the average CLTV for each contract type.
-- Display only contract types whose average CLTV is greater
-- than the average CLTV of customers with a Basic plan.
WITH contract_cltv AS (SELECT contract_type,AVG(cltv) AS avg_cltv FROM subscription
                       GROUP BY contract_type)
SELECT contract_type,avg_cltv FROM contract_cltv
WHERE avg_cltv > (SELECT AVG(cltv)FROM subscription
                  WHERE plan_type = 'Basic');

-- LEVEL - 11 WINDOW FUNCTIONS

-- Q156. Display each customer's name, plan type,
-- monthly charges, and the rank of their monthly charges
-- within each plan type.
SELECT c.name,s.plan_type,s.monthly_charges,RANK() OVER (PARTITION BY s.plan_type ORDER BY s.monthly_charges DESC) AS charge_rank
FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q157. Display each customer's name, subscription type,
-- monthly charges, and row number within each subscription type.
-- Order the row number by monthly charges from highest to lowest.
SELECT c.name,s.subscription_type,s.monthly_charges,ROW_NUMBER() OVER (
PARTITION BY s.subscription_type ORDER BY s.monthly_charges DESC) AS charge_row FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q158. Display each customer name, contract type,
-- CLTV, and the dense rank of CLTV within each contract type.
-- Order the rank from highest CLTV to lowest.
SELECT c.name,s.contract_type,s.cltv,DENSE_RANK() OVER (PARTITION BY s.contract_type 
ORDER BY s.cltv DESC) AS cltv_rank FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q159. Display each customer name, plan type,
-- monthly charges, and the average monthly charges
-- of their plan type using a window function.
SELECT c.name,s.plan_type,s.monthly_charges,AVG(s.monthly_charges) OVER (
PARTITION BY s.plan_type) AS avg_plan_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q160. Display each customer name, plan type,
-- monthly charges, and the difference between their
-- monthly charges and the average charges of their plan type.
SELECT c.name,s.plan_type,s.monthly_charges,s.monthly_charges,AVG(s.monthly_charges) OVER (
PARTITION BY s.plan_type) AS difference_from_avg FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q161. Display each customer name, contract type,
-- CLTV, and the previous customer's CLTV within
-- the same contract type.
-- Order by CLTV from highest to lowest.
SELECT c.name,s.contract_type,s.cltv,LAG(s.cltv) OVER (
PARTITION BY s.contract_type ORDER BY s.cltv DESC) AS previous_cltv FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q162. Display each customer name, support CSAT score,
-- and the next support record's CSAT score.
-- Order records by CSAT score from highest to lowest.
SELECT c.name,sp.csat_score,LEAD(sp.csat_score) OVER (ORDER BY sp.csat_score DESC)
AS next_csat_score FROM customer c
JOIN support sp
ON c.customerid = sp.customerid;

-- Q163. Display each customer name, plan type,
-- monthly charges, and the total monthly charges
-- within their plan type.
SELECT c.name,s.plan_type,s.monthly_charges,SUM(s.monthly_charges) OVER (
PARTITION BY s.plan_type) AS total_plan_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q164. Display each customer name, contract type,
-- CLTV, and the total number of customers
-- within their contract type.
SELECT c.name,s.contract_type,s.cltv,COUNT(*) OVER (PARTITION BY s.contract_type) AS total_customers FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q165. Display each customer name, plan type,
-- monthly charges, and the running total of monthly charges
-- within each plan type, ordered by monthly charges from lowest to highest.
SELECT c.name,s.plan_type,s.monthly_charges,SUM(s.monthly_charges) OVER (PARTITION BY s.plan_type 
ORDER BY s.monthly_charges ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q166. Display each customer name, plan type,
-- CLTV, and the highest CLTV within their plan type.
SELECT c.name,s.plan_type,s.cltv,MAX(s.cltv) OVER (PARTITION BY s.plan_type) AS max_plan_cltv FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q167. Display each customer name, subscription type,
-- monthly charges, and the average monthly charges
-- within their subscription type.
SELECT c.name,s.subscription_type,s.monthly_charges,AVG(s.monthly_charges) OVER (
PARTITION BY s.subscription_type) AS avg_subscription_charges FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q168. Display each customer name, plan type,
-- CLTV, and the difference between their CLTV
-- and the previous customer's CLTV within the same plan type.
-- Order CLTV from highest to lowest.
SELECT c.name,s.plan_type,s.cltv,s.cltv - LAG(s.cltv) OVER (
PARTITION BY s.plan_type ORDER BY s.cltv DESC) AS cltv_difference FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q169. Display each customer name, contract type,
-- monthly charges, and the percentage contribution of
-- their monthly charges to the total charges within
-- their contract type.
SELECT c.name,s.contract_type,s.monthly_charges,s.monthly_charges /SUM(s.monthly_charges) OVER (
PARTITION BY s.contract_type) * 100 AS charge_percentage FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q170. Display each customer name, subscription type,
-- churn score, and the highest churn score within
-- their subscription type.
SELECT c.name,s.subscription_type,s.churn_score,MAX(s.churn_score) OVER (
PARTITION BY s.subscription_type) AS max_churn_score FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q171. Display each customer name, contract type,
-- monthly charges, and the rank of their monthly charges
-- within each contract type.
-- Order monthly charges from highest to lowest.
SELECT c.name,s.contract_type,s.monthly_charges,DENSE_RANK() OVER (
PARTITION BY s.contract_type ORDER BY s.monthly_charges DESC) AS charge_rank FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q172. Display each customer name, subscription type,
-- CLTV, and the first CLTV value within each subscription type.
-- Order CLTV from highest to lowest.
SELECT c.name,s.subscription_type,s.cltv,FIRST_VALUE(s.cltv) OVER (
PARTITION BY s.subscription_type ORDER BY s.cltv DESC) AS first_cltv FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q173. Display each customer name, subscription type,
-- monthly charges, and the last monthly charge within
-- each subscription type.
-- Order monthly charges from lowest to highest.
SELECT c.name,s.subscription_type,s.monthly_charges,LAST_VALUE(s.monthly_charges) OVER (PARTITION BY s.subscription_type 
ORDER BY s.monthly_charges ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_monthly_charge FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q174. Display each customer name, plan type,
-- monthly charges, and the number of customers
-- with higher monthly charges within the same plan type.
SELECT c.name,s.plan_type,s.monthly_charges,COUNT(*) OVER (PARTITION BY s.plan_type ORDER BY s.monthly_charges DESC 
ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS higher_charge_count FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q175. Display each customer name, plan type,
-- CLTV, and the cumulative average CLTV within
-- their plan type.
-- Order CLTV from highest to lowest.
SELECT c.name,s.plan_type,s.cltv,AVG(s.cltv) OVER (PARTITION BY s.plan_type ORDER BY s.cltv DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_avg_cltv FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q176. Display each customer name, contract type,
-- churn score, and the difference between their churn score
-- and the average churn score within their contract type.
SELECT c.name,s.contract_type,s.churn_score,s.churn_score -AVG(s.churn_score) OVER (
PARTITION BY s.contract_type) AS difference_from_avg FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q177. Display each customer name, plan type,
-- monthly charges, and the percentage rank of their
-- monthly charges within each plan type.
-- Order monthly charges from highest to lowest.
SELECT c.name,s.plan_type,s.monthly_charges,PERCENT_RANK() OVER (PARTITION BY s.plan_type
ORDER BY s.monthly_charges DESC) AS charge_percent_rank FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- Q178. Display each customer name, subscription type,
-- monthly charges, and the quartile of their monthly charges
-- within each subscription type.
-- Order monthly charges from highest to lowest.
SELECT c.name,s.subscription_type,s.monthly_charges,NTILE(4) OVER (PARTITION BY s.subscription_type
ORDER BY s.monthly_charges DESC) AS charge_quartile FROM customer c
JOIN subscription s
ON c.customerid = s.customerid;

-- LEVEL - 12 ADVANCED CTEs & SUBQUERIES

-- Q179. Find the average monthly charges for each plan type.
-- Display only plan types whose average monthly charges
-- are greater than the overall average monthly charges.
-- Use a CTE and a subquery.
WITH plan_charges AS (SELECT plan_type,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
                      GROUP BY plan_type)
SELECT plan_type,avg_monthly_charges FROM plan_charges
WHERE avg_monthly_charges > (SELECT AVG(monthly_charges) FROM subscription);

-- LEVEL - 12 ADVANCED CTEs & SUBQUERIES

-- Q180. Find the average CLTV for each contract type.
-- Display only contract types whose average CLTV is greater
-- than the average CLTV of the Basic plan.
-- Use a CTE and a subquery.
WITH contract_cltv AS (SELECT contract_type,AVG(cltv) AS avg_cltv FROM subscription
                       GROUP BY contract_type)
SELECT contract_type,avg_cltv FROM contract_cltv
WHERE avg_cltv > (SELECT AVG(cltv)FROM subscription
WHERE plan_type = 'Basic');

-- Q181. Find the total monthly charges for each subscription type.
-- Display only subscription types whose total monthly charges
-- are greater than the average total monthly charges
-- across all subscription types.
-- Use a CTE and a subquery.
WITH subscription_totals AS (SELECT subscription_type,SUM(monthly_charges) AS total_monthly_charges FROM subscription
                             GROUP BY subscription_type)
SELECT subscription_type,total_monthly_charges FROM subscription_totals
WHERE total_monthly_charges > (SELECT AVG(total_monthly_charges)FROM subscription_totals);

-- Q182. Find the average CSAT score for each escalation type.
-- Display only escalation types whose average CSAT score
-- is greater than the overall average CSAT score.
-- Use a CTE and a subquery.
wITH escalation_csat AS (SELECT escalations,AVG(csat_score) AS avg_csat_score FROM support
                         GROUP BY escalations)
SELECT escalations,avg_csat_score FROM escalation_csat
WHERE avg_csat_score > (SELECT AVG(csat_score)FROM support);

-- Q183. Find the maximum churn score for each plan type.
-- Display only plan types whose maximum churn score
-- is greater than the overall average churn score.
-- Use a CTE and a subquery.
WITH plan_churn AS (SELECT plan_type,MAX(churn_score) AS max_churn_score FROM subscription
                    GROUP BY plan_type)
SELECT plan_type,max_churn_score FROM plan_churn
WHERE max_churn_score > (SELECT AVG(churn_score)FROM subscription);

-- Q184. Find the minimum monthly charges for each contract type.
-- Display only contract types whose minimum monthly charges
-- are less than the overall average monthly charges.
-- Use a CTE and a subquery.
WITH contract_charges AS (SELECT contract_type,MIN(monthly_charges) AS min_monthly_charges FROM subscription
                          GROUP BY contract_type)
SELECT contract_type,min_monthly_charges FROM contract_charges
WHERE min_monthly_charges < (SELECT AVG(monthly_charges)FROM subscription);

-- Q185. Find the average CLTV for each subscription type.
-- Display only subscription types whose average CLTV
-- is greater than the average CLTV of the Premium plan.
-- Use a CTE and a subquery.
WITH subscription_cltv AS (SELECT subscription_type,AVG(cltv) AS avg_cltv FROM subscription
                           GROUP BY subscription_type)
SELECT subscription_type,avg_cltv FROM subscription_cltv
WHERE avg_cltv < (SELECT AVG(cltv)FROM subscription
                  WHERE plan_type = 'Premium');

-- Q186. Find the total number of support complaints for each CSAT score.
-- Display only CSAT scores whose complaint count is greater than
-- the average complaint count across all CSAT scores.
-- Use a CTE and a subquery.
WITH csat_complaints AS (SELECT csat_score,COUNT(*) AS complaint_count FROM support
                         GROUP BY csat_score)
SELECT csat_score,complaint_count FROM csat_complaints
WHERE complaint_count > (SELECT AVG(complaint_count) FROM csat_complaints);

-- Q188. Find the average monthly charges for each plan type.
-- Display only plan types whose average monthly charges
-- are less than the average monthly charges of the Premium plan.
-- Use a CTE and a subquery.
WITH plan_charges AS (SELECT plan_type,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
                       GROUP BY plan_type)
SELECT plan_type,avg_monthly_charges FROM plan_charges
WHERE avg_monthly_charges < (SELECT AVG(monthly_charges)FROM subscription
                             WHERE plan_type = 'Premium');

-- Q189. Find the top 3 customers with the highest
-- monthly charges within each plan type.
-- Use a CTE with a window function.
WITH ranked_customers AS (SELECT c.name,s.plan_type,s.monthly_charges,ROW_NUMBER() OVER (
                          PARTITION BY s.plan_type ORDER BY s.monthly_charges DESC) AS charge_rank FROM customer c
                          JOIN subscription s
                          ON c.customerid = s.customerid)
SELECT name,plan_type,monthly_charges,charge_rank
FROM ranked_customers
WHERE charge_rank <= 3;

-- Q190. Find the average monthly charges for each plan type,
-- rank the plan types by their average monthly charges,
-- and display only the top 2 plan types.
-- Use multiple CTEs.
WITH plan_charges AS (SELECT plan_type,AVG(monthly_charges) AS avg_monthly_charges FROM subscription
                      GROUP BY plan_type),
ranked_plans AS (SELECT plan_type,avg_monthly_charges,DENSE_RANK() OVER (ORDER BY avg_monthly_charges DESC) AS plan_rank FROM plan_charges)
SELECT plan_type,avg_monthly_charges,plan_rank FROM ranked_plans
WHERE plan_rank <= 2;

-- LEVEL - 13 DATE & DATETIME

-- Q191. Display the customer name, complaint date,
-- and CSAT score for complaints received after a specific date.
SELECT c.name,sp.complaint_date,sp.csat_score FROM customer c
JOIN support sp
ON c.customerid = sp.customerid
WHERE sp.complaint_date > '2024-01-01';

-- Q192. Display all subscriptions started in January 2025.
-- Order the subscriptions by subscription start date.
SELECT c.name,s.subscription_start_date,s.subscription_type,s.plan_type FROM customer c
JOIN subscription s
ON c.customerid = s.customerid
WHERE s.subscription_start_date < '2025-01-01' AND s.subscription_start_date < '2025-02-01'
ORDER BY s.subscription_start_date;

-- Q193. Find the number of subscriptions started in each month.
-- Display the month number and total subscriptions.
-- Order by total subscriptions from highest to lowest.
SELECT MONTH(subscription_start_date) AS month_number,COUNT(*) AS total_subscriptions FROM subscription
GROUP BY MONTH(subscription_start_date)
ORDER BY total_subscriptions DESC;

-- Q194. Find the number of subscriptions started in each month.
-- Display the month number, month name and total subscriptions.
-- Order by total subscriptions from highest to lowest.
SELECT MONTH(subscription_start_date) AS month_number,MONTHNAME(subscription_start_date) AS month_name,
COUNT(*) AS total_subscriptions FROM subscription
GROUP BY MONTH(subscription_start_date),MONTHNAME(subscription_start_date)
ORDER BY total_subscriptions DESC;

-- Q195. Find the total monthly charges for each month
-- based on the subscription start date.
-- Display the month number, month name and total monthly charges.
-- Order by total monthly charges from highest to lowest.
SELECT MONTH(subscription_start_date) AS month_number,MONTHNAME(subscription_start_date) AS month_name,
SUM(monthly_charges) AS total_monthly_charges FROM subscription
GROUP BY MONTH(subscription_start_date),MONTHNAME(subscription_start_date)
ORDER BY total_monthly_charges DESC;

-- Q196. Find the total number of subscriptions started on each day of the week.
-- Display the day name, month name and total subscriptions.
-- Order by total subscriptions from highest to lowest.
SELECT DAYNAME(subscription_start_date) AS day_name,MONTHNAME(subscription_start_date) AS month_name,
COUNT(*) AS total_subscriptions FROM subscription
GROUP BY DAYNAME(subscription_start_date),MONTHNAME(subscription_start_date)
ORDER BY total_subscriptions DESC;

-- Q197. Find the number of support complaints for each hour
-- based on the complaint date.
-- Display the hour and total complaints.
-- Order by total complaints from highest to lowest.
SELECT HOUR(complaint_date) AS complaint_hour,COUNT(*) AS total_complaints FROM support
GROUP BY HOUR(complaint_date)
ORDER BY total_complaints DESC;

-- Q198. Find the number of support complaints for each day of the month.
-- Display the day number and total complaints.
-- Order by day number from lowest to highest.
SELECT DAYNAME(complaint_date) AS day_number,COUNT(*) AS total_complaints FROM support
GROUP BY DAYNAME(complaint_date)
ORDER BY day_number;

-- Q199. Find the number of subscriptions renewed in each month.
-- Display the month number, month name and total renewals.
-- Order by total renewals from highest to lowest.
SELECT MONTH(renewal_date) AS month_number,MONTHNAME(renewal_date) AS month_name,COUNT(*) AS total_renewals FROM subscription
GROUP BY MONTH(renewal_date),MONTHNAME(renewal_date)
ORDER BY total_renewals DESC;

-- Q200. Find the number of cancellations for each month.
-- Display the month number, month name and total cancellations.
-- Ignore records where the cancellation date is NULL.
-- Order by total cancellations from highest to lowest.
SELECT MONTH(cancellation_date) AS month_number,MONTHNAME(cancellation_date) AS month_name,COUNT(*) AS total_cancellations FROM subscription
WHERE cancellation_date IS NOT NULL
GROUP BY MONTH(cancellation_date),MONTHNAME(cancellation_date)
ORDER BY total_cancellations DESC;

-- Q201. Find the number of support complaints for each month.
-- Display the month number, month name and total complaints.
-- Order by total complaints from highest to lowest.
SELECT MONTH(complaint_date) AS month_number,MONTHNAME(complaint_date) AS month_name,COUNT(*) AS total_complaints FROM support
GROUP BY MONTH(complaint_date),MONTHNAME(complaint_date)
ORDER BY total_complaints DESC;

-- Q202. Find the average monthly charges for subscriptions
-- started in each month.
-- Display the month number, month name and average monthly charges.
-- Order by average monthly charges from highest to lowest.
SELECT MONTH(subscription_start_date) AS month_number,MONTHNAME(subscription_start_date) AS month_name,
AVG(monthly_charges) AS avg_monthly_charges FROM subscription
GROUP BY MONTH(subscription_start_date),MONTHNAME(subscription_start_date)
ORDER BY avg_monthly_charges DESC;

-- Q203. Find the total monthly charges for subscriptions
-- renewed in each month.
-- Display the month number, month name and total monthly charges.
-- Order by total monthly charges from highest to lowest.
SELECT MONTH(renewal_date) AS month_number,MONTHNAME(renewal_date) AS month_name,
SUM(monthly_charges) AS total_monthly_charges FROM subscription
GROUP BY MONTH(renewal_date),MONTHNAME(renewal_date)
ORDER BY total_monthly_charges DESC;




