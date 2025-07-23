SELECT 
    year,
    DATE(CONCAT(year, '-01-01')) AS year_start
FROM cases
LIMIT 10;
