/*
*********************************************************************
Name: UK Price Paid Data Warehouse (Star Schema)
MySQL Compatibility: 5.7
*********************************************************************
*/

DROP DATABASE IF EXISTS price_paid_uk_2025_dw;

CREATE DATABASE price_paid_uk_2025_dw DEFAULT CHARACTER SET utf8;

USE price_paid_uk_2025_dw;

-- Dimension Table: Location

CREATE TABLE dim_location (
    location_key INT AUTO_INCREMENT PRIMARY KEY,
    city         VARCHAR(100) NOT NULL,
    district     VARCHAR(100),
    county       VARCHAR(100),
    UNIQUE (city, district, county)
);

-- Dimension Table: Time

CREATE TABLE dim_time (
    time_key INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE NOT NULL,
    day       INT NOT NULL,
    month     INT NOT NULL,
    year      INT NOT NULL
);

-- Dimension: Property

CREATE TABLE dim_property (
    property_key INT AUTO_INCREMENT PRIMARY KEY,
    property_type CHAR(1) NOT NULL COMMENT 'D=Detached, S=Semi, T=Terraced, F=Flat, O=Other',
    newly_built   CHAR(1) NOT NULL COMMENT 'Y/N',
    duration      CHAR(1) NOT NULL COMMENT 'F=Freehold, L=Leasehold',
    UNIQUE (property_type, newly_built, duration)
);

-- Fact Table: Sales

CREATE TABLE fact_sales (
    location_key  INT NOT NULL,
    time_key      INT NOT NULL,
    property_key  INT NOT NULL,
    total_sales_amount DECIMAL(15,2) NOT NULL,
    total_transactions INT NOT NULL,
    PRIMARY KEY (location_key, time_key, property_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (time_key) REFERENCES dim_time(time_key),
    FOREIGN KEY (property_key) REFERENCES dim_property(property_key)
);
