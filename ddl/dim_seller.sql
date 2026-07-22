DROP TABLE IF EXISTS dim_seller;
CREATE TABLE dim_seller (
  seller_sk      SERIAL PRIMARY KEY,
  source_file    TEXT NOT NULL,
  seller_id      BIGINT   NOT NULL,      
  first_name     TEXT     NOT NULL,
  last_name      TEXT     NOT NULL,
  email          TEXT,
  country        TEXT,
  postal_code    TEXT
);
