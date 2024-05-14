-- 6.1. Tutorial 1 - Utilizando las funciones agregadas

SELECT
    round(AVG(length(country_name))) average_country_name_length
FROM
    countries;

-- 6.2. Tutorial 2 - Agrupando datos basados en múltiples columnas
SELECT
    to_char(end_date, 'YYYY') "Quitting Year",
    job_id,
    COUNT(*)                  "Number of Employees"
FROM
    job_history
GROUP BY
    to_char(end_date, 'YYYY'),
    job_id
ORDER BY
    COUNT(*) DESC;
    
--6.3. Tutorial 3 - La cláusula HAVING
SELECT
    to_char(hire_date, 'DAY'),
    COUNT(*)
FROM
    employees
GROUP BY
    to_char(hire_date, 'DAY')
HAVING
    COUNT(*) >= 18;

-- 6.4. Tutorial 4 - Global
SELECT
    COUNT(*),
    SUM(list_price),
    product_status
FROM
    product_information
WHERE
    upper(product_status) <> 'ORDERABLE'
GROUP BY
    product_status
HAVING
    SUM(list_price) > 4000;