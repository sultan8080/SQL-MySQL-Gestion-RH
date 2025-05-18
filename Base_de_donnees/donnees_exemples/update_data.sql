

-- Ajouter manager_id pour chaque département, SQL update
UPDATE department d
SET manager_id = (
    SELECT e.employee_id
    FROM employee e
    JOIN job_role jr ON e.job_role_id = jr.job_role_id
    WHERE e.department_id = d.department_id
      AND jr.title IN (
        'Chef de Projet IT',
        'Responsable Marketing',
        'Responsable Relations Publiques',
        'Consultant en stratégie',
        'Chef de projet événementiel',
        'Gestionnaire de paie',
        'Contrôleur Qualité',
        'Agent de Service Client',
        'Logisticien',
        'Ingénieur Produit'
      )
    LIMIT 1
);

SELECT * FROM department;