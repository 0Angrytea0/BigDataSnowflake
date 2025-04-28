INSERT INTO dim_date (
  sale_date,
  year,
  quarter,
  month,
  day,
  weekday
)
SELECT DISTINCT
  sale_date,
  EXTRACT(YEAR    FROM sale_date)::INT   AS year,
  EXTRACT(QUARTER FROM sale_date)::INT   AS quarter,
  EXTRACT(MONTH   FROM sale_date)::INT   AS month,
  EXTRACT(DAY     FROM sale_date)::INT   AS day,
  EXTRACT(DOW     FROM sale_date)::INT   AS weekday
FROM mock_data
WHERE sale_date IS NOT NULL
ON CONFLICT (sale_date) DO NOTHING;