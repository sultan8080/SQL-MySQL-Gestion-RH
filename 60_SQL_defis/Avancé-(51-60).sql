-- 51. Calcule la durée moyenne des formations données par chaque formateur.
SELECT 
    t.trainer_id,
    tr.name AS trainer_name,
    AVG(t.duration) AS moyenne_duree
FROM training t
JOIN trainer tr ON t.trainer_id = tr.trainer_id
GROUP BY t.trainer_id, tr.name;


-- 52. Compare les performances avant et après formation pour les employés ayant reçu au moins une formation.
WITH training_dates AS (
    SELECT et.employee_id, MIN(t.start_date) AS first_training_date
    FROM employee_training et
    JOIN training t ON et.training_id = t.training_id
    GROUP BY et.employee_id
)
SELECT e.employee_id, 
       AVG(CASE WHEN pr.review_date < td.first_training_date THEN pr.performance_score END) AS avg_before_training,
       AVG(CASE WHEN pr.review_date >= td.first_training_date THEN pr.performance_score END) AS avg_after_training
FROM employee e
JOIN performance_review pr ON e.employee_id = pr.employee_id
JOIN training_dates td ON e.employee_id = td.employee_id
GROUP BY e.employee_id;


-- 53. Affiche les employés assignés au plus grand nombre de projets.
SELECT 
    pa.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS nom_employe,
    COUNT(*) AS nb_projets
FROM project_assignment pa
JOIN employee e ON pa.employee_id = e.employee_id
GROUP BY pa.employee_id
ORDER BY nb_projets DESC
LIMIT 1;


-- 54. Pour chaque employé, calcule l’écart entre son salaire actuel et le plafond de son poste.
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS nom_employe,
    s.salary_amount,
    jr.max_salary,
    (jr.max_salary - s.salary_amount) AS ecart
FROM employee e
JOIN salary s ON e.employee_id = s.employee_id
JOIN job_role jr ON e.job_role_id = jr.job_role_id;


-- 55. Affiche la répartition mensuelle des différents types de congés pris par les employés.
SELECT 
    MONTH(lr.start_date) AS mois,
    lr.leave_type,
    COUNT(*) AS nb_conges
FROM leave_request lr
GROUP BY mois, lr.leave_type
ORDER BY mois;


-- 56. Détecte les doublons d’nom parmi les employés.
SELECT last_name COUNT(*) AS occurrences
FROM employee
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 57. Affiche la répartition des employés par localisation des départements.
SELECT location, COUNT(employee_id) AS total_employees
FROM department
JOIN employee ON department.department_id = employee.department_id
GROUP BY location
ORDER BY total_employees DESC;


-- 58. Analyser la répartition des employés par ancienneté
SELECT 
    CASE 
        WHEN FLOOR(DATEDIFF(NOW(), e.hire_date) / 365) BETWEEN 0 AND 5 THEN '0-5 ans'
        WHEN FLOOR(DATEDIFF(NOW(), e.hire_date) / 365) BETWEEN 6 AND 10 THEN '6-10 ans'
        WHEN FLOOR(DATEDIFF(NOW(), e.hire_date) / 365) BETWEEN 11 AND 15 THEN '11-15 ans'
        ELSE '16 ans et plus'
    END AS anciennete_range,
    COUNT(e.employee_id) AS total_employees
FROM employee e
GROUP BY anciennete_range
ORDER BY anciennete_range;



