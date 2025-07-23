SELECT 
    c.entity,
    c.code,
    AVG(cs.cases) AS avg_rabies,
    MIN(cs.cases) AS min_rabies,
    MAX(cs.cases) AS max_rabies,
    SUM(cs.cases) AS sum_rabies
FROM cases cs
JOIN countries c ON cs.country_id = c.id
WHERE cs.disease = 'Number_rabies'
  AND cs.cases IS NOT NULL
GROUP BY c.id, c.entity, c.code
ORDER BY avg_rabies DESC
LIMIT 10;
