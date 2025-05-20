-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 20 mai 2025 à 11:08
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_rh`
--

-- --------------------------------------------------------

--
-- Structure de la table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `check_in_time` datetime DEFAULT NULL,
  `check_out_time` datetime DEFAULT NULL,
  `absence_type` varchar(100) DEFAULT NULL,
  `absence_start_date` date DEFAULT NULL,
  `absence_end_date` date DEFAULT NULL,
  `status_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `employee_id`, `check_in_time`, `check_out_time`, `absence_type`, `absence_start_date`, `absence_end_date`, `status_id`) VALUES
(1, 1, '2024-05-15 08:30:00', '2024-05-15 17:30:00', NULL, NULL, NULL, 1),
(2, 2, '2024-05-15 08:45:00', '2024-05-15 17:45:00', NULL, NULL, NULL, 1),
(3, 3, NULL, NULL, 'Congé maladie', '2024-05-10', '2024-05-15', 2),
(4, 4, '2024-05-15 09:00:00', '2024-05-15 18:00:00', NULL, NULL, NULL, 1),
(5, 5, '2024-05-15 08:30:00', '2024-05-15 17:30:00', NULL, NULL, NULL, 1),
(6, 6, NULL, NULL, 'Congé annuel', '2024-05-10', '2024-05-17', 2),
(7, 7, '2024-05-15 09:15:00', '2024-05-15 18:15:00', NULL, NULL, NULL, 1),
(8, 8, '2024-05-15 08:30:00', '2024-05-15 17:30:00', NULL, NULL, NULL, 1),
(9, 9, '2024-05-15 08:50:00', '2024-05-15 17:50:00', NULL, NULL, NULL, 1),
(10, 10, NULL, NULL, 'Congé sans solde', '2024-05-12', '2024-05-20', 3);

-- --------------------------------------------------------

--
-- Structure de la table `attendance_status`
--

