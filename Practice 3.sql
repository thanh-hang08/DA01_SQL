--- Ex1
SELECT Name
FROM STUDENTS
WHERE Marks >75
ORDER BY RIGHT(Name,3), ID ASC
--- Ex 2
SELECT user_id,
Concat(Upper(left(name,1)),lower(right(name,length(name)-1))) AS name
FROM Users
ORDER BY user_id ASC
--- Ex 3
SELECT extract(month FROM submit_date) AS mth, product_id AS product, ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY extract(month FROM submit_date),product_id
ORDER BY extract(month FROM submit_date) ASC, product_id ASC
--- Ex 4
