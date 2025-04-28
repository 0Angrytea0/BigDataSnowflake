DROP TABLE IF EXISTS dim_customer;
CREATE TABLE dim_customer (
  customer_sk    SERIAL PRIMARY KEY,
  customer_id    BIGINT    UNIQUE,     
  first_name     TEXT     NOT NULL,
  last_name      TEXT     NOT NULL,
  age            INT,
  email          TEXT,
  country        TEXT,
  postal_code    TEXT
);
