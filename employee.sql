CREATE DATABASE skypro;
    \c skypro;
        CREATE TABLE employee (
            id BIGSERIAL NOT NULL PRIMARY KEY,
            first_name VARCHAR(50) NOT NULL,
            last_name VARCHAR(50) NOT NULL,
            gender VARCHAR(6) NOT NULL,
            age INT NOT NULL
        );
INSERT INTO employee (
    first_name, last_name, gender, age)
        VALUES ('Julia', 'Petrova', 'W', 19);
INSERT INTO employee (
    first_name, last_name, gender, age)
        VALUES ('Semen', 'Ivanov', 'M', 30);
INSERT INTO employee (
    first_name, last_name, gender, age)
        VALUES ('Pavel', 'Sidorov', 'M', 20);
SELECT*FROM employee;
UPDATE employee SET first_name = 'Evgeniy' WHERE id = 1;
UPDATE employee SET last_name = 'Kharitonov' WHERE id = 1;
UPDATE employee SET gender = 'M' WHERE id = 1;
UPDATE employee SET age = 18 WHERE id = 1;
SELECT*FROM employee;
DELETE FROM employee WHERE id = 1;
SELECT*FROM employee;
INSERT INTO employee (
    first_name, last_name, gender, age)
        VALUES ('Grigoriy', 'Semenov', 'M', 32);
INSERT INTO employee (
    first_name, last_name, gender, age)
        VALUES ('Uliyana', 'Ivantcova', 'W', 24);
INSERT INTO employee (
    first_name, last_name, gender, age)
        VALUES ('Mikhail', 'Udaltcov', 'M', 110);
SELECT first_name AS Имя, last_name AS Фамилия
FROM employee;
SELECT * FROM employee WHERE age<30 OR age>50;
SELECT * FROM employee WHERE age BETWEEN 30 AND 50;
SELECT *FROM employee ORDER BY last_name DESC;
SELECT * FROM employee WHERE LENGTH (first_name) > 4;
--вторая задача
SELECT * FROM employee;
UPDATE employee SET first_name = 'Semen' WHERE id = 4;
UPDATE employee SET first_name = 'Evgeniya' WHERE id = 5;
SELECT first_name AS Имя,
SUM(age) AS Суммарный_возраст
FROM employee
GROUP BY Имя;
SELECT first_name,
age FROM employee
WHERE age = (SELECT MIN (age)
FROM employee);
SELECT first_name AS Имя,
MAX(age) AS Максимальный_возраст
FROM employee
GROUP BY first_name
HAVING COUNT(first_name)>1;
--Работа с несколькими таблицами
--Задача 1
CREATE TABLE city (
city_id BIGSERIAL NOT NULL PRIMARY KEY,
city_name VARCHAR(60) NOT NULL
);
ALTER TABLE employee ADD city_id INT;
ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city(city_id);
INSERT INTO city(city_name)
VALUES('Chicago');
INSERT INTO city(city_name)
VALUES('Saint-Petersburg');
INSERT INTO city(city_name)
VALUES('Saint-Louis');
INSERT INTO city(city_name)
VALUES('Deli');
INSERT INTO city(city_name)
VALUES('Irak');
UPDATE employee SET city_id = 1 WHERE id = 1;
UPDATE employee SET city_id = 2 WHERE id = 2;
UPDATE employee SET city_id = 3 WHERE id = 3;
UPDATE employee SET city_id = 4 WHERE id = 4;
UPDATE employee SET city_id = 5 WHERE id = 5;
UPDATE employee SET city_id = 6 WHERE id = 6;
--Задача 2
SELECT first_name, last_name, city_name FROM employee
INNER JOIN city ON employee.city_id=city.city_id;
SELECT city_name, first_name, last_name FROM employee
FULL JOIN city ON employee.city_id=city.city_id;
SELECT first_name, city_name
FROM employee FULL OUTER JOIN city
ON employee.city_id = city.city_id
ORDER BY first_name;
SELECT first_name, city_name
FROM employee
CROSS JOIN city;
SELECT city_name
FROM employee
RIGHT JOIN city ON employee.city_id = city.city_id
WHERE employee.first_name is NULL;
