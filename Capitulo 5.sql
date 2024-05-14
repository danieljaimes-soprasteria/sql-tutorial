-- 5.1. Tutorial 1 - Convirtiendo Fechas en Caracteres Utilizando la Función TO_CHAR
SELECT
    first_name,
    last_name,
    to_char(hire_date, 'fmDay, "the" Ddth "of" Month, Yyyysp.') start_date
FROM
    employees
WHERE
    to_char(TO_DATE(hire_date, 'yy/mm/dd'),
            'fmDay') = 'Saturday';

-- 5.2. Tutorial 2 - Utilizando NULLIF Y NVL2 Para Lógica Condicional Simple

SELECT
    first_name,
    last_name,
    nvl2(nullif(length(last_name),
                length(first_name)),
         'Different Length',
         'Same Length') name_lengths
FROM
    employees
WHERE
    department_id = 100;

-- 5.3. Tutorial 3 - Usando la función DECODE

SELECT
    decode(state_province, 'Washington', 'Headquarters', 'Texas', 'Oil Wells',
           'California', city, 'New Jersey', street_address) location_info,
    state_province,
    city,
    street_address,
    country_id
FROM
    locations
WHERE
    country_id = 'US'
ORDER BY
    location_info;

-- 5.4. Tutorial 4 - Global
SELECT
    cust_first_name,
    cust_last_name,
    cust_email,
    date_of_birth,
    CASE to_char(date_of_birth, 'DDD') - to_char(TO_DATE('&REFDATE'),
                                                 'DDD')
        WHEN - 2 THEN
            'Day before yesterday'
        WHEN - 1 THEN
            'Yesterday'
        WHEN 0   THEN
            'Today'
        WHEN 1   THEN
            'Tomorrow'
        WHEN 2   THEN
            'Day after
tomorrow'
        ELSE
            'Later this week'
    END birthday
FROM
    customers
WHERE
    to_char(date_of_birth, 'DDD') - to_char(TO_DATE('&REFDATE'),
                                            'DDD') BETWEEN - 2 AND 7
ORDER BY
    to_char(date_of_birth, 'MM-DD');
-- dd/mm/yy