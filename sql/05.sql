/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * HINT:
 * This can be solved using either a LEFT JOIN or the NOT IN operator.
 */



SELECT A.last_name, A.first_name 
FROM actor as A 
LEFT JOIN customer as C using(last_name, first_name)
WHERE (C.last_name, C.first_name) IS NULL
ORDER BY A.last_name, A.first_name; 













