/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/
SELECT 
    CASE
    WHEN A+B<=C OR A+C<=B OR B+C<=A THEN "Not A Triangle"
    WHEN A=B AND B=C THEN "Equilateral"
    WHEN A<>B AND B<>C AND C<>A THEN "Scalene"
    ELSE "Isosceles"
    END
FROM TRIANGLES

/*
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
*/
SELECT 
    CONCAT(NAME, "(", LEFT(OCCUPATION,1),")") 
FROM OCCUPATIONS
ORDER BY NAME;

SELECT 
    CONCAT("There are a total of ", Count(*), " ", LOWER(OCCUPATION), "s.")
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION) ASC, OCCUPATION ASC;

/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
*/
SELECT
    --MAX to pivot and consolidate into respective columns
    MAX(CASE WHEN OCCUPATION="Doctor" THEN NAME ELSE NULL END) AS doctor,
    MAX(CASE WHEN OCCUPATION="Professor" THEN NAME ELSE NULL END) AS professor,
    MAX(CASE WHEN OCCUPATION="Singer" THEN NAME ELSE NULL END) AS singer,
    MAX(CASE WHEN OCCUPATION="Actor" THEN NAME ELSE NULL END) AS actor
FROM (
    --subquery to assign row number
    Select name, occupation, ROW_NUMBER() OVER(PARTITION BY occupation ORDER by name) row_num
    from occupations
     ) numbered_table
    --print names corresponding to row_num assignment
GROUP BY row_num;