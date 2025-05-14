## Structure de la base de données - Gestion RH

Ce fichier décrit la structure de la base de données pour un système de **Gestion des Ressources Humaines (RH)**. Il présente les différentes entités utilisées pour gérer les employés, leurs informations, et leurs interactions dans le cadre de l'entreprise. Chaque entité est définie avec ses colonnes principales et son objectif dans le système.

### 1. **Employees (Employés)**
**Objectif** : Stocke les détails personnels et professionnels des employés.
- `id` (Clé primaire) : Identifiant unique de l'employé.
- `first_name` : Prénom de l'employé.
- `last_name` : Nom de famille de l'employé.
- `email` : Adresse e-mail de l'employé.
- `phone_number` : Numéro de téléphone de l'employé.
- `hire_date` : Date d'embauche de l'employé.
- `date_of_birth` (Date of Birth) : Date de naissance de l'employé.
- `department_id` : Identifiant du département auquel l'employé est affecté (clé étrangère vers **Departments**).
- `position_id` : Identifiant du poste de l'employé (clé étrangère vers **Positions**).
- `salary_id` : Identifiant du salaire actuel de l'employé (clé étrangère vers **Salaries**).
- `manager_id` : Identifiant du manager de l'employé, s'il y en a un (clé étrangère vers **Employees**, optionnel).

### 2. **Departments (Départements)**
**Objectif** : Permet de regrouper les employés dans des unités organisationnelles (par exemple, RH, IT, Marketing).

- `id` (Clé primaire) : Identifiant unique du département.
- `name` : Nom du département (ex. : "Ressources Humaines").
- `location` : Localisation géographique du département.
- `manager_id` : Identifiant du responsable du département (clé étrangère vers **Employees**).


### 3. **Positions (Postes)**
**Objectif** : Définit les rôles ou fonctions occupés par les employés au sein des départements.

- `id` (Clé primaire) : Identifiant unique du poste.
- `title` : Titre du poste (ex. : "Développeur", "Chef de projet").
- `department_id` : Identifiant du département auquel appartient le poste (clé étrangère vers **Departments**).
- `salary_range` : Plage salariale pour ce poste.

### 4. **Salaries (Salaires)**
**Objectif** : Suit l'historique des salaires des employés et permet d'effectuer des mises à jour lorsque nécessaire.

- `id` (Clé primaire) : Identifiant unique du salaire.
- `employee_id` : Identifiant de l'employé concerné (clé étrangère vers **Employees**).
- `salary_amount` : Montant du salaire de l'employé.
- `effective_date` : Date d'entrée en vigueur du salaire.
- `bonus` : Bonus éventuel associé à ce salaire.

### 5. **Attendance (Présence)**
**Objectif** : Permet de suivre la présence et l'absence des employés sur le lieu de travail.
- `id` (Clé primaire) : Identifiant unique de l'enregistrement de présence.
- `employee_id` : Identifiant de l'employé (clé étrangère vers **Employees**).
- `check_in_time` : Heure d'entrée de l'employé.
- `check_out_time` : Heure de sortie de l'employé.
- `absence_type` : Type d'absence (par exemple, "Maladie", "Congé payé").
- `absence_start_date` : Date de début de l'absence (si applicable).
- `absence_end_date` : Date de fin de l'absence (si applicable).


### 6. **Leave Requests (Demandes de Congé)**
**Objectif** : Gère les demandes de congé des employés (vacances, maladie, etc.).
- `id` (Clé primaire) : Identifiant unique de la demande de congé.
- `employee_id` : Identifiant de l'employé demandant le congé (clé étrangère vers **Employees**).
- `leave_type` : Type de congé (par exemple, "Congé annuel", "Congé maladie").
- `start_date` : Date de début du congé.
- `end_date` : Date de fin du congé.
- `status` : Statut de la demande (par exemple, "En attente", "Approuvé", "Rejeté").


### 7. **Performance Reviews (Évaluations de Performance)**
**Objectif** : Enregistre les évaluations de performance des employés.
- `id` (Clé primaire) : Identifiant unique de l'évaluation.
- `employee_id` : Identifiant de l'employé évalué (clé étrangère vers **Employees**).
- `review_date` : Date de l'évaluation.
- `reviewer_id` : Identifiant de l'évaluateur (clé étrangère vers **Employees**, généralement un manager).
- `performance_score` : Note de performance de l'employé.
- `comments` : Commentaires supplémentaires sur la performance de l'employé.


### 8. **Training (Formations)**
**Objectif** : Suivi des formations ou certifications suivies par les employés.
- `id` (Clé primaire) : Identifiant unique de la formation.
- `title` : Titre de la formation (par exemple, "Formation Leadership").
- `description` : Description de la formation.
- `duration` : Durée de la formation (en heures, jours, etc.).
- `trainer_id` : Identifiant de l'instructeur ou formateur (clé étrangère vers **Employees**, si la formation est interne).
- `start_date` : Date de début de la formation.
- `end_date` : Date de fin de la formation.

### 9. **Projects (Projets)**
**Objectif** : Liste les projets d'entreprise, avec des informations essentielles (objectif, budget, dates).
- `id` (Clé primaire) : Identifiant unique du projet.
- `name` : Nom du projet (par exemple, "Développement d'un logiciel").
- `description` : Description du projet.
- `budget` : Budget alloué au projet.
- `start_date` : Date de début du projet.
- `end_date` : Date de fin du projet.
- `status` : Statut du projet (par exemple, "En cours", "Terminé", "Suspendu").


### 10. **Project Assignments (Affectations de Projets)**
**Objectif** : Lie les employés aux projets spécifiques sur lesquels ils travaillent.
- `id` (Clé primaire) : Identifiant unique de l'affectation.
- `employee_id` : Identifiant de l'employé assigné au projet (clé étrangère vers **Employees**).
- `project_id` : Identifiant du projet (clé étrangère vers **Projects**).
- `role_in_project` : Rôle joué par l'employé dans le projet (par exemple, "Développeur", "Manager de projet").
- `start_date` : Date de début de l'affectation au projet.
- `end_date` : Date de fin de l'affectation au projet.

### **Conclusion :**
Cette base de données permet de gérer efficacement les informations relatives aux employés, aux projets, et aux processus RH de l'entreprise.
