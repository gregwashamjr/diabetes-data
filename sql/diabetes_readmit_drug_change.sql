SELECT 
    diabetesmed,
    change,
    COUNT(*) AS total_patients,
    ROUND(AVG(readmit_30d_flag) * 100, 2) AS readmit_rate
FROM patient_data_cleaned
WHERE diag_1 LIKE '250%' -- Focus only on the high-risk Diabetes group
GROUP BY 1, 2
ORDER BY readmit_rate DESC;