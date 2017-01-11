-- ntiles defined by number of buckets
-- 
SELECT 
school,
internet,
g3 AS final_grade,
MAX(g3) OVER (PARTITION BY school) AS max_final_grade,
ntile(100) OVER (PARTITION BY school ORDER BY g3) AS percentile
FROM students;

SELECT 
school,
internet,
g3 AS final_grade,
MAX(g3) OVER (PARTITION BY school) AS max_final_grade,
ntile(10) OVER (PARTITION BY school ORDER BY g3) AS decatile
FROM students;
