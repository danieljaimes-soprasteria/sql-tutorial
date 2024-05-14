-- 7.1. Tutorial 1 - Utilizando NATURAL JOIN

SELECT
    employee_id,
    job_id,
    department_id,
    emp.last_name,
    emp.hire_date,
    jh.end_date
FROM
         job_history jh
    NATURAL JOIN employees emp;

-- 7.2. Tutorial 2 - Utilizando la cláusula NATURAL JOIN…ON
SELECT
    e.first_name
    || ' '
    || e.last_name
    || ' is manager of the '
    || d.department_name
    || ' department.' "Managers"
FROM
         employees e
    JOIN departments d ON ( e.employee_id = d.manager_id );

-- 7.3. Tutorial 3 - Realizando un SELF-JOIN
SELECT
    e.last_name employee,
    e.employee_id,
    e.manager_id,
    m.last_name manager,
    e.department_id
FROM
         employees e
    JOIN employees m ON ( e.manager_id = m.employee_id )
WHERE
    e.department_id IN ( 10, 20, 30 )
ORDER BY
    e.department_id;
    
-- 7.4. Tutorial 4 - Realizando un OUTER JOIN

SELECT D.DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM DEPARTMENTS D
LEFT OUTER JOIN EMPLOYEES E ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IS NULL;

-- 7.5. Tutorial 5 - Realizando un CROSS JOIN

SELECT COUNT(*)
FROM EMPLOYEES 
CROSS JOIN DEPARTMENTS;

SELECT COUNT(*) FROM EMPLOYEES;
SELECT COUNT(*) FROM DEPARTMENTS;

-- 7.6. Tutorial 6 - Global

SELECT CUST_FIRST_NAME, CUST_LAST_NAME, PRODUCT_NAME, LIST_PRICE
FROM CUSTOMERS
JOIN ORDERS USING (CUSTOMER_ID)
JOIN ORDER_ITEMS USING (ORDER_ID)
JOIN PRODUCT_INFORMATION USING (PRODUCT_ID)
WHERE LIST_PRICE > 1000;
