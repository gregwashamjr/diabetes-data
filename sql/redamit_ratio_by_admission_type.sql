WITH cte1 AS(
SELECT 
	admission_type, 
	at.description AS description, 
	AVG(time_in_hospital) avg_days_spent_in_hospital,
	COUNT(readmitted) AS total_readmit
FROM patient_data AS pd
LEFT JOIN admission_types AS at
ON CAST(pd.admission_type AS INT) = at.admission_type_id
WHERE admission_type NOT IN ('5','6','8', '4')
GROUP BY admission_type, at.description),

cte2 AS(
SELECT admission_type, COUNT(readmitted) AS less_than_30_readmit FROM patient_data
WHERE readmitted = '<30' AND admission_type NOT IN ('5','6','8', '4')
GROUP BY admission_type
)

SELECT
	cte1.description,
	cte1.avg_days_spent_in_hospital,
	cte1.total_readmit,
	cte2.less_than_30_readmit,
	(cte2.less_than_30_readmit/cte1.total_readmit::FLOAT) AS readmit_ratio
FROM cte1
LEFT JOIN cte2
ON cte1.admission_type = cte2.admission_type
	
	