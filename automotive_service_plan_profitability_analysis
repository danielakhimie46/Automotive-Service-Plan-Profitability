-
-- Automotive Service Plan Profitability Analysis
-- SQL Business Analysis | Synthetic/Demo Data
-- ============================================================
-- Purpose:
-- Analyse service-plan sales, revenue, service costs and profitability
-- to identify the main financial and operational cost drivers.
--
-- Dataset/Table: service_plans
-- Tool: SQL (SQLite)



-
-- 1. OVERALL PLAN SALES & REVENUE


-- How many plans were sold and what was the total revenue generated?

SELECT
    COUNT(Plan_ID) AS Total_Plans_Sold,
    SUM(Total_Revenue) AS Total_Revenue_Generated
FROM service_plans;



-- 2. PROFITABILITY BY PLAN TYPE


-- How does profitability differ across service plan types?

SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans_Sold,
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    SUM(Profit) AS Total_Profit
FROM service_plans
GROUP BY Plan_Type
ORDER BY Total_Plans_Sold DESC, Total_Profit ASC;


-- What is the average revenue and average service cost per plan type?

SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans_Sold,
    AVG(Total_Revenue) AS Average_Revenue,
    AVG(Total_Service_Cost) AS Average_Service_Cost
FROM service_plans
GROUP BY Plan_Type
ORDER BY Average_Service_Cost DESC;


-- Which plan types are generating losses?

SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans_Sold,
    SUM(Profit) AS Total_Profit
FROM service_plans
GROUP BY Plan_Type
ORDER BY Total_Profit ASC;


-- What is the profit margin for each plan type?

SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Total_Revenue), 0) * 100,
        2
    ) AS Profit_Margin_Percent
FROM service_plans
GROUP BY Plan_Type
ORDER BY Profit_Margin_Percent DESC;


-
-- 3. VEHICLE MODEL SERVICE COST ANALYSIS


-- Which vehicle models are the most expensive to service?

SELECT
    Vehicle_Model,
    COUNT(Plan_ID) AS Total_Plans_Sold,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost,
    SUM(Number_of_Services) AS Total_Services
FROM service_plans
GROUP BY Vehicle_Model
ORDER BY Total_Service_Cost DESC;


-- What is the average service cost per plan by vehicle model?

SELECT
    Vehicle_Model,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    ROUND(
        SUM(Total_Service_Cost) / NULLIF(COUNT(Plan_ID), 0),
        2
    ) AS Average_Service_Cost
FROM service_plans
GROUP BY Vehicle_Model
ORDER BY Total_Service_Cost DESC;


-- What is the average cost per service by vehicle model?

SELECT
    Vehicle_Model,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    ROUND(
        SUM(Total_Service_Cost) / NULLIF(SUM(Number_of_Services), 0),
        2
    ) AS Cost_Per_Service,
    SUM(Profit) AS Total_Profit
FROM service_plans
GROUP BY Vehicle_Model
ORDER BY Cost_Per_Service DESC;


-
-- 4. SERVICE COST DRIVERS: LABOUR VS PARTS


-- What is making each service expensive?

SELECT
    Vehicle_Model,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    ROUND(
        SUM(Labour_Cost) / NULLIF(SUM(Number_of_Services), 0),
        2
    ) AS Labour_Cost_Per_Service,
    ROUND(
        SUM(Parts_Cost) / NULLIF(SUM(Number_of_Services), 0),
        2
    ) AS Parts_Cost_Per_Service,
    ROUND(
        SUM(Total_Service_Cost) / NULLIF(SUM(Number_of_Services), 0),
        2
    ) AS Total_Cost_Per_Service
FROM service_plans
GROUP BY Vehicle_Model
ORDER BY Total_Cost_Per_Service DESC;


-- 5. VEHICLE MODEL + PLAN TYPE ANALYSIS


-- For each vehicle model and plan type combination:
-- analyse volume, revenue, service cost, profit and cost-to-revenue ratio.

SELECT
    Vehicle_Model,
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans_Sold,
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Total_Service_Cost) / NULLIF(SUM(Total_Revenue), 0) * 100,
        2
    ) AS Service_Cost_to_Revenue_Percent
FROM service_plans
GROUP BY Vehicle_Model, Plan_Type
ORDER BY Total_Service_Cost DESC;


-- Which vehicle models are driving the cost of Standard plans?

SELECT
    Vehicle_Model,
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans_Sold,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost,
    SUM(Number_of_Services) AS Total_Services
