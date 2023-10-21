

-- JOIN, select every film and its language
SELECT title,name
FROM film
JOIN language
ON film.language_id = language.language_id;

-- Rewrite
-- JOIN, select every film and its language
SELECT film.title,language.name
FROM film
JOIN language
ON film.language_id = language.language_id;

-- update language id of film_id with id 1
UPDATE film 
SET language_id = 4 
WHERE film_id = 1;


-- select language id 
SELECT film.title,film.release_year,language.name, film.language_id
FROM film
JOIN language
ON film.language_id = language.language_id;

-- same query with a shorter syntax
-- alias for every table 
SELECT f.title AS movieName,
f.release_year,
l.name AS language, 
f.language_id
FROM film f
JOIN language l
ON f.language_id = l.language_id;



-- Show each actor name with film he has done
select f.title as "Movie Name", a.first_name as FirstName, a.last_name As LastName
from film_actor fa 
join actor a 
join film f
on fa.film_id = f.film_id
and a.actor_id = fa.actor_id;
-- order by f.title DESC;


-- Change of Database (Self Join Example)
USE classicmodels;

-- Self-Join
SELECT e.firstName,e.jobTitle,m.firstName AS manager,m.jobTitle AS ManagerJob
FROM employees e
JOIN employees m
ON e.reportsTo=m.employeeNumber;

-- Lecture  06: Joins-II Contd...
-- Join 2 Tables, Join more than 2 tables?
USE sakila;

SELECT f1.title,f2.title, f1.rental_rate, f2.rental_rate
FROM film f1
JOIN film f2 
ON f2.release_year BETWEEN f1.release_year - 2 AND f1.release_year + 2 
AND f1.rental_rate < f2.rental_rate;

-- Classic Models (Cars, customers, payments, order ...)
-- Query: Show all orders by each customer (customerNo, Name,orderNo)
USE classicmodels;

-- Inner Join 
SELECT c.customerName, c.customerNumber,o.orderNumber
FROM orders o
JOIN customers c
ON o.customerNumber = c.customerNumber;


-- Right Outer Join
SELECT c.customerName, c.customerNumber,o.orderNumber
FROM orders o
RIGHT JOIN customers c
ON o.customerNumber = c.customerNumber;

-- Right Outer Join
SELECT c.customerName, c.customerNumber,o.orderNumber
FROM customers c
LEFT JOIN orders o
ON o.customerNumber = c.customerNumber;

-- Full Outer Join 
SELECT c.customerName, c.customerNumber,o.orderNumber
FROM customers c
JOIN orders o
ON o.customerNumber = c.customerNumber;

-- Cross Join
SELECT c.customerName, c.customerNumber,o.orderNumber
FROM customers c
CROSS JOIN orders o;

-- Implicit Join (Cross Join)
SELECT c.customerName, c.customerNumber,o.orderNumber
FROM customers c,orders o;

-- Example of Union 
-- number of columns should be same
SELECT customerName AS "Name",phone AS "Number"
FROM customers
UNION
SELECT firstName,extension
FROM employees;

-- Calculated
SELECT *, CONCAT(contactFirstName,contactLastName) AS "Full Name" 
FROM customers;





