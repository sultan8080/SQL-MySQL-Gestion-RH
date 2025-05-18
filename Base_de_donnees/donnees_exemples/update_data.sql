-- Ajouter manager_id pour chaque département, SQL update
UPDATE department d
SET manager_id = (
    SELECT e.employee_id
    FROM employee e
      JOIN job_role jr ON e.job_role_id = jr.job_role_id
    WHERE e.department_id = d.department_id
      AND jr.title IN (
        'Responsable Ressources Humaines',
        'Responsable Finance',
        'Responsable Gestion des Projets',
        'Responsable Service Client',
        'Responsable Qualité et Conformité',
        'Responsable logistique',
        'Responsable Production',
        'Responsable IT',
        'Responsable Marketing',
        'Responsable Relations Publiques'
      )
    LIMIT 1
  );

  SELECT * FROM job_role ORDER BY job_role_id DESC;



UPDATE department d
SET d.manager_id = (
    SELECT e.employee_id
    FROM employee e
      JOIN job_role jr ON e.job_role_id = jr.job_role_id
    WHERE jr.title = 'Responsable Ressources Humaines'
  )
WHERE name = 'Ressources Humaines';

SELECT e.employee_id, d.name, jr.title, e.job_role_id
FROM department d
JOIN employee e ON e.department_id = d.department_id
  JOIN job_role jr ON e.job_role_id = jr.job_role_id
ORDER BY e.employee_id DESC;

WHERE jr.title = 'Responsable Ressources Humaines'

UPDATE department
SET manager_id = NULL;

SELECT *
FROM department;

SELECT * FROM employee ORDER BY employee_id DESC; 

SELECT *
FROM employee
ORDER BY employee_id DESC;

SELECT * FROM job_role ORDER BY job_role_id DESC;


INSERT INTO job_role (title, department_id, min_salary, max_salary)
VALUES (
    'Responsable Ressources Humaines',1,45000,90000),
  ('Responsable Finance', 2, 48000, 92000),
  ('Responsable Gestion des Projets', 5,47000,91000),
  ('Responsable Service Client', 6, 43000, 85000),
  ('Responsable Qualité et Conformité',10,44000,86000  ),
  ('Responsable logistique', 7, 40000, 70000),
  ('Responsable Production', 8, 44000, 86000),
  ('Responsable IT', 3, 45000, 90000);
SELECT *
FROM job_role;


INSERT INTO job_role (title, department_id, min_salary, max_salary)
VALUES ('Responsable Marketing', 4, 50000, 95000),
  ('Responsable Relations Publiques', 9,46000,88000 ),


  SELECT *
FROM job_role;
INSERT INTO job_role (title, department_id, min_salary, max_salary)
VALUES ('CEO', 1, 70000, 110000);


INSERT INTO employee (
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    date_of_birth,
    department_id,
    job_role_id
  )
VALUES (
    'Monsier',
    'Hamlet',
    'hamlet@example.com',
    '0601010101',
    '2015-03-01',
    '1982-06-15',
    1,
    16
  );


SELECT *
FROM employee
WHERE last_name = 'Hamlet';



INSERT INTO employee (
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    date_of_birth,
    department_id,
    job_role_id,
    manager_id
  )
VALUES (
    'Claire',
    'Martin',
    'claire.martin2@example.com',
    '0601010101',
    '2015-03-01',
    '1982-06-15',
    1,
    16,
    41
  ),
  (
    'David',
    'Bernard',
    'david.bernard@example.com',
    '0602020202',
    '2016-07-12',
    '1980-09-20',
    2,
    17,
    41
  ),
  (
    'Élodie',
    'Fournier',
    'elodie.fournier@example.com',
    '0603030303',
    '2017-01-10',
    '1985-03-11',
    3,
    24,
    41
  ),
  (
    'Julien',
    'Masson',
    'julien.masson@example.com',
    '0604040404',
    '2018-05-22',
    '1983-12-07',
    4,
    4,
    41
  ),
  (
    'Sophie',
    'Marchand',
    'sophie.marchand@example.com',
    '0605050505',
    '2014-11-18',
    '1981-08-02',
    5,
    18,
    41
  ),
  (
    'Antoine',
    'Garnier',
    'antoine.garnier@example.com',
    '0606060606',
    '2019-04-08',
    '1984-02-28',
    6,
    19,
    41
  ),
  (
    'Nathalie',
    'Roche',
    'nathalie.roche@example.com',
    '0607070707',
    '2020-08-14',
    '1986-05-13',
    7,
    20,
    41
  ),
  (
    'Yann',
    'Blanchet',
    'yann.blanchet@example.com',
    '0608080808',
    '2016-06-30',
    '1982-10-19',
    8,
    21,
    41
  ),
  (
    'Isabelle',
    'Charpentier',
    'isabelle.charpentier@example.com',
    '0609090909',
    '2017-09-25',
    '1983-07-27',
    9,
    9,
    41
  ),
  (
    'Thomas',
    'Pires',
    'thomas.pires@example.com',
    '0610101010',
    '2015-12-03',
    '1980-04-04',
    10,
    22,
    41
  );


SELECT department_id, COUNT(*) AS employee_count
FROM employee
GROUP BY department_id;


SELECT * FROM employee ORDER BY employee_id DESC

UPDATE employee e
SET manager_id = (
    SELECT manager.employee_id
    FROM employee manager
    WHERE manager.department_id = e.department_id
      AND manager.employee_id <> e.employee_id
    LIMIT 1
)
WHERE e.manager_id IS NULL;