DROP TABLE IF EXISTS dim_store;
CREATE TABLE dim_store (
  store_sk       SERIAL PRIMARY KEY,
  name           TEXT     UNIQUE,    
  location       TEXT,                
  city           TEXT,
  state          TEXT,
  country        TEXT,
  phone          TEXT,
  email          TEXT
);
