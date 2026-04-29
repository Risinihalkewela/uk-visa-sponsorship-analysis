# Trends and Policy Impacts in UK Study and Work Visa Sponsorships 🇬🇧

This project analyzes **UK Home Office migration datasets** to uncover trends in study and work visa sponsorships. Using **SQL Server** for data cleaning and **Power BI** for visualization, the project delivers interactive dashboards that highlight policy impacts, nationality patterns, and sectoral differences.

## 📊 Datasets
- Source: [UK Government Open Data Portal](https://data.gov.uk)
- Series: Managed Migration – Historic Datasets
- Files: Study Sponsorship (CAS) & Work Sponsorship (CoS)
- Format: CSV/Excel

## ⚙️ Methodology
1. **Data Cleaning (SQL Server):**
   - Fixed data types, removed nulls, standardized categories
   - Created aggregation views for sponsorship trends
2. **Power BI Transformation:**
   - Unpivoted year fields, renamed attributes
   - Defined calculated fields & DAX measures
3. **Dashboard Development:**
   - Multi-page interactive dashboards
   - Slicers for nationality, institution type, year
   - Visuals: line charts, bar charts, decomposition trees, treemaps

## 🚀 Results
- **Study Visa Dashboard:**
  - Trends in applications & extensions
  - Outcomes by sector and nationality
- **Work Visa Dashboard:**
  - Industry distribution of sponsorships
  - Application outcomes & extension patterns
- **Key Insights:**
  - Policy changes directly impact application volumes
  - Nationality trends reveal shifting migration behavior
  - Sectoral differences highlight workforce demand

## 🛠️ Tech Stack
- SQL Server (ETL, cleaning, aggregation)
- Power BI (DAX, dashboards, interactive visuals)
- Power Query Editor



✨ *This project demonstrates a complete end-to-end workflow: SQL data preparation → Power BI dashboards → actionable migration insights.*
