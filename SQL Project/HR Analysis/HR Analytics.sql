SELECT * FROM hrdata

SELECT SUM(employee_count) AS Employee_Count
FROM hrdata

SELECT COUNT(attrition)AS Attrition_Count
FROM hrdata WHERE attrition = 'Yes'

SELECT 
    ROUND((CAST((SELECT COUNT(attrition)
    FROM hrdata WHERE attrition = 'Yes') AS FLOAT)/SUM(employee_count)) * 100, 2) AS Attrition_Rate
FROM hrdata

SELECT
    SUM(employee_count)-(SELECT COUNT(attrition) FROM hrdata
    WHERE attrition = 'Yes') AS Active_Employee
FROM hrdata

SELECT
    ROUND(AVG(age),0) AS Average_Age
FROM hrdata

SELECT gender,
    COUNT(attrition) AS Attrition_Count FROM hrdata
WHERE attrition = 'Yes'
GROUP BY
    gender
ORDER BY
    COUNT(attrition) DESC

SELECT age,
    SUM(employee_count) AS Employee_Count
FROM hrdata
GROUP BY
    age
ORDER BY
    age

SELECT education_field,
    COUNT(attrition) AS Attrition_Count
    FROM hrdata
WHERE attrition = 'Yes'
GROUP BY
    education_field
ORDER BY
    COUNT(attrition) DESC

SELECT age_band,
    gender,COUNT(attrition) AS Attrition,
        ROUND((CAST(COUNT(attrition) AS NUMERIC)/(SELECT COUNT(attrition) FROM hrdata
        WHERE attrition = 'Yes'))*100,2) AS pct
    FROM hrdata
Where attrition = 'Yes'
GROUP BY
    age_band,gender
ORDER BY
    age_band,gender DESC

SELECT
    job_role,
        SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS [One],
        SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS [Two],
        SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS [Three],
        SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS [Four]
    FROM hrdata
GROUP BY
    job_role
ORDER BY
    job_role