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
