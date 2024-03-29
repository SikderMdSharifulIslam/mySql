SELECT AVG(salary) FROM company;
SELECT MAX(salary) FROM company;
SELECT MIN(salary) FROM company;
SELECT SUM(salary) FROM company;
SELECT COUNT(research_area) FROM company;
SELECT COUNT(DISTINCT research_area) FROM company;
SELECT COUNT(*) FROM company;
SELECT COUNT(*) FROM company WHERE salary>=35000;
SELECT CONCAT(employee_name,', ',research_area) FROM company;
SELECT LCASE(employee_name) FROM company;
SELECT UCASE(employee_name) FROM company;
SELECT LENGTH(employee_name) FROM company;