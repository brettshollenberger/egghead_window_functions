-- Get weighted student grades by ordering students by grade they received and using
-- (rank - 1) / (total_rows - 1)
--
SELECT 
school,
g3 AS final_grade,
MAX(g3) OVER (PARTITION BY school) AS max_final_grade,
ROUND(percent_rank() OVER (PARTITION BY school ORDER BY g3) * 100) AS weighted_final_grade
FROM students;
