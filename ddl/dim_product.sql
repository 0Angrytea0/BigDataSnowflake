DROP TABLE IF EXISTS dim_product;
CREATE TABLE dim_product (
  product_sk         SERIAL PRIMARY KEY,
  product_id         BIGINT   UNIQUE,   
  name               TEXT     NOT NULL,
  category           TEXT,
  weight             NUMERIC,
  color              TEXT,
  size               TEXT,
  brand              TEXT,
  material           TEXT,
  description        TEXT,
  rating             NUMERIC,
  reviews            INT,
  release_date       DATE,
  expiry_date        DATE,
  unit_price         NUMERIC       
);
