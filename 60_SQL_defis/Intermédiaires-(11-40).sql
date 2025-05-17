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
