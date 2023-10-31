SELECT * FROM sakila.film;

-- Create Index
CREATE INDEX idx_release_year 
ON film(release_year);

-- Create Index on multiple columns
CREATE INDEX idx_release_year_title 
ON film(release_year,title);


-- Search movies released in 2023
EXPLAIN ANALYZE SELECT * FROM film
WHERE release_year=2023;
-- Before Index: '-> Filter: (film.release_year = 2023)  (cost=103.00 rows=100) (actual time=2.183..2.199 rows=5 loops=1)\n    -> Table scan on film  (cost=103.00 rows=1000) (actual time=0.160..1.939 rows=1011 loops=1)\n'
-- After Index: '-> Index lookup on film using idx_release_year (release_year=2023)  (cost=1.75 rows=5) (actual time=0.046..0.069 rows=5 loops=1)\n'


-- Delete Index
DROP INDEX idx_release_year ON film;
