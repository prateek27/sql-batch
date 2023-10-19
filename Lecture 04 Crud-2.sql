SELECT * FROM film 
WHERE title LIKE "%man";

SELECT * FROM film 
WHERE description LIKE "%" OR description IS NULL;

SELECT * FROM film 
ORDER BY title 
LIMIT 10 offset 20;
-- offset here means start after first 20 movies
-- limit select these many movies 

-- select movie no from 51 to 70
SELECT * FROM film 
ORDER BY title 
LIMIT 10 offset 20;

-- Update Query 
-- UPDATE table_name SET column_name = value WHERE conditions;

UPDATE film SET release_year = 2023 WHERE film_id = 1;
UPDATE film SET release_year = 2006, rating = 'G' WHERE film_id = 1;
SELECT * FROM film;

-- Delete a particular row
-- DELETE FROM table_name WHERE conditions;

DELETE FROM film WHERE film_id = 1004;

-- Similar to Delete, Truncate 
-- Delete all the rows and recreate the table structure 
-- Truncate can't be rolled back
TRUNCATE film;

-- Drop completely destroy the table including the structure
-- it can't be rolled back 
DROP TABLE film;



