CREATE DATABASE realestate_db;
USE realestate_db;
CREATE TABLE real_estate_projects (
    Property_ID VARCHAR(50) PRIMARY KEY,
    Micro_Market VARCHAR(255),
    Project_Name VARCHAR(255),
    Developer_Name VARCHAR(255),
    Unit_Size_Sqft INT,
    Configuration VARCHAR(100),
    Ticket_Price_Cr DECIMAL(12,2),
    Transaction_Type VARCHAR(100),
    Buyer_Type VARCHAR(100),
    Purchase_Quarter VARCHAR(20),
    Connectivity_Score DECIMAL(5,2),
    Amenity_Score DECIMAL(5,2),
    Possession_Status VARCHAR(50),
    Sales_Channel VARCHAR(100),
    NRI_Buyer BOOLEAN,
    Locality_Infra_Score DECIMAL(5,2),
    Avg_Traffic_Time_Min INT,
    Buyer_Comments TEXT,
    Price_per_Sqft DECIMAL(12,2),
    Quarter_Number INT,
    Booking_Flag BOOLEAN
);

select * from real_estate_projects;

-- 1. Total rows
SELECT COUNT(*) as total_rows 
FROM real_estate_projects;

-- 2. Count by booking status
SELECT 
  Booking_Flag,
  COUNT(*) AS records
FROM real_estate_projects
GROUP BY Booking_Flag
ORDER BY Booking_Flag;

-- 3.Average ticket price per builder
SELECT 
  Developer_Name AS builder,
  AVG(Ticket_Price_Cr) AS avg_ticket_price_cr,
  COUNT(*) AS project_count
FROM real_estate_projects
WHERE Ticket_Price_Cr IS NOT NULL
GROUP BY Developer_Name
ORDER BY avg_ticket_price_cr DESC;
