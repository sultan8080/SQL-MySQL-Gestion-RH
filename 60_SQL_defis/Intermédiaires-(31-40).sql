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


-- 36. Lister les projets qui impliquent des employés de plus de 40 ans.
SELECT DISTINCT p.project_name, e.first_name, e.last_name, 
       (YEAR(CURRENT_DATE) - YEAR(e.date_of_birth)) AS age
FROM employee e
JOIN project_assignment pa ON e.employee_id = pa.employee_id
JOIN project p ON pa.project_id = p.project_id
WHERE (YEAR(CURRENT_DATE) - YEAR(e.date_of_birth)) > 40;


-- 37. Afficher les rôles avec le nombre d’employés par rôle, trié du plus au moins représenté.
SELECT j.job_role_id AS job_id, j.title, COUNT(e.employee_id) AS NUMBER_EMPLOYEES
FROM job_role j
JOIN employee e ON e.job_role_id = j.job_role_id
GROUP BY j.job_role_id, j.title
ORDER BY NUMBER_EMPLOYEES DESC;


-- 38. Afficher les congés refusés avec le nom de l’employé.
SELECT e.employee_id, CONCAT(e.last_name, ' ', e.first_name) AS employee_name
FROM employee e
JOIN leave_request lr ON e.employee_id = lr.employee_id
JOIN leave_status ls ON lr.status_id = ls.status_id
WHERE ls.status_name = "Rejeté";


-- 39. Trouver les postes occupés par au moins deux employés dans le même département
SELECT employee_id, department_id, COUNT(*) AS num_employees
FROM employee
GROUP BY employee_id, department_id
HAVING COUNT(*) > 1;


-- 40. Afficher les projets actifs aujourd’hui (entre la date de début et de fin incluant aujourd’hui).
SELECT p.project_name, ps.status_name, p.start_date, p.end_date
FROM project p
JOIN project_status ps ON p.status_id = ps.status_id
WHERE ps.status_name = "En cours";