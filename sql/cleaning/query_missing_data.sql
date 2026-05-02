SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN race = '?' THEN 1 ELSE 0 END) AS missing_race,
    SUM(CASE WHEN weight = '?' THEN 1 ELSE 0 END) AS missing_weight,
    SUM(CASE WHEN medical_specialty = '?' THEN 1 ELSE 0 END) AS missing_specialty,
    SUM(CASE WHEN diag_1 = '?' THEN 1 ELSE 0 END) AS missing_diag
FROM patient_data;
