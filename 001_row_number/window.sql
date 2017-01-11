-- For each year, what were the best rated movies?

WITH rankings AS (
 SELECT title,
 year,
 rating,
 row_number() OVER (PARTITION BY year ORDER BY rating DESC) AS ranking
 FROM movies
)
SELECT *
FROM rankings
WHERE ranking <= 5
ORDER BY year, ranking ASC;
