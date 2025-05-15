## Structure de la base de données - Gestion RH

#### 1. **Employees (Employés)**
**Objectif** : Stocke les détails personnels et professionnels des employés.
- `employee_id` (Clé primaire) : Identifiant unique de l'employé.
- `first_name` : Prénom de l'employé.
- `last_name` : Nom de famille de l'employé.
- `email` : Adresse e-mail de l'employé.
- `phone_number` : Numéro de téléphone de l'employé.
- `hire_date` : Date d'embauche de l'employé.
- `date_of_birth` : Date de naissance.
- `department_id` : Référence vers le département de l'employé.
- `job_role_id` : Référence vers le poste occupé.
- `manager_id` : Supérieur hiérarchique (référence vers un autre employé).


#### 2. **Departments (Départements)**
**Objectif** : Représente les services de l'entreprise (ex : RH, IT, Finance).
- `department_id` (Clé primaire) : Identifiant unique.
- `name` : Nom du département.
- `location` : Localisation.
- `manager_id` : Employé responsable du département.

#### 3. **Job Roles (Postes/Rôles)**
**Objectif** : Décrit les postes occupés dans l'organisation.
- `job_role_id` (Clé primaire) : Identifiant du poste.
- `title` : Intitulé du poste.
- `department_id` : Département associé.
- `min_salary` : Salaire minimum.
- `max_salary` : Salaire maximum.

#### 4. **Salaries (Salaires)**
**Objectif** : Gère l’historique des salaires.
- `salary_id` (Clé primaire) : Identifiant du salaire.
- `employee_id` : Employé concerné.
- `salary_amount` : Montant du salaire.
- `effective_date` : Date de début d’effet.
- `effective_end_date` : Fin de validité (si applicable).
- `bonus` : Bonus éventuel.

#### 5. **Attendance (Présence)**
**Objectif** : Gère les présences/absences des employés.
- `attendance_id` : Identifiant unique.
- `employee_id` : Employé concerné.
- `check_in_time` : Heure d’arrivée.
- `check_out_time` : Heure de départ.
- `absence_type` : Motif d’absence (maladie, congé...).
- `absence_start_date` : Début de l’absence.
- `absence_end_date` : Fin de l’absence.
- `status_id` : Statut de présence (clé vers `attendance_status`).


#### 6. **Attendance Status**
**Objectif** : Liste des statuts de présence.
- `status_id` : Identifiant.
- `status_name` : Nom du statut (Présent, Absent, Retard...).

#### 7. **Leave Requests (Demandes de Congé)**
**Objectif** : Traite les congés des employés.
- `leave_request_id` : Identifiant.
- `employee_id` : Employé concerné.
- `leave_type` : Type de congé.
- `start_date` : Début du congé.
- `end_date` : Fin du congé.
- `status_id` : Statut de la demande (clé vers `leave_status`).


#### 8. **Leave Status**
**Objectif** : Définit les statuts de traitement des congés.
- `status_id` : Identifiant.
- `status_name` : Statut (En attente, Approuvé, Rejeté...).


#### 9. **Performance Reviews (Évaluations)**
**Objectif** : Archive les évaluations des employés.
- `review_id` : Identifiant.
- `employee_id` : Employé évalué.
- `review_date` : Date de l’évaluation.
- `reviewer_id` : Évaluateur (autre employé).
- `performance_score` : Note.
- `comments` : Commentaires.


#### 10. **Training (Formations)**
**Objectif** : Regroupe les sessions de formation proposées.
- `training_id` : Identifiant.
- `title` : Nom de la formation.
- `description` : Contenu ou sujet.
- `duration` : Durée.
- `trainer_id` : Référence vers un formateur.
- `start_date` / `end_date` : Période de la formation.


#### 11. **Trainer (Formateurs)**
**Objectif** : Répertorie les formateurs internes/externes.
- `trainer_id` : Identifiant.
- `name` : Nom du formateur.
- `expertise` : Domaine d’expertise.

#### 12. **Projects (Projets)**
**Objectif** : Définit les projets de l’entreprise.
- `project_id` : Identifiant.
- `project_name` : Nom du projet.
- `project_description` : Détails du projet.
- `budget` : Budget alloué.
- `start_date` / `end_date` : Durée du projet.
- `status_id` : Statut du projet (clé vers `project_status`).

#### 13. **Project Status**
**Objectif** : Liste les statuts possibles des projets.
- `status_id` : Identifiant.
- `status_name` : Nom du statut (En cours, Terminé...).


#### 14. **Project Assignment (Affectations de Projet)**
**Objectif** : Lie employés et projets.
- `assignment_id` : Identifiant.
- `employee_id` : Employé affecté.
- `project_id` : Projet concerné.
- `role_in_project` : Rôle spécifique (ex : Développeur).
- `start_date` / `end_date` : Période d’affectation.

