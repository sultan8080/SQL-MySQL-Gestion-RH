CREATE TABLE employee_training (
    employee_training_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    training_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (training_id) REFERENCES training(training_id)
);

-- Clean and corrected training assignments
INSERT INTO employee_training (employee_id, training_id) VALUES
(1, 1), (1, 4),
(2, 2),
(3, 3), (3, 5),
(4, 6),
(5, 1), (5, 7),
(6, 2),
(7, 4), (7, 9),
(8, 5),
(9, 7),
(10, 3),
(11, 1),
(12, 6), (12, 8),
(14, 2),
(15, 4),
(16, 3),
(17, 8), (17, 10),
(18, 7),
(19, 9),
(20, 2),
(21, 6),
(22, 5),
(23, 4),
(24, 10),
(25, 1), (25, 6),
(26, 3),
(27, 5), (27, 9),
(28, 8),
(30, 10),
(31, 5),
(32, 2),
(35, 7),
(36, 6),
(37, 3),
(38, 7),
(39, 9),
(40, 4),
(41, 1),
(54, 5),
(55, 6),
(56, 7),
(58, 3),
(59, 4),
(60, 2),
(61, 1), (61, 10),
(62, 6);



SELECT * FROM employee_training;

-- verifier les employees qui n'ont pas de formations
SELECT e.employee_id, e.first_name, e.last_name
FROM employee e
LEFT JOIN employee_training et ON e.employee_id = et.employee_id
WHERE et.employee_id IS NULL;

-- création la training_job_role
CREATE TABLE training_job_role (
    training_job_role_id INT PRIMARY KEY AUTO_INCREMENT,
    training_id INT NOT NULL,
    job_role_id INT NOT NULL,
    FOREIGN KEY (training_id) REFERENCES training(training_id),
    FOREIGN KEY (job_role_id) REFERENCES job_role(job_role_id)
);

SELECT * FROM training_job_role;

-- Insertion de données dans la table training_job_role
INSERT INTO training_job_role (training_id, job_role_id) VALUES
(1, 1), (1, 11), (1, 14),
(2, 5), (2, 12), (2, 17),
(3, 3), (3, 13), (3, 18),
(4, 4), (4, 15), (4, 8),
(5, 6), (5, 10), (5, 19),
(6, 2), (6, 18), (6, 23),
(7, 7), (7, 9), (7, 21),
(8, 7), (8, 22), (8, 21),
(9, 9), (9, 14), (9, 10),
(10, 10), (10, 19), (10, 20);

-- Training relevance their job role
CREATE TABLE training_job_role (
    training_job_role_id INT PRIMARY KEY AUTO_INCREMENT,
    training_id INT NOT NULL,
    job_role_id INT NOT NULL,
    FOREIGN KEY (training_id) REFERENCES training(training_id),
    FOREIGN KEY (job_role_id) REFERENCES job_role(job_role_id)
);

