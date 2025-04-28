DROP TABLE IF EXISTS dim_seller;
CREATE TABLE dim_seller (
  seller_sk      SERIAL PRIMARY KEY,
  seller_id      BIGINT   UNIQUE,      
  first_name     TEXT     NOT NULL,
  last_name      TEXT     NOT NULL,
  email          TEXT,
  country        TEXT,
  postal_code    TEXT
);
