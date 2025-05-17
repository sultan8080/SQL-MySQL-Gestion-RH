-- Défis Débutants (1–10) – Requêtes simples

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

