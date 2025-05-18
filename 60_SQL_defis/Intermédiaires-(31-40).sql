-- 31 Trouver le projet le plus ancien (date de début la plus ancienne).
SELECT project_name, start_date
FROM project
ORDER BY start_date ASC
LIMIT 1;


-- 32. Afficher les employés et leur nombre de projets, même ceux sans projet.
SELECT e.first_name, e.last_name, COUNT(pa.project_id) AS total_projects
FROM employee e
LEFT JOIN project_assignment pa ON e.employee_id = pa.employee_id
GROUP BY e.first_name, e.last_name;

-- 32. Afficher les employés et leur nombre de projets, même ceux sans projet (afficher 0 si aucun).
SELECT e.first_name, e.last_name, COALESCE(COUNT(pa.project_id), 0) AS total_projects
FROM employee e
LEFT JOIN project_assignment pa ON e.employee_id = pa.employee_id
GROUP BY e.first_name, e.last_name;

