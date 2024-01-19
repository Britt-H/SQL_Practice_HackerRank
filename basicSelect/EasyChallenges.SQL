--Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
select Name from City
where POPULATION > 120000 and CountryCode = 'USA'

--Query all columns (attributes) for every row in the CITY table.
select * from City

--Query all columns for a city in CITY with the ID 1661.
select * from city
where ID = 1661

--Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
select * from City
where CountryCode = 'Jpn'

--Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
select name from city
where CountryCode = 'JPN'

--Query a list of CITY and STATE from the STATION table.
select City, State from station

--Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
select DISTINCT city from station
where mod(ID, 2)=0

--Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
select Count(City) - Count(Distinct City) as UniqueCity from Station

--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SELECT CITY, LENGTH(CITY) AS MINS 
FROM STATION 
ORDER BY MINS,CITY asc 
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS MAXCITY 
FROM STATION 
ORDER BY MAXCITY DESC 
LIMIT 1;

--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
select distinct City
from Station
Where left(City, 1) In ('A', 'E', 'I', 'O', 'U')

--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select DISTINCT City from Station
where Right(City, 1) in ('a', 'e', 'i', 'o','u')

--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
select DISTINCT CITY from STATION
where Left(city, 1) in ('a', 'e', 'i','o','u') AND
    right(city, 1) in ('a', 'e', 'i','o','u')

--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('A','E','I','O','U')

--Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE RIGHT(CITY, 1) NOT IN ('A','E','I','O','U')

--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
select DISTINCT CITY from STATION
where LEFT(city, 1) NOT IN ('a', 'e', 'i','o', 'u') OR
    RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
ORDER BY CITY

--Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
select DISTINCT CITY from STATION
where LEFT(city, 1) NOT IN ('a', 'e', 'i','o', 'u') AND
    RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
ORDER BY CITY

--Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT NAME FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3) ASC, ID ASC

--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT NAME FROM EMPLOYEE
ORDER BY NAME ASC

--Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
SELECT NAME FROM EMPLOYEE
WHERE SALARY > 2000 AND
    MONTHS < 10
ORDER BY EMPLOYEE_ID ASC