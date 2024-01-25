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
