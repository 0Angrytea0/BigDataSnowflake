DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date (
  date_sk     SERIAL PRIMARY KEY,
  sale_date   DATE     UNIQUE,
  year        INT,
  quarter     INT,
  month       INT,
  day         INT,
  weekday     INT
);
