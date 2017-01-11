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

-- This is the same as saying the default
SELECT
projects.name,
backers.name,
backers.contribution,
SUM(contribution) OVER (PARTITION BY project_id ORDER BY contribution DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM backers
INNER JOIN projects
ON projects.id=backers.project_id;

-- This is the same as saying "the whole window"
-- If you want to keep an order but want to specify behavior different from a running total for aggregations
SELECT
projects.name,
backers.name,
backers.contribution,
SUM(contribution) OVER (PARTITION BY project_id ORDER BY contribution DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS running_total
FROM backers
INNER JOIN projects
ON projects.id=backers.project_id;

-- This is between the current row and all following rows
SELECT
projects.name,
backers.name,
backers.contribution,
SUM(contribution) OVER (PARTITION BY project_id ORDER BY contribution DESC ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_total
FROM backers
INNER JOIN projects
ON projects.id=backers.project_id;
