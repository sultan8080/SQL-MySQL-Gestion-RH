

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

-- department
INSERT INTO department (name, location) VALUES
('Ressources Humaines', 'Paris'),
('Finance', 'Lyon'),
('Informatique', 'Marseille'),
('Marketing', 'Bordeaux'),
('Gestion des Projets', 'Toulouse'),
('Service Client', 'Strasbourg'),
('Logistique', 'Lille'),
('Développement Produit', 'Nantes'),
('Relations Publiques', 'Nice'),
('Qualité et Conformité', 'Grenoble');


SELECT * FROM department;


INSERT INTO job_role (title, department_id, min_salary, max_salary) VALUES
('Responsable Ressources Humaines', 1, 45000, 90000),
('Responsable Finance', 2, 48000, 92000),
('Responsable Gestion des Projets', 5, 47000, 91000),
('Responsable Service Client', 6, 43000, 85000),
('Responsable Qualité et Conformité', 10, 44000, 86000),
('Responsable logistique', 7, 40000, 70000),
('Responsable Production', 8, 44000, 86000),
('Responsable IT', 3, 45000, 90000),


INSERT INTO job_role (title, department_id, min_salary, max_salary) VALUES
('Responsable Marketing', 4, 50000, 95000),
('Responsable Relations Publiques', 9, 46000, 88000),