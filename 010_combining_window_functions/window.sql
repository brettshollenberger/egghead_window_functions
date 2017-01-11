-- For the year with the most 1 star movies, what were the names of the 1 star movies?
-- For the year with the most 2 star movies, what were the names of the 2 star movies?
-- Etc.
WITH rankings AS (
  SELECT title,
  year,
  ROUND(rating) AS rating,
  row_number() OVER (PARTITION BY ROUND(rating),year ORDER BY year DESC) AS ranking
  FROM movies
), counts AS (
  SELECT *,
  last_value(ranking) OVER (partition by rating,year ORDER BY year DESC) AS count
  FROM rankings
), rating_years AS (
  SELECT *,
  dense_rank() OVER (PARTITION BY rating ORDER BY count DESC) AS place
  FROM counts
)
SELECT rating,
title,
year,
count
FROM rating_years
WHERE place=1;