FROM service_plans
WHERE Plan_Type = 'Standard'
GROUP BY Vehicle_Model
ORDER BY Total_Service_Cost DESC;


-
-- 6. ORION GT DEEP DIVE


-- Which plan type contributes most to Orion GT's service cost?

SELECT
    Plan_Type,
    Vehicle_Model,
    COUNT(Plan_ID) AS Total_Plans_Sold,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost,
    SUM(Number_of_Services) AS Total_Services
FROM service_plans
WHERE Vehicle_Model = 'Orion Gt'
GROUP BY Plan_Type
ORDER BY Total_Service_Cost DESC;


-- What is driving Orion GT's cost per service?

SELECT
    Plan_Type,
    Vehicle_Model,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    ROUND(
        SUM(Labour_Cost) / NULLIF(SUM(Number_of_Services), 0),
        2
    ) AS Labour_Cost_Per_Service,
    ROUND(
        SUM(Parts_Cost) / NULLIF(SUM(Number_of_Services), 0),
        2
    ) AS Parts_Cost_Per_Service,
    ROUND(
        SUM(Total_Service_Cost) / NULLIF(SUM(Number_of_Services), 0),
        2
    ) AS Total_Cost_Per_Service
FROM service_plans
WHERE Vehicle_Model = 'Orion Gt'
GROUP BY Plan_Type
ORDER BY Total_Cost_Per_Service DESC;


-- Review individual Orion GT plans with Unknown plan type.

SELECT
    Plan_ID,
    Vehicle_Model,
    Number_of_Services,
    Labour_Cost,
    Parts_Cost,
    Total_Service_Cost
FROM service_plans
WHERE Plan_Type = 'Unknown'
  AND Vehicle_Model = 'Orion Gt'
ORDER BY Total_Service_Cost DESC;


-- Compare Orion GT profitability across plan types.

SELECT
    Vehicle_Model,
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost,
    SUM(Profit) AS Total_Profit
FROM service_plans
WHERE Vehicle_Model = 'Orion Gt'
GROUP BY Vehicle_Model, Plan_Type
ORDER BY Average_Service_Cost DESC;



-- 7. UNKNOWN PLAN TYPE / DATA QUALITY INVESTIGATION


-- Investigate the Unknown plan type.

SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Labour_Cost) AS Average_Labour_Cost,
    AVG(Parts_Cost) AS Average_Parts_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost
FROM service_plans
WHERE Plan_Type = 'Unknown'
GROUP BY Plan_Type;


-- Review individual records classified as Unknown.

SELECT
    Plan_ID,
    Vehicle_Model,
    Number_of_Services,
    Labour_Cost,
    Parts_Cost,
    Total_Service_Cost,
    Total_Revenue,
    Profit
FROM service_plans
WHERE Plan_Type = 'Unknown'
ORDER BY Total_Service_Cost DESC;


-- Within Unknown plan types, which vehicle model has the highest average cost?

SELECT
    Vehicle_Model,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Labour_Cost) AS Average_Labour_Cost,
    AVG(Parts_Cost) AS Average_Parts_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost
FROM service_plans
WHERE Plan_Type = 'Unknown'
GROUP BY Vehicle_Model
ORDER BY Average_Service_Cost DESC;



-- 8. COST BREAKDOWN BY PLAN TYPE


-- Compare labour, parts and service cost across plan types.

SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Labour_Cost) AS Average_Labour_Cost,
    AVG(Parts_Cost) AS Average_Parts_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost
FROM service_plans
GROUP BY Plan_Type
ORDER BY Average_Service_Cost DESC;


-- 9. DEALER PROFITABILITY


-- Compare revenue and service cost across dealers.

SELECT
    Dealer,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    SUM(Profit) AS Total_Profit
FROM service_plans
GROUP BY Dealer
ORDER BY Total_Revenue DESC;


-- Compare dealer profitability margins.

SELECT
    Dealer,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Total_Revenue), 0) * 100,
        2
    ) AS Profit_Margin_Percent
FROM service_plans
GROUP BY Dealer
ORDER BY Profit_Margin_Percent DESC;



-- END OF ANALYSIS

-- Key business themes explored:
-- 1. Plan volume and revenue
-- 2. Profitability by plan type
-- 3. Vehicle model service costs
-- 4. Labour vs parts cost drivers
-- 5. Vehicle model + plan type profitability
-- 6. Orion GT cost deep dive
-- 7. Unknown plan type/data quality investigation
-- 8. Dealer profitability

