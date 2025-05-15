-- Base de données Gestion RH - Schéma 
CREATE DATABASE IF NOT EXISTS gestion_rh;
USE gestion_rh;

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
