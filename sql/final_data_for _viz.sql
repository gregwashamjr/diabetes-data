SELECT 
    race, gender, age, 
    specialty_grouped, 
    CASE 
        WHEN diag_1 LIKE '250%' THEN 'Diabetes'
        WHEN diag_1 ~ '^[VE]' THEN 'Other (Injury/External)'
        WHEN diag_1 ~ '^[0-9]+' AND diag_1::numeric BETWEEN 390 AND 459 OR diag_1 = '785' THEN 'Circulatory'
        WHEN diag_1 ~ '^[0-9]+' AND diag_1::numeric BETWEEN 460 AND 519 OR diag_1 = '786' THEN 'Respiratory'
        WHEN diag_1 ~ '^[0-9]+' AND diag_1::numeric BETWEEN 520 AND 579 OR diag_1 = '787' THEN 'Digestive'
        WHEN diag_1 ~ '^[0-9]+' AND diag_1::numeric BETWEEN 800 AND 999 THEN 'Injury'
        ELSE 'Other'
    END AS diagnosis_group,
    time_in_hospital, num_lab_procedures, num_medications, 
    readmit_30d_flag, 
    diabetesmed, change
FROM patient_data_cleaned; -- Your final clean table