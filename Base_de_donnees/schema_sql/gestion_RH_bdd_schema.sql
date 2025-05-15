-- Gestion RH Database Schema

CREATE DATABASE IF NOT EXISTS gestion_rh;
USE gestion_rh;

-- Table department
CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    manager_id INT,
    CONSTRAINT fk_department_manager FOREIGN KEY (manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL
);

-- Table position
CREATE TABLE position (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    salary_range VARCHAR(50),
    CONSTRAINT fk_position_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE
);


-- Table employee
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    date_of_birth DATE,
    department_id INT,
    position_id INT,
    manager_id INT,
    CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE SET NULL,
    CONSTRAINT fk_employee_position FOREIGN KEY (position_id) REFERENCES position(position_id) ON DELETE SET NULL,
    CONSTRAINT fk_employee_manager FOREIGN KEY (manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL
);

-- Table salary
CREATE TABLE salary (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    salary_amount DECIMAL(10,2) NOT NULL,
    effective_date DATE NOT NULL,
    bonus DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT fk_salary_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);


-- Table attendance
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    check_in_time DATETIME,
    check_out_time DATETIME,
    absence_type VARCHAR(50),
    absence_start_date DATE,
    absence_end_date DATE,
    CONSTRAINT fk_attendance_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);

-- Table leave_request
CREATE TABLE leave_request (
    leave_request_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    leave_type VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    CONSTRAINT fk_leave_request_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);


-- Table performance_review
CREATE TABLE performance_review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    review_date DATE NOT NULL,
    reviewer_id INT,
    performance_score INT CHECK (performance_score BETWEEN 1 AND 10),
    comments TEXT,
    CONSTRAINT fk_performance_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    CONSTRAINT fk_performance_reviewer FOREIGN KEY (reviewer_id) REFERENCES employee(employee_id) ON DELETE SET NULL
);

-- Table training
CREATE TABLE training (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    duration INT, -- duration in hours
    trainer_id INT,
    start_date DATE,
    end_date DATE,
    CONSTRAINT fk_training_trainer FOREIGN KEY (trainer_id) REFERENCES employee(employee_id) ON DELETE SET NULL
);

-- Table project
CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    project_description TEXT,
    budget DECIMAL(15,2),
    start_date DATE,
    end_date DATE,
    status ENUM('Ongoing', 'Completed', 'On Hold') DEFAULT 'Ongoing'
);


-- Table project_assignment
CREATE TABLE project_assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    role_in_project VARCHAR(100),
    start_date DATE,
    end_date DATE,
    CONSTRAINT fk_assignment_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    CONSTRAINT fk_assignment_project FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
    UNIQUE KEY unique_assignment (employee_id, project_id)
);