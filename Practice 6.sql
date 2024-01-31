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
--- Ex 2
SELECT 
  category, 
  product,
  (SELECT Max(spend) AS total
  FROM product_spend table1
  WHERE table1.category=table2.category
  GROUP BY category)
FROM product_spend table2
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product
