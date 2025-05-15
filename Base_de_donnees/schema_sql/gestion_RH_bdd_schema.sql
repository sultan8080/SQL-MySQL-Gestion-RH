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