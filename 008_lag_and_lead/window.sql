WITH division_places AS (
   SELECT 
   division,
   row_number() OVER (PARTITION BY division ORDER BY pace ASC) AS place,
   pace,
   COALESCE(lag(pace) OVER (PARTITION BY division ORDER BY pace ASC), 'Infinity'::FLOAT) AS leaders_pace,
   COALESCE(lead(pace) OVER (PARTITION BY division ORDER BY pace ASC), 'Infinity'::FLOAT) AS laggers_pace,
   first_value(pace) OVER (PARTITION BY division ORDER BY pace ASC) AS first_place_pace
   FROM runners
   LIMIT 100
)
SELECT *,
(laggers_pace - pace) AS won_by,
(pace - leaders_pace) AS lost_by,
(pace - first_place_pace) AS lost_to_first_by
FROM division_places;
