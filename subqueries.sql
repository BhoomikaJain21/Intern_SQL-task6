-- 1. Scalar Subquery in SELECT
-- Each employee along with the highest salary in the company

SELECT name, salary,(SELECT MAX(salary) FROM employees) AS max_salary
FROM employees;


-- 2. Subquery in WHERE with IN
-- Employees working in departments where someone earns more than 70,000

SELECT name FROM employees
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE salary > 70000
);


-- 3. Correlated Subquery
-- Employees whose salary is above the average salary in their department

SELECT name, salary FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);


-- 4. EXISTS Subquery
-- Departments that have at least one employee earning below 45,000

SELECT DISTINCT department_id FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e2.department_id = e.department_id
      AND e2.salary < 45000
);


-- 5. Subquery in FROM clause (Derived Table)
-- Average salary per department, filtered to only show departments with avg > 50,000

SELECT department_id, avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg
WHERE avg_salary > 50000;


-- 6. Scalar Subquery in WHERE
-- All employees earning the highest salary in the company

SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- 7. Nested Subqueries
-- Employees who earn more than the average salary across all departments with avg salary > 60,000

SELECT name, salary FROM employees
WHERE salary > (
    SELECT AVG(avg_dept_salary)
    FROM (
        SELECT AVG(salary) AS avg_dept_salary
        FROM employees
        GROUP BY department_id
        HAVING AVG(salary) > 60000
    ) as Dept_Salary
);


-- 8. Correlated Subquery with NOT EXISTS
-- Employees who are the only ones in their department

SELECT name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e.department_id = e2.department_id AND e.emp_id <> e2.emp_id
);


-- 9. Subquery with COUNT in SELECT
-- Each department with total employees and average salary

SELECT department_id,
    (SELECT COUNT(*) FROM employees e2 WHERE e2.department_id = e1.department_id) AS total_employees,
    (SELECT AVG(salary) FROM employees e3 WHERE e3.department_id = e1.department_id) AS avg_salary
FROM employees e1
GROUP BY department_id;


-- 10. Subquery in HAVING clause
-- Departments where average salary is greater than the overall company average

SELECT department_id, AVG(salary) AS avg_dept_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary) FROM employees
);