-- 11. Afficher le nom de l’employé, son rôle et son département.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, jr.title AS job_role, d.name AS department
FROM employee e
JOIN job_role jr ON e.job_role_id = jr.job_role_id
JOIN department d ON e.department_id = d.department_id;


