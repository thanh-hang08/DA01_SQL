--- Ex1
SELECT 
SUM(CASE
  WHEN device_type ='laptop' THEN 1 ELSE 0
  END) AS laptop_views,
SUM(CASE
  WHEN device_type IN ('tablet','phone') THEN 1 ELSE 0
  END) AS mobile_views
 FROM viewership;
--- Ex2
SELECT x,y,z,
CASE
    WHEN x+y>z and x+z>y and y+z>x THEN 'Yes' 
    ELSE 'No' 
    END AS triangle
FROM Triangle
--- Ex 3
SELECT 
ROUND(100*sum(CASE
  WHEN call_category ='n/a' THEN 1
  WHEN call_category IS null THEN 1 
  ELSE 0
  END)/count(*),1) AS call_percentage
FROM callers;
--- Ex 4
SELECT name
FROM Customer 
WHERE(COALESCE (referee_id ," ")<>2)
--- Ex 5
SELECT   
    survived,      
    COUNT(CASE WHEN pclass = 1 THEN survived = 1  END) AS first_class,   
    COUNT(CASE WHEN pclass = 2 THEN survived = 1  END) AS second_class,   
    COUNT(CASE WHEN pclass = 3 THEN survived = 1  END) AS third_class  
FROM titanic  
GROUP BY survived 
