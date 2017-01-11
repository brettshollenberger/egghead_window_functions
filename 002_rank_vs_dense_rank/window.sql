-- Like row_number, but ties have the value of the first row in the group
-- Wit rank, after a tie, row numbers begin counting at the row number again (1, 2, 2, 4)
-- With dense_rank, row numbers begin counting at the next number (1, 2, 2, 3)
-- See division 1, rank 20

SELECT
division,
rank() OVER (PARTITION BY division ORDER BY pace ASC),
pace,
name
FROM runners;

SELECT
division,
dense_rank() OVER (PARTITION BY division ORDER BY pace ASC),
pace,
name
FROM runners;
