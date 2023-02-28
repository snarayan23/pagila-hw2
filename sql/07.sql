/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

WITH us_customer as 
    (SELECT C.customer_id
    FROM customer as C
    JOIN address as A using (address_id)
    JOIN city as CI using (city_id)
    JOIN country as CO using (country_id)
    WHERE CO.country_id = 103),

rentals as 
    (SELECT DISTINCT F.title, R.customer_id
    FROM film as F 
    JOIN inventory as I using (film_id)
    JOIN rental as R using (inventory_id)),

us_rents as (
    SELECT * from rentals
    WHERE rentals.customer_id in (SELECT * from us_customer))

SELECT DISTINCT rentals.title from rentals
LEFT JOIN us_rents using(customer_id)
WHERE rentals.title not in (SELECT title from us_rents)
ORDER BY rentals.title;

