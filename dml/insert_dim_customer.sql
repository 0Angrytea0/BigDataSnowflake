INSERT INTO dim_customer (
  source_file,
  customer_id,
  first_name,
  last_name,
  age,
  email,
  country,
  postal_code
)
SELECT
  source_file,
  sale_customer_id,
  customer_first_name,
  customer_last_name,
  customer_age,
  customer_email,
  customer_country,
  customer_postal_code
FROM (
  SELECT
    source_file,
    sale_customer_id,
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    customer_postal_code,
    ROW_NUMBER() OVER (
      PARTITION BY source_file, sale_customer_id
      ORDER BY sale_date DESC  
    ) AS rn
  FROM mock_data
  WHERE sale_customer_id IS NOT NULL
) t
WHERE t.rn = 1
ON CONFLICT (source_file, customer_id) DO NOTHING;
