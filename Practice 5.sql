--- Ex 1
SELECT COUNTRY.continent, FLOOR(AVG(CITY.population))
FROM COUNTRY
INNER JOIN CITY
ON COUNTRY.Code=CITY.countrycode
GROUP BY COUNTRY.continent
--- Ex 2
SELECT 
ROUND(CAST(SUM(CASE WHEN texts.signup_action = 'Confirmed' THEN 1 ELSE 0 END) AS decimal)/count(texts.email_id),2) AS confirm_rate
FROM emails 
LEFT JOIN texts
ON emails.email_id=texts.email_id
--- Ex 3
SELECT a_b.age_bucket,
  ROUND(SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent END)/SUM(CASE WHEN a.activity_type IN ('open','send') THEN a.time_spent END)*100,2) AS send_perc,
  ROUND(SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent END)/SUM(CASE WHEN a.activity_type IN ('open','send') THEN a.time_spent END)*100,2) AS open_perc
FROM activities AS a
INNER JOIN age_breakdown AS a_b
ON a.user_id=a_b.user_id
GROUP BY a_b.age_bucket
--- Ex 4
SELECT c.customer_id
FROM customer_contracts AS c
LEFT JOIN products as p 
ON c.product_id=p.product_id
GROUP BY c.customer_id
HAVING COUNT(distinct p.product_category) = 3
--- Ex 5
SELECT 
E_id.employee_id AS employee_id, E_id.name, COUNT(Rpt_to.reports_to) AS reports_count, ROUND(AVG(Rpt_to.age)) AS average_age
FROM Employees AS E_id
JOIN Employees AS Rpt_to
ON E_id.employee_id=Rpt_to.reports_to
--- Ex 6
SELECT 
P.product_name AS product_name, sum(O.unit) AS unit
FROM Products AS P
JOIN Orders AS O
ON P.product_id=O.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY P.product_id
HAVING SUM(O.unit)>=100
--- Ex 7
SELECT  
P.page_id
FROM pages AS P 
LEFT JOIN page_likes AS P_L
ON P.page_id=P_L.page_id
WHERE P_L.page_id IS NULL
