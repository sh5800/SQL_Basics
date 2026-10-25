CREATE DATABASE bank_db;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    desig VARCHAR(50) NOT NULL DEFAULT "Probation"
);

ALTER TABLE employees ADD COLUMN dept VARCHAR(30);

DESC employees;

INSERT INTO employees (emp_id,name,desig,dept) VALUES 
(101,"Raju","Manager","Loan"),
(102,"Sham","Cashier","Cash"),
(103,"Paul","Associate","Loan"),
(104,"Alex","Accountant","Account"),
(105,"Victor","Associate","Deposit");

SELECT *FROM employees;

SELECT emp_id,name FROM employees;

SELECT *FROM employees WHERE dept = "Loan";

SELECT *FROM employees WHERE emp_id = 101;

SELECT emp_id,name FROM employees WHERE emp_id = 101;

UPDATE employees SET dept = "IT" WHERE emp_id = 103;

SELECT *FROM employees;

DELETE FROM employees WHERE emp_id = 102;

SELECT *FROM employees;

ALTER TABLE employees ADD COLUMN lname VARCHAR(50);

SELECT *FROM employees;

ALTER TABLE employees RENAME COLUMN name TO fname;


UPDATE employees SET lname = "Rastogi" WHERE emp_id = 101;
UPDATE employees SET lname = "Philip" WHERE emp_id = 103;
UPDATE employees SET lname = "Watt" WHERE emp_id = 104;
UPDATE employees SET lname = "Ferns" WHERE emp_id = 105;

SELECT *FROM employees;


SELECT CONCAT_WS(":",emp_id,fname,desig,dept) FROM employees WHERE emp_id = 101;

SELECT CONCAT_WS(":",emp_id,CONCAT(fname," ",lname),desig,dept) FROM employees WHERE emp_id = 101;

SELECT CONCAT_WS(":",emp_id,fname,UPPER(desig),dept) FROM employees WHERE emp_id = 101;

SELECT CONCAT(SUBSTR(dept,1,1),emp_id),fname FROM employees;

SELECT DISTINCT dept from employees;

SELECT DISTINCT fname,lname from employees;

CREATE TABLE employee2 (
    emp_id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    desig VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employee2 (emp_id, fname, lname, desig, dept, salary)
VALUES
(101, 'Raju',    'Rastogi', 'Manager',    'Loan',    37000),
(102, 'Sham',    'Mohan',   'Cashier',    'Cash',    32000),
(103, 'Baburao', 'Apte',    'Associate',  'Loan',    25000),
(104, 'Paul',    'Philip',  'Accountant', 'Account', 45000),
(105, 'Alex',    'Watt',    'Associate',  'Deposit', 35000),
(106, 'Rick',    'Watt',    'Manager',    'Account', 65000),
(107, 'Leena',   'Jhonson', 'Lead',       'Cash',    25000),
(108, 'John',    'Paul',    'Manager',    'IT',      75000),
(109, 'Alex',    'Watt',    'Probation',  'Loan',    40000);

SELECT DISTINCT dept FROM employee2;

SELECT *FROM employee2 ORDER BY salary DESC;

SELECT *FROM employee2 LIMIT 0,3;

SELECT *FROM employee2 WHERE fname LIKE "A%";

SELECT *FROM employee2 WHERE lname LIKE "____";


SELECT *FROM employee2 WHERE salary <> (SELECT MAX(salary) FROM employee2) ORDER BY salary DESC LIMIT 1;

SELECT COUNT(*) FROM employee2;

SELECT COUNT(*) FROM employee2 GROUP BY dept;

SELECT MAX(salary) FROM employee2;
SELECT *FROM employee2 ORDER BY salary LIMIT 0,1;

SELECT MIN(salary) FROM employee2;
SELECT *FROM employee2 ORDER BY salary DESC LIMIT 0,1;

SELECT SUM(salary) FROM employee2 WHERE dept = "Loan";

SELECT AVG(salary) FROM employee2 GROUP BY dept;