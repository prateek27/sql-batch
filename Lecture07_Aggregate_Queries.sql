
USE sakila;

SELECT MAX(amount) AS "highest Payment"
FROM payment;

-- highest, lowest, average 
SELECT 
MAX(amount) AS "Highest Payment",
MIN(amount) AS "Lowest Payment",
ROUND(AVG(amount),2) AS "Average Payment",
SUM(amount) AS "total"
FROM payment;

-- mathematical fn in mySQL
SELECT ROUND(10.34343,2);

-- COUNT * all rows 
SELECT COUNT(*) 
FROM film;

-- Count films which have a description
SELECT COUNT(description) 
FROM film;

SELECT *
FROM film;

-- COUNT(1,1,1,null,null,5) 
SELECT COUNT(description),description 
FROM film;


-- GROUP BY 
-- Show no of films for every type of rating
SELECT rating,COUNT(*) AS movieCount
FROM film
GROUP BY rating;

-- Show ratings which have atleast 200 movies 
SELECT rating,COUNT(*) 
FROM film
GROUP BY rating
HAVING COUNT(*) > 200;

-- Show ratings which have atleast 200 movies 
SELECT rating,COUNT(*) AS movieCount
FROM film
GROUP BY rating
HAVING movieCount > 200;

-- Query 1
-- list the customers who have made at least 30 rentals, 
-- for each customers, display their name and count of rentals
SELECT c.customer_id,
CONCAT(c.first_name," ",c.last_name) AS CustomerName,
COUNT(*) AS NoOfRentals 
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id 
HAVING NoOfRentals>=30;

-- Query 2
-- retrieve the total revenue by each film category,
-- but only include categories where the total revenue 
-- is greater than 1000 usd. Order the results by revenue in desc order.
USE sakila;
SELECT c.name,SUM(amount) as Revenue
FROM category c
JOIN film_category 
USING (category_id)
JOIN inventory 
USING (film_id)
JOIN rental
USING (inventory_id)
JOIN payment 
USING (rental_id)
GROUP BY category_id
HAVING Revenue>1000
ORDER BY Revenue DESC
LIMIT 3;

-- Query 3
-- find the actors who have appeared in atleast two films together 
-- (they share at least one film id)
-- display the actor IDs and no of films they done together.
SELECT * 
FROM actor;

SELECT a1.actor_id,a2.actor_id, COUNT(*) AS MoviesTogether
FROM film_actor a1
JOIN film_actor a2
ON a1.film_id = a2.film_id AND a1.actor_id < a2.actor_id
GROUP BY
		a1.actor_id,a2.actor_id
HAVING MoviesTogether >=2;



-- Query 4
-- count of orders from from "USA","Japan","Spain"
-- and orders must >=20
SELECT country,COUNT(*) AS orderCount
FROM orders
JOIN customers USING (customerNumber)
where COUNTRY IN ("USA","Japan","Spain")
GROUP BY country
HAVING orderCount >=20;

-- Query 5
-- Count of orders from each Country, on each date
SELECT country,COUNT(*) AS orderCount,orderDate
FROM orders
JOIN customers USING (customerNumber)
GROUP BY orderDate,country;
