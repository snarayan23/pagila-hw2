/*
 * Management wants to purchase new films that they don't already have.
 * Select a list of all films in the film table that are not in the inventory table.
 *
 * HINT:
 * This can be done by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 */

WITH i_title as (
    SELECT F.title
    FROM film as F
    JOIN inventory as I using(film_id)
    GROUP BY F.title)


SELECT F.title 
FROM film as F
WHERE F.title not in (SELECT * FROM i_title); 
