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