CREATE TABLE `attendance_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `attendance_status`
--

INSERT INTO `attendance_status` (`status_id`, `status_name`) VALUES
(2, 'Absent'),
(3, 'En congé'),
(1, 'Présent'),
(4, 'Télétravail');

-- --------------------------------------------------------

--
-- Structure de la table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `department`
--

INSERT INTO `department` (`department_id`, `name`, `location`, `manager_id`) VALUES
(1, 'Ressources Humaines', 'Paris', 42),
(2, 'Finance', 'Lyon', 54),
(3, 'Informatique', 'Marseille', 60),
(4, 'Marketing', 'Bordeaux', 27),
(5, 'Gestion des Projets', 'Toulouse', 55),
(6, 'Service Client', 'Strasbourg', 56),
(7, 'Logistique', 'Lille', 58),
(8, 'Développement Produit', 'Nantes', 59),
(9, 'Relations Publiques', 'Nice', 62),
(10, 'Qualité et Conformité', 'Grenoble', 57);

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `job_role_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `date_of_birth`, `department_id`, `job_role_id`, `manager_id`) VALUES
(1, 'Alice', 'Durand', 'alice.durand@example.com', '0601020304', '2020-05-15', '1995-02-10', 3, 1, 11),
(2, 'Bob', 'Lemoine', 'bob.lemoine@example.com', '0611223344', '2021-07-20', '1990-09-25', 2, 4, 12),
(3, 'Charlie', 'Martin', 'charlie.martin@example.com', '0622334455', '2019-11-10', '1988-06-30', 1, 3, 13),
(4, 'Diana', 'Moreau', 'diana.moreau@example.com', '0633445566', '2022-01-05', '1993-12-15', 4, 2, 14),
(5, 'Émile', 'Rousseau', 'emile.rousseau@example.com', '0644556677', '2018-09-15', '1985-07-21', 5, 8, 15),
(6, 'Félix', 'Bertrand', 'felix.bertrand@example.com', '0655667788', '2020-11-30', '1987-04-11', 6, 6, 16),
(7, 'Gabrielle', 'Lefèvre', 'gabrielle.lefevre@example.com', '0666778899', '2017-03-22', '1992-06-18', 7, 9, 17),
(8, 'Hugo', 'Delacroix', 'hugo.delacroix@example.com', '0677889900', '2023-01-10', '1996-08-25', 8, 10, 18),
(9, 'Isabelle', 'Fontaine', 'isabelle.fontaine@example.com', '0688990011', '2016-07-05', '1991-05-14', 9, 5, 19),
(10, 'Jacques', 'Giraud', 'jacques.giraud@example.com', '0699001122', '2015-04-28', '1984-03-30', 10, 7, 20),
(11, 'Karine', 'Michaud', 'karine.michaud@example.com', '0600112233', '2021-06-19', '1990-09-17', 3, 12, 1),
(12, 'Laurent', 'Perrot', 'laurent.perrot@example.com', '0611223344', '2022-08-14', '1993-12-04', 2, 13, 2),
(13, 'Manon', 'Bonnet', 'manon.bonnet@example.com', '0622334455', '2019-05-21', '1988-07-09', 1, 14, 3),
(14, 'Nicolas', 'Bouvier', 'nicolas.bouvier@example.com', '0633445566', '2017-02-10', '1991-10-22', 4, 15, 4),
(15, 'Ophélie', 'Guillaume', 'ophelie.guillaume@example.com', '0644556677', '2020-03-27', '1992-02-07', 5, 11, 5),
(16, 'Paul', 'Reynaud', 'paul.reynaud@example.com', '0655667788', '2018-11-02', '1989-11-15', 6, 12, 6),
(17, 'Quentin', 'Barbe', 'quentin.barbe@example.com', '0666778899', '2016-09-08', '1994-04-23', 7, 13, 7),
(18, 'Raphaëlle', 'Simon', 'raphaelle.simon@example.com', '0677889900', '2023-07-12', '1995-05-18', 8, 14, 8),
(19, 'Sébastien', 'Arnaud', 'sebastien.arnaud@example.com', '0688990011', '2015-12-30', '1987-01-11', 9, 15, 9),
(20, 'Thierry', 'Deschamps', 'thierry.deschamps@example.com', '0699001122', '2021-10-25', '1990-08-29', 10, 11, 10),
(21, 'Ulysse', 'Ferrand', 'ulysse.ferrand@example.com', '0600112233', '2018-06-17', '1986-02-03', 3, 10, 1),
(22, 'Véronique', 'Leclerc', 'veronique.leclerc@example.com', '0611223344', '2019-11-05', '1993-09-07', 2, 9, 2),
(23, 'William', 'Boisson', 'william.boisson@example.com', '0622334455', '2017-08-22', '1988-04-19', 1, 8, 3),
(24, 'Xavier', 'Lemoine', 'xavier.lemoine@example.com', '0633445566', '2020-12-10', '1992-05-26', 4, 7, 4),
(25, 'Yasmine', 'Gosselin', 'yasmine.gosselin@example.com', '0644556677', '2016-02-14', '1991-06-30', 5, 6, 5),
(26, 'Zacharie', 'Navarro', 'zacharie.navarro@example.com', '0655667788', '2023-04-03', '1994-07-11', 6, 5, 6),
(27, 'Aurélien', 'Tessier', 'aurelien.tessier@example.com', '0666778899', '2015-07-18', '1986-08-14', 7, 4, 7),
(28, 'Béatrice', 'Carpentier', 'beatrice.carpentier@example.com', '0677889900', '2022-03-29', '1993-11-21', 8, 3, 10),
(29, 'Clément', 'Marchand', 'clement.marchand@example.com', '0688990011', '2019-05-16', '1989-10-10', 9, 2, 9),
(30, 'Delphine', 'Renard', 'delphine.renard@example.com', '0699001122', '2018-04-24', '1990-01-15', 10, 1, 10),
(31, 'Édouard', 'Loiseau', 'edouard.loiseau@example.com', '0600112233', '2020-09-06', '1995-12-02', 3, 5, 1),
(32, 'Fanny', 'Dubois', 'fanny.dubois@example.com', '0611223344', '2016-07-15', '1991-03-08', 2, 10, 2),
(33, 'Gustave', 'Chevalier', 'gustave.chevalier@example.com', '0622334455', '2019-01-28', '1992-09-17', 1, 12, 3),
(34, 'Héloïse', 'Blanchard', 'heloise.blanchard@example.com', '0633445566', '2017-12-09', '1987-05-25', 4, 14, 4),
(35, 'Isaac', 'Fabre', 'isaac.fabre@example.com', '0644556677', '2023-05-30', '1993-07-19', 5, 9, 5),
(36, 'Juliette', 'Gautier', 'juliette.gautier@example.com', '0655667788', '2021-02-08', '1994-06-16', 6, 7, 6),
(37, 'Kylian', 'Rivière', 'kylian.riviere@example.com', '0666778899', '2018-11-26', '1988-02-28', 7, 15, 30),
(38, 'Éléonore', 'Dupont', 'eleonore.dupont@example.com', '0601234567', '2022-10-15', '1993-01-27', 4, 8, 4),
(39, 'Baptiste', 'Morel', 'baptiste.morel@example.com', '0612345678', '2019-07-21', '1990-05-19', 5, 12, 5),
(40, 'Clara', 'Germain', 'clara.germain@example.com', '0623456789', '2021-03-10', '1995-11-03', 2, 6, 2),
(41, 'Monsier', 'Hamlet', 'hamlet@example.com', '0601010101', '2015-03-01', '1982-06-15', 1, 16, NULL),
(42, 'Claire', 'Martin', 'claire.martin@example.com', '0601010101', '2015-03-01', '1982-06-15', 1, 16, 41),
(54, 'David', 'Bernard', 'david.bernard@example.com', '0602020202', '2016-07-12', '1980-09-20', 2, 17, 41),
(55, 'Élodie', 'Fournier', 'elodie.fournier@example.com', '0603030303', '2017-01-10', '1985-03-11', 5, 18, 41),
(56, 'Julien', 'Masson', 'julien.masson@example.com', '0604040404', '2018-05-22', '1983-12-07', 6, 19, 41),
(57, 'Sophie', 'Marchand', 'sophie.marchand@example.com', '0605050505', '2014-11-18', '1981-08-02', 10, 20, 41),
(58, 'Antoine', 'Garnier', 'antoine.garnier@example.com', '0606060606', '2019-04-08', '1984-02-28', 7, 21, 41),
(59, 'Nathalie', 'Roche', 'nathalie.roche@example.com', '0607070707', '2020-08-14', '1986-05-13', 5, 22, 41),
(60, 'Yann', 'Blanchet', 'yann.blanchet@example.com', '0608080808', '2016-06-30', '1982-10-19', 3, 23, 41),
(61, 'Isabelle', 'Charpentier', 'isabelle.charpentier@example.com', '0609090909', '2017-09-25', '1983-07-27', 4, 4, 41),
(62, 'Thomas', 'Pires', 'thomas.pires@example.com', '0610101010', '2015-12-03', '1980-04-04', 9, 8, 41);

