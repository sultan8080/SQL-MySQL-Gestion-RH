-- 21. Lister les employés dont le rôle est "Chef de projet IT".
SELECT e.first_name, e.last_name, j.title
FROM employee e
JOIN job_role j ON e.job_role_id = j.job_role_id
WHERE title = "Chef de projet IT";


-- 22. Afficher les employés et les projets auxquels ils sont affectés, s’il y en a.
SELECT e.first_name, e.last_name, p.project_name
FROM employee e
LEFT JOIN project_assignment pa ON e.employee_id = pa.employee_id
LEFT JOIN project p ON pa.project_id = p.project_id;


-- 23. Lister les congés approuvés en 2024.
SELECT employee_id, leave_type, start_date, end_date
FROM leave_request
WHERE status_id = (SELECT status_id FROM leave_status WHERE status_name = 'Approuvé')
AND YEAR(start_date) = 2024;


-- 24. Afficher le projet avec le budget le plus élevé
SELECT project_name, budget
FROM project
ORDER BY budget DESC
LIMIT 1;


-- 25. Trouver les départements avec plus de 4 employés.
SELECT d.name AS department_name, COUNT(e.employee_id) AS total_employees
FROM department d
JOIN employee e ON d.department_id = e.department_id
GROUP BY d.name
HAVING COUNT(e.employee_id) > 4;


-- 26. Afficher les employés qui ont pris plus de 3 congés au total.
SELECT e.first_name, e.last_name, COUNT(lr.leave_request_id) AS total_leaves
FROM employee e
JOIN leave_request lr ON e.employee_id = lr.employee_id
GROUP BY e.first_name, e.last_name
HAVING COUNT(lr.leave_request_id) > 3;


-- 27. Lister les projets auxquels participent uniquement des employés du même département.
SELECT p.project_name
FROM project p
JOIN project_assignment pa ON p.project_id = pa.project_id
JOIN employee e ON pa.employee_id = e.employee_id
GROUP BY p.project_name
HAVING COUNT(DISTINCT e.department_id) = 1;
