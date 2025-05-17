-- 11. Afficher le nom de l’employé, son rôle et son département.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, jr.title AS job_role, d.name AS department
FROM employee e
JOIN job_role jr ON e.job_role_id = jr.job_role_id
JOIN department d ON e.department_id = d.department_id;



-- 12. Afficher les projets et le nombre d’employés affectés à chaque projet.
SELECT p.project_name, COUNT(pa.employee_id) AS total_employes
FROM project p
LEFT JOIN project_assignment pa ON p.project_id = pa.project_id
GROUP BY p.project_name;


--13. Lister les employés avec leurs salaires et bonus, triés par salaire décroissant.
SELECT e.first_name, e.last_name, s.salary_amount, s.bonus
FROM employee e
JOIN salary s ON e.employee_id = s.employee_id
ORDER BY s.salary_amount DESC;


-- 14. Trouver les employés qui n’ont pas demandé de congé.
SELECT e.first_name, e.last_name
FROM employee e
LEFT JOIN leave_request lr ON e.employee_id = lr.employee_id
WHERE lr.employee_id IS NULL;

-- 15. Afficher le nombre de congés par type.
SELECT leave_type, COUNT(*) AS total_conges
FROM leave_request
GROUP BY leave_type;


--16. Afficher les employés avec un bonus supérieur à 6000.
SELECT e.first_name, e.last_name, s.bonus
FROM employee e
JOIN salary s ON e.employee_id = s.employee_id
WHERE s.bonus > 6000;

--17. Lister les projets ayant un budget supérieur à la moyenne.
SELECT project_name, budget
FROM project
WHERE budget > (SELECT AVG(budget) FROM project);


--18. Afficher les employés affectés à plus d’un projet.
SELECT e.first_name, e.last_name, COUNT(pa.project_id) AS total_projects
FROM employee e
JOIN project_assignment pa ON e.employee_id = pa.employee_id
GROUP BY e.first_name, e.last_name
HAVING COUNT(pa.project_id) > 1;