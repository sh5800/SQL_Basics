USE bank_db;


CREATE TABLE num1(
    price DECIMAL(5,2)
);

DESC num1;

INSERT INTO num1 VALUES(155.65);
INSERT INTO num1 VALUES(155.679);

SELECT *FROM num1;

CREATE TABLE num2(
    f FLOAT,
    d DOUBLE
);


INSERT INTO num2 VALUES(123.456,123.456);


SELECT *FROM num2;

INSERT INTO num2 VALUES(123.123456789,123.123456789);

SELECT *FROM num2;

INSERT INTO num2 VALUES(123.123456789,123.12345678900987654321);

SELECT *FROM num2;


CREATE TABLE person(
    jd DATE,
    jt TIME,
    jdt DATETIME
);

INSERT INTO person VALUES('2026-10-24','23:00:00','2026-10-24 23:00:00');

SELECT *FROM person;

INSERT INTO person VALUES('2026:10:24','23:00:00','2026-10-24 23:00:00');


SELECT *FROM person;

SELECT CURDATE();

SELECT CURTIME();

SELECT NOW();

INSERT INTO person VALUES(CURDATE(),CURTIME(),NOW());

SELECT *FROM person;

SELECT DAYNAME('2026-10-24');

SELECT DAYOFMONTH(CURDATE());

SELECT DAYOFWEEK(CURDATE());

SELECT MONTHNAME(CURDATE());

SELECT jt, HOUR(jt) FROM person;

SELECT jt, MINUTE(jt) FROM person;

SELECT DATE_FORMAT(NOW(),'%d/%m/%y');

SELECT DATE_FORMAT(NOW(),'%D %a at %T');

SELECT jdt, DATE_FORMAT(jdt,'%D %a at %T') FROM person;

SELECT DATEDIFF('2026-10-24','2026-10-19');

SELECT DATEDIFF('2026-10-24','2026-09-19');

SELECT DATE_ADD(NOW(),INTERVAL 1 DAY);

SELECT DATE_ADD(NOW(),INTERVAL 1 MONTH);

SELECT DATE_SUB(NOW(),INTERVAL 2 MONTH);

SELECT TIMEDIFF(CURTIME(),'10:00:00');

CREATE TABLE blogs(
    blog VARCHAR(150),
    ct DATETIME DEFAULT CURRENT_TIMESTAMP,
    ut DATETIME ON UPDATE CURRENT_TIMESTAMP
);


DESC blogs;


INSERT INTO blogs(blog) VALUES("This is my first blog");

SELECT *FROM blogs;

UPDATE blogs SET blog = "This is my Updated Blog";

SELECT *FROM blogs;


SELECT CURTIME();

SELECT CURDATE();

SELECT DAYNAME(CURDATE());

SELECT DATE_FORMAT(CURDATE(),'%d:%m:%Y');

SELECT DATE_FORMAT('2026-10-24 11:32:00','%M %D at %T');

USE store_db;

SELECT *FROM employee2 WHERE salary > 65000;

SELECT *FROM employee2 WHERE salary < 65000;

SELECT *FROM employee2 WHERE salary <= 65000;

SELECT *FROM employee2 WHERE salary >= 65000;

SELECT *FROM employee2 WHERE salary != 25000;

SELECT *FROM employee2 WHERE salary = 25000 and dept = 'Loan';

SELECT *FROM employee2 WHERE salary = 25000 or dept = 'Loan';
SELECT *FROM employee2 WHERE salary BETWEEN 25000 and 35000;

SELECT *FROM employee2 WHERE dept IN('Account','Cash','Loan');

SELECT *FROM employee2 WHERE dept NOT IN('Account','Cash','Loan');


SELECT fname,salary, CASE WHEN salary > 50000 THEN 'Higher Salary' ELSE 'Lower Salary' END AS 'Salary Category' FROM employee2;

SELECT 
fname,
salary, 
CASE WHEN salary > 50000 THEN 'Higher Salary' 
WHEN salary > 40000 AND salary < 50000 THEN "Mid Range Salary"
 ELSE 'Lower Salary' 
 END AS 'Salary Category' 
 FROM employee2;


SELECT *FROM employee2 WHERE salary BETWEEN 30000 AND 40000; 


SELECT *FROM employee2 WHERE fname LIKE 'R%' OR fname LIKE 'S%';

SELECT *FROM employee2 WHERE salary = 25000 AND dept = 'Cash';

SELECT *FROM employee2 WHERE desig IN ('Manager','Lead','Associate');

SELECT fname, salary, salary/98 as sal_in_dollars from employee2;


CREATE table customersNew(
    cust_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE table orders(
    ord_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    amount DECIMAL(10,2),
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customersNew(cust_id)
);


INSERT INTO customersNew(cust_id,name,email) VALUES(1,"Sham","Sham@email.com");

INSERT INTO orders(date,amount,cust_id) VALUES(NOW(),100,1);


SELECT *FROM orders;


INSERT INTO customersNew (cust_id, name, email)
VALUES
(2, 'Sham',    'sham@email.com'),
(3, 'Baburao', 'babu@email.com'),
(4, 'Paul',    'paul@email.com'),
(5, 'Alex',    'alex@email.com');

SELECT *FROM customersNew;


INSERT INTO orders (ord_id, date, amount, cust_id)
VALUES
(3,  '2023-08-20',  503.38, 1),
(6,  '2023-08-21',  400.00, 5),
(7,  '2023-08-21',  700.00, 4),
(8,  '2023-08-21',  400.00, 5),
(9,  '2023-08-21', 1000.00, 3),
(10, '2023-08-21', 1100.00, 1),
(11, '2023-08-21',  900.00, 4);


SELECT *FROM customersNew INNER JOIN orders ON orders.cust_id = customersNew.cust_id;

SELECT name,SUM(amount) FROM customersNew INNER JOIN orders WHERE orders.cust_id = customersNew.cust_id GROUP BY name;

SELECT *FROM customersNew LEFT JOIN orders ON orders.cust_id = customersNew.cust_id;

SELECT name,IFNULL(SUM(amount),0) FROM customersNew LEFT JOIN orders ON orders.cust_id = customersNew.cust_id GROUP BY name;

SELECT *FROM customersNew RIGHT JOIN orders ON orders.cust_id = customersNew.cust_id;

SELECT name,IFNULL(SUM(amount),0) FROM customersNew RIGHT JOIN orders ON orders.cust_id = customersNew.cust_id GROUP BY name;