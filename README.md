# Data-Analysis-and-Integration---Price-Paid-Data-by-the-UK-Government

Develop a star schema to perform multidimensional analysis on data about the Price Paid Data by the UK Government from 2025, available online on https://www.gov.uk/government/statistical-data-sets/price-paid-data-downloads .

Analyzing certain facts, namely, how much has been sold at each location (at the granularity of town or city) and on each date.
For example, we could analyze the amount of sales by city and date, with the possibility of aggregating up to county and year, if necessary

# Task 01:
Access the Price Paid Data, and download the yearly CSV file for 2025.

Write an SQL script to create a database with a single table in MySQL, to store the data. Also, in that SQL script, write an instruction to load the CSV file into the table.
Note: You may use online resources and the MySQL Reference Manual (for the MySQL version
that you are using) to decide about column names, data types, and the appropriate instructions to load the data into the table. Present the SQL script in text format

# Task 02:
From the database created in the previous step, we can try to get the data at the desired level of granularity. For this purpose, write an SQL query to get the amount of sales by location and date, where location does not need to go below the level of city.
Note: Present the query and (possibly only an excerpt of) the results, sorted by amount, with the largest amount on top.

# Task 03:
Write an SQL script to create a data warehouse (star schema) as a separate database in MySQL.
The requirements are the following:
• The star schema should have one fact table, and two-dimension tables for location and time.
• Location should include the levels of city and above and should use an integer surrogate key.
• Time should have day, month and year.
• Facts should have a measure, and a primary key composed of foreign keys.
Note: The purpose of this script is to define the structure for the data warehouse. The actual data will be populated into the tables through a series of transformations in the next tasks.

# Task 04:
Using Pentaho Data Integration (PDI), develop a transformation to populate the location
dimension.
Note: Present a screenshot of the entire transformation, and screenshots of the configuration window and of the preview window for each step.

# Task 05:
Using PDI, develop a transformation to populate the time dimension.
Note: Present a screenshot of the entire transformation, and screenshots of the configuration window and of the preview window for each step.

# Task 06:
Using PDI, develop a transformation to populate the fact table.
Note: Present a screenshot of the entire transformation, and screenshots of the configuration window and of the preview window for each step.

# Task 07:
Using Pentaho Schema Workbench (PSW), develop an XML cube definition based on your star
schema.
Note: Present a screenshot of tree structure in PSW, and the contents of the XML file.

# Task 08:
Configure Pentaho Server to use that cube and, using Saiku Analytics, present an analysis of the sales amount by month and district, but only for the county of Greater London.
Note: Take a screenshot of the analysis and the results in Saiku Analytics. Also, export the results in Excel (XLS) format.

# Task 09:
Using Pentaho Report Designer (PRD), create a report with the total amount per county in 2025.
However, show only the counties with a total above one billion pounds (i.e. £ 1,000,000,000).
Note: Present the underlying MDX query. Take screenshots of the report in design mode and in preview mode. Export the report in PDF format.

# Task 10:
Download the CSV file for 2024, and write an SQL instruction to append those data to the database table, without erasing the data for 2025. Run your transformations again and, as you try to do this, what would you say are the main bottlenecks? Discuss using your own words.
Note: Present the instructions to load the 2024 data and discuss the observed bottlenecks when running the transformations with the additional data.

# Task 11:
Restart Pentaho Server and, using Saiku Analytics, write an MDX query that shows, for each district of Greater London: the amount of sales for January 2024; the amount of sales for January 2025; and the percent change from January 2024 to January 2025.
Note: Present the underlying MDX query. Take a screenshot of the query and the results in Saiku Analytics. Also, export the results in Excel (XLS) format.

