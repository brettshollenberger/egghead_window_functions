WITH division_places AS (
   SELECT 
   division,
   row_number() OVER (PARTITION BY division ORDER BY pace ASC) AS place,
   pace,
   first_value(pace) OVER (PARTITION BY division ORDER BY pace ASC) AS first_place_pace,
   last_value(pace) OVER (PARTITION BY division) AS last_place_pace
   FROM runners
   LIMIT 100
)
SELECT *,
(pace - first_place_pace) AS lost_to_first_by,
(pace - last_place_pace) AS beat_last_by
FROM division_places;