-- --------------------------------------------------------

--
-- Structure de la table `job_role`
--

CREATE TABLE `job_role` (
  `job_role_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `min_salary` decimal(10,2) DEFAULT NULL,
  `max_salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_role`
--

INSERT INTO `job_role` (`job_role_id`, `title`, `department_id`, `min_salary`, `max_salary`) VALUES
(1, 'Développeur Web', 3, 35000.00, 70000.00),
(2, 'Chef de Projet IT', 3, 45000.00, 90000.00),
(3, 'Analyste Financier', 2, 40000.00, 85000.00),
(4, 'Responsable Marketing', 4, 50000.00, 95000.00),
(5, 'Spécialiste RH', 1, 38000.00, 72000.00),
(6, 'Agent de Service Client', 6, 30000.00, 60000.00),
(7, 'Logisticien', 7, 34000.00, 68000.00),
(8, 'Responsable Relations Publiques', 9, 46000.00, 88000.00),
(9, 'Contrôleur Qualité', 10, 42000.00, 82000.00),
(10, 'Ingénieur Produit', 8, 48000.00, 92000.00),
(11, 'Analyste des données', 3, 46000.00, 90000.00),
(12, 'Consultant en stratégie', 2, 50000.00, 95000.00),
(13, 'Gestionnaire de paie', 1, 38000.00, 75000.00),
(14, 'Designer UX/UI', 3, 45000.00, 87000.00),
(15, 'Chef de projet événementiel', 9, 44000.00, 86000.00),
(16, 'Responsable Ressources Humaines', 1, 45000.00, 90000.00),
(17, 'Responsable Finance', 2, 48000.00, 92000.00),
(18, 'Responsable Gestion des Projets', 5, 47000.00, 91000.00),
(19, 'Responsable Service Client', 6, 43000.00, 85000.00),
(20, 'Responsable Qualité et Conformité', 10, 44000.00, 86000.00),
(21, 'Responsable logistique', 7, 40000.00, 70000.00),
(22, 'Responsable Production', 8, 44000.00, 86000.00),
(23, 'Responsable IT', 3, 45000.00, 90000.00),
(24, 'CEO', 1, 70000.00, 110000.00);

-- --------------------------------------------------------

--
-- Structure de la table `leave_request`
--

CREATE TABLE `leave_request` (
  `leave_request_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `leave_request`
--

INSERT INTO `leave_request` (`leave_request_id`, `employee_id`, `leave_type`, `start_date`, `end_date`, `status_id`) VALUES
(1, 1, 'Congé annuel', '2024-06-10', '2024-06-20', 2),
(2, 2, 'Congé maladie', '2024-03-05', '2024-03-10', 1),
(3, 3, 'Congé maternité', '2024-07-01', '2024-09-01', 2),
(4, 4, 'Congé personnel', '2024-08-15', '2024-08-20', 3),
(5, 5, 'Congé sans solde', '2024-10-01', '2024-10-15', 2),
(6, 6, 'Congé parental', '2024-05-10', '2024-05-30', 2),
(7, 7, 'Congé exceptionnel', '2024-04-20', '2024-04-25', 1),
(8, 8, 'Congé annuel', '2024-11-01', '2024-11-10', 3),
(9, 9, 'Congé maladie', '2024-09-05', '2024-09-09', 2),
(10, 10, 'Congé maternité', '2024-12-01', '2025-02-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `leave_status`
--

CREATE TABLE `leave_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `leave_status`
--

INSERT INTO `leave_status` (`status_id`, `status_name`) VALUES
(2, 'Approuvé'),
(1, 'En attente'),
(3, 'Rejeté');

-- --------------------------------------------------------

--
-- Structure de la table `performance_review`
--

CREATE TABLE `performance_review` (
  `review_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `review_date` date NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `performance_score` int(11) DEFAULT NULL CHECK (`performance_score` between 1 and 10),
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `performance_review`
--

INSERT INTO `performance_review` (`review_id`, `employee_id`, `review_date`, `reviewer_id`, `performance_score`, `comments`) VALUES
(1, 1, '2024-04-10', 5, 8, 'Bon développement web, amélioration possible en UX.'),
(2, 2, '2024-04-15', 7, 9, 'Gestion RH efficace, quelques améliorations en communication.'),
(3, 3, '2024-03-30', 10, 7, 'Analyse financière correcte, doit être plus approfondie.'),
(4, 4, '2024-04-05', 2, 10, 'Excellent leadership et très bon travail d’équipe.'),
(5, 5, '2024-04-20', 8, 6, 'Bonne organisation, quelques retards dans les délais.'),
(6, 6, '2024-03-25', 4, 7, 'Amélioration notable en stratégie marketing.'),
(7, 7, '2024-05-01', 9, 5, 'Besoin de plus de formation en communication.'),
(8, 8, '2024-04-12', 3, 9, 'Très bon niveau technique en cybersécurité.'),
(9, 9, '2024-03-18', 6, 8, 'Bon travail en logistique, gestion efficace.'),
(10, 10, '2024-04-08', 1, 6, 'Peut mieux gérer les délais et la productivité.'),
(11, 1, '2024-04-10', 5, 8, 'Bon développement web, amélioration possible en UX.'),
(12, 2, '2024-04-15', 7, 9, 'Gestion RH efficace, quelques améliorations en communication.'),
(13, 3, '2024-03-30', 10, 7, 'Analyse financière correcte, doit être plus approfondie.'),
(14, 4, '2024-04-05', 2, 10, 'Excellent leadership et très bon travail d’équipe.'),
(15, 5, '2024-04-20', 8, 6, 'Bonne organisation, quelques retards dans les délais.'),
(16, 6, '2024-03-25', 4, 7, 'Amélioration notable en stratégie marketing.'),
(17, 7, '2024-05-01', 9, 5, 'Besoin de plus de formation en communication.'),
(18, 8, '2024-04-12', 3, 9, 'Très bon niveau technique en cybersécurité.'),
(19, 9, '2024-03-18', 6, 8, 'Bon travail en logistique, gestion efficace.'),
(20, 10, '2024-04-08', 1, 6, 'Peut mieux gérer les délais et la productivité.'),
(21, 11, '2024-04-12', 7, 9, 'Bonne gestion des ressources, amélioration possible sur la communication.'),
(22, 12, '2024-05-20', 8, 7, 'Très efficace dans la prise de décision, quelques erreurs mineures à corriger.'),
(23, 13, '2024-06-05', 6, 8, 'Bonne connaissance technique, devrait améliorer son travail en équipe.'),
(24, 14, '2024-04-30', 5, 10, 'Excellent dans l’analyse de données, apporte des solutions innovantes.'),
(25, 15, '2024-07-15', 9, 7, 'Compétent en gestion de projet, pourrait mieux gérer les délais critiques.'),
(26, 16, '2024-08-18', 2, 9, 'Leadership solide, amélioration possible dans la gestion de conflits.'),
(27, 17, '2024-03-22', 4, 6, 'Très bon dans la logistique, mais parfois trop dépendant des procédures classiques.'),
(28, 18, '2024-09-01', 10, 8, 'Bon niveau en cybersécurité, amélioration souhaitable sur la documentation technique.'),
(29, 19, '2024-10-10', 3, 7, 'Travail d’équipe exceptionnel, quelques lacunes dans les tâches individuelles.'),
(30, 20, '2024-05-07', 1, 8, 'Performant dans le service client, pourrait améliorer sa rapidité de traitement.'),
(31, 21, '2024-06-21', 8, 10, 'Expertise approfondie, manque parfois de clarté dans ses explications.'),
(32, 22, '2024-07-09', 9, 7, 'Bon en résolution de problèmes, devrait éviter les décisions impulsives.'),
(33, 23, '2024-11-12', 6, 9, 'Apport créatif significatif, nécessite de développer ses compétences analytiques.'),
(34, 24, '2024-04-04', 5, 6, 'Organisation rigoureuse, peut améliorer son adaptabilité à des situations changeantes.'),
(35, 25, '2024-12-01', 7, 9, 'Très efficace en gestion de tâches complexes, quelques erreurs de précipitation.'),
(36, 26, '2024-03-27', 10, 8, 'Excellente maîtrise technique, mais doit mieux structurer ses rapports.'),
(37, 27, '2024-05-19', 1, 7, 'Analyse correcte, manque parfois de perspicacité sur les détails importants.'),
(38, 28, '2024-09-22', 3, 8, 'Bonne gestion de projet, doit renforcer sa relation avec les équipes techniques.'),
(39, 29, '2024-06-02', 4, 10, 'Innovation forte, quelques idées irréalisables nécessitant plus danalyse.'),
(40, 30, '2024-10-18', 2, 7, 'Travail constant, pourrait être plus dynamique dans les échanges.'),
(41, 31, '2024-12-10', 9, 8, 'Bon sur le développement produit, manque parfois de vision à long terme.'),
(42, 32, '2024-08-05', 5, 9, 'Performance globale excellente, peut améliorer la précision dans les tâches critiques.'),
(43, 33, '2024-07-28', 7, 6, 'Travail efficace, devrait développer davantage ses compétences en présentation.'),
(44, 34, '2024-09-30', 8, 10, 'Très bon en analyse marketing, doit mieux structurer ses résultats.'),
(45, 35, '2024-11-20', 6, 7, 'Solide en gestion de projet, quelques erreurs d’anticipation sur les risques.'),
(46, 36, '2024-05-08', 3, 8, 'Connaissance approfondie, manque parfois de synthèse dans ses analyses.'),
(47, 37, '2024-03-15', 1, 9, 'Énergique et motivé, doit canaliser sa productivité pour de meilleurs résultats.'),
(48, 38, '2024-06-25', 10, 7, 'Bonne capacité d’adaptation, devrait prendre plus d’initiatives.'),
(49, 39, '2024-08-29', 9, 8, 'Très organisé, pourrait améliorer son approche collaborative.'),
(50, 40, '2024-10-05', 2, 10, 'Excellent gestionnaire, manque parfois d’écoute active.'),
(51, 41, '2024-07-14', 6, 9, 'Bon en relations publiques, doit affiner son discours pour le rendre plus percutant.'),
(52, 42, '2024-11-01', 4, 8, 'Bonne prise de décision, manque parfois d’approfondissement des sujets.'),
(53, 54, '2024-04-11', 7, 9, 'Rapide et méthodique, peut améliorer son approche stratégique.'),
(54, 55, '2024-05-22', 3, 7, 'Travail efficace, gestion du stress à améliorer.'),
(55, 56, '2024-06-30', 10, 8, 'Excellente gestion de conflits, pourrait mieux structurer ses projets.'),
(56, 57, '2024-07-07', 1, 6, 'Bonne gestion d’équipe, manque de précision sur les orientations stratégiques.'),
(57, 58, '2024-08-21', 9, 7, 'Très bon en coordination, manque d’innovation dans ses propositions.'),
(58, 59, '2024-09-05', 5, 9, 'Bonne organisation, amélioration possible en communication.'),
(59, 60, '2024-10-25', 8, 10, 'Gestion remarquable, pourrait mieux partager ses connaissances.'),
(60, 61, '2024-11-30', 6, 7, 'Approche pragmatique, doit renforcer son esprit critique.'),
(61, 62, '2024-12-18', 4, 8, 'Excellent dans l’analyse des données, pourrait améliorer la clarté des rapports.');

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `project_description` text DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_id` int(11) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `project`
--

INSERT INTO `project` (`project_id`, `project_name`, `project_description`, `budget`, `start_date`, `end_date`, `status_id`) VALUES
(1, 'Refonte du site web', 'Amélioration de l’interface utilisateur et de l’ergonomie.', 15000.00, '2024-03-01', '2024-09-01', 2),
(2, 'Système RH', 'Développement d’un système interne de gestion des ressources humaines.', 50000.00, '2024-01-15', '2024-12-15', 3),
(3, 'Campagne marketing', 'Lancement d’une campagne digitale pour augmenter la visibilité.', 25000.00, '2024-06-01', '2024-12-01', 2),
(4, 'Audit financier', 'Réalisation d’un audit complet des finances de l’entreprise.', 80000.00, '2024-04-10', '2024-11-30', 3),
(5, 'Plateforme e-commerce', 'Création d’une plateforme de vente en ligne pour produits exclusifs.', 95000.00, '2024-02-20', '2024-10-10', 2),
(6, 'Optimisation logistique', 'Amélioration de la gestion des stocks et de la distribution.', 62000.00, '2024-05-01', '2025-01-15', 2),
(7, 'Plan de formation', 'Mise en place de formations internes pour améliorer les compétences.', 40000.00, '2024-07-01', '2024-12-30', 3),
(8, 'Sécurité informatique', 'Renforcement des mesures de cybersécurité et des protocoles.', 70000.00, '2024-09-15', '2025-03-01', 2),
(9, 'Innovation produit', 'Développement de nouvelles fonctionnalités pour les produits existants.', 88000.00, '2024-04-01', '2025-02-01', 2),
(10, 'Service client IA', 'Mise en place d’un chatbot intelligent pour l’assistance clientèle.', 55000.00, '2024-08-20', '2025-05-10', 2);

-- --------------------------------------------------------

--
-- Structure de la table `project_assignment`
--

CREATE TABLE `project_assignment` (
  `assignment_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `role_in_project` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `project_assignment`
--

INSERT INTO `project_assignment` (`assignment_id`, `employee_id`, `project_id`, `role_in_project`, `start_date`, `end_date`) VALUES
(1, 1, 1, 'Développeur Frontend', '2024-03-01', '2024-09-01'),
(2, 5, 1, 'UX Designer', '2024-03-01', '2024-09-01'),
(3, 12, 1, 'Chef de projet IT', '2024-03-01', '2024-09-01'),
(4, 2, 2, 'Responsable RH', '2024-01-15', '2024-12-15'),
(5, 8, 2, 'Consultant RH', '2024-01-15', '2024-12-15'),
(6, 14, 2, 'Analyste RH', '2024-01-15', '2024-12-15'),
(7, 22, 2, 'Juriste RH', '2024-01-15', '2024-12-15'),
(8, 3, 3, 'Responsable marketing digital', '2024-06-01', '2024-12-01'),
(9, 11, 3, 'Community Manager', '2024-06-01', '2024-12-01'),
(10, 4, 4, 'Auditeur financier', '2024-04-10', '2024-11-30'),
(11, 10, 4, 'Comptable senior', '2024-04-10', '2024-11-30'),
(12, 18, 4, 'Expert fiscal', '2024-04-10', '2024-11-30'),
(13, 27, 4, 'Spécialiste en audit', '2024-04-10', '2024-11-30'),
(14, 33, 4, 'Auditeur interne', '2024-04-10', '2024-11-30'),
(15, 6, 5, 'Architecte logiciel', '2024-02-20', '2024-10-10'),
(16, 15, 5, 'Data Scientist', '2024-02-20', '2024-10-10'),
(17, 25, 5, 'Spécialiste Cloud', '2024-02-20', '2024-10-10'),
(18, 7, 6, 'Consultant logistique', '2024-05-01', '2025-01-15'),
(19, 17, 6, 'Responsable logistique', '2024-05-01', '2025-01-15'),
(20, 23, 6, 'Gestionnaire transport', '2024-05-01', '2025-01-15'),
(21, 30, 6, 'Responsable entrepôt', '2024-05-01', '2025-01-15'),
(22, 35, 6, 'Gestionnaire achats', '2024-05-01', '2025-01-15'),
(23, 40, 6, 'Superviseur logistique', '2024-05-01', '2025-01-15'),
(24, 9, 7, 'Formateur interne', '2024-07-01', '2024-12-30'),
(25, 26, 7, 'Consultant formation', '2024-07-01', '2024-12-30'),
(26, 16, 8, 'Expert cybersécurité', '2024-09-15', '2025-03-01'),
(27, 19, 8, 'Développeur sécurité', '2024-09-15', '2025-03-01'),
(28, 28, 8, 'Analyste cybersécurité', '2024-09-15', '2025-03-01'),
(29, 36, 8, 'Ingénieur en sécurité IT', '2024-09-15', '2025-03-01'),
(30, 13, 9, 'Ingénieur R&D', '2024-04-01', '2025-02-01'),
(31, 21, 9, 'Chef de produit', '2024-04-01', '2025-02-01'),
(32, 24, 9, 'Coordinateur R&D', '2024-04-01', '2025-02-01'),
(33, 32, 9, 'Chargé d’innovation', '2024-04-01', '2025-02-01'),
(34, 38, 9, 'Spécialiste développement produit', '2024-04-01', '2025-02-01'),
(35, 20, 10, 'Gestionnaire support client IA', '2024-08-20', '2025-05-10'),
(36, 29, 10, 'Chargé de satisfaction client', '2024-08-20', '2025-05-10'),
(37, 39, 10, 'Responsable service client', '2024-08-20', '2025-05-10'),
(38, 1, 1, 'Développeur Frontend', '2024-03-01', '2024-09-01'),
(39, 15, 1, 'UX Designer', '2024-03-01', '2024-09-01'),
(40, 26, 1, 'Chef de projet IT', '2024-03-01', '2024-09-01'),
(41, 12, 2, 'Responsable RH', '2024-01-15', '2024-12-15'),
(42, 30, 2, 'Consultant RH', '2024-01-15', '2024-12-15'),
(43, 16, 2, 'Analyste RH', '2024-01-15', '2024-12-15'),
(44, 1, 2, 'Juriste RH', '2024-01-15', '2024-12-15'),
(45, 1, 3, 'Responsable marketing digital', '2024-06-01', '2024-12-01');

-- --------------------------------------------------------

--
-- Structure de la table `project_status`
--

CREATE TABLE `project_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `project_status`
--

INSERT INTO `project_status` (`status_id`, `status_name`) VALUES
(2, 'En cours'),
(4, 'En pause'),
(1, 'Non démarré'),
(3, 'Terminé');

-- --------------------------------------------------------

--
-- Structure de la table `salary`
--

CREATE TABLE `salary` (
  `salary_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_amount` decimal(10,2) NOT NULL,
  `effective_date` date NOT NULL,
  `effective_end_date` date DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salary`
--

INSERT INTO `salary` (`salary_id`, `employee_id`, `salary_amount`, `effective_date`, `effective_end_date`, `bonus`) VALUES
(81, 1, 60000.00, '2024-01-01', NULL, 5000.00),
(82, 2, 72000.00, '2024-01-01', NULL, 7000.00),
(83, 3, 50000.00, '2024-01-01', NULL, 4500.00),
(84, 4, 75000.00, '2024-01-01', NULL, 8000.00),
(85, 5, 66000.00, '2024-01-01', NULL, 5500.00),
(86, 6, 48000.00, '2024-01-01', NULL, 4000.00),
(87, 7, 52000.00, '2024-01-01', NULL, 4500.00),
(88, 8, 89000.00, '2024-01-01', NULL, 9500.00),
(89, 9, 53000.00, '2024-01-01', NULL, 4200.00),
(90, 10, 69000.00, '2024-01-01', NULL, 6000.00),
(91, 11, 75000.00, '2024-01-01', NULL, 8000.00),
(92, 12, 82000.00, '2024-01-01', NULL, 9000.00),
(93, 13, 64000.00, '2024-01-01', NULL, 5500.00),
(94, 14, 71000.00, '2024-01-01', NULL, 6700.00),
(95, 15, 78000.00, '2024-01-01', NULL, 7200.00),
(96, 16, 50000.00, '2024-01-01', NULL, 4000.00),
(97, 17, 55000.00, '2024-01-01', NULL, 4600.00),
(98, 18, 86000.00, '2024-01-01', NULL, 9400.00),
(99, 19, 49000.00, '2024-01-01', NULL, 3700.00),
(100, 20, 73000.00, '2024-01-01', NULL, 6800.00),
(101, 21, 67000.00, '2024-01-01', NULL, 6200.00),
(102, 22, 78000.00, '2024-01-01', NULL, 7200.00),
(103, 23, 52000.00, '2024-01-01', NULL, 4500.00),
(104, 24, 85000.00, '2024-01-01', NULL, 9000.00),
(105, 25, 49000.00, '2024-01-01', NULL, 4200.00),
(106, 26, 70000.00, '2024-01-01', NULL, 6500.00),
(107, 27, 55000.00, '2024-01-01', NULL, 4700.00),
(108, 28, 62000.00, '2024-01-01', NULL, 5200.00),
(109, 29, 80000.00, '2024-01-01', NULL, 8500.00),
(110, 30, 78000.00, '2024-01-01', NULL, 7300.00),
(111, 31, 56000.00, '2024-01-01', NULL, 4700.00),
(112, 32, 69000.00, '2024-01-01', NULL, 6200.00),
(113, 33, 72000.00, '2024-01-01', NULL, 6700.00),
(114, 34, 75000.00, '2024-01-01', NULL, 7200.00),
(115, 35, 48000.00, '2024-01-01', NULL, 3900.00),
(116, 36, 81000.00, '2024-01-01', NULL, 8800.00),
(117, 37, 54000.00, '2024-01-01', NULL, 4600.00),
(118, 38, 78000.00, '2024-01-01', NULL, 7400.00),
(119, 39, 83000.00, '2024-01-01', NULL, 9100.00),
(120, 40, 60000.00, '2024-01-01', NULL, 5000.00);

-- --------------------------------------------------------

--
-- Structure de la table `trainer`
--

CREATE TABLE `trainer` (
  `trainer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expertise` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trainer`
--

INSERT INTO `trainer` (`trainer_id`, `name`, `expertise`) VALUES
(1, 'Jean Dupont', 'Développement Web'),
(2, 'Marie Lefèvre', 'Gestion des ressources humaines'),
(3, 'Alex Martin', 'Analyse financière'),
(4, 'Sophie Bernard', 'Marketing digital'),
(5, 'Thomas Petit', 'Sécurité informatique'),
(6, 'Laura Robert', 'Gestion de projet'),
(7, 'Pierre Moreau', 'Communication et leadership'),
(8, 'Camille Girard', 'Logistique et transport'),
(9, 'Lucie Fontaine', 'Design UX/UI'),
(10, 'David Rousseau', 'Cybersécurité');

-- --------------------------------------------------------

--
-- Structure de la table `training`
--

CREATE TABLE `training` (
  `training_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL CHECK (`duration` > 0),
  `trainer_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `training`
--

INSERT INTO `training` (`training_id`, `title`, `description`, `duration`, `trainer_id`, `start_date`, `end_date`) VALUES
(1, 'Formation HTML & CSS', 'Apprendre les bases du développement web.', 30, 1, '2024-05-10', '2024-06-10'),
(2, 'Stratégies RH', 'Optimisation des processus de recrutement.', 25, 2, '2024-07-01', '2024-07-26'),
(3, 'Analyse financière avancée', 'Méthodes d’analyse pour les entreprises.', 40, 3, '2024-08-15', '2024-09-24'),
(4, 'Marketing digital et réseaux sociaux', 'Stratégies de contenu et publicité ciblée.', 35, 4, '2024-06-01', '2024-07-05'),
(5, 'Sécurité informatique', 'Meilleures pratiques pour protéger les données.', 45, 5, '2024-09-01', '2024-10-15'),
(6, 'Gestion de projet Agile', 'Introduction aux méthodologies Agile.', 30, 6, '2024-05-20', '2024-06-20'),
(7, 'Leadership et communication', 'Amélioration de la prise de décision.', 20, 7, '2024-10-10', '2024-10-30'),
(8, 'Optimisation logistique', 'Stratégies pour réduire les coûts.', 50, 8, '2024-11-01', '2024-12-15'),
(9, 'UX/UI Design avancé', 'Créer des interfaces intuitives.', 30, 9, '2024-07-15', '2024-08-15'),
(10, 'Protection des systèmes informatiques', 'Renforcement de la cybersécurité.', 40, 10, '2024-12-01', '2025-01-15');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Index pour la table `attendance_status`
--
ALTER TABLE `attendance_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Index pour la table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `fk_department_manager` (`manager_id`);

--
-- Index pour la table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `job_role_id` (`job_role_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Index pour la table `job_role`
--
ALTER TABLE `job_role`
  ADD PRIMARY KEY (`job_role_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Index pour la table `leave_request`
--
ALTER TABLE `leave_request`
  ADD PRIMARY KEY (`leave_request_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Index pour la table `leave_status`
--
ALTER TABLE `leave_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Index pour la table `performance_review`
--
ALTER TABLE `performance_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Index pour la table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Index pour la table `project_assignment`
--
ALTER TABLE `project_assignment`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Index pour la table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Index pour la table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `fk_salary_employee` (`employee_id`);

--
-- Index pour la table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`trainer_id`);

--
-- Index pour la table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`training_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `attendance_status`
--
ALTER TABLE `attendance_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `job_role`
--
ALTER TABLE `job_role`
  MODIFY `job_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `leave_request`
--
ALTER TABLE `leave_request`
  MODIFY `leave_request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `leave_status`
--
ALTER TABLE `leave_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `performance_review`
--
ALTER TABLE `performance_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `project_assignment`
--
ALTER TABLE `project_assignment`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `salary`
--
ALTER TABLE `salary`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `trainer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `training`
--
ALTER TABLE `training`
  MODIFY `training_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `attendance_status` (`status_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `fk_department_manager` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`job_role_id`) REFERENCES `job_role` (`job_role_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `job_role`
--
ALTER TABLE `job_role`
  ADD CONSTRAINT `job_role_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `leave_request`
--
ALTER TABLE `leave_request`
  ADD CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_request_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `leave_status` (`status_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `performance_review`
--
ALTER TABLE `performance_review`
  ADD CONSTRAINT `performance_review_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `performance_review_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `project_status` (`status_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `project_assignment`
--
ALTER TABLE `project_assignment`
  ADD CONSTRAINT `project_assignment_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_assignment_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `fk_salary_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
