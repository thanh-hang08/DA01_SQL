--- Question 1:
SELECT DISTINCT replacement_cost FROM film 
ORDER BY replacement_cost
---> Ans 1: Chi phi thay the thap nhat: 9.99

--- Question 2
SELECT
COUNT(CASE WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low' END) AS low,
COUNT(CASE WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium' END) AS medium,
COUNT(CASE WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high' END) AS high
FROM film
---> Ans 2: 514 phim thuoc chi phi 'low'
  
--- Question 3
SELECT film.title, film.length, category.name
FROM film
INNER JOIN film_category ON film.film_id=film_category.film_id
INNER JOIN category ON film_category.category_id=category.category_id
WHERE category.name ='Drama' or category.name ='Sports'
ORDER BY film.length desc
---> Ans 3: Phim dai nhat thuoc the loai Sports : Dai 184
  
--- Question 4
SELECT category.name,
count(category.name) AS total_count
FROM film
INNER JOIN film_category ON film.film_id=film_category.film_id
INNER JOIN category ON film_category.category_id=category.category_id
GROUP BY category.name 
ORDER BY total_count DESC
---> Ans 4: Sports: 74 titles
  
--- Question 5
SELECT first_name ||' '|| last_name AS Name,
COUNT(film_actor.actor_id) AS total_film
FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
JOIN film ON film.film_id=film_actor.film_id
GROUP BY name
ORDER BY total_film DESC
---> Ans 5: Dien vien dong nhieu phim nhat: Susan Davis: 54 movies
  
--- Question 6
SELECT 
FIRST_NAME || ' '|| last_name AS full_name, a.address
FROM address AS a
LEFT JOIN customer AS c
ON a.address_id=c.address_id
WHERE c.first_name IS NULL
---> Ans 6: 4 dia chi ko co KH
  
--- Question 7
SELECT 
city.city AS name_city, 
sum(payment.amount) AS total_amount
FROM city
JOIN address ON city.city_id=address.city_id
JOIN customer ON address.address_id=customer.address_id
JOIN payment ON customer.customer_id=payment.customer_id
GROUP BY name_city 
ORDER BY total DESC
---> Ans 7: Doanh thu TP cao nhat: Cape Coral: 221.55

--- Question 8: 
SELECT 
country.country, city.city, 
sum(payment.amount) AS total
FROM country
JOIN city ON country.country_id=city.country_id
JOIN address ON city.city_id=address.city_id
JOIN customer ON address.address_id=customer.address_id
JOIN payment ON customer.customer_id=payment.customer_id
GROUP BY country.country, City.city  
ORDER BY total
---> Ans 8: Doanh thu của thành phố thấp nhất: United States, Tallahassee : 50.85
