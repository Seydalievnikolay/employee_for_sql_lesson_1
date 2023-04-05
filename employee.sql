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
        VALUES ('Julia', 'Petrova', 'W', 19)
        VALUES ('Semen', 'Ivanov', 'M', 30)
        VALUES ('Pavel', 'Sidorov', 'M', 20);
SELECT*FROM employee;
UPDATE employee SET first_name = 'Evgeniy' WHERE id = 1;
UPDATE employee SET last_name = 'Kharitonov' WHERE id = 1;
UPDATE employee SET gender = 'M' WHERE id = 1;
UPDATE employee SET age = 18 WHERE id = 1;
SELECT*FROM employee;
DELETE FROM employee WHERE id = 1;
SELECT*FROM employee;