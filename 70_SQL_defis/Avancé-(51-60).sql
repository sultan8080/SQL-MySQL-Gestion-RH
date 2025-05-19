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


--55. Affiche la répartition mensuelle des différents types de congés pris par les employés.
SELECT 
    MONTH(lr.start_date) AS mois,
    lr.leave_type,
    COUNT(*) AS nb_conges
FROM leave_request lr
GROUP BY mois, lr.leave_type
ORDER BY mois;
