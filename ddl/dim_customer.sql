DROP TABLE IF EXISTS dim_customer;
CREATE TABLE dim_customer (
  customer_sk    SERIAL PRIMARY KEY,
  source_file    TEXT   NOT NULL,
  customer_id    BIGINT NOT NULL,     
  first_name     TEXT   NOT NULL,
  last_name      TEXT   NOT NULL,
  age            INT,
  email          TEXT,
  country        TEXT,
  postal_code    TEXT,
  UNIQUE (source_file, customer_id)
);
