USE sakila;
SHOW variables LIKE "transaction_isolation";

-- Session 1 (Left Side)
-- Example 1 Read Uncommitted
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

begin;
SELECT * FROM film
WHERE film_id = 10;

UPDATE film 
SET title = "Catman"
WHERE film_id = 10;

commit;


--  Example 2 Read Committed (left side)

begin;
SELECT * FROM film 
WHERE film_id = 11;

UPDATE film 
SET title = "RRR-2" 
WHERE film_id = 11;

SELECT * FROM film 
WHERE film_id = 11;
commit;

--  Example 3 Demo (left side)
-- Non repeatable read 
SHOW variables LIKE "transaction_isolation";

begin;
SELECT * FROM film 
WHERE film_id = 21;

UPDATE film 
SET title = "Indian Circus" 
WHERE film_id = 21;
commit;

--  Example 4 Demo (left side)
-- Repeated read problem
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SHOW variables LIKE "transaction_isolation";

begin;
-- midsummer 
SELECT * FROM film 
WHERE film_id = 22;

UPDATE film 
SET title = "Mid-autumn" 
WHERE film_id = 22;
commit;


--  Example 5 Demo (left side)
-- Repeated read snapshot problem
begin;
SELECT * FROM film 
WHERE film_id = 22; -- midautum

SELECT * FROM film 
WHERE film_id = 180; -- conspiracy spirit 

SELECT * FROM film 
WHERE film_id = 180;

UPDATE film 
SET title = "conspiracy theory " 
WHERE film_id = 180;

SELECT * FROM film 
WHERE film_id = 980;

UPDATE film 
SET title = "harry potter & wizards " 
WHERE film_id = 980;

commit;


--  Example 6 Phantom Read (left side)
-- Problem of Repeatable Read 

begin;
SELECT * 
FROM language;

INSERT INTO LANGUAGE VALUES(12,"Tamil",now());
commit;




