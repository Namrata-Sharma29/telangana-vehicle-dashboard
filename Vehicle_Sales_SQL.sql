CREATE DATABASE TRANSPORT;
USE TRANSPORT;

RENAME TABLE `transport vehicle online sales data (quarter 1, 2024) - csv` TO vehicle_data;

ALTER TABLE vehicle_data
MODIFY COLUMN make_year DATE,
MODIFY COLUMN fromdate DATE;

SELECT * FROM vehicle_data;

-- Top 5 Manufacturers by Sales  
  SELECT
  maker_name,
  COUNT(*) AS total_sales
FROM
  vehicle_data
GROUP BY
  maker_name
ORDER BY
  total_sales DESC
LIMIT 5;

-- Fuel-Type Sales Distribution Across Registration Offices

SELECT office_cd, fuel, COUNT(*) AS total_registrations
FROM vehicle_data
GROUP BY office_cd, fuel
ORDER BY office_cd, total_registrations DESC;


-- Top 5 Selling Vehicle Models
SELECT
  model_desc,
  COUNT(*) AS total_sales
FROM
  vehicle_data
GROUP BY
  model_desc
ORDER BY
  total_sales DESC
LIMIT 5;

-- Sales Distribution by Vehicle Class
SELECT
  vehicle_class,
  COUNT(*) AS total_sales
FROM
  vehicle_data
GROUP BY
  vehicle_class
ORDER BY
  total_sales DESC;

-- Sales of Second Vehicles
SELECT
  CASE
    WHEN second_vehicle = 'Y' THEN 'Second Vehicle'
    WHEN second_vehicle = 'N' THEN 'New Vehicle'
    ELSE 'Unknown'
  END AS vehicle_condition,
  COUNT(*) AS total_sales
FROM
  vehicle_data
GROUP BY
  vehicle_condition;

  
  -- Sales Distribution by Category (Transport vs. Non-Transport)
  SELECT
  category,
  COUNT(*) AS total_sales
FROM
  vehicle_data
GROUP BY
  category
ORDER BY
  total_sales DESC;
