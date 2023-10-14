USE sakila;


-- Insert into an existing table 

-- if you are giving values for all columns, then passing columns names is optional
INSERT INTO film(title,release_year,language_id,
original_language_id,rental_duration,rental_rate,length,
replacement_cost,rating,special_features,last_update)
VALUES
('ShaktimanNow',2023,1,NULL,3,'4.99',48,'12.99','G','Trailers,Deleted Scenes',default),
('Shaktiman1',2023,1,NULL,3,'4.99',48,'12.99','G','Trailers,Deleted Scenes',default),
('Shaktiman2',2023,1,NULL,3,'4.99',48,'12.99','G','Trailers,Deleted Scenes',default),
('Shaktiman3',2023,1,NULL,3,'4.99',48,'12.99','G','Trailers,Deleted Scenes',default);


-- you can skip columns names if you are giving all columns
INSERT INTO film
VALUES
(default,'Scaler CRUD-2','A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China',2006,1,NULL,3,'4.99',48,'12.99','G','Trailers,Deleted Scenes','2006-02-15 05:03:42');


-- Read some columns and rename them (while display)
SELECT title AS "Film Name",film_id
FROM film;

-- Select 
SELECT * 
FROM FILM;

-- Show me rating of the film
SELECT DISTINCT rating
FROM FILM;

-- Get pairs of year, rating 
SELECT DISTINCT rating,release_year
FROM FILM;

-- select statement can be used as print statement also
SELECT "Hello World" AS "Col1";
SELECT 56 AS Msg;

SELECT title AS MovieName,"Hello" AS Msg,Now() AS CurrentTime
FROM film;

-- Now() is inbuilt sqlfunction 
SELECT NOW();

-- Current Date
SELECT CURDATE() as "Today Date";

-- Expressions 
SELECT title, rental_duration, (rental_duration*60) 
AS "Duration in Minutes" FROM FILM;

-- CREATE Query 
-- Problem: Create a table called film copy (title,releaseYear) 
-- Copy all the data from film into film copy 
CREATE TABLE filmCopy(
	title varchar(255),
    releaseYear YEAR
);
INSERT INTO filmCopy(title,releaseYear) 
SELECT title,release_year FROM film;

SELECT * FROM filmCopy;

-- WHERE CLAUSE 
-- Problem: Select Films having rating of PG-13
SELECT title,release_year 
FROM film
WHERE rating='G';

-- AND, OR, NOT in conditions 
SELECT title,release_year,rating 
FROM film
WHERE NOT rating='G';

SELECT title,release_year,rating 
FROM film
WHERE rating='G' AND release_year=2023;

SELECT title,release_year,rating 
FROM film
WHERE rating='PG-13' OR NOT release_year=2023;

-- select movies G, PG-13 
SELECT title,release_year,rating 
FROM film
WHERE rating='PG-13' OR rating='G';

-- IN Operator
SELECT title,release_year,rating 
FROM film
WHERE rating NOT IN ('G','PG-13','A+');

-- IS NULL Operator
SELECT title,description,release_year,rating 
FROM film
WHERE description IS NULL;

