-- 41. Trouve les employés ayant occupé plusieurs projets différents dans leur carrière, avec les dates de changement.
SELECT pa.employee_id, e.last_name, 
       COUNT(pa.assignment_id) AS Total_Project, 
       MIN(pa.start_date) AS First_Project_start_date, 
       MAX(pa.end_date) AS Last_Project_end_date
FROM project_assignment pa
JOIN employee e ON pa.employee_id = e.employee_id
GROUP BY pa.employee_id, e.last_name
HAVING COUNT(pa.assignment_id) > 1
ORDER BY First_Project_start_date;


-- 42. Calcule le budget total utilisé par chaque département via ses projets.
SELECT d.name AS department_name, SUM(p.budget) AS total_budget_used
FROM project p
JOIN department d ON p.project_id = d.department_id
GROUP BY d.name
ORDER BY total_budget_used DESC;


-- 43. Trouve l’employé ayant réalisé le plus grand nombre d’évaluations de performance.
SELECT pr.reviewer_id, e.first_name, e.last_name, 
       COUNT(pr.review_id) AS total_reviews
FROM performance_review pr
JOIN employee e ON pr.reviewer_id = e.employee_id
GROUP BY pr.reviewer_id, e.first_name, e.last_name
HAVING COUNT(pr.review_id) = (
    SELECT MAX(review_count) 
    FROM (
        SELECT COUNT(review_id) AS review_count 
        FROM performance_review 
        GROUP BY reviewer_id
    ) AS subquery
);

-- Alternative
WITH review_counts AS (
    SELECT reviewer_id, COUNT(review_id) AS total_reviews
    FROM performance_review
    GROUP BY reviewer_id
)
SELECT e.employee_id, e.first_name, e.last_name, rc.total_reviews
FROM review_counts rc
JOIN employee e ON rc.reviewer_id = e.employee_id
WHERE rc.total_reviews = (SELECT MAX(total_reviews) FROM review_counts);


-- 44. Affiche les 5 projets les plus longs en termes de durée (end_date - start_date).
SELECT project_id, project_name, 
       CONCAT(
           CASE WHEN FLOOR(DATEDIFF(end_date, start_date) / 365) > 0 
                THEN CONCAT(FLOOR(DATEDIFF(end_date, start_date) / 365), ' années, ') ELSE '' END,
           CASE WHEN FLOOR((DATEDIFF(end_date, start_date) % 365) / 30) > 0 
                THEN CONCAT(FLOOR((DATEDIFF(end_date, start_date) % 365) / 30), ' mois, ') ELSE '' END,
           CASE WHEN DATEDIFF(end_date, start_date) % 30 > 0 
                THEN CONCAT(DATEDIFF(end_date, start_date) % 30, ' jours') ELSE '' END
       ) AS duration
FROM project
ORDER BY DATEDIFF(end_date, start_date) DESC
LIMIT 5;