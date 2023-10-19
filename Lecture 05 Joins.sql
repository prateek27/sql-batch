

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
from film_actor fa join actor a join film f
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




















