-- 9.1. Tutorial 1 - Describir los operadores de conjunto
SELECT
    region_name
FROM
    regions;

SELECT
    region_name
FROM
    regions
UNION
SELECT
    region_name
FROM
    regions;

SELECT
    region_name
FROM
    regions
UNION ALL
SELECT
    region_name
FROM
    regions;

SELECT
    region_name
FROM
    regions
INTERSECT
SELECT
    region_name
FROM
    regions;

SELECT
    region_name
FROM
    regions
MINUS
SELECT
    region_name
FROM
    regions;

-- 9.2. Tutorial 2- Utilizando los Operadores Conjunto
SELECT
    department_id,
    COUNT(1)
FROM
    employees
WHERE
    department_id IN ( 20, 30, 40 )
GROUP BY
    department_id;

SELECT
    20,
    COUNT(1)
FROM
    employees
WHERE
    department_id = 20
UNION ALL
SELECT
    30,
    COUNT(1)
FROM
    employees
WHERE
    department_id = 30
UNION ALL
SELECT
    40,
    COUNT(1)
FROM
    employees
WHERE
    department_id = 40;

SELECT
    manager_id
FROM
    employees
WHERE
    department_id = 20
INTERSECT
SELECT
    manager_id
FROM
    employees
WHERE
    department_id = 30
MINUS
SELECT
    manager_id
FROM
    employees
WHERE
    department_id = 40;

SELECT
    department_id,
    NULL,
    SUM(salary)
FROM
    employees
GROUP BY
    department_id
UNION
SELECT
    NULL,
    manager_id,
    SUM(salary)
FROM
    employees
GROUP BY
    manager_id
UNION ALL
SELECT
    NULL,
    NULL,
    SUM(salary)
FROM
    employees;

-- 9.3. Tutorial 3 - Controlar el orden de los registros devueltos
SELECT
    department_id dept,
    NULL          mgr,
    SUM(salary)
FROM
    employees
GROUP BY
    department_id
UNION ALL
SELECT
    NULL,
    manager_id,
    SUM(salary)
FROM
    employees
GROUP BY
    manager_id
UNION ALL
SELECT
    NULL,
    NULL,
    SUM(salary)
FROM
    employees;

SELECT
    department_id dept,
    NULL          mgr,
    SUM(salary)
FROM
    employees
GROUP BY
    department_id
UNION
SELECT
    NULL,
    manager_id,
    SUM(salary)
FROM
    employees
GROUP BY
    manager_id
UNION
SELECT
    NULL,
    NULL,
    SUM(salary)
FROM
    employees;
    
-- 9.4. Tutorial 4 - Global
SELECT
    employee_id,
    last_name
FROM
    employees
MINUS
SELECT
    employee_id,
    last_name
FROM
         job_history
    JOIN employees USING ( employee_id );

SELECT
    last_name,
    job_title
FROM
         employees
    JOIN jobs USING ( job_id )
INTERSECT
SELECT
    last_name,
    job_title
FROM
         job_history h
    JOIN jobs      j ON ( h.job_id = j.job_id )
    JOIN employees e ON ( h.employee_id = e.employee_id );

SELECT
    job_title
FROM
         jobs
    JOIN employees USING ( job_id )
WHERE
    employee_id = &&who
UNION
SELECT
    job_title
FROM
         jobs
    JOIN job_history USING ( job_id )
WHERE
    employee_id = &&who;