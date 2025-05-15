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