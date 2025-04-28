DROP TABLE IF EXISTS dim_supplier;
CREATE TABLE dim_supplier (
  supplier_sk    SERIAL PRIMARY KEY,
  name           TEXT     UNIQUE,    
  contact        TEXT,
  email          TEXT,
  phone          TEXT,
  address        TEXT,
  city           TEXT,
  country        TEXT
);
