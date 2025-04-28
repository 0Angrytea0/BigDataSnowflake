INSERT INTO dim_supplier (
  name,
  contact,
  email,
  phone,
  address,
  city,
  country
)
SELECT
  supplier_name    AS name,
  supplier_contact AS contact,
  supplier_email   AS email,
  supplier_phone   AS phone,
  supplier_address AS address,
  supplier_city    AS city,
  supplier_country AS country
FROM (
  SELECT
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country,
    ROW_NUMBER() OVER (
      PARTITION BY supplier_name
      ORDER BY sale_date
    ) AS rn
  FROM mock_data
) t
WHERE t.rn = 1
  AND supplier_name IS NOT NULL
ON CONFLICT (name) DO NOTHING;