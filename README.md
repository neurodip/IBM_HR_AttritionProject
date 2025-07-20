# HR Employee Attrition Analysis Using MySQL

A complete data cleaning and analysis project using the IBM HR Employee Attrition dataset. The goal is to clean, transform, and generate meaningful HR insights that help understand employee attrition patterns using structured SQL queries.

---

##  Project Objective

* Understand and analyze patterns behind employee attrition.
* Clean and normalize raw HR data for consistent use.
* Explore relationships between variables like job role, overtime, age, and attrition.

---

##  Dataset Overview

* **Source**: IBM HR Analytics Employee Attrition Dataset
* **Rows**: 1,470
* **Columns**: 35
* **Main Table**: `hr_employee_attrition`

| Attribute         | Description                        |
| ----------------- | ---------------------------------- |
| Age               | Employee age                       |
| Attrition         | Whether the employee left (Yes/No) |
| JobRole           | Employee's job position            |
| MonthlyIncome     | Monthly salary                     |
| OverTime          | Whether employee works overtime    |
| TotalWorkingYears | Years of experience                |
| EducationField    | Field of academic education        |
| DistanceFromHome  | Distance in kilometers from work   |

> Some columns like `Over18`, `StandardHours`, and `EmployeeCount` had constant values and were dropped.

---

##  Tools & Technologies Used

* **Database**: MySQL 8+
* **Language**: SQL
* **Platform**: MySQL Workbench / CLI
* **Dataset Source**: IBM (via third-party repositories)

---

##  Data Cleaning Summary

| Step                    | Description                                                       |
| ----------------------- | ----------------------------------------------------------------- |
|  BOM Fix               | Renamed `ï»¿Age` to `Age` due to encoding issues                  |
|  Null Imputation       | Replaced missing `NumCompaniesWorked`, `TotalWorkingYears` with 1 |
|  Removed Constant Cols | Dropped `Over18`, `StandardHours`, `EmployeeCount`                |
|  Boolean Mapping       | Created `is_attrition` and `is_overtime` columns                  |

---

##  Key Analysis Performed

* Total attrition rate in the company
* Attrition breakdown by job role
* Attrition vs. age group (<30, 30-40, 40-50, 50+)
* Impact of overtime on attrition
* Income & experience comparison: attrited vs. non-attrited
* Distance from home & attrition risk
* Education fields with highest attrition

---

##  Insights Highlights

* **Younger employees (<30)** and those working **overtime** showed higher attrition rates.
* **Sales Executive** and **Laboratory Technician** roles had the highest attrition.
* Employees with **higher monthly income and more experience** were more likely to stay.
* Long **commute distance** also had a notable correlation with attrition.

---

##  Project Structure

```
hr_employee_analytics_project/
├── data/
│   └── HR_Employee_Attrition.csv
├── sql/
│   ├── create_tables.sql
│   ├── cleaning_steps.sql
│   └── analysis_queries.sql
├── report/
│   └── hr_attrition_analysis_report.pdf
├── README.md
```
## Conclusion
This project demonstrates how structured SQL queries can uncover meaningful HR insights from raw employee data. By analyzing factors such as age, overtime, income, and commute distance, we gain a deeper understanding of employee attrition. These insights can guide HR teams in shaping retention strategies and improving workplace satisfaction.
