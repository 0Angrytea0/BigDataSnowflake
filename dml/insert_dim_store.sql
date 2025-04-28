INSERT INTO dim_store (
  name,
  location,
  city,
  state,
  country,
  phone,
  email
)
SELECT
  store_name     AS name,
  store_location AS location,
  store_city     AS city,
  store_state    AS state,
  store_country  AS country,
  store_phone    AS phone,
  store_email    AS email
FROM (
  SELECT
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email,
    ROW_NUMBER() OVER (
      PARTITION BY store_name
      ORDER BY sale_date
    ) AS rn
  FROM mock_data
) t
WHERE t.rn = 1
  AND store_name IS NOT NULL
ON CONFLICT (name) DO NOTHING;