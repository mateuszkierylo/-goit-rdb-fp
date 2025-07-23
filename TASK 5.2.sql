SELECT 
    year,
    year_difference(year) AS year_diff
FROM cases
LIMIT 10;
