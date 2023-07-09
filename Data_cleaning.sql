select * from nhr;

ALTER TABLE nhr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE nhr;

SET sql_safe_updates = 0;


UPDATE nhr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

select birthdate from nhr;

ALTER TABLE nhr
MODIFY COLUMN birthdate DATE;

UPDATE nhr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE nhr
MODIFY COLUMN hire_date DATE;

UPDATE nhr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

ALTER TABLE nhr
MODIFY COLUMN termdate DATE;

ALTER TABLE nhr ADD COLUMN age INT;

UPDATE nhr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM nhr;


select birthdate, age from nhr;

SELECT count(*) FROM nhr WHERE age < 18;


SELECT COUNT(*) FROM nhr WHERE termdate > CURDATE();



select * from nhr;

