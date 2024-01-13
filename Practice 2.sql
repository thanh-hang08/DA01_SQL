--- Ex 1
SELECT DISTINCT CITY FROM STATION WHERE ID%2=0
--- Ex 2
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION
--- Ex 4
SELECT 
ROUND(CAST(sum(item_count*order_occurrences)/sum(order_occurrences) AS Decimal),1) AS mean FROM items_per_order;
--- Ex 5
SELECT candidate_id FROM candidates
WHERE skill IN('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id
--- Ex7
SELECT card_name,
(MAX(issued_amount) - min(issued_amount)) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC
--- Ex 8
SELECT manufacturer,
COUNT(drug) AS drug_count,
ABS(SUM(total_sales-cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales<cogs
GROUP BY manufacturer
ORDER BY total_loss DESC
--- Ex9
SELECT * FROM Cinema
WHERE id%2=1 AND description <>'boring'
ORDER BY rating DESC
--- Ex10
SELECT teacher_id,
COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id
--- Ex11
SELECT user_id,
COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id
--- Ex12
SELECT class FROM Courses
GROUP BY class
HAVING count(class)>5
