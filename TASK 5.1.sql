DELIMITER $$

CREATE FUNCTION year_difference(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE base_date DATE;
    SET base_date = DATE(CONCAT(input_year, '-01-01'));
    RETURN TIMESTAMPDIFF(YEAR, base_date, CURDATE());
END$$

DELIMITER ;
