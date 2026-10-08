-- How many plans was sold and what was the total revenue genrated

--SELECT COUNT(Plan_ID) AS Total_plan_sold, Sum(Total_revenue) AS Total_Revenue_Generated
--FROM service_plans;

-- How does profitability differ across the different service plan types 
SELECT 
COUNT(Plan_ID) AS Total_plan_sold, 
Sum(Total_revenue) AS Total_Revenue_Generated,
sum(Total_Service_Cost) AS Total_service_cost,
sum(Profit) AS Total_profit, Plan_Type
FROM service_plans
Group BY Plan_Type
order BY Total_plan_sold DESC, profit ASC;

--For each Plan type, what is the average revenue per pan and the avaerage cost per paln?

SELECT 
COUNT(Plan_ID) AS Total_plan_sold, 
avg(Total_Revenue) AS Average_Revenue,
avg(Total_Service_Cost) AS Average_Service_cost, Plan_Type
FROM service_plans
Group BY Plan_Type
order BY  Average_Service_cost desc;

--Which individual service plan are losing Money?

select 
Count(plan_ID) AS total_Plan_Sold,
Sum(Profit) AS Total_Profit,
plan_Type
FROM Service_plans
Group BY Plan_type
ORDER BY Total_Profit desc;

--WHICH VEHICEL MODELS ARE THE MOST EXPENSIVE TO SERVICE

SELECT
COUNT (plan_ID) AS Total_PLan_Sold,
Vehicle_Model,
SUM(Total_Service_Cost) AS Total_Service_Cost,
AVG(Total_service_Cost) AS Average_Service_Cost,
Plan_type, 
SUM(Number_of_Services)AS Total_Number_of_service
FROM service_plans
Group BY Vehicle_Model
ORDER BY Total_Service_Cost DESC;

--WHICH Plan type Contributes most to  Orion GT High Average Cost?

SELECT
COUNT (plan_ID) AS Total_PLan_Sold,
SUM(Total_Service_Cost) AS Total_Service_Cost,
AVG(Total_service_Cost) AS Average_Service_Cost,
Vehicle_Model, Plan_type, 
SUM(Number_of_Services)AS Total_Number_of_service
FROM service_plans
WHERE Vehicle_Model = 'Orion Gt'
Group BY Plan_type
ORDER BY Total_Service_Cost DESC;

--Which vehice model is driving the service cost of standard pans 

SELECT
COUNT (plan_ID) AS Total_PLan_Sold,
SUM(Total_Service_Cost) AS Total_Service_Cost,
AVG(Total_service_Cost) AS Average_Service_Cost,
Vehicle_Model, Plan_type, 
SUM(Number_of_Services)AS Total_Number_of_service
FROM service_plans
WHERE  Plan_Type= 'Standard'
Group BY Vehicle_Model
ORDER BY Total_Service_Cost DESC;

-- For each Vehicle Model + Plan Type Combination, what are the Total Plan sold,
--total revenue , total service cost, total profit, and percentage loss ratio

SELECT 
COUNT(Plan_ID) AS total_Plan_Sold,
SUM(Total_Revenue) AS Total_Revenue,
SUM(Total_Service_Cost) AS Total_Service_Cost,
AVG(Total_service_Cost) AS Average_Service_Cost,
Sum(Profit) AS Total_Profit,
ROUND(sum( Total_service_cost) / sum(Total_Revenue) * 100, 2) AS Loss_Ratio_percent,
Vehicle_Model, Plan_type
FROM Service_plans
Group BY Vehicle_Model, Plan_Type
ORDER BY Total_Service_Cost DESC;


--WHy the combination of previous finding is generating such high service cost?


SELECT 
COUNT(Plan_ID) AS total_Plan_Sold,
SUM(Number_of_Services)AS Total_Number_of_service,
SUM(Labour_Cost) AS Total_Labour_Cost,
SUM(Parts_Cost) AS Total_Parts_Cost,
SUM(Total_Service_Cost) AS Total_Service_Cost,
AVG(Total_service_Cost) AS Average_Service_Cost,
Vehicle_Model, Plan_type
FROM Service_plans
Group BY Vehicle_Model, Plan_Type
ORDER BY Parts_Cost DESC, Number_of_Services DESC;


--Check

