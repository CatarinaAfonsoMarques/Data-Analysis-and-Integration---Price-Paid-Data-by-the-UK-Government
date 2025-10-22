USE price_paid_uk_2025;

-- Directly append new data (from 2024 CSV) into the existing 2025 table
LOAD DATA LOCAL INFILE '/home/aid/Downloads/Project/task_11/pp-2024.csv'
INTO TABLE price_paid_transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(transaction_id, price, transfer_date, postcode, property_type,
 newly_built, duration, paon, saon, street, locality, town_city,
 district, county, ppd_category, record_status);

