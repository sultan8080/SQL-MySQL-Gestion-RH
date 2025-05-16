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
('Kylian', 'Rivière', 'kylian.riviere@example.com', '0666778899', '2018-11-26', '1988-02-28', 7, 15);
