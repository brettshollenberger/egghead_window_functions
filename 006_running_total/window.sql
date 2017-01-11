-- Aggregate functions create a running total when used
-- with window functions + the ORDER BY clause.
--
-- Remove ORDER BY to remove the running total behavior
--
SELECT
projects.name,
backers.name,
backers.contribution,
SUM(contribution) OVER (PARTITION BY project_id ORDER BY contribution DESC) AS running_total
FROM backers
INNER JOIN projects
ON projects.id=backers.project_id;
