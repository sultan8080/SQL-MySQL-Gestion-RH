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


-- 42. Calcule le budget total utilisé par chaque département via ses projets.
SELECT d.name AS department_name, SUM(p.budget) AS total_budget_used
FROM project p
JOIN department d ON p.project_id = d.department_id
GROUP BY d.name
ORDER BY total_budget_used DESC;

