

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


INSERT INTO job_role (title, department_id, min_salary, max_salary) VALUES
('Responsable Ressources Humaines', 1, 45000, 90000),
('Responsable Finance', 2, 48000, 92000),
('Responsable Gestion des Projets', 5, 47000, 91000),
('Responsable Service Client', 6, 43000, 85000),
('Responsable Qualité et Conformité', 10, 44000, 86000),
('Responsable logistique', 7, 40000, 70000),
('Responsable Production', 8, 44000, 86000),
('Responsable IT', 3, 45000, 90000);

SELECT * FROM job_role;
INSERT INTO job_role (title, department_id, min_salary, max_salary) VALUES
('Responsable Marketing', 4, 50000, 95000),
('Responsable Relations Publiques', 9, 46000, 88000),

SELECT * FROM job_role;
INSERT INTO job_role (title, department_id, min_salary, max_salary) VALUES
('CEO', 1, 70000, 110000);

INSERT INTO employee (first_name, last_name, email, phone_number, hire_date, date_of_birth, department_id, job_role_id) VALUES
('Monsier', 'Hamlet', 'hamlet@example.com', '0601010101', '2015-03-01', '1982-06-15', 1, 16);
SELECT * FROM employee WHERE last_name ='Hamlet';

INSERT INTO employee (first_name, last_name, email, phone_number, hire_date, date_of_birth, department_id, job_role_id, manager_id) VALUES
('Claire', 'Martin', 'claire.martin2@example.com', '0601010101', '2015-03-01', '1982-06-15', 1, 16,41),
('David', 'Bernard', 'david.bernard@example.com', '0602020202', '2016-07-12', '1980-09-20', 2, 17,41),
('Élodie', 'Fournier', 'elodie.fournier@example.com', '0603030303', '2017-01-10', '1985-03-11', 3,24,41),
('Julien', 'Masson', 'julien.masson@example.com', '0604040404', '2018-05-22', '1983-12-07', 4, 4,41),
('Sophie', 'Marchand', 'sophie.marchand@example.com', '0605050505', '2014-11-18', '1981-08-02', 5, 18,41),
('Antoine', 'Garnier', 'antoine.garnier@example.com', '0606060606', '2019-04-08', '1984-02-28', 6, 19,41),
('Nathalie', 'Roche', 'nathalie.roche@example.com', '0607070707', '2020-08-14', '1986-05-13', 7, 20,41),
('Yann', 'Blanchet', 'yann.blanchet@example.com', '0608080808', '2016-06-30', '1982-10-19', 8, 21,41),
('Isabelle', 'Charpentier', 'isabelle.charpentier@example.com', '0609090909', '2017-09-25', '1983-07-27', 9, 9,41),
('Thomas', 'Pires', 'thomas.pires@example.com', '0610101010', '2015-12-03', '1980-04-04', 10, 22,41);

SELECT * FROM job_role;