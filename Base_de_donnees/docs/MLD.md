# Modèle Logique de Données (MLD) - Gestion RH

### 📄 Table : employee
- `employee_id` (PK)
- `first_name`
- `last_name`
- `email`
- `phone_number`
- `hire_date`
- `date_of_birth`
- `department_id` (FK → department.department_id)
- `position_id` (FK → position.position_id)
- `manager_id` (FK → employee.employee_id, optionnel)

### 📄 Table : department
- `department_id` (PK)
- `name`
- `location`
- `manager_id` (FK → employee.employee_id, optionnel)


### 📄 Table : position
- `position_id` (PK)
- `title`
- `department_id` (FK → department.department_id)
- `salary_range`

### 📄 Table : salary
- `salary_id` (PK)
- `employee_id` (FK → employee.employee_id)
- `salary_amount`
- `effective_date`
- `bonus`


### 📄 Table : attendance
- `attendance_id` (PK)
- `employee_id` (FK → employee.employee_id)
- `check_in_time`
- `check_out_time`
- `absence_type`
- `absence_start_date`
- `absence_end_date`


### 📄 Table : leave_request
- `leave_request_id` (PK)
- `employee_id` (FK → employee.employee_id)
- `leave_type`
- `start_date`
- `end_date`
- `status`


### 📄 Table : performance_review
- `review_id` (PK)
- `employee_id` (FK → employee.employee_id)
- `review_date`
- `reviewer_id` (FK → employee.employee_id)
- `performance_score`
- `comments`


### 📄 Table : training
- `training_id` (PK)
- `title`
- `description`
- `duration`
- `trainer_id` (FK → employee.employee_id, optionnel)
- `start_date`
- `end_date`


### 📄 Table : project
- `project_id` (PK)
- `project_name`
- `project_description`
- `budget`
- `start_date`
- `end_date`
- `status`

### 📄 Table : project_assignment
- `assignment_id` (PK)
- `employee_id` (FK → employee.employee_id)
- `project_id` (FK → project.project_id)
- `role_in_project`
- `start_date`
- `end_date`


