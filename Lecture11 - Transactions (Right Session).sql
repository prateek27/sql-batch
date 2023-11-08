USE sakila;
SHOW variables LIKE "transaction_isolation";

-- Session 1 (Right Side)
-- Example 1 Read Uncommitted
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

begin;
SELECT * FROM film
WHERE film_id = 10;

SELECT * FROM film
WHERE film_id = 10;

commit;

--  Example 2 Read Committed (right side)
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SHOW variables LIKE "transaction_isolation";

begin;
SELECT * FROM film 
WHERE film_id = 11;

UPDATE film 
SET title = "RRR-3" 
WHERE film_id = 11;

commit;

--  Example 3 Demo (right side)
-- Non repeatable read problem
SHOW variables LIKE "transaction_isolation";
begin;
-- american circus
SELECT * FROM film 
WHERE film_id = 21;

-- problem: within the same transaction the value of 
-- film is changing everytime

-- indian circus 
SELECT * FROM film 
WHERE film_id = 21;

commit;


--  Example 4 Demo (right side)
-- Repeated read problem
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW variables LIKE "transaction_isolation";

begin;
-- midsummer 
SELECT * FROM film 
WHERE film_id = 22;
-- changed the movie name in T1 but 
-- that change wont be reflected here unless you commit T2
-- midsummer 
SELECT * FROM film 
WHERE film_id = 22;
commit;

SELECT * FROM film 
WHERE film_id = 22;

--  Example 5 Demo (right side)
-- Repeated read snapshot problem
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW variables LIKE "transaction_isolation";

begin;
SELECT * FROM film 
WHERE film_id = 22; -- midautum

SELECT * FROM film 
WHERE film_id = 180; -- part of the snapshot 

SELECT * FROM film 
WHERE film_id = 980; -- part of the snapshot 

commit;
--  Example 6 Demo (right side)
-- Phantom Reads is a problem in Repeatable Read  
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW variables LIKE "transaction_isolation";
begin;

SELECT * 
FROM language;

SELECT COUNT(*) 
FROM language;

-- update operation on all rows 
UPDATE language 
set name = CONCAT("X_",name);

commit;









