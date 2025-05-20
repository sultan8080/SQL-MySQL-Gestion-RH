## 60 Défis SQL - Projet de Gestion des Ressources Humaines

Bienvenue dans ce projet SQL orienté **apprentissage progressif**, basé sur un système complet de **gestion des ressources humaines (RH)**.
Ce dépôt propose **60 Défis SQL** classés par niveau, ainsi que toute la structure de la base de données (modélisation conceptuelle, logique, physique et données réelles).

### Contenu du projet

- **1-10 Défis SQL - Niveau Débutant**
- **11-40 Défis SQL - Niveau Intermédiaire**
- **41-60 Défis SQL - Niveau Avancé**
- **Modèle Conceptuel de Données (MCD)**
- **Modèle Logique de Données (MLD)**
- **Fichier SQL complet** :
  - Structure des tables
  - Contraintes
  - Données d'exemple
- **Mises à jour** : ajout de 2 à 3 tables pour enrichir les cas d’usage.

### Objectifs pédagogiques

- Pratiquer le SQL avec des cas concrets en entreprise (RH).
- Explorer des requêtes de sélection, d’agrégation, de jointures complexes, de sous-requêtes, de fonctions analytiques, etc.
- Renforcer les compétences de modélisation de données.


### Niveaux de difficulté

### Débutant (1-10 défis)
- Sélection simple
- Filtres avec `WHERE`
- Tri avec `ORDER BY`
- Fonctions d’agrégation de base

### Intermédiaire (11-40 défis)
- Jointures entre plusieurs tables
- Agrégats et `GROUP BY`
- Sous-requêtes
- Calculs de durée, regroupements par mois/année, etc.

### Avancé (41-60 défis)
- Fonctions analytiques (`RANK`, `ROW_NUMBER`)
- CTE, sous-requêtes corrélées
- Analyse multi-table, logique RH avancée
- Détection de cohérences métier

### Base de données

- **Nom** : `gestion_rh`
- Plus de 15 tables incluant :
  - `employee`, `department`, `job_role`, `attendance`, `leave_request`, `project`, `project_assignment`, `salary`, `performance_review`, `training`, `trainer`, etc.
- **Ajouts récents** : certaines tables ont été ajoutées pour enrichir les cas d’analyse (employee_training, training_job_role).

### Installation

1. Cloner ce dépôt :
   git clone https://github.com/sultan8080/sql-gestion-rh.git
   cd sql-gestion-rh

Une fois le projet installé, vous pouvez importer la base de données à partir du fichier suivant :
```bash
base_de_donnee/complete_gestion_rh.sql