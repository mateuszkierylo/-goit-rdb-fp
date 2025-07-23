CREATE TABLE countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(100) NOT NULL,
    code VARCHAR(10) NOT NULL
);

INSERT INTO countries (entity, code)
SELECT DISTINCT Entity, Code FROM infectious_cases;

CREATE TABLE cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT,
    year INT,
    disease VARCHAR(100),
    cases INT,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

INSERT INTO cases (country_id, year, disease, cases)
SELECT 
    c.id,
    i.Year,
    'polio_cases' AS disease,
    i.polio_cases
FROM infectious_cases i
JOIN countries c ON i.Entity = c.entity AND i.Code = c.code
WHERE i.polio_cases IS NOT NULL;
