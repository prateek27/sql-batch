
-- Q2 Demo Example:
--  Find all students whose psp is greater than psp of student with id = 18
SELECT * 
FROM student 
WHERE psp > (SELECT psp 
			FROM student 	
			WHERE s_id = 18);
            
-- Q3 Find films where rental rate was more than average rental rate of film
SELECT film_id,title,rental_rate
FROM FILM 
WHERE rental_rate > (SELECT AVG(rental_rate)
					FROM FILM);
            
-- Q4 Sakila Example
-- Film Table, find out all the years where the average of the rental rate of films 
-- of that year was greater than global average of rental_rate (across all films)

-- 1. Find out the global average
-- 2. Year wise average rental rate.
-- 3. Filter out years from 2 using condition 1

SELECT release_year, AVG(rental_rate) as avg_rental
FROM film 
GROUP BY release_year
HAVING avg_rental > (SELECT AVG(rental_rate)
					FROM FILM);
                    
-- Find Names(unique) of students that also the names of TA
-- Two Persons to compare - Self Join?
-- Approach 1 
SELECT DISTINCT S.name 
FROM users S
JOIN users T 
ON S.is_student = true  AND T.is_TA = true AND T.name = S.name;

-- Approach 2 
-- List of TA Names
-- Filter out students who name matches with any name in TA list 
SELECT DISTINCT U.name 
FROM users U 
WHERE U.is_student = true 
		AND U.name IN (SELECT DISTINCT name 
					FROM users U 
					WHERE u.is_TA = true);
                    
-- Find all of the students whose psp is not less than the smallest psp of any batch.
-- Whenever you have a subquery in FROM clause, 
-- it is required to give it a name, hendce, minpsps.
SELECT * 
FROM student 
WHERE psp > (SELECT MAX(psp)
			FROM(
				SELECT MIN(psp)
				FROM student 
				GROUP BY batch_id
			) minPspTable
        );   

-- Find all students whose psp is greater than average psp of their batch.

SELECT * 
FROM student S  
WHERE psp > (
	SELECT avg(psp)
    FROM students 
    WHERE batch_id = S.batch_id
);

--  Let’s say we want to find all students who are also TA given the two tables
SELECT * 
FROM student 
WHERE id IN 
	(SELECT st_id 
	FROM TA 
    WHERE st_id IS NOT NULL);
    

-- Another way for same query
-- Better way of doing the above query 
-- some part of the table, EXISTS return true as soon as there is a match
SELECT * 
FROM student S
WHERE EXISTS
	(SELECT st_id 
	FROM TA 
    WHERE TA.st_id = S.id);
    
    
-- Subquery vs Join 
-- ClassicModels Database
-- query: customers who never placed an order (subqueries and joins)
-- readability, performance to decide whether subquery or a join
USE classicmodels;

-- In general, Subqueries are slower than joins
-- Subquery
SELECT customerNumber
FROM customers
WHERE customerNumber NOT IN(SELECT DISTINCT customerNumber FROM orders);

-- Join 
SELECT COUNT(DISTINCT customerNumber) AS "Customers Never Order"
FROM customers
LEFT JOIN orders using (customerNumber)
WHERE orderNumber is NULL;

-- Joins can exploit indexes,other internal optimisations  
-- type of query, query complexity (readable)
-- subquery returns a very large list /result it can become slower 
-- Factors: Database Engine, Data Size, Query Complexity, Indexes, Benchmarking 


			




                    
	