SELECT 
COUNT(Plan_ID) AS total_Plan_Sold,
SUM(Number_of_Services)AS Total_Number_of_service,
SUM(Labour_Cost) AS Total_Labour_Cost,
SUM(Parts_Cost) AS Total_Parts_Cost,
SUM(Total_Service_Cost) AS Total_Service_Cost,
AVG(Total_service_Cost) AS Average_Service_Cost,
AVG(Parts_Cost) AS Average_Parts_Cost,
AVG(Labour_Cost) AS Average_Labour_Cost,
Plan_Type
FROM Service_plans
Group BY Plan_Type
ORDER BY AVerage_Service_Cost DESC;

-- Investigating unknon service plan type 

SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Labour_Cost) AS Average_Labour_Cost,
    AVG(Parts_Cost) AS Average_Parts_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost
FROM Service_Plans
WHERE Plan_Type = 'Unknown'
GROUP BY Plan_Type;

-- Investigating unknon service plan type 

SELECT
    Plan_ID,
    Vehicle_Model,
    Number_of_Services,
    Labour_Cost,
    Parts_Cost,
    Total_Service_Cost,
    Total_Revenue,
    Profit
FROM Service_Plans
WHERE Plan_Type = 'Unknown'
ORDER BY Total_Service_Cost DESC;

--within Unkown plan types, which vehicle model has the highest average service cost

SELECT
    Vehicle_Model,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Number_of_Services) AS Total_Number_of_Services,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    AVG(Labour_Cost) AS Average_Labour_Cost,
    AVG(Parts_Cost) AS Average_Parts_Cost,
    AVG(Total_Service_Cost) AS Average_Service_Cost
FROM Service_Plans
WHERE Plan_Type = 'Unknown'
GROUP BY Vehicle_Model
ORDER BY Average_Service_Cost DESC;

---check

SELECT
    Vehicle_Model,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    ROUND(
        SUM(Total_Service_Cost) / SUM(Number_of_Services),
        2
    ) AS Cost_Per_Service,
    SUM(Profit) AS Total_Profit
FROM service_plans
GROUP BY Vehicle_Model
ORDER BY Cost_Per_Service DESC;


-- What is making each service expensive 

SELECT
    Vehicle_Model,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,

    ROUND(
        SUM(Labour_Cost) / SUM(Number_of_Services),
        2
    ) AS Labour_Cost_Per_Service,

    ROUND(
        SUM(Parts_Cost) / SUM(Number_of_Services),
        2
    ) AS Parts_Cost_Per_Service,

    ROUND(
        SUM(Total_Service_Cost) / SUM(Number_of_Services),
        2
    ) AS Total_Cost_Per_Service

FROM service_plans

GROUP BY Vehicle_Model

ORDER BY Total_Cost_Per_Service DESC;

--ORION GT 

SELECT
    plan_Type,
    Vehicle_Model,
    SUM(Number_of_Services) AS Total_Services,
    SUM(Labour_Cost) AS Total_Labour_Cost,
    SUM(Parts_Cost) AS Total_Parts_Cost,
    SUM(Total_Service_Cost) AS Total_Service_Cost,

    ROUND(
        SUM(Labour_Cost) / SUM(Number_of_Services),
        2
    ) AS Labour_Cost_Per_Service,

    ROUND(
        SUM(Parts_Cost) / SUM(Number_of_Services),
        2
    ) AS Parts_Cost_Per_Service,

    ROUND(
        SUM(Total_Service_Cost) / SUM(Number_of_Services),
        2
    ) AS Total_Cost_Per_Service

FROM service_plans

WHERE Vehicle_Model = 'Orion Gt'

GROUP BY Plan_Type

ORDER BY Total_Cost_Per_Service DESC;


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
GROUP BY Plan_ID
ORDER BY Total_Service_Cost DESC;


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
ORDER BY Total_Profit DESC;


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


SELECT 
   Dealer,
   COUNT(Plan_ID) AS Total_Plans,
   SUM(Total_Revenue) AS Total_Revenue,
   SUM(Total_Service_Cost) AS Total_Service_Cost
   FROM service_plans
   GROUP BY Dealer
   ORDER BY Total_Revenue DESC;


SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plans,
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Total_Revenue), 0) * 100,
        2
    ) AS Profit_Margin_Percent
FROM service_plans
GROUP BY Plan_Type
ORDER BY  Profit_Margin_Percent DESC;



SELECT
    Plan_Type,
    COUNT(Plan_ID) AS Total_Plan_Sold,
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(Total_Service_Cost) AS Total_Service_Cost,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) / NULLIF(SUM(Total_Revenue), 0) * 100
        AS Profit_Margin_Percent
FROM service_plans
GROUP BY Plan_Type
ORDER BY Total_Service_Cost DESC;



