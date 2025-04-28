DROP TABLE IF EXISTS fact_sales;
CREATE TABLE fact_sales (
  sale_sk           SERIAL PRIMARY KEY,
  date_sk           INT  NOT NULL REFERENCES dim_date(date_sk),
  customer_sk       INT  NOT NULL REFERENCES dim_customer(customer_sk),
  seller_sk         INT  NOT NULL REFERENCES dim_seller(seller_sk),
  product_sk        INT  NOT NULL REFERENCES dim_product(product_sk),
  store_sk          INT  NOT NULL REFERENCES dim_store(store_sk),
  supplier_sk       INT  NOT NULL REFERENCES dim_supplier(supplier_sk),
  sale_quantity     INT,
  sale_total_price  NUMERIC,
  unit_price        NUMERIC
);
