-- Statuts de présence

INSERT INTO attendance_status (status_name) VALUES
('Présent'),
('Absent'),
('En congé'),
('Télétravail');

SELECT * FROM attendance_status;

-- Statuts de congé
INSERT INTO leave_status (status_name) VALUES
('En attente'),
('Approuvé'),
('Rejeté');

SELECT * FROM leave_status;

-- Statuts de projet
INSERT INTO project_status (status_name) VALUES
('Non démarré'),
('En cours'),
('Terminé'),
('En pause');

SELECT * FROM project_status;

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
