-- Base de données Gestion RH - Schéma 
CREATE DATABASE IF NOT EXISTS gestion_rh;
USE gestion_rh;


-- Lookup tables for statuses (attendance, leave, project)
CREATE TABLE attendance_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE leave_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE project_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- Table: department
CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    manager_id INT DEFAULT NULL
) ENGINE=InnoDB;



-- Table: job_role
CREATE TABLE job_role (
    job_role_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    department_id INT,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE SET NULL
) ENGINE=InnoDB;


-- Création de la table employee
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    date_of_birth DATE,
    manager_id INT NULL
);

-- Création de la table department
CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    manager_id INT NULL
);

-- Création de la table position
CREATE TABLE position (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    salary_range VARCHAR(50)
);

-- Création de la table salary
CREATE TABLE salary (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    salary_amount DECIMAL(10,2) NOT NULL,
    effective_date DATE NOT NULL,
    bonus DECIMAL(10,2) DEFAULT 0
);

-- Création de la table leave_request
CREATE TABLE leave_request (
    leave_request_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    leave_type VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- Création de la table performance_review
CREATE TABLE performance_review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    review_date DATE NOT NULL,
    reviewer_id INT,
    performance_score INT,
    comments TEXT
);

-- Création de la table training
CREATE TABLE training (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    duration INT,
    trainer_id INT,
    start_date DATE,
    end_date DATE
);

-- Création de la table project
CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    project_description TEXT,
    budget DECIMAL(15,2),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20)
);

-- Création de la table project_assignment
CREATE TABLE project_assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    role_in_project VARCHAR(100),
    start_date DATE,
    end_date DATE
);

-- Ajout des contraintes de clés étrangères avec ALTER TABLE

-- employee.manager_id réfère employee.employee_id (clé étrangère récursive)
ALTER TABLE employee
ADD CONSTRAINT fk_employee_manager FOREIGN KEY (manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL;

-- department.manager_id réfère employee.employee_id
ALTER TABLE department
ADD CONSTRAINT fk_department_manager FOREIGN KEY (manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL;

-- position.department_id réfère department.department_id
ALTER TABLE position
ADD CONSTRAINT fk_position_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE;

-- salary.employee_id réfère employee.employee_id
ALTER TABLE salary
ADD CONSTRAINT fk_salary_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE;

-- leave_request.employee_id réfère employee.employee_id
ALTER TABLE leave_request
ADD CONSTRAINT fk_leave_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE;

-- performance_review.employee_id réfère employee.employee_id
ALTER TABLE performance_review
ADD CONSTRAINT fk_review_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE;

-- performance_review.reviewer_id réfère employee.employee_id
ALTER TABLE performance_review
ADD CONSTRAINT fk_review_reviewer FOREIGN KEY (reviewer_id) REFERENCES employee(employee_id) ON DELETE SET NULL;

-- training.trainer_id réfère employee.employee_id
ALTER TABLE training
ADD CONSTRAINT fk_training_trainer FOREIGN KEY (trainer_id) REFERENCES employee(employee_id) ON DELETE SET NULL;

-- project_assignment.employee_id réfère employee.employee_id
ALTER TABLE project_assignment
ADD CONSTRAINT fk_assignment_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE;

-- project_assignment.project_id réfère project.project_id
ALTER TABLE project_assignment
ADD CONSTRAINT fk_assignment_project FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE;
