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

CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT NOT NULL
);

INSERT INTO departments (dept_id, dept_name) VALUES
    (10, 'Engineering'),
    (20, 'Analytics'),
    (30, 'Data Platform'),
    (40, 'HR');

WITH dept_avg AS (
    SELECT
        dept_id,
        AVG(salary) AS avg_salary
    FROM employees
    WHERE dept_id IS NOT NULL
    GROUP BY dept_id
),
above_avg AS (
    SELECT
        e.name,
        e.dept_id,
        e.salary,
        da.avg_salary,
        ROUND((e.salary - da.avg_salary) * 100.0 / da.avg_salary, 2) AS pct_above
    FROM employees AS e
    JOIN dept_avg AS da
        ON e.dept_id = da.dept_id
    WHERE e.salary > da.avg_salary
)
SELECT
    aa.name,
    d.dept_name,
    aa.salary,
    ROUND(aa.avg_salary, 2) AS avg_salary,
    aa.pct_above
FROM above_avg AS aa
JOIN departments AS d
    ON aa.dept_id = d.dept_id
ORDER BY aa.pct_above DESC;
