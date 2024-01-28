--- Question 1
SELECT DISTINCT replacement_cost FROM film 
ORDER BY replacement_cost
--- Question 2
SELECT
COUNT(CASE WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low' END) AS low,
COUNT(CASE WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium' END) AS medium,
COUNT(CASE WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high' END) AS high
FROM film
--- Question 3
SELECT film.title, film.length, category.name
FROM film
INNER JOIN film_category ON film.film_id=film_category.film_id
INNER JOIN category ON film_category.category_id=category.category_id
WHERE category.name ='Drama' or category.name ='Sports'
ORDER BY film.length desc
--- Ex 4
