USE sakila;

-- Commit and Rollback 

SET AUTOCOMMIT = 0;

SELECT *
FROM film
WHERE film_id = 5;

-- Update film 
UPDATE film
SET title = "American Burger 1"
WHERE film_id = 5;

commit;

-- Update film once again
UPDATE film
SET title = "Indian Burger 2"
WHERE film_id = 5;

-- Undo, undoing the changes since last commit 
rollback;
