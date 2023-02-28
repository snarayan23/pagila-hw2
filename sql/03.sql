/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

WITH most_profitable as (
    SELECT F.film_id
    FROM film as F
    JOIN inventory as I using(film_id)
    JOIN rental as R on I.inventory_id = R.inventory_id
    JOIN payment as P on R.rental_id = P.rental_id
    GROUP BY F.film_id
    ORDER BY sum(P.amount) desc
    LIMIT 5)


SELECT C.customer_id
FROM customer as C 
JOIN rental using(customer_id)
JOIN inventory using(inventory_id) 
JOIN film using(film_id)
WHERE film_id in (SELECT * from most_profitable)
GROUP BY C.customer_id
ORDER BY C.customer_id;



