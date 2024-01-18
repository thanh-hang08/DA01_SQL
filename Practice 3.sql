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
SELECT manufacturer,
concat('$',round(sum(total_sales)/1000000,0),' million') AS sales
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sum(total_sales) DESC, manufacturer 
--- Ex 4
SELECT extract(month FROM submit_date) AS mth, product_id AS product, ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY extract(month FROM submit_date),product_id
ORDER BY extract(month FROM submit_date) ASC, product_id ASC
--- Ex 5
SELECT sender_id,
count(sender_id) AS message_count
FROM messages
WHERE sent_date BETWEEN '2022-08-01' and '2022-09-01'
GROUP BY sender_id, message_count
ORDER BY message_count DESC
Limit 2
--- Ex 6
SELECT tweet_id
FROM Tweets
WHERE length(content) > 15
--- Ex 7
SELECT activity_date AS day,
count(distinct user_id) AS active_users
FROM Activity
WHERE activity_date between '2019-06-27' and '2019-07-27'
group by activity_date
--- Ex 8
select 
count(id) AS number_employee
from employees
where extract(month FROM joining_date) between 1 and 7
and extract(year FROM joining_date)=2022
--- Ex 9
select position ('a' in first_name) as position
from worker
WHERE first_name=('Amitah')
--- Ex10
select 
substring (title,length(winery)+2,4)
from winemag_p2
WHERE country='Macedonia'
