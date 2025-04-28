INSERT INTO dim_product (
  product_id,
  name,
  category,
  weight,
  color,
  size,
  brand,
  material,
  description,
  rating,
  reviews,
  release_date,
  expiry_date,
  unit_price
)
SELECT
  sale_product_id      AS product_id,
  product_name         AS name,
  product_category     AS category,
  product_weight       AS weight,
  product_color        AS color,
  product_size         AS size,
  product_brand        AS brand,
  product_material     AS material,
  product_description  AS description,
  product_rating       AS rating,
  product_reviews      AS reviews,
  product_release_date AS release_date,
  product_expiry_date  AS expiry_date,
  product_price        AS unit_price
FROM (
  SELECT
    sale_product_id,
    product_name,
    product_category,
    product_weight,
    product_color,
    product_size,
    product_brand,
    product_material,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date,
    product_price,
    ROW_NUMBER() OVER (
      PARTITION BY sale_product_id
      ORDER BY sale_date
    ) AS rn
  FROM mock_data
) t
WHERE t.rn = 1
  AND sale_product_id IS NOT NULL
ON CONFLICT (product_id) DO NOTHING;