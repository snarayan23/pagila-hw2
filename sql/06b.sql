/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */


SELECT F.title 
FROM film as F
LEFT JOIN inventory as I using (film_id)
WHERE I.inventory_id is null
ORDER BY F.title;

