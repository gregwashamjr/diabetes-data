SELECT 
    specialty_grouped, 
    ROUND(AVG(time_in_hospital), 2) AS avg_stay,
    ROUND(AVG(readmit_30d_flag) * 100, 2) AS readmit_rate_pct
FROM patient_data_cleaned
GROUP BY specialty_grouped
ORDER BY readmit_rate_pct DESC;