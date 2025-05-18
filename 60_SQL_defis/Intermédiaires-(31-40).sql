-- 31 Trouver le projet le plus ancien (date de début la plus ancienne).
SELECT project_name, start_date
FROM project
ORDER BY start_date ASC
LIMIT 1;


