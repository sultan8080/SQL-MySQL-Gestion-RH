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

-- job_role
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

--employee
INSERT INTO employee (first_name, last_name, email, phone_number, hire_date, date_of_birth, department_id, job_role_id) VALUES
('Alice', 'Durand', 'alice.durand@example.com', '0601020304', '2020-05-15', '1995-02-10', 3, 1),
('Bob', 'Lemoine', 'bob.lemoine@example.com', '0611223344', '2021-07-20', '1990-09-25', 2, 4),
('Charlie', 'Martin', 'charlie.martin@example.com', '0622334455', '2019-11-10', '1988-06-30', 1, 3),
('Diana', 'Moreau', 'diana.moreau@example.com', '0633445566', '2022-01-05', '1993-12-15', 4, 2),
('Émile', 'Rousseau', 'emile.rousseau@example.com', '0644556677', '2018-09-15', '1985-07-21', 5, 8),
('Félix', 'Bertrand', 'felix.bertrand@example.com', '0655667788', '2020-11-30', '1987-04-11', 6, 6),
('Gabrielle', 'Lefèvre', 'gabrielle.lefevre@example.com', '0666778899', '2017-03-22', '1992-06-18', 7, 9),
('Hugo', 'Delacroix', 'hugo.delacroix@example.com', '0677889900', '2023-01-10', '1996-08-25', 8, 10),
('Isabelle', 'Fontaine', 'isabelle.fontaine@example.com', '0688990011', '2016-07-05', '1991-05-14', 9, 5),
('Jacques', 'Giraud', 'jacques.giraud@example.com', '0699001122', '2015-04-28', '1984-03-30', 10, 7),
('Karine', 'Michaud', 'karine.michaud@example.com', '0600112233', '2021-06-19', '1990-09-17', 3, 12),
('Laurent', 'Perrot', 'laurent.perrot@example.com', '0611223344', '2022-08-14', '1993-12-04', 2, 13),
('Manon', 'Bonnet', 'manon.bonnet@example.com', '0622334455', '2019-05-21', '1988-07-09', 1, 14),
('Nicolas', 'Bouvier', 'nicolas.bouvier@example.com', '0633445566', '2017-02-10', '1991-10-22', 4, 15),
('Ophélie', 'Guillaume', 'ophelie.guillaume@example.com', '0644556677', '2020-03-27', '1992-02-07', 5, 11),
('Paul', 'Reynaud', 'paul.reynaud@example.com', '0655667788', '2018-11-02', '1989-11-15', 6, 12),
('Quentin', 'Barbe', 'quentin.barbe@example.com', '0666778899', '2016-09-08', '1994-04-23', 7, 13),
('Raphaëlle', 'Simon', 'raphaelle.simon@example.com', '0677889900', '2023-07-12', '1995-05-18', 8, 14),
('Sébastien', 'Arnaud', 'sebastien.arnaud@example.com', '0688990011', '2015-12-30', '1987-01-11', 9, 15),
('Thierry', 'Deschamps', 'thierry.deschamps@example.com', '0699001122', '2021-10-25', '1990-08-29', 10, 11),
('Ulysse', 'Ferrand', 'ulysse.ferrand@example.com', '0600112233', '2018-06-17', '1986-02-03', 3, 10),
('Véronique', 'Leclerc', 'veronique.leclerc@example.com', '0611223344', '2019-11-05', '1993-09-07', 2, 9),
('William', 'Boisson', 'william.boisson@example.com', '0622334455', '2017-08-22', '1988-04-19', 1, 8),
('Xavier', 'Lemoine', 'xavier.lemoine@example.com', '0633445566', '2020-12-10', '1992-05-26', 4, 7),
('Yasmine', 'Gosselin', 'yasmine.gosselin@example.com', '0644556677', '2016-02-14', '1991-06-30', 5, 6),
('Zacharie', 'Navarro', 'zacharie.navarro@example.com', '0655667788', '2023-04-03', '1994-07-11', 6, 5),
('Aurélien', 'Tessier', 'aurelien.tessier@example.com', '0666778899', '2015-07-18', '1986-08-14', 7, 4),
('Béatrice', 'Carpentier', 'beatrice.carpentier@example.com', '0677889900', '2022-03-29', '1993-11-21', 8, 3),
('Clément', 'Marchand', 'clement.marchand@example.com', '0688990011', '2019-05-16', '1989-10-10', 9, 2),
('Delphine', 'Renard', 'delphine.renard@example.com', '0699001122', '2018-04-24', '1990-01-15', 10, 1),
('Édouard', 'Loiseau', 'edouard.loiseau@example.com', '0600112233', '2020-09-06', '1995-12-02', 3, 5),
('Fanny', 'Dubois', 'fanny.dubois@example.com', '0611223344', '2016-07-15', '1991-03-08', 2, 10),
('Gustave', 'Chevalier', 'gustave.chevalier@example.com', '0622334455', '2019-01-28', '1992-09-17', 1, 12),
('Héloïse', 'Blanchard', 'heloise.blanchard@example.com', '0633445566', '2017-12-09', '1987-05-25', 4, 14),
('Isaac', 'Fabre', 'isaac.fabre@example.com', '0644556677', '2023-05-30', '1993-07-19', 5, 9),
('Juliette', 'Gautier', 'juliette.gautier@example.com', '0655667788', '2021-02-08', '1994-06-16', 6, 7),
('Kylian', 'Rivière', 'kylian.riviere@example.com', '0666778899', '2018-11-26', '1988-02-28', 7, 15),
('Éléonore', 'Dupont', 'eleonore.dupont@example.com', '0601234567', '2022-10-15', '1993-01-27', 4, 8),
('Baptiste', 'Morel', 'baptiste.morel@example.com', '0612345678', '2019-07-21', '1990-05-19', 5, 12),
('Clara', 'Germain', 'clara.germain@example.com', '0623456789', '2021-03-10', '1995-11-03', 2, 6);


--salary
INSERT INTO salary (employee_id, salary_amount, effective_date, bonus) VALUES
(1, 60000, '2024-01-01', 5000),
(2, 72000, '2024-01-01', 7000),
(3, 50000, '2024-01-01', 4500),
(4, 75000, '2024-01-01', 8000),
(5, 66000, '2024-01-01', 5500),
(6, 48000, '2024-01-01', 4000),
(7, 52000, '2024-01-01', 4500),
(8, 89000, '2024-01-01', 9500),
(9, 53000, '2024-01-01', 4200),
(10, 69000, '2024-01-01', 6000),
(11, 75000, '2024-01-01', 8000),
(12, 82000, '2024-01-01', 9000),
(13, 64000, '2024-01-01', 5500),
(14, 71000, '2024-01-01', 6700),
(15, 78000, '2024-01-01', 7200),
(16, 50000, '2024-01-01', 4000),
(17, 55000, '2024-01-01', 4600),
(18, 86000, '2024-01-01', 9400),
(19, 49000, '2024-01-01', 3700),
(20, 73000, '2024-01-01', 6800),
(21, 67000, '2024-01-01', 6200),
(22, 78000, '2024-01-01', 7200),
(23, 52000, '2024-01-01', 4500),
(24, 85000, '2024-01-01', 9000),
(25, 49000, '2024-01-01', 4200),
(26, 70000, '2024-01-01', 6500),
(27, 55000, '2024-01-01', 4700),
(28, 62000, '2024-01-01', 5200),
(29, 80000, '2024-01-01', 8500),
(30, 78000, '2024-01-01', 7300),
(31, 56000, '2024-01-01', 4700),
(32, 69000, '2024-01-01', 6200),
(33, 72000, '2024-01-01', 6700),
(34, 75000, '2024-01-01', 7200),
(35, 48000, '2024-01-01', 3900),
(36, 81000, '2024-01-01', 8800),
(37, 54000, '2024-01-01', 4600),
(38, 78000, '2024-01-01', 7400),
(39, 83000, '2024-01-01', 9100),
(40, 60000, '2024-01-01', 5000);


-- leave_request
INSERT INTO leave_request (employee_id, leave_type, start_date, end_date, status_id) VALUES
(1, 'Congé annuel', '2024-06-10', '2024-06-20', 2),
(2, 'Congé maladie', '2024-03-05', '2024-03-10', 1),
(3, 'Congé maternité', '2024-07-01', '2024-09-01', 2),
(4, 'Congé personnel', '2024-08-15', '2024-08-20', 3),
(5, 'Congé sans solde', '2024-10-01', '2024-10-15', 2),
(6, 'Congé parental', '2024-05-10', '2024-05-30', 2),
(7, 'Congé exceptionnel', '2024-04-20', '2024-04-25', 1),
(8, 'Congé annuel', '2024-11-01', '2024-11-10', 3),
(9, 'Congé maladie', '2024-09-05', '2024-09-09', 2),
(10, 'Congé maternité', '2024-12-01', '2025-02-01', 1);


-- project
INSERT INTO project (project_name, project_description, budget, start_date, end_date, status_id) VALUES
('Refonte du site web', 'Amélioration de l’interface utilisateur et de l’ergonomie.', 15000, '2024-03-01', '2024-09-01', 2),
('Système RH', 'Développement d’un système interne de gestion des ressources humaines.', 50000, '2024-01-15', '2024-12-15', 3),
('Campagne marketing', 'Lancement d’une campagne digitale pour augmenter la visibilité.', 25000, '2024-06-01', '2024-12-01', 2),
('Audit financier', 'Réalisation d’un audit complet des finances de l’entreprise.', 80000, '2024-04-10', '2024-11-30', 3),
('Plateforme e-commerce', 'Création d’une plateforme de vente en ligne pour produits exclusifs.', 95000, '2024-02-20', '2024-10-10', 2),
('Optimisation logistique', 'Amélioration de la gestion des stocks et de la distribution.', 62000, '2024-05-01', '2025-01-15', 2),
('Plan de formation', 'Mise en place de formations internes pour améliorer les compétences.', 40000, '2024-07-01', '2024-12-30', 3),
('Sécurité informatique', 'Renforcement des mesures de cybersécurité et des protocoles.', 70000, '2024-09-15', '2025-03-01', 2),
('Innovation produit', 'Développement de nouvelles fonctionnalités pour les produits existants.', 88000, '2024-04-01', '2025-02-01', 2),
('Service client IA', 'Mise en place d’un chatbot intelligent pour l’assistance clientèle.', 55000, '2024-08-20', '2025-05-10', 2);


-- project_assignment
INSERT INTO project_assignment (employee_id, project_id, role_in_project, start_date, end_date) VALUES
(1, 1, 'Développeur Frontend', '2024-03-01', '2024-09-01'),
(5, 1, 'UX Designer', '2024-03-01', '2024-09-01'),
(12, 1, 'Chef de projet IT', '2024-03-01', '2024-09-01'),
(2, 2, 'Responsable RH', '2024-01-15', '2024-12-15'),
(8, 2, 'Consultant RH', '2024-01-15', '2024-12-15'),
(14, 2, 'Analyste RH', '2024-01-15', '2024-12-15'),
(22, 2, 'Juriste RH', '2024-01-15', '2024-12-15'),
(3, 3, 'Responsable marketing digital', '2024-06-01', '2024-12-01'),
(11, 3, 'Community Manager', '2024-06-01', '2024-12-01'),
(4, 4, 'Auditeur financier', '2024-04-10', '2024-11-30'),
(10, 4, 'Comptable senior', '2024-04-10', '2024-11-30'),
(18, 4, 'Expert fiscal', '2024-04-10', '2024-11-30'),
(27, 4, 'Spécialiste en audit', '2024-04-10', '2024-11-30'),
(33, 4, 'Auditeur interne', '2024-04-10', '2024-11-30'),
(6, 5, 'Architecte logiciel', '2024-02-20', '2024-10-10'),
(15, 5, 'Data Scientist', '2024-02-20', '2024-10-10'),
(25, 5, 'Spécialiste Cloud', '2024-02-20', '2024-10-10'),
(7, 6, 'Consultant logistique', '2024-05-01', '2025-01-15'),
(17, 6, 'Responsable logistique', '2024-05-01', '2025-01-15'),
(23, 6, 'Gestionnaire transport', '2024-05-01', '2025-01-15'),
(30, 6, 'Responsable entrepôt', '2024-05-01', '2025-01-15'),
(35, 6, 'Gestionnaire achats', '2024-05-01', '2025-01-15'),
(40, 6, 'Superviseur logistique', '2024-05-01', '2025-01-15'),
(9, 7, 'Formateur interne', '2024-07-01', '2024-12-30'),
(26, 7, 'Consultant formation', '2024-07-01', '2024-12-30'),
(16, 8, 'Expert cybersécurité', '2024-09-15', '2025-03-01'),
(19, 8, 'Développeur sécurité', '2024-09-15', '2025-03-01'),
(28, 8, 'Analyste cybersécurité', '2024-09-15', '2025-03-01'),
(36, 8, 'Ingénieur en sécurité IT', '2024-09-15', '2025-03-01'),
(13, 9, 'Ingénieur R&D', '2024-04-01', '2025-02-01'),
(21, 9, 'Chef de produit', '2024-04-01', '2025-02-01'),
(24, 9, 'Coordinateur R&D', '2024-04-01', '2025-02-01'),
(32, 9, 'Chargé d’innovation', '2024-04-01', '2025-02-01'),
(38, 9, 'Spécialiste développement produit', '2024-04-01', '2025-02-01'),
(20, 10, 'Gestionnaire support client IA', '2024-08-20', '2025-05-10'),
(29, 10, 'Chargé de satisfaction client', '2024-08-20', '2025-05-10'),
(39, 10, 'Responsable service client', '2024-08-20', '2025-05-10');


