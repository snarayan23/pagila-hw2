/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH features as (
    SELECT title, unnest(special_features) as SF
    from film),

rates as (
    SELECT title 
    FROM film 
    WHERE rating = 'G')

SELECT title from rates
JOIN features using (title)
WHERE features.SF = 'Trailers'
ORDER BY title;



