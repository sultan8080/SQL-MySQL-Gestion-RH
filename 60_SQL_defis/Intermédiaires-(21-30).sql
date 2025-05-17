-- 21. Lister les employés dont le rôle est "Chef de projet IT".
SELECT e.first_name, e.last_name, j.title
FROM employee e
JOIN job_role j ON e.job_role_id = j.job_role_id
WHERE title = "Chef de projet IT";

