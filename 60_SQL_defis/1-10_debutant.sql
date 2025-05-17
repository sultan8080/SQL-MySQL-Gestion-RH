-- Défis Débutants (1–10)

-- 1. Lister tous les employés avec leurs prénoms, noms et adresses e-mail.
SELECT first_name, last_name, email FROM employee;


-- 2. Afficher les noms des départements et leur localisation.
SELECT name, location FROM department;


--3. Afficher le nom et le salaire de tous les employés dont le salaire est supérieur à 70 000.
SELECT e.first_name, e.last_name, s.salary_amount
FROM employee e
JOIN salary s ON e.employee_id = s.employee_id
WHERE s.salary_amount > 70000;


--4. Compter le nombre total d’employés dans la base de données.
SELECT COUNT(*) AS total_employes FROM employee;


--5. Trier les employés par date d’embauche (du plus récent au plus ancien).
SELECT first_name, last_name, hire_date
FROM employee
ORDER BY hire_date DESC;


--6. Afficher les rôles de poste distincts existants dans la table job_role.
SELECT DISTINCT title FROM job_role;


--7. Lister les employés nés avant 1990.
SELECT first_name, last_name, date_of_birth
FROM employee
WHERE date_of_birth < '1990-01-01';


--8. Afficher tous les projets en cours avec leur budget.
SELECT p.project_name, p.budget
FROM project p
JOIN project_status ps ON p.status_id = ps.status_id
WHERE ps.status_name = 'En cours';

--2ème methode 
SELECT project_name, budget
FROM project
WHERE status_id = (SELECT status_id FROM project_status WHERE status_name = 'En cours');


--9 Afficher les employés qui travaillent dans le département "Informatique".
SELECT e.first_name, e.last_name, d.name
FROM employee e
JOIN department d ON e.department_id = d.department_id
WHERE name = 'Informatique';


--10 Trouver les employés dont le nom commence par 'A'.
SELECT * FROM employee WHERE last_name LIKE 'A%';

