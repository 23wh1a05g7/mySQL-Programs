CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT
);

INSERT INTO products (product_id, product_name, category_id) VALUES
(1, 'Pear', 50),
(2, 'Banana', 50),
(3, 'Orange', 50),
(4, 'Grapefruit', 50),
(5, 'Pear', 75),
(6, 'Sliced Ham', NULL),
(7, 'Kleenex', NULL);
SELECT * FROM products;

UPDATE products
SET product_name = 'Grapefruit'
WHERE product_name = 'Pear';
SELECT * FROM products;

UPDATE products
SET category_id = 30
WHERE category_id IS NULL;
SELECT * FROM products;

UPDATE products
SET category_id = category_id + 5;
SELECT * FROM products;

UPDATE products
SET product_name = 'Apple'
WHERE product_id = 4;
SELECT * FROM products;

UPDATE products
SET product_name = 'Banana', category_id = 25
WHERE product_id = 6;
SELECT * FROM products;

UPDATE products
SET category_id = 75
WHERE category_id >= 55;
SELECT * FROM products;

CREATE TABLE employees (
    Emp_id INT PRIMARY KEY,
    Ename VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO employees (Emp_id, Ename, Department, Salary) VALUES
(1, 'Ramu', 'CSE', 10000),
(2, 'Ravi', 'CSE', 15000),
(3, 'Raju', 'ECE', 8000),
(4, 'Sita', 'EEE', 11000),
(5, 'Venu', 'IT', 10000),
(6, 'Anu', 'IT', 12000),
(7, 'Ashok', 'CSE', 15000);
SELECT * FROM employees;

UPDATE employees
SET salary = CASE
    WHEN Department = 'CSE' THEN salary * 1.20
    WHEN Department = 'ECE' THEN salary * 1.12
    WHEN Department = 'IT' THEN salary * 1.15
    ELSE salary
END;
SELECT * FROM employees;

DELETE FROM employees
WHERE salary = 11000;
SELECT * FROM employees;

DELETE FROM employees
WHERE Department = 'IT';
SELECT * FROM employees;
