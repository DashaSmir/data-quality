WITH stats AS (
    SELECT
        COUNT(*) AS count_of_rows,
        SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS count_of_customer_id_null,
        SUM(CASE WHEN full_name IS NULL THEN 1 ELSE 0 END) AS count_of_full_name_null,
        SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS count_of_email_null,
        SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS count_of_phone_null,
        SUM(CASE WHEN birth_date IS NULL THEN 1 ELSE 0 END) AS count_of_birth_date_null,
        SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS count_of_country_null,
        SUM(CASE WHEN segment IS NULL THEN 1 ELSE 0 END) AS count_of_segment_null
    FROM customers
)
SELECT 'customer_id' AS column_name, 
       count_of_customer_id_null AS null_count,
       ROUND((count_of_rows - count_of_customer_id_null) * 100.0 / count_of_rows, 2) AS occupancy_percentage
FROM stats
UNION ALL
SELECT 'full_name', 
       count_of_full_name_null,
       ROUND((count_of_rows - count_of_full_name_null) * 100.0 / count_of_rows, 2)
FROM stats
UNION ALL
SELECT 'email', 
       count_of_email_null,
       ROUND((count_of_rows - count_of_email_null) * 100.0 / count_of_rows, 2)
FROM stats
UNION ALL
SELECT 'phone', 
       count_of_phone_null,
       ROUND((count_of_rows - count_of_phone_null) * 100.0 / count_of_rows, 2)
FROM stats
UNION ALL
SELECT 'birth_date', 
       count_of_birth_date_null,
       ROUND((count_of_rows - count_of_birth_date_null) * 100.0 / count_of_rows, 2)
FROM stats
UNION ALL
SELECT 'country', 
       count_of_country_null,
       ROUND((count_of_rows - count_of_country_null) * 100.0 / count_of_rows, 2)
FROM stats
UNION ALL
SELECT 'segment', 
       count_of_segment_null,
       ROUND((count_of_rows - count_of_segment_null) * 100.0 / count_of_rows, 2)
FROM stats
ORDER BY occupancy_percentage ASC;
