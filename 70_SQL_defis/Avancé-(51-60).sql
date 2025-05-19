-- 51. Calcule la durée moyenne des formations données par chaque formateur.
SELECT 
    t.trainer_id,
    tr.name AS trainer_name,
    AVG(t.duration) AS moyenne_duree
FROM training t
JOIN trainer tr ON t.trainer_id = tr.trainer_id
GROUP BY t.trainer_id, tr.name;
