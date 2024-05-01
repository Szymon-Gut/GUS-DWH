# Data Warehouse feeded by GUS data for efficient data analysis of historic data. 

### Project Goal
Goal of this project was to prepare ready to use Data Warehouse system, including designing the data warehouse, feeding this with data using designed ETL process and at the top of the data warehouse, build buisseness inteligence system to in an elegant way, visualize statistics for further analysis.


### Short guide to first-time warehouse setup
STEP 1:

Run the dbo_creation.sql script to create a data warehouse

Run date_feed.sql script to feed Date Dimension in created Data Warehouse

STEP 2:

Open eu_funds_generation.ipynb notebook and execute every cell. This is necesarry to add artificial generated additional FactTable of EU donations to match project requirements. 

STEP 3:

Run the dwh_project_etl/LoadDimensions.dtsx package in SSIS to load, process and store data inside the data warehouse.

After these steps the warehouse should be ready to use for reports etc.

### Important notes 
Additional informations about buissenes requirements, data (and it's copyrights) which was used to populate the data warehouse, executed tests to check correctness of executed ETL pipeline and a lot more, can be found in dokumentacja.pdf (unfortunatelly written only in polish).
In the file raportowanie_dwh_project.pbix and .pdf you can find buissenes raport in PowerBI and pdf format.

### Raport view
![image](https://github.com/Szymon-Gut/GUS-DWH/assets/72514490/a00ac087-cad4-47e5-bb28-561bd628a9ab)

![image](https://github.com/Szymon-Gut/GUS-DWH/assets/72514490/3ffdb093-559a-48bc-8237-cc09f3a96b31)

![image](https://github.com/Szymon-Gut/GUS-DWH/assets/72514490/ea33575e-7e1a-495d-8aa7-893f8285b173)

![image](https://github.com/Szymon-Gut/GUS-DWH/assets/72514490/8d966445-e88a-4854-84a8-1f0438e3c03d)

*Project was developed for Data Warehouses and Buisseness Inteligence classes at Warsaw University of Technology*
