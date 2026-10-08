# Automotive Service Plan Profitability Analysis

## Project Overview

This portfolio project analyses automotive service plan performance using SQL and Power BI.

The objective is to understand service plan revenue, service costs and profitability, identify the main cost drivers, and provide business recommendations to improve plan profitability.

The project uses synthetic automotive service plan data created for portfolio purposes.

## Business Questions

The analysis explores:

- How many service plans were sold and how much revenue was generated?
- How does profitability differ across service plan types?
- Which plan types are generating losses?
- Which vehicle models have the highest service costs?
- What are the main labour and parts cost drivers?
- Which vehicle models and plan types create the greatest profitability pressure?
- How does profitability vary across dealers?
- Does service frequency appear to influence service costs?
- Where should management focus cost control and pricing reviews?

## Tools & Technologies

- *SQL* — business analysis and data exploration
- *Power BI* — interactive dashboard development
- *Power Query* — data cleaning and transformation
- *DAX* — calculated measures and profitability metrics
- *Excel* — supporting data preparation

## Data Preparation

The synthetic dataset was deliberately created with realistic data-quality challenges, including:

- Duplicate records
- Missing dealer information
- Missing plan type information
- Missing mileage values
- Missing parts cost values
- Inconsistent text formatting
- An unusual negative labour-cost value requiring investigation

Data was reviewed and cleaned using Power Query before being analysed in Power BI.

Missing categorical values that could not be reliably derived were classified as Unknown rather than being guessed.

Financial relationships were also validated, including:

- Total Service Cost = Labour Cost + Parts Cost
- Profit = Total Revenue - Total Service Cost

## SQL Analysis

SQL was used to investigate:

1. Overall plan sales and revenue
2. Profitability by plan type
3. Average revenue and service cost
4. Loss-making plan types
5. Vehicle model service costs
6. Labour versus parts cost drivers
7. Vehicle model and plan type profitability
8. Orion GT cost drivers
9. Unknown plan type and data-quality issues
10. Dealer profitability

The complete SQL analysis is available in:

automotive_service_plan_profitability_analysis.sql

## Power BI Dashboard

### 1. Executive Overview

Provides a high-level view of:

- Total service plans
- Total revenue
- Total service cost
- Total profit
- Overall profit margin
- Revenue versus service cost by vehicle model
- Profitability by plan type
- Average service cost by vehicle model

### 2. Vehicle & Plan Profitability

Examines profitability and service-cost pressure across:

- Vehicle models
- Plan types
- Service volume
- Service cost
- Profitability

The analysis highlights the relationship between service frequency and service costs.

### 3. Overall Profitability & Recommendations

Provides an overall profitability assessment and highlights:

- Dealer profitability
- Profit margin by plan type
- Key financial findings
- Recommended areas for management review

## Key Findings

- The service plan portfolio generated approximately *£2.25M in revenue* against approximately *£2.42M in service costs*.
- Overall portfolio profit was approximately *-£210K*, resulting in an overall negative profit margin.
- *All vehicle models were loss-making*, indicating that profitability pressure was portfolio-wide rather than isolated to one model.
- *Venture* recorded the largest absolute vehicle-model loss.
- *Falcon X2* had high service frequency and relatively high average cost per service, making it an important area for profitability review.
- *Comprehensive* plans were profitable, while other major plan types generated losses.
- Dealer profitability varied considerably, indicating opportunities for targeted pricing and cost reviews.
- Service costs generally increased with service volume, highlighting service frequency as an important profitability driver.

## Business Recommendations

Based on the analysis:

1. Review pricing and coverage assumptions for loss-making service plans.
2. Investigate high-cost vehicle models and recurring maintenance cost drivers.
3. Assess whether service frequency and plan duration are appropriately reflected in plan pricing.
4. Review labour and parts costs separately to identify opportunities for cost control.
5. Monitor profitability by plan type, vehicle model and dealer.
6. Investigate records classified as Unknown to improve data quality and reporting accuracy.

## Project Files

| File | Description |
|---|---|
| Automotive Service Plan Profitability.pbix | Power BI dashboard |
| automotive_service_plan_profitability_analysis.sql | SQL business analysis |
| Executive Overview.PNG | Executive dashboard |
| Vehicle & Plan Profitability.PNG | Vehicle and plan profitability analysis |
| Overall Profitability & Recommendations.PNG | Overall profitability and recommendations |

## Skills Demonstrated

- SQL querying
- Data cleaning and validation
- Business analysis
- Profitability analysis
- Cost-driver analysis
- Power Query
- Power BI data modelling
- DAX measures
- Data visualisation
- Business storytelling
- Translating data into actionable recommendations

## Data Disclaimer

*This project uses synthetic/demo data created for portfolio and learning purposes. It does not contain confidential, proprietary, customer, or employer data.*

---

*Portfolio Project | Automotive After-Sales / Service Plan Analytics*
