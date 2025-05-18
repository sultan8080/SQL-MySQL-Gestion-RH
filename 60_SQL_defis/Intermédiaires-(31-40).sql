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


-- 33. Lister les départements qui n’ont aucun projet associé.
SELECT d.name AS department_name
FROM department d
LEFT JOIN employee e ON d.department_id = e.department_id
LEFT JOIN project_assignment pa ON e.employee_id = pa.employee_id
WHERE pa.project_id IS NULL;


-- 34. Afficher pour chaque département, le salaire moyen des employés.
SELECT d.name AS Department_Name, ROUND(AVG(s.salary_amount),2) AS Average_Salary
FROM department d
LEFT JOIN employee e ON d.department_id = e.department_id
LEFT JOIN salary s ON e.employee_id = s.employee_id
GROUP BY d.name;


-- 35. Trouver les employés qui ont un salaire supérieur à celui de leur chef de projet.
SELECT e.employee_id, CONCAT(e.last_name, ' ', e.first_name) AS employee_name, es.salary_amount AS employee_salary,
       m.employee_id AS manager_id, CONCAT(m.last_name, ' ', m.first_name) AS manager_name, ms.salary_amount AS manager_salary
FROM employee e
JOIN salary es ON e.employee_id = es.employee_id
JOIN employee m ON e.manager_id = m.employee_id
JOIN salary ms ON m.employee_id = ms.employee_id
WHERE es.salary_amount > ms.salary_amount;
