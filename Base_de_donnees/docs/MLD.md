### Modèle Logique de Données (MLD) - Gestion RH

#### Table : `employee`
- `employee_id` (PK)
- `first_name`
- `last_name`
- `email`
- `phone_number`
- `hire_date`
- `date_of_birth`
- `department_id` (FK → `department.department_id`)
- `job_role_id` (FK → `job_role.job_role_id`)
- `manager_id` (FK → `employee.employee_id`)

#### Table : `department`
- `department_id` (PK)
- `name`
- `location`
- `manager_id` (FK → `employee.employee_id`)

#### Table : `job_role`
- `job_role_id` (PK)
- `title`
- `department_id` (FK → `department.department_id`)
- `min_salary`
- `max_salary`

#### Table : `salary`
- `salary_id` (PK)
- `employee_id` (FK → `employee.employee_id`)
- `salary_amount`
- `effective_date`
- `effective_end_date`
- `bonus`

#### Table : `attendance`
- `attendance_id` (PK)
- `employee_id` (FK → `employee.employee_id`)
- `check_in_time`
- `check_out_time`
- `absence_type`
- `absence_start_date`
- `absence_end_date`
- `status_id` (FK → `attendance_status.status_id`)

#### Table : `attendance_status`
- `status_id` (PK)
- `status_name` (unique)

#### Table : `leave_request`
- `leave_request_id` (PK)
- `employee_id` (FK → `employee.employee_id`)
- `leave_type`
- `start_date`
- `end_date`
- `status_id` (FK → `leave_status.status_id`)

#### Table : `leave_status`
- `status_id` (PK)
- `status_name` (unique)

#### Table : `performance_review`
- `review_id` (PK)
- `employee_id` (FK → `employee.employee_id`)
- `review_date`
- `reviewer_id` (FK → `employee.employee_id`, optionnel)
- `performance_score`
- `comments`

#### Table : `training`
- `training_id` (PK)
- `title`
- `description`
- `duration`
- `trainer_id` (FK → `trainer.trainer_id`, optionnel)
- `start_date`
- `end_date`

#### Table : `trainer`
- `trainer_id` (PK)
- `name`
- `expertise`

---

#### Table : `project`
- `project_id` (PK)
- `project_name`
- `project_description`
- `budget`
- `start_date`
- `end_date`
- `status_id` (FK → `project_status.status_id`)

#### Table : `project_status`
- `status_id` (PK)
- `status_name` (unique)

#### Table : `project_assignment`
- `assignment_id` (PK)
- `employee_id` (FK → `employee.employee_id`)
- `project_id` (FK → `project.project_id`)
- `role_in_project`
- `start_date`
- `end_date`