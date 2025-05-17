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