-- trainer
INSERT INTO trainer (name, expertise) VALUES
('Jean Dupont', 'Développement Web'),
('Marie Lefèvre', 'Gestion des ressources humaines'),
('Alex Martin', 'Analyse financière'),
('Sophie Bernard', 'Marketing digital'),
('Thomas Petit', 'Sécurité informatique'),
('Laura Robert', 'Gestion de projet'),
('Pierre Moreau', 'Communication et leadership'),
('Camille Girard', 'Logistique et transport'),
('Lucie Fontaine', 'Design UX/UI'),
('David Rousseau', 'Cybersécurité');


-- training
INSERT INTO training (title, description, duration, trainer_id, start_date, end_date) VALUES
('Formation HTML & CSS', 'Apprendre les bases du développement web.', 30, 1, '2024-05-10', '2024-06-10'),
('Stratégies RH', 'Optimisation des processus de recrutement.', 25, 2, '2024-07-01', '2024-07-26'),
('Analyse financière avancée', 'Méthodes d’analyse pour les entreprises.', 40, 3, '2024-08-15', '2024-09-24'),
('Marketing digital et réseaux sociaux', 'Stratégies de contenu et publicité ciblée.', 35, 4, '2024-06-01', '2024-07-05'),
('Sécurité informatique', 'Meilleures pratiques pour protéger les données.', 45, 5, '2024-09-01', '2024-10-15'),
('Gestion de projet Agile', 'Introduction aux méthodologies Agile.', 30, 6, '2024-05-20', '2024-06-20'),
('Leadership et communication', 'Amélioration de la prise de décision.', 20, 7, '2024-10-10', '2024-10-30'),
('Optimisation logistique', 'Stratégies pour réduire les coûts.', 50, 8, '2024-11-01', '2024-12-15'),
('UX/UI Design avancé', 'Créer des interfaces intuitives.', 30, 9, '2024-07-15', '2024-08-15'),
('Protection des systèmes informatiques', 'Renforcement de la cybersécurité.', 40, 10, '2024-12-01', '2025-01-15');


-- attendance
INSERT INTO attendance (employee_id, check_in_time, check_out_time, absence_type, absence_start_date, absence_end_date, status_id) VALUES
(1, '2024-05-15 08:30:00', '2024-05-15 17:30:00', NULL, NULL, NULL, 1),
(2, '2024-05-15 08:45:00', '2024-05-15 17:45:00', NULL, NULL, NULL, 1),
(3, NULL, NULL, 'Congé maladie', '2024-05-10', '2024-05-15', 2),
(4, '2024-05-15 09:00:00', '2024-05-15 18:00:00', NULL, NULL, NULL, 1),
(5, '2024-05-15 08:30:00', '2024-05-15 17:30:00', NULL, NULL, NULL, 1),
(6, NULL, NULL, 'Congé annuel', '2024-05-10', '2024-05-17', 2),
(7, '2024-05-15 09:15:00', '2024-05-15 18:15:00', NULL, NULL, NULL, 1),
(8, '2024-05-15 08:30:00', '2024-05-15 17:30:00', NULL, NULL, NULL, 1),
(9, '2024-05-15 08:50:00', '2024-05-15 17:50:00', NULL, NULL, NULL, 1),
(10, NULL, NULL, 'Congé sans solde', '2024-05-12', '2024-05-20', 3);


-- performance_review
INSERT INTO performance_review (employee_id, review_date, reviewer_id, performance_score, comments) VALUES
(1, '2024-04-10', 5, 8, 'Bon développement web, amélioration possible en UX.'),
(2, '2024-04-15', 7, 9, 'Gestion RH efficace, quelques améliorations en communication.'),
(3, '2024-03-30', 10, 7, 'Analyse financière correcte, doit être plus approfondie.'),
(4, '2024-04-05', 2, 10, 'Excellent leadership et très bon travail d’équipe.'),
(5, '2024-04-20', 8, 6, 'Bonne organisation, quelques retards dans les délais.'),
(6, '2024-03-25', 4, 7, 'Amélioration notable en stratégie marketing.'),
(7, '2024-05-01', 9, 5, 'Besoin de plus de formation en communication.'),
(8, '2024-04-12', 3, 9, 'Très bon niveau technique en cybersécurité.'),
(9, '2024-03-18', 6, 8, 'Bon travail en logistique, gestion efficace.'),
(10, '2024-04-08', 1, 6, 'Peut mieux gérer les délais et la productivité.');

