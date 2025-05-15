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

-- Table: salary
CREATE TABLE salary (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    salary_amount DECIMAL(10,2) NOT NULL,
    effective_date DATE NOT NULL,
    effective_end_date DATE DEFAULT NULL,
    bonus DECIMAL(10,2)
) ENGINE=InnoDB;

-- Table: trainer
CREATE TABLE trainer (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    expertise VARCHAR(100)
) ENGINE=InnoDB;
