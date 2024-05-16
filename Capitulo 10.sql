-- 10.1. Tutorial 1 - Uso del comando INSERT

SELECT
    *
FROM
    regions;

INSERT INTO regions VALUES (
    101,
    'Great Britain'
);

INSERT INTO regions VALUES (
    &region_number,
    '&Region_name'
);

INSERT INTO regions VALUES (
    (
        SELECT
            MAX(region_id) + 1
        FROM
            regions
    ),
    'Oceania'
);

COMMIT;

-- 10.2. Tutorial 2 - Utilizar el comando UPDATE
UPDATE regions
SET
    region_name = 'Scandinavia'
WHERE
    region_id = 101;

UPDATE regions
SET
    region_name = 'Iberia'
WHERE
    region_id > 100;

UPDATE regions
SET
    region_id = ( region_id + (
        SELECT
            MAX(region_id)
        FROM
            regions
    ) )
WHERE
    region_id IN (
        SELECT
            region_id
        FROM
            regions
        WHERE
            region_id > 100
    );

SELECT
    *
FROM
    regions;

COMMIT;

-- 10.3. Tutorial 3 - Uso del comando DELETE
DELETE FROM regions
WHERE
    region_id = 204;

DELETE FROM regions;

DELETE FROM regions
WHERE
    region_id IN (
        SELECT
            region_id
        FROM
            regions
        WHERE
            region_name = 'Iberia'
    );

SELECT
    *
FROM
    regions;

COMMIT;

-- 10.4. Tutorial 4 - Uso de comandos COMMIT y ROLLBACK
-- 10.5. Tutorial 5 - Global
INSERT INTO customers (
    customer_id,
    cust_first_name,
    cust_last_name
) VALUES (
    (
        SELECT
            MAX(customer_id) + 1
        FROM
            customers
    ),
    'John',
    'Watson'
);

UPDATE customers
SET
    credit_limit = (
        SELECT
            AVG(credit_limit)
        FROM
            customers
    )
WHERE
    cust_last_name = 'Watson';

INSERT INTO customers
(customer_id,cust_first_name,cust_last_name,credit_limit)
SELECT customer_id+1,cust_first_name,cust_last_name,credit_limit
FROM customers
WHERE cust_last_name='Watson';

UPDATE customers
SET cust_last_name='Ramklass',cust_first_name='Roopesh'
WHERE customer_id=
 (SELECT max(customer_id)
 FROM customers);
 
 COMMIT;
 
 SELECT customer_id,cust_last_name
FROM customers
WHERE cust_last_name IN ('Watson','Ramklass') FOR UPDATE;

UPDATE customers
SET credit_limit=0
WHERE cust_last_name='Ramklass';

COMMIT;

DELETE FROM customers
WHERE cust_last_name IN ('Watson','Ramklass');

TRUNCATE TABLE customers;

COMMIT;

SELECT max(customer_id)
FROM customers;