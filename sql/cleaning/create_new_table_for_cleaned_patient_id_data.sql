CREATE TABLE patient_data_cleaned AS
SELECT
    encounter_id,
    patient_nbr,
    CASE WHEN race = '?' THEN 'Other/Unknown' ELSE race END AS race,
    gender,
    age,
    CASE 
        WHEN medical_specialty = '?' THEN 'Unspecified'
        WHEN medical_specialty IN ('InternalMedicine', 'Emergency/Trauma', 'Family/GeneralPractice', 'Cardiology', 'Surgery-General') 
            THEN medical_specialty
        ELSE 'Other Specialty' 
    END AS specialty_grouped,
    time_in_hospital,
    num_lab_procedures,
    num_medications,
    number_diagnoses,
    CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END AS readmit_30d_flag,
    diag_1,
    diabetesmed,
    change
FROM patient_data
WHERE diag_1  <> '?' 
  AND discharge_disposition_id::integer NOT IN (11, 13, 14, 19, 20, 21); 