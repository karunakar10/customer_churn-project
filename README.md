# Customer Churn Analysis

## About the Project

This project is about analyzing customer churn using Python, SQL and Power BI.

I worked with customer, subscription and support data to understand why customers may leave, how many customers are retained, customer churn risk, subscription plans, customer complaints and the revenue impact of churn.

The main aim of this project was to take the raw data, clean it, analyze it and create useful insights from it.

---

## Dataset

The project contains three datasets:

### Customer
This dataset contains customer details such as:

- Customer ID
- Name
- Country
- State
- Gender
- Date of Birth
- Interests

### Subscription
This dataset contains subscription-related information:

- Customer ID
- Subscription Type
- Plan Type
- Contract Type
- Monthly Charges
- Churn Score
- CLTV

### Support
This dataset contains customer support information:

- Customer ID
- Complaint Date
- CSAT Score
- Escalations
- Comments

I used `CustomerID` to connect the three datasets.

---

## What I Did in This Project

### 1. Data Cleaning

First, I checked and cleaned the datasets before starting the analysis.

Some of the main steps were:

- Checking missing values
- Handling missing values
- Standardizing gender values
- Converting date columns
- Removing unnecessary columns
- Checking data types
- Combining the datasets using CustomerID

### 2. Python Analysis

I used Python for data cleaning, analysis and visualization.

Libraries used:

- Pandas
- NumPy
- Matplotlib
- Seaborn

I analyzed:

- Customer churn
- Customer retention
- Subscription plans
- Churn score
- Churn risk
- Customer tenure
- Customer complaints
- CSAT scores
- Escalations
- Monthly churn
- Revenue impact

I also created two important features:

- Customer Churn
- Churn Risk

Customers were classified into Low, Medium and High risk based on their churn score.

---

## SQL Analysis

I also used SQL to analyze the customer, subscription and support data.

I practiced and used different SQL concepts such as:

- SELECT
- DISTINCT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- CASE WHEN
- Aggregate functions
- Joins
- Subqueries
- CTEs
- Window functions

For window functions, I used:

- ROW_NUMBER
- RANK
- DENSE_RANK
- LAG
- LEAD
- FIRST_VALUE
- LAST_VALUE
- NTILE
- PERCENT_RANK

I also worked on running totals, cumulative calculations, rankings and percentage analysis.

---

## Main KPIs

Some of the main results from the analysis were:

| KPI | Value |
|---|---:|
| Churn Rate | 28.57% |
| Retention Rate | 71.43% |
| Average Tenure | 1,520.14 days |
| Churn-related Revenue Loss | 73.94K |

---

## Power BI Dashboard

After completing the analysis, I created a Power BI dashboard to present the results.

The dashboard contains analysis related to:

- Churn
- Retention
- Churn Risk
- Subscription
- Customer Support
- CSAT
- Revenue

The dashboard helps to view the important results in a simple and interactive way.

---

## Project Workflow

```text
Raw Data
   ↓
Data Cleaning
   ↓
Data Preparation
   ↓
Combine Tables
   ↓
Python Analysis
   ↓
SQL Analysis
   ↓
KPI Analysis
   ↓
Power BI Dashboard
