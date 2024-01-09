--- Ex1
SELECT NAME FROM CITY WHERE COUNTRYCODE ='USA' AND POPULATION > 120000
--- Ex2
select * from CITY where COUNTRYCODE = 'JPN';
--- Ex3
select CITY,STATE from STATION;
--- Ex4
SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';
--- Ex5
SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';
--- Ex6
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%';
--- Ex7
SELECT name FROM Employee ORDER BY NAME 
--- Ex8
SELECT name FROM Employee WHERE salary >2000 AND months <10 ORDER BY employee_id
--- Ex9
SELECT product_id FROM Products WHERE low_fats='Y' AND recyclable='Y'
--- Ex10
SELECT name FROM Customer WHERE referee_id <>2 OR referee_id is null
--- Ex11
SELECT name, population, area FROM World WHERE area >=3000000 OR population >=25000000
--- Ex12
SELECT DISTINCT author_id AS id FROM Views WHERE author_id=viewer_id ORDER BY author_id
--- Ex13
