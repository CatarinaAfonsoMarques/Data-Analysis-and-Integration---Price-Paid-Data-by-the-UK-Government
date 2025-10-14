-- Create a new database for the data warehouse
CREATE DATABASE IF NOT EXISTS price_paid_dw;
USE price_paid_dw;

-- Drop old tables if they exist
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_location;
DROP TABLE IF EXISTS dim_time;

-- Dimension: Location
CREATE TABLE dim_location (
    location_id   INT AUTO_INCREMENT PRIMARY KEY,
    city          VARCHAR(128) NOT NULL,
    district      VARCHAR(128),
    county        VARCHAR(128)
);

-- Dimension: Time
CREATE TABLE dim_time (
    time_id INT AUTO_INCREMENT PRIMARY KEY,
    day       INT NOT NULL,
    month     INT NOT NULL,
    year      INT NOT NULL
);

-- Fact Table: Sales
CREATE TABLE fact_sales (
    location_id INT NOT NULL,
    time_id     INT NOT NULL,
    total_sales DECIMAL(18,2) NOT NULL,
    PRIMARY KEY (location_id, time_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (time_id) REFERENCES dim_time(time_id)
);

