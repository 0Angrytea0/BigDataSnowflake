INSERT INTO dim_seller (
  seller_id,
  source_file,
  first_name,
  last_name,
  email,
  country,
  postal_code
)
SELECT
  sale_seller_id    AS seller_id,
  source_file,
  seller_first_name AS first_name,
  seller_last_name  AS last_name,
  seller_email      AS email,
  seller_country    AS country,
  seller_postal_code AS postal_code
FROM (
  SELECT
    sale_seller_id,
    source_file,
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    seller_postal_code,
    ROW_NUMBER() OVER (
      PARTITION BY source_file, sale_seller_id
      ORDER BY sale_date
    ) AS rn
  FROM mock_data
) t
WHERE t.rn = 1
  AND sale_seller_id IS NOT NULL
ON CONFLICT (source_file, seller_id) DO NOTHING;
