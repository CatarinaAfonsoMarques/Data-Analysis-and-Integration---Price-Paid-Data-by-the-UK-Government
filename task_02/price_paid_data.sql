-- Create the database
DROP DATABASE IF EXISTS price_paid_data;
CREATE DATABASE IF NOT EXISTS price_paid_data;
USE price_paid_data;

-- Create the table to store Price Paid Data
DROP TABLE IF EXISTS transactions;
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id VARCHAR(64) NOT NULL,
    price DECIMAL(12 , 2 ) NOT NULL,
    transfer_date DATE NOT NULL,
    postcode VARCHAR(10),
    property_type CHAR(1),
    old_new CHAR(1),
    duration CHAR(1),
    paon VARCHAR(255),
    saon VARCHAR(255),
    street VARCHAR(255),
    locality VARCHAR(255),
    town_city VARCHAR(255),
    district VARCHAR(255),
    county VARCHAR(255),
    ppd_category CHAR(1),
    record_status CHAR(1),
    PRIMARY KEY (transaction_id)
);

LOAD DATA INFILE '/var/lib/mysql-files/pp-2025.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(transaction_id, price, @transfer_date, postcode, property_type, old_new, 
duration, paon, saon, street, locality, town_city, district, county, 
ppd_category, record_status)
SET transfer_date = STR_TO_DATE(SUBSTRING_INDEX(@transfer_date, ' ', 1), '%Y-%m-%d');
