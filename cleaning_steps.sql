USE HRAnalytics;

-- Fix BOM issue if first column name appears as ï»¿Age
ALTER TABLE hr_employee_attrition
CHANGE `ï»¿Age` Age INT;
-- 1. Total Rows
SELECT COUNT(*) AS total_rows FROM hranalytics.`hr_employee_attrition`;

-- 2. Check for NULL or 0 values
SELECT COUNT(*) FROM hranalytics.`hr_employee_attrition` 
WHERE NumCompaniesWorked IS NULL OR TotalWorkingYears IS NULL;

SELECT COUNT(*) FROM hranalytics.`hr_employee_attrition` 
WHERE MonthlyIncome = 0 OR TotalWorkingYears = 0;

-- 3. Replace missing values (if any found)
UPDATE hranalytics.`hr_employee_attrition` SET NumCompaniesWorked = 1 
WHERE NumCompaniesWorked IS NULL;
UPDATE hranalytics.`hr_employee_attrition` SET TotalWorkingYears = 1 
WHERE TotalWorkingYears IS NULL;

-- 4. Drop unnecessary columns (these are constant)
ALTER TABLE hranalytics.`hr_employee_attrition` DROP COLUMN Over18;
ALTER TABLE hranalytics.`hr_employee_attrition` DROP COLUMN StandardHours;
ALTER TABLE hranalytics.`hr_employee_attrition` DROP COLUMN EmployeeCount;

-- 5. Normalize boolean fields
ALTER TABLE hranalytics.`hr_employee_attrition` ADD is_attrition BOOLEAN;
UPDATE hranalytics.`hr_employee_attrition` SET is_attrition = (Attrition = 'Yes');

ALTER TABLE hranalytics.`hr_employee_attrition` ADD is_overtime BOOLEAN;
UPDATE hranalytics.`hr_employee_attrition` SET is_overtime = (OverTime = 'Yes');