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

-- Table: employee
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    date_of_birth DATE,
    department_id INT,
    job_role_id INT,
    manager_id INT DEFAULT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE SET NULL,
    FOREIGN KEY (job_role_id) REFERENCES job_role(job_role_id) ON DELETE SET NULL,
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Table: attendance
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    check_in_time DATETIME,
    check_out_time DATETIME,
    absence_type VARCHAR(100),
    absence_start_date DATE DEFAULT NULL,
    absence_end_date DATE DEFAULT NULL,
    status_id INT DEFAULT 1,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES attendance_status(status_id) ON DELETE SET NULL
) ENGINE=InnoDB;


-- Table: leave_request
CREATE TABLE leave_request (
    leave_request_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    leave_type VARCHAR(100),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status_id INT DEFAULT 1,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES leave_status(status_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Table: performance_review
CREATE TABLE performance_review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    review_date DATE NOT NULL,
    reviewer_id INT,
    performance_score INT CHECK (performance_score BETWEEN 1 AND 10),
    comments TEXT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_id) REFERENCES employee(employee_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Table: training
CREATE TABLE training (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    duration INT CHECK (duration > 0),
    trainer_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Table: project
CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100),
    project_description TEXT,
    budget DECIMAL(12,2),
    start_date DATE,
    end_date DATE,
    status_id INT DEFAULT 2,
    FOREIGN KEY (status_id) REFERENCES project_status(status_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Table: project_assignment
CREATE TABLE project_assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    role_in_project VARCHAR(100),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
) ENGINE=InnoDB;