CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Sales');

INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 1),
(103, 'Charlie', 2);

DELETE FROM departments WHERE dept_id = 1;

UPDATE departments
SET dept_id = 10
WHERE dept_id = 1;

DROP TABLE employees;
DROP TABLE departments;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Sales');

INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 1),
(103, 'Charlie', 2);

SELECT * FROM employees;

DELETE FROM departments WHERE dept_id = 1;

SELECT * FROM employees;

UPDATE departments
SET dept_id = 10
WHERE dept_id = 2;

SELECT * FROM employees;

----------

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON DELETE SET NULL
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Sales');

INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 1),
(103, 'Charlie', 2);

DELETE FROM departments WHERE dept_id = 1;

SELECT * FROM employees;

-- ON DELETE SET NULL: When a referenced row is deleted from the departments table, this action sets the foreign key column (dept_id) in the employees table to NULL instead of deleting the related rows or throwing an error.
----------

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON DELETE RESTRICT
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Sales');

INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 1),
(103, 'Charlie', 2);

DELETE FROM departments WHERE dept_id = 1;

-- The ON DELETE RESTRICT option prevents the deletion of a row in the referenced table (departments) if there are any related rows in the referencing table (employees). 
-- In this case, you cannot delete the HR department because it has employees associated with it. 
-- This is useful for enforcing data integrity, ensuring that records in related tables remain consistent and valid.
----------

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON UPDATE NO ACTION
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Sales');

INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 1),
(103, 'Charlie', 2);

UPDATE departments SET dept_id = 10 WHERE dept_id = 1;

-- The ON UPDATE NO ACTION option enforces referential integrity by preventing updates to the primary key in the departments table when it is referenced by rows in the employees table. 
-- In this case, since employees Alice and Bob are associated with dept_id = 1, you cannot update that department's dept_id to 10. 
-- This ensures that references between tables remain valid and consistent.
----------
