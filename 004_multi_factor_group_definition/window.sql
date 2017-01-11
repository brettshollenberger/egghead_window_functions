-- Percent rank ranks you relative to your group of peers (like all window functions)
--
-- Here we learn about using multiple factors to create a group, and see how that
-- affects weighted letter grades.
--
-- We learn as much about privilege as we do about window functions.
--
-- See the student at MS without internet who got a 76%, but was the absolute top performer
-- among students without internet access. She would receive a 100% if weighted in that group
-- instead.
-- 
SELECT 
school,
internet,
g3 AS final_grade,
MAX(g3) OVER (PARTITION BY school) AS max_final_grade_not_considering_internet,
ROUND(percent_rank() OVER (PARTITION BY school ORDER BY g3) * 100) AS weighted_final_grade_not_considering_internet,
MAX(g3) OVER (PARTITION BY school,internet) AS max_final_grade_considering_internet,
ROUND(percent_rank() OVER (PARTITION BY school,internet ORDER BY g3) * 100) AS weighted_final_grade_considering_internet
FROM students;
