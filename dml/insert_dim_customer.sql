INSERT INTO dim_customer (
  customer_id,
  first_name,
  last_name,
  age,
  email,
  country,
  postal_code
)
SELECT
  sale_customer_id,
  customer_first_name,
  customer_last_name,
  customer_age,
  customer_email,
  customer_country,
  customer_postal_code
FROM (
  SELECT
    sale_customer_id,
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    customer_postal_code,
    ROW_NUMBER() OVER (
      PARTITION BY sale_customer_id
      ORDER BY sale_date  
    ) AS rn
  FROM mock_data
) t
WHERE t.rn = 1
ON CONFLICT (customer_id) DO NOTHING;
