-- PREGUTNA 1
SELECT
    employee_id,
    job_id,
    start_date,
    end_date,
    ( ( end_date - start_date ) + 1 ) / 365.25 "YearsWorked"
FROM
    job_history;

-- PREGUNTA 2
SELECT
    'The Job Id for the '
    || job_title
    || '''s job is: '
    || job_id AS "Job Description"
FROM
    jobs;

-- PREGUNTA 3
SELECT
    ( 22 / 7 ) * ( 6000 * 6000 ) area
FROM
    dual;