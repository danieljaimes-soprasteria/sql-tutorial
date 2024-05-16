-- 8.1. Tutorial 1 - Tipos de subconsultas
SELECT
    sysdate today,
    (
        SELECT
            COUNT(*)
        FROM
            departments
    )       dept_count,
    (
        SELECT
            COUNT(*)
        FROM
            employees
    )       emp_count
FROM
    dual;

SELECT
    last_name
FROM
    employees
WHERE
    employee_id IN (
        SELECT
            manager_id
        FROM
            employees
    );

SELECT
    MAX(salary),
    country_id
FROM
    (
        SELECT
            salary,
            country_id
        FROM
                 employees
            NATURAL JOIN departments
            NATURAL JOIN locations
    )
GROUP BY
    country_id;

-- 8.2. Tutorial 2 - Subconsultas mas complejas
SELECT
    last_name
FROM
    employees
WHERE
    department_id IN (
        SELECT
            department_id
        FROM
            departments
        WHERE
            location_id IN (
                SELECT
                    location_id
                FROM
                    locations
                WHERE
                    country_id = (
                        SELECT
                            country_id
                        FROM
                            countries
                        WHERE
                            country_name = 'United Kingdom'
                    )
            )
    );

SELECT
    country_id
FROM
    countries
WHERE
    country_name = 'United Kingdom';

SELECT
    location_id
FROM
    locations
WHERE
    country_id = 'UK';

SELECT
    department_id
FROM
    departments
WHERE
    location_id IN ( 2400, 2500, 2600 );

SELECT
    last_name
FROM
    employees
WHERE
    department_id IN ( 40, 80 );

SELECT
    last_name
FROM
    employees
WHERE
    department_id IN (
        SELECT
            department_id
        FROM
            departments
        WHERE
            department_name LIKE 'IT%'
    )
    AND salary > (
        SELECT
            AVG(salary)
        FROM
            employees
    );
    
-- 8.3. Tutorial 3 - Investigar los diferentes tipos de subconsultas
SELECT
    last_name
FROM
    employees
WHERE
    salary > (
        SELECT
            salary
        FROM
            employees
        WHERE
            last_name = 'Tobias'
    )
ORDER BY
    last_name;
    
-- DA ERROR A DREDE
SELECT
    last_name
FROM
    employees
WHERE
    salary > (
        SELECT
            salary
        FROM
            employees
        WHERE
            last_name = 'Taylor'
    )
ORDER BY
    last_name;

SELECT
    COUNT(last_name)
FROM
    employees
WHERE
    last_name = 'Tobias';

SELECT
    COUNT(last_name)
FROM
    employees
WHERE
    last_name = 'Taylor';

-- SOL. 1
SELECT
    last_name
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            last_name = 'Taylor'
    )
ORDER BY
    last_name;

-- SOL. 2
SELECT
    last_name
FROM
    employees
WHERE
    salary > (
        SELECT
            MAX(salary)
        FROM
            employees
        WHERE
            last_name = 'Taylor'
    )
ORDER BY
    last_name;

-- 8.4. Tutorial 4 - Crear una consulta que sea fiable y fácil de interpretar
SELECT
    last_name
FROM
    employees
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            departments
        WHERE
            department_name = '&Department_name'
    );

SELECT
    last_name
FROM
    employees
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            departments
        WHERE
            upper(department_name) LIKE upper('%&Department_name%')
    );

-- 8.5. Tutorial 5 - Global
-- DA ERROR de signle-row subquery
SELECT
    last_name
FROM
    employees
WHERE
    salary > (
        SELECT
            salary
        FROM
            employees
        WHERE
            last_name = 'Taylor'
    )
ORDER BY
    last_name;

-- SOL. 1
SELECT
    last_name
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            last_name = 'Taylor'
    )
ORDER BY
    last_name;

-- SOL. 2
SELECT
    last_name
FROM
    employees
WHERE
    salary > (
        SELECT
            MAX(salary)
        FROM
            employees
        WHERE
            last_name = 'Taylor'
    )
ORDER BY
    last_name;
    
-- SOL. ALTERNATIVE 1
SELECT
    last_name
FROM
    employees
WHERE
    salary > ANY (
        SELECT
            salary
        FROM
            employees
        WHERE
            last_name = 'Taylor'
    )
ORDER BY
    last_name;

-- SOL. ALTERNATIVE 2
SELECT
    last_name
FROM
    employees
WHERE
    salary > (
        SELECT
            MIN(salary)
        FROM
            employees
        WHERE
            last_name = 'Taylor'
    )
ORDER BY
    last_name;