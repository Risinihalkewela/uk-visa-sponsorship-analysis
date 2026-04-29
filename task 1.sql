--Ensure correct data types

--STEP 1A — Remove non-numeric characters from numeric fields
--Clean the "Applications" cloumn
--Study — By Nationality
UPDATE [dbo].[migration-study-by-nationality-table]
SET Applications = NULLIF(LTRIM(RTRIM(Applications)), '')
WHERE ISNUMERIC(Applications) = 0;

--Study — By Sector
UPDATE [dbo].[migration-study-by-sector-table]
SET Applications = NULLIF(LTRIM(RTRIM(Applications)), '')
WHERE ISNUMERIC(Applications) = 0;

--Work — By Industry
UPDATE [dbo].[migration-work-by-Industry-table]
SET Applications = NULLIF(LTRIM(RTRIM(Applications)), '')
WHERE ISNUMERIC(Applications) = 0;

--Work — By Nationality
UPDATE [dbo].[migration-work-by-nationality-table]
SET Applications = NULLIF(LTRIM(RTRIM(Applications)), '')
WHERE ISNUMERIC(Applications) = 0;


--Step 1B - Remove Commas From Applications Column
--For Study by Nationality
UPDATE [dbo].[migration-study-by-nationality-table]
SET Applications = REPLACE(Applications, ',', '')
WHERE Applications LIKE '%,%';

--For Study by Sector
UPDATE [dbo].[migration-study-by-sector-table]
SET Applications = REPLACE(Applications, ',', '')
WHERE Applications LIKE '%,%';

--For Work by Industry
UPDATE [dbo].[migration-work-by-Industry-table]
SET Applications = REPLACE(Applications, ',', '')
WHERE Applications LIKE '%,%';

--For Work by Nationality
UPDATE [dbo].[migration-work-by-nationality-table]
SET Applications = REPLACE(Applications, ',', '')
WHERE Applications LIKE '%,%';


--Step 1C - Convert empty strings to NULL (important)
-- STUDY BY NATIONALITY
UPDATE [dbo].[migration-study-by-nationality-table]
SET Applications = NULL
WHERE Applications = '';

-- STUDY BY SECTOR
UPDATE [dbo].[migration-study-by-sector-table]
SET Applications = NULL
WHERE Applications = '';

-- WORK BY INDUSTRY
UPDATE [dbo].[migration-work-by-Industry-table]
SET Applications = NULL
WHERE Applications = '';

-- WORK BY NATIONALITY
UPDATE [dbo].[migration-work-by-nationality-table]
SET Applications = NULL
WHERE Applications = '';


--step 1D - Convert numeric columns to INT
--Applications → INT
ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN Applications INT;

ALTER TABLE [dbo].[migration-study-by-sector-table]
ALTER COLUMN Applications INT;

ALTER TABLE [dbo].[migration-work-by-Industry-table]
ALTER COLUMN Applications INT;

ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN Applications INT;


--STEP 2A — CLEAN THE “Year” COLUMN
--Remove non-numeric values:
UPDATE [dbo].[migration-study-by-nationality-table]
SET Year = NULL
WHERE ISNUMERIC(Year) = 0;

UPDATE [dbo].[migration-study-by-sector-table]
SET Year = NULL
WHERE ISNUMERIC(Year) = 0;

UPDATE [dbo].[migration-work-by-Industry-table]
SET Year = NULL
WHERE ISNUMERIC(Year) = 0;

UPDATE [dbo].[migration-work-by-nationality-table]
SET Year = NULL
WHERE ISNUMERIC(Year) = 0;

--Step 2B - Convert Year to INT
ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN Year INT;

ALTER TABLE [dbo].[migration-study-by-sector-table]
ALTER COLUMN Year INT;

ALTER TABLE [dbo].[migration-work-by-Industry-table]
ALTER COLUMN Year INT;

ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN Year INT;


--Step 3A - Now Convert Data Types (Correct ALTER statements)
--Table: migration-study-by-nationality-table
ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN Year INT;

ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN Quarter VARCHAR(20);

ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN [Type_of_application] VARCHAR(200);

ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN Institution_type_group VARCHAR(200);

ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN Geographical_region VARCHAR(200);

ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN Nationality VARCHAR(200);

ALTER TABLE [dbo].[migration-study-by-nationality-table]
ALTER COLUMN Applications INT;

--Table: migration-study-by-sector-table
ALTER TABLE [dbo].[migration-study-by-sector-table]
ALTER COLUMN Year INT;

ALTER TABLE [dbo].[migration-study-by-sector-table]
ALTER COLUMN Quarter VARCHAR(20);

ALTER TABLE [dbo].[migration-study-by-sector-table]
ALTER COLUMN [Type_of_application] VARCHAR(200);

ALTER TABLE [dbo].[migration-study-by-sector-table]
ALTER COLUMN Institution_type_group VARCHAR(200);

ALTER TABLE [dbo].[migration-study-by-sector-table]
ALTER COLUMN Institution_type VARCHAR(200);

ALTER TABLE [dbo].[migration-study-by-sector-table]
ALTER COLUMN Applications INT;


--Table: migration-work-by-Industry-table
ALTER TABLE [dbo].[migration-work-by-Industry-table]
ALTER COLUMN Year INT;

ALTER TABLE [dbo].[migration-work-by-Industry-table]
ALTER COLUMN Quarter VARCHAR(20);

ALTER TABLE [dbo].[migration-work-by-Industry-table]
ALTER COLUMN [Type_of_application] VARCHAR(200);

ALTER TABLE [dbo].[migration-work-by-Industry-table]
ALTER COLUMN Category_of_leave VARCHAR(200);

ALTER TABLE [dbo].[migration-work-by-Industry-table]
ALTER COLUMN Industry VARCHAR(200);

ALTER TABLE [dbo].[migration-work-by-Industry-table]
ALTER COLUMN Applications INT;


--Table: migration-work-by-nationality-table
ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN Year INT;

ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN Quarter VARCHAR(20);

ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN [Type_of_application] VARCHAR(200);

ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN Category_of_leave VARCHAR(200);

ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN Geographical_region VARCHAR(200);

ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN Nationality VARCHAR(200);

ALTER TABLE [dbo].[migration-work-by-nationality-table]
ALTER COLUMN Applications INT;



--Handle Missing or Inconsistent Data
--1. CHECK Missing Values in All 4 Tables
SELECT *
FROM [dbo].[migration-study-by-nationality-table]
WHERE 
    Year IS NULL OR
    Quarter IS NULL OR
    Type_of_application IS NULL OR
    Institution_type_group IS NULL OR
    Geographical_region IS NULL OR
    Nationality IS NULL OR
    Applications IS NULL;

SELECT *
FROM [dbo].[migration-study-by-sector-table]
WHERE 
    Year IS NULL OR
    Quarter IS NULL OR
    Type_of_application IS NULL OR
    Institution_type_group IS NULL OR
    Institution_type IS NULL OR
    Applications IS NULL;

SELECT *
FROM [dbo].[migration-work-by-Industry-table]
WHERE 
    Year IS NULL OR
    Quarter IS NULL OR
    Type_of_application IS NULL OR
    Category_of_leave IS NULL OR
    Industry IS NULL OR
    Applications IS NULL;

SELECT *
FROM [dbo].[migration-work-by-nationality-table]
WHERE 
    Year IS NULL OR
    Quarter IS NULL OR
    Type_of_application IS NULL OR
    Category_of_leave IS NULL OR
    Geographical_region IS NULL OR
    Nationality IS NULL OR
    Applications IS NULL;


--2. Replace missing numbers with 0
UPDATE [dbo].[migration-study-by-sector-table]
SET Applications = 0
WHERE Applications IS NULL;

UPDATE [dbo].[migration-study-by-nationality-table]
SET Applications = 0
WHERE Applications IS NULL;

UPDATE [dbo].[migration-work-by-industry-table]
SET Applications = 0
WHERE Applications IS NULL;

UPDATE [dbo].[migration-work-by-nationality-table]
SET Applications = 0
WHERE Applications IS NULL;


--Rename columns for readability
--1. Rename Columns – migration-study-by-nationality-table
-- STUDY BY NATIONALITY TABLE
EXEC sp_rename '[dbo].[migration-study-by-nationality-table].[Year]', 'Year', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-nationality-table].[Quarter]', 'Quarter', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-nationality-table].[Type_of_application]', 'Type_of_application', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-nationality-table].[Institution_Type_Group]', 'Institution_Type_Group', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-nationality-table].[Geographical_Region]', 'Geographical_Region', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-nationality-table].[Nationality]', 'Nationality', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-nationality-table].[Applications]', 'Applications', 'COLUMN';

--2. Rename Columns – Study by Sector Table
-- STUDY BY SECTOR TABLE
EXEC sp_rename '[dbo].[migration-study-by-sector-table].[Year]', 'Year', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-sector-table].[Quarter]', 'Quarter', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-sector-table].[Type_of_application]', 'Type_of_application', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-sector-table].[Institution_Type_Group]', 'Institution_Type_Group', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-sector-table].[Institution_Type]', 'Institution_Type', 'COLUMN';
EXEC sp_rename '[dbo].[migration-study-by-sector-table].[Applications]', 'Applications', 'COLUMN';

--3. Rename Columns – Work by Industry Table
-- WORK BY INDUSTRY TABLE
EXEC sp_rename '[dbo].[migration-work-by-Industry-table].[Year]', 'Year', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-Industry-table].[Quarter]', 'Quarter', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-Industry-table].[Type_of_application]', 'Type_of_application', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-Industry-table].[Category_of_Leave]', 'Category_of_Leave', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-Industry-table].[Industry]', 'Industry', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-Industry-table].[Applications]', 'Applications', 'COLUMN';

--4. Rename Columns – Work by Nationality Table
-- WORK BY NATIONALITY TABLE
EXEC sp_rename '[dbo].[migration-work-by-nationality-table].[Year]', 'Year', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-nationality-table].[Quarter]', 'Quarter', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-nationality-table].[Type_of_application]', 'Type_Of_application', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-nationality-table].[Category_of_Leave]', 'Category_of_Leave', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-nationality-table].[Geographical_Region]', 'Geographical_Region', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-nationality-table].[Nationality]', 'Nationality', 'COLUMN';
EXEC sp_rename '[dbo].[migration-work-by-nationality-table].[Applications]', 'Applications', 'COLUMN';



--USE SQL QUERIES TO FILTER OR AGGREGATE LARGE TABLES BEFORE CONNECTING TO POWER BI
--PART 1 — AGGREGATION VIEWS
--A. VISA APPLICATION TRENDS OVER TIME
--Study Trends (Nationality + Sector)
CREATE VIEW vw_Study_Trends AS
SELECT 
    Year,
    SUM(CAST(Applications AS INT)) AS Total_Study_Applications
FROM [dbo].[migration-study-by-nationality-table]
GROUP BY Year

UNION ALL

SELECT 
    Year,
    SUM(CAST(Applications AS INT)) AS Total_Study_Applications
FROM [dbo].[migration-study-by-sector-table]
GROUP BY Year;

--Work Trends (Industry + Nationality)
CREATE VIEW vw_Work_Trends AS
SELECT 
    Year,
    SUM(CAST(Applications AS INT)) AS Total_Work_Applications
FROM [dbo].[migration-work-by-Industry-table]
GROUP BY Year

UNION ALL

SELECT 
    Year,
    SUM(CAST(Applications AS INT)) AS Total_Work_Applications
FROM [dbo].[migration-work-by-Industry-table]
GROUP BY Year;


--B. TOP 10 NATIONALITIES (Study + Work)
--1. Study — Top 10 Nationalities
CREATE VIEW vw_Study_Top10_Nationalities AS
SELECT TOP 10 
    Nationality,
    SUM(CAST(Applications AS INT)) AS TotalApplications
FROM [dbo].[migration-study-by-nationality-table]
GROUP BY Nationality
ORDER BY TotalApplications DESC;

--2. Work — Top 10 Nationalities
CREATE VIEW vw_Work_Top10_Nationalities AS
SELECT TOP 10 
    Nationality,
    SUM(CAST(Applications AS INT)) AS TotalApplications
FROM [dbo].[migration-work-by-nationality-table]
GROUP BY Nationality
ORDER BY TotalApplications DESC;


--C. APPLICATION OUTCOMES (Approval, Refusal, Withdrawn)
--STUDY — Outcomes
CREATE VIEW vw_Study_Application_Outcomes AS
SELECT 
    Type_of_application,
    Year,
    SUM(CAST(Applications AS INT)) AS Total
FROM [dbo].[migration-study-by-nationality-table]
GROUP BY Type_of_application, Year;


--WORK — Outcomes
CREATE VIEW vw_Work_Application_Outcomes AS
SELECT 
    Type_of_application,
    Year,
    SUM(CAST(Applications AS INT)) AS Total
FROM [dbo].[migration-work-by-nationality-table]
GROUP BY Type_of_application, Year;

--D. EXTENSIONS (repeat sponsorships)
CREATE VIEW vw_Study_Extensions AS
SELECT 
    Year,
    SUM(CAST(Applications AS INT)) AS Total_Extensions
FROM [dbo].[migration-study-by-nationality-table]
WHERE Type_of_application LIKE '%Extension%'
GROUP BY Year;

CREATE VIEW vw_Work_Extensions AS
SELECT 
    Year,
    SUM(CAST(Applications AS INT)) AS Total_Extensions
FROM [dbo].[migration-work-by-nationality-table]
WHERE Type_of_application LIKE '%Extension%'
GROUP BY Year;


--E. CLEAN COMBINED VIEWS (for Power BI)
--Study — Combined
CREATE VIEW vw_Study_ALL AS
SELECT
    Year,
    Quarter,
    Type_of_application,
    Institution_type_group,
    Institution_type,
    NULL AS Geographical_region,
    NULL AS Nationality,
    Applications
FROM [dbo].[migration-study-by-sector-table]

UNION ALL

SELECT
    Year,
    Quarter,
    Type_of_application,
    Institution_type_group,
    NULL AS Institution_type,
    Geographical_region,
    Nationality,
    Applications
FROM [dbo].[migration-study-by-nationality-table];


--Work: combined view
CREATE VIEW vw_Work_ALL AS
SELECT
    Year,
    Quarter,
    Type_of_application,
    Category_of_leave,
    Industry,
    NULL AS Geographical_region,
    NULL AS Nationality,
    Applications
FROM [dbo].[migration-work-by-industry-table]

UNION ALL

SELECT
    Year,
    Quarter,
    Type_of_application,
    Category_of_leave,
    NULL AS Industry,
    Geographical_region,
    Nationality,
    Applications
FROM [dbo].[migration-work-by-nationality-table];


