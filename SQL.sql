create database hr;
use hr;

-- ===============================================================
-- 📌 PROBLEM: View all data to check import
--    SOLUTION: Select all rows from hr table
-- ===============================================================
SELECT * FROM hr;

-- ===============================================================
-- 📌 PROBLEM: Count total employees
--    SOLUTION: COUNT(*)
-- ===============================================================
SELECT COUNT(*) AS total_employees FROM hr;

-- ===============================================================
-- 📌 PROBLEM: Count employees who left vs stayed
--    SOLUTION: GROUP BY Attrition
-- ===============================================================
SELECT Attrition, COUNT(*) AS count_employees
FROM hr
GROUP BY Attrition;

-- ===============================================================
-- 📌 PROBLEM: Calculate overall Attrition %
--    SOLUTION: AVG(CASE WHEN ...) * 100
-- ===============================================================
SELECT ROUND(AVG(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100, 2) AS attrition_percent
FROM hr;

-- ===============================================================
-- 📌 PROBLEM: Average Monthly Income of employees
--    SOLUTION: AVG(MonthlyIncome)
-- ===============================================================
SELECT ROUND(AVG(MonthlyIncome),2) AS avg_monthly_income
FROM hr;

-- ===============================================================
-- 📌 PROBLEM: Median Monthly Income
--    SOLUTION: PERCENTILE_CONT(0.5)
-- ===============================================================
-- PostgreSQL or MySQL 8+
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY MonthlyIncome) AS median_income
FROM hr;

-- ===============================================================
-- 📌 PROBLEM: Attrition % by Department
--    SOLUTION: GROUP BY Department
-- ===============================================================
SELECT Department,
       ROUND(AVG(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100, 2) AS attrition_percent
FROM hr
GROUP BY Department;

-- ===============================================================
-- 📌 PROBLEM: Attrition % by JobRole
--    SOLUTION: GROUP BY JobRole, ORDER BY descending
-- ===============================================================
SELECT JobRole,
       ROUND(AVG(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100, 2) AS attrition_percent
FROM hr
GROUP BY JobRole
ORDER BY attrition_percent DESC;

-- ===============================================================
-- 📌 PROBLEM: Average Monthly Income by Department
--    SOLUTION: GROUP BY Department
-- ===============================================================
SELECT Department,
       ROUND(AVG(MonthlyIncome),2) AS avg_income
FROM hr
GROUP BY Department;

-- ===============================================================
-- 📌 PROBLEM: Attrition % by Education Field
--    SOLUTION: GROUP BY EducationField
-- ===============================================================
SELECT EducationField,
       COUNT(*) AS num_employees,
       ROUND(AVG(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100,2) AS attrition_percent
FROM hr
GROUP BY EducationField
ORDER BY attrition_percent DESC;

-- ===============================================================
-- 📌 PROBLEM: Correlation between Age and YearsAtCompany
--    SOLUTION: Use CORR()
-- ===============================================================
SELECT CORR(Age, YearsAtCompany) AS age_experience_corr
FROM hr;

-- ===============================================================
-- 📌 PROBLEM: Employees eligible for promotion
--    SOLUTION: Conditional SELECT WHERE YearsAtCompany>5 AND PerformanceRating>=4
-- ===============================================================
SELECT EmployeeName, Department, JobRole, YearsAtCompany, PerformanceRating
FROM hr
WHERE YearsAtCompany > 5 AND PerformanceRating >= 4
ORDER BY PerformanceRating DESC;

-- ===============================================================
-- 📌 PROBLEM: Top 5 highest paid employees who left
--    SOLUTION: WHERE Attrition='Yes' + ORDER BY MonthlyIncome DESC + LIMIT 5
-- ===============================================================
SELECT EmployeeName, Department, JobRole, MonthlyIncome, Attrition
FROM hr
WHERE Attrition='Yes'
ORDER BY MonthlyIncome DESC
LIMIT 5;

-- ===============================================================
-- 📌 PROBLEM: Average Age by JobRole
--    SOLUTION: GROUP BY JobRole
-- ===============================================================
SELECT JobRole, ROUND(AVG(Age),2) AS avg_age
FROM hr
GROUP BY JobRole
ORDER BY avg_age DESC;
