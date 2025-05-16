-- Statuts de présence

INSERT INTO attendance_status (status_name) VALUES
('Présent'),
('Absent'),
('En congé'),
('Télétravail');

-- Statuts de congé
INSERT INTO leave_status (status_name) VALUES
('En attente'),
('Approuvé'),
('Rejeté');

-- Statuts de projet
INSERT INTO project_status (status_name) VALUES
('Non démarré'),
('En cours'),
('Terminé'),
('En pause');


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


INSERT INTO job_role (title, department_id, min_salary, max_salary) VALUES
('Développeur Web', 3, 35000, 70000),
('Chef de Projet IT', 3, 45000, 90000),
('Analyste Financier', 2, 40000, 85000),
('Responsable Marketing', 4, 50000, 95000),
('Spécialiste RH', 1, 38000, 72000),
('Agent de Service Client', 6, 30000, 60000),
('Logisticien', 7, 34000, 68000),
('Responsable Relations Publiques', 9, 46000, 88000),
('Contrôleur Qualité', 10, 42000, 82000),
('Ingénieur Produit', 8, 48000, 92000),
('Analyste des données', 3, 46000, 90000),
('Consultant en stratégie', 2, 50000, 95000),
('Gestionnaire de paie', 1, 38000, 75000),
('Designer UX/UI', 3, 45000, 87000),
('Chef de projet événementiel', 9, 44000, 86000);
