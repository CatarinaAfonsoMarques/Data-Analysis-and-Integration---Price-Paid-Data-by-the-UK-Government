/*
*********************************************************************
Name: MySQL Database for UK Land Registry Price Paid Data
Link: https://www.gov.uk/government/statistical-data-sets/price-paid-data-downloads
Compatible with MySQL 5.7 and 8.0.
*********************************************************************
*/

SET NAMES utf8;

DROP DATABASE IF EXISTS price_paid_uk_2025;

CREATE DATABASE IF NOT EXISTS price_paid_uk_2025 DEFAULT CHARACTER SET utf8;

USE price_paid_uk_2025;

/*Table structure for table price_paid_transactions */

DROP TABLE IF EXISTS price_paid_transactions;

CREATE TABLE price_paid_transactions (
  transaction_id   CHAR(38) NOT NULL,
  price            INT UNSIGNED NOT NULL,
  transfer_date    DATE NOT NULL,
  postcode         VARCHAR(10) DEFAULT NULL,
  property_type CHAR(1) NOT NULL CHECK (property_type IN ('D','F','S','T','O')),	-- D = Detached, S = Semi-detached, T = Terraced, F = Flats, O = Other
  newly_built  CHAR(1) NOT NULL CHECK (newly_built  IN ('Y','N')),	-- Y/N
  duration     CHAR(1) NOT NULL CHECK (duration     IN ('F','L')),	-- F = Freehold, L = Leasehold
  paon             VARCHAR(100) DEFAULT NULL,
  saon             VARCHAR(100) DEFAULT NULL,
  street           VARCHAR(100) DEFAULT NULL,
  locality         VARCHAR(100) DEFAULT NULL,
  town_city        VARCHAR(100) DEFAULT NULL,
  district         VARCHAR(100) DEFAULT NULL,
  county           VARCHAR(100) DEFAULT NULL,
  ppd_category CHAR(1) NOT NULL CHECK (ppd_category IN ('A','B')),	-- A = Standard, B = Additional
  record_status CHAR(1) NOT NULL CHECK (record_status IN ('A','C','D')),	-- A = Added, C = Changed, D = Deleted
  PRIMARY KEY (transaction_id)
)

-- Note: CHECK constraints are enforced only in MySQL 8.0+, ignored in 5.7

/*Load data for the table price_paid_transactions from local csv file*/

LOAD DATA LOCAL INFILE '/home/aid/Downloads/project/task_01/pp-2025.csv'
	INTO TABLE price_paid_transactions
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	(transaction_id, price, transfer_date, postcode, property_type,
 	newly_built, duration, paon, saon, street, locality, town_city,
 	district, county, ppd_category, record_status);
