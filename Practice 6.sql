--- Ex 1
WITH job_hiring AS
(SELECT company_id, title, 
COUNT(job_id) AS job_count
FROM job_listings
GROUP BY company_id, title)

SELECT 
COUNT (DISTINCT company_id) 
FROM job_hiring 
WHERE job_count>1
--- Ex 2 with CTEs
WITH xx AS 
(SELECT category, product, sum(spend) AS total_spend
FROM product_spend
WHERE EXTRACT(year FROM transaction_date)=2022
GROUP BY category, product)
(SELECT * FROM xx
WHERE category='appliance'
ORDER BY total_spend DESC
limit 2)
 UNION ALL
(SELECT * FROM xx
WHERE category='electronics'
ORDER BY total_spend DESC
limit 2)
--- Ex 2 with ranking
WITH ranking_table AS
(SELECT category, product,
sum(spend) AS total_spend,
RANK() OVER(PARTITION BY category ORDER BY sum(spend) DESC) AS ranking
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product)
SELECT category, product, total_spend
FROM ranking_table
WHERE ranking<=2
GROUP BY category, product, total_spend, ranking
ORDER BY category, ranking 
--- Ex 3
SELECT count(call) AS total FROM
(SELECT policy_holder_id, count(case_id) AS call FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id)>=3) 
AS call_rec;
--- Ex 4
SELECT page_id FROM pages WHERE page_id NOT IN 
(SELECT page_id
FROM page_likes)
--- Ex 6
WITH date AS (SELECT *, DATE_FORMAT (trans_date, '%Y-%m') AS month FROM Transactions)

SELECT date.month, date.country,
count(date.id) AS trans_count,
sum(CASE WHEN date.state ='approved' THEN 1 ELSE 0 END) AS approved_count,
sum(date.amount) AS trans_total_amount,
sum(CASE WHEN state ='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM date
GROUP BY date.month, date.country
--- Ex 7
SELECT product_id, year as first_year, quantity,price
FROM Sales
WHERE (product_id,year) in 
(SELECT product_id,MIN(year)
FROM Sales
GROUP BY product_id)
--- Ex 8
select customer_id
from customer
group by customer_id
having count(distinct product_key)=(select count(product_key) from product)
--- Ex 9 
select employee_id from employees where salary<30000
and manager_id not in (select employee_id
from employees 
group by employee_id)
order by employee_id 
--- Ex 10





