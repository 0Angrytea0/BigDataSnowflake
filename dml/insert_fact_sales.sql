INSERT INTO fact_sales (
  date_sk,
  customer_sk,
  seller_sk,
  product_sk,
  store_sk,
  supplier_sk,
  sale_quantity,
  sale_total_price,
  unit_price
)
SELECT
  d.date_sk,
  c.customer_sk,
  s.seller_sk,
  p.product_sk,
  st.store_sk,
  sup.supplier_sk,
  md.sale_quantity,
  md.sale_total_price,
  md.product_price
FROM mock_data md

JOIN dim_date     d   ON md.sale_date           = d.sale_date
JOIN dim_customer c   ON md.sale_customer_id    = c.customer_id
JOIN dim_seller   s   ON md.sale_seller_id      = s.seller_id
JOIN dim_product  p   ON md.sale_product_id     = p.product_id
JOIN dim_store    st  ON md.store_name          = st.name
JOIN dim_supplier sup ON md.supplier_name       = sup.name

WHERE md.sale_customer_id IS NOT NULL
  AND md.sale_seller_id   IS NOT NULL
  AND md.sale_product_id  IS NOT NULL;