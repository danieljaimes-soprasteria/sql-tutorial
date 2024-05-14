SELECT DISTINCT
    sales_rep_id
FROM
    orders;

SELECT
    order_id,
    order_date,
    order_total
FROM
    orders;

SELECT
    product_name
    || ' with code:'
    || product_id
    || ' has status of:'
    || product_status AS "Product"
FROM
    product_information;

SELECT
    list_price - min_price AS "Max Actual Savings"
FROM
    product_information;

SELECT
    ( ( list_price - min_price ) / list_price ) * 100 AS "Max Discount %"
FROM
    product_information;

SELECT
    ( 4 * ( 22 / 7 ) * ( 3958.759 * 3958.759 ) ) AS "Earth's Area"
FROM
    dual;