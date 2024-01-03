CREATE DATABASE searchQuery;

CREATE TABLE company (employee_id int, employee_name varchar(20), research_area varchar(20), salary int);

INSERT INTO company VALUES 
(101, 'Sikder', 'Software Engineering', 1000000),
(102, 'Mujahid', 'Cyber Security', 100000),
(103, 'Mahmudul', 'Web Development', 80000),
(104, 'Akash', 'App Development', 35000),
(105, 'Salman', 'Blockchain', 3500000),
(106, 'Rakib', 'Front End Developer', 25000),
(107, 'Ryan', 'Software Engineering', 23000),
(108, 'Tajmirul', 'Web Development', 70000),
(109, 'Hasib', 'Cyber Security', 40000);


SELECT employee_id, employee_name, salary FROM company;

SELECT DISTINCT research_area FROM company;

SELECT salary, employee_name FROM company WHERE employee_id=101;

SELECT employee_id, employee_name FROM company WHERE salary>250000;
SELECT employee_id, employee_name FROM company WHERE salary>=100000;
SELECT employee_id, employee_name FROM company WHERE salary=100000;
SELECT employee_id, employee_name FROM company WHERE salary<>100000;
SELECT employee_id, employee_name FROM company WHERE employee_name LIKE 'S%' AND salary>100000;
SELECT employee_id, employee_name FROM company ORDER BY salary;
SELECT employee_id, employee_name FROM company ORDER BY salary DESC;
SELECT employee_id, employee_name FROM company LIMIT 3;
SELECT employee_id, employee_name FROM company LIMIT 6,8;
SELECT employee_id, employee_name FROM company WHERE salary IN (23000,35000);
SELECT employee_id, employee_name FROM company WHERE salary NOT IN (23000,35000);
SELECT employee_id, employee_name FROM company WHERE salary BETWEEN 23000 AND 35000;
SELECT employee_id, employee_name FROM company WHERE salary NOT BETWEEN 23000 AND 35000;
SELECT employee_id, employee_name FROM company WHERE employee_name LIKE '%k%';
SELECT employee_id, employee_name FROM company WHERE employee_name LIKE 'S____r';
SELECT * FROM company WHERE salary IS NOT NULL;
SELECT * FROM company WHERE salary IS NULL;