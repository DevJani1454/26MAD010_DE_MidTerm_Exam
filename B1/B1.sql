CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    dept_id INTEGER,
    salary INTEGER,
    manager_id INTEGER
);

INSERT INTO employees (emp_id, name, dept_id, salary, manager_id) VALUES
    (1, 'Anita', 10, 90000, NULL),
    (2, 'Bharat', 10, 60000, 1),
    (3, 'Chetan', 20, 75000, 1),
    (4, 'Divya', 20, 55000, 3),
    (5, 'Esha', 20, 62000, 3),
    (6, 'Farhan', 30, 82000, 1),
    (7, 'Gaurav', 30, 50000, 6),
    (8, 'Hina', NULL, 45000, 1);

SELECT
    e.name AS employee_name,
    COALESCE(m.name, 'no manager') AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.emp_id
ORDER BY e.emp_id;