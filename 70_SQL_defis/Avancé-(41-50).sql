-- 41. Trouve les employés ayant occupé plusieurs projets différents dans leur carrière, avec les dates de changement.
SELECT pa.employee_id, e.last_name, 
       COUNT(pa.assignment_id) AS Total_Project, 
       MIN(pa.start_date) AS First_Project_start_date, 
       MAX(pa.end_date) AS Last_Project_end_date
FROM project_assignment pa
JOIN employee e ON pa.employee_id = e.employee_id
GROUP BY pa.employee_id, e.last_name
HAVING COUNT(pa.assignment_id) > 1
ORDER BY First_Project_start_date;


