/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */


SELECT F.title 
FROM film as F
JOIN inventory as I using(film_id)
JOIN rental as R using(inventory_id) 
JOIN customer as C using(customer_id)
WHERE C.customer_id = 1
GROUP BY F.title 
HAVING count(*) > 1
ORDER BY F.title;
