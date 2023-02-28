/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

WITH features as (
    SELECT title, unnest(special_features) as SF
    from film), 

bts as (
    SELECT title 
    from features 
    WHERE SF = 'Behind the Scenes'),

trailers as (
    SELECT title
    from features
    WHERE SF = 'Trailers')

SELECT * 
FROM bts 
JOIN trailers using (title) 
ORDER BY title; 
