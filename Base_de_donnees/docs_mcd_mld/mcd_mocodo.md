
### 📘 Modèle Conceptuel de Données (MCD)

#### 🧩 Diagramme MCD (Mocodo)

Le diagramme suivant représente les entités, leurs attributs, et les associations entre elles.

![Diagramme MCD](mcd.png)


### Description des entités

#### EMPLOYEE
**Attributs** : `employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `date_of_birth`  
Un employé peut appartenir à un département, avoir un rôle, participer à des projets, suivre des formations, soumettre des demandes de congé, etc.

#### DEPARTMENT  
**Attributs** : `department_id`, `name`, `location`, `manager_id`  
Un département peut avoir plusieurs employés et un manager.

#### JOB_ROLE  
**Attributs** :`job_role_id`, `title`, `department_id`, `min_salary`, `max_salary`  
Un poste appartient à un département et peut être occupé par plusieurs employés.

#### SALARY  
**Attributs** : `salary_id`, `employee_id`, `salary_amount`, `effective_date`, `effective_end_date`, `bonus`  
Historique des salaires par employé, permettant le suivi des évolutions.

#### TRAINER  
Attributs : `trainer_id`, `name`, `expertise`  
Intervenant externe chargé de dispenser des formations.

#### TRAINING  
**Attributs** :`training_id`, `title`, `description`, `duration`, `trainer_id`, `start_date`, `end_date`  
Une session de formation peut être suivie par plusieurs employés.

#### PROJECT  
**Attributs** : `project_id`, `project_name`, `project_description`, `budget`, `start_date`, `end_date`, `status_id`  
Un projet peut être attribué à des employés via des affectations (`project_assignment`).

#### PROJECT_ASSIGNMENT  
**Attributs** : `assignment_id`, `employee_id`, `project_id`, `role_in_project`, `start_date`, `end_date`  
Relie les employés aux projets avec un rôle précis.

#### PERFORMANCE_REVIEW  
**Attributs** :`review_id`, `employee_id`, `review_date`, `reviewer_id`, `performance_score`, `comments`  
Historique des évaluations de performance des employés.

#### LEAVE_REQUEST  
**Attributs** : `leave_request_id`, `employee_id`, `leave_type`, `start_date`, `end_date`, `status_id`  
Enregistre les demandes de congés d’un employé.

#### ATTENDANCE  
**Attributs** : `attendance_id`, `employee_id`, `check_in_time`, `check_out_time`, `absence_type`, `absence_start_date`, `absence_end_date`, `status_id`  
Sert à suivre la présence et les absences des employés.

#### ATTENDANCE_STATUS  
**Attributs** : `status_id`, `status_name`  
Statuts possibles de présence (ex. Présent, Absent, Retard...).

#### LEAVE_STATUS  
**Attributs** : `status_id`, `status_name`  
Statuts possibles des congés (ex. Approuvé, Rejeté, En attente...).

#### PROJECT_STATUS  
**Attributs** : `status_id`, `status_name`  
Statuts possibles d’un projet (ex. En cours, Terminé, Annulé...).

#### Associations majeures

- `BELONGS_TO`: EMPLOYEE ↔ DEPARTMENT
- `HAS_JOB_ROLE`: EMPLOYEE ↔ JOB_ROLE
- `HAS_SALARY`: EMPLOYEE ↔ SALARY
- `MANAGES`: EMPLOYEE (manager) ↔ DEPARTMENT
- `WORKS_ON`: EMPLOYEE ↔ PROJECT_ASSIGNMENT
- `ASSIGNED_TO`: PROJECT_ASSIGNMENT ↔ PROJECT
- `TRAINED_IN`: EMPLOYEE ↔ TRAINING
- `DELIVERED_BY`: TRAINING ↔ TRAINER
- `REVIEWS`: EMPLOYEE ↔ PERFORMANCE_REVIEW
- `LEAVE_SUBMITTED`: EMPLOYEE ↔ LEAVE_REQUEST
- `RECORDED_IN`: ATTENDANCE ↔ EMPLOYEE
- `STATUS_OF_ATTENDANCE`: ATTENDANCE ↔ ATTENDANCE_STATUS
- `STATUS_OF_LEAVE`: LEAVE_REQUEST ↔ LEAVE_STATUS
- `PROJECT_STATUS_FOR`: PROJECT ↔ PROJECT_STATUS






