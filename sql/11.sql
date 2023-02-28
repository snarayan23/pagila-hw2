/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

WITH features as (
    SELECT title, unnest(special_features) as SF 
    from film), 

actor_names as (
    SELECT F.title, (A.first_name || ' ' || A.last_name) as "Actor Name" 
    from film as F
    JOIN film_actor using (film_id)
    JOIN actor as A using (actor_id))

SELECT "Actor Name"
FROM actor_names 
WHERE actor_names.title in (Select title from features WHERE SF = 'Behind the Scenes')
GROUP BY "Actor Name"
ORDER BY "Actor Name";
