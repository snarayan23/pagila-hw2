/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH features as (
    SELECT title, unnest(special_features) as SF
    FROM film)

SELECT features.SF as special_features, count(features.SF)
FROM features
Group By special_features
ORDER BY special_features;
