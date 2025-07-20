-- Total Employees & Attrition
SELECT COUNT(*) AS total, SUM(is_attrition) AS attrited, ROUND(SUM(is_attrition)/COUNT(*)*100, 2) AS attrition_rate
FROM hranalytics.`hr_employee_attrition`;

-- Attrition by Job Role
SELECT JobRole, COUNT(*) AS total, SUM(is_attrition) AS attrited,
ROUND(SUM(is_attrition)/COUNT(*)*100, 2) AS attrition_rate
FROM hranalytics.`hr_employee_attrition`
GROUP BY JobRole
ORDER BY attrition_rate DESC;

-- Attrition by Age Group
SELECT 
  CASE 
    WHEN Age < 30 THEN '<30'
    WHEN Age BETWEEN 30 AND 40 THEN '30-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    ELSE '50+' END AS age_group,
  COUNT(*) AS total, SUM(is_attrition) AS attrited,
  ROUND(SUM(is_attrition)/COUNT(*)*100, 2) AS attrition_rate
FROM hranalytics.`hr_employee_attrition`
GROUP BY age_group;

-- Attrition by Overtime
SELECT is_overtime, COUNT(*) AS total, SUM(is_attrition) AS attrited,
ROUND(SUM(is_attrition)/COUNT(*)*100, 2) AS attrition_rate
FROM hranalytics.`hr_employee_attrition`
GROUP BY is_overtime;

-- Monthly Income Comparison
SELECT 
  is_attrition,
  ROUND(AVG(MonthlyIncome), 2) AS avg_income,
  ROUND(AVG(TotalWorkingYears), 2) AS avg_experience
FROM hranalytics.`hr_employee_attrition`
GROUP BY is_attrition;

-- Attrition by Distance from Home
SELECT DistanceFromHome, COUNT(*) AS total, SUM(is_attrition) AS attrited,
ROUND(SUM(is_attrition)/COUNT(*)*100, 2) AS attrition_rate
FROM hranalytics.`hr_employee_attrition`
GROUP BY DistanceFromHome
ORDER BY attrition_rate DESC
LIMIT 10;

-- Attrition by Education Field
SELECT EducationField, COUNT(*) AS total, SUM(is_attrition) AS attrited,
ROUND(SUM(is_attrition)/COUNT(*)*100, 2) AS attrition_rate
FROM hranalytics.`hr_employee_attrition`
GROUP BY EducationField
ORDER BY attrition_rate DESC;