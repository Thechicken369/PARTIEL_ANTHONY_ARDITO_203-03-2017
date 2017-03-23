-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 23 Mars 2017 à 16:39
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gest_projet`
--
CREATE DATABASE IF NOT EXISTS `gest_projet` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gest_projet`;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `CLI_ID` int(11) NOT NULL,
  `CLI_Nom` varchar(100) DEFAULT NULL,
  `CLI_Adresse` varchar(250) DEFAULT NULL,
  `CLI_Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `finance`
--

CREATE TABLE `finance` (
  `FIN_IDProjet` int(11) NOT NULL,
  `FIN_IDClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `NO_ID` int(11) NOT NULL,
  `NO_Contenue` varchar(105) NOT NULL,
  `NO_Date` date NOT NULL,
  `NO_IDProj` int(11) NOT NULL,
  `NO_IDUtil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `PRO_ID` int(11) NOT NULL,
  `PRO_Nom` varchar(100) NOT NULL,
  `PRO_Date_Fin` date DEFAULT NULL,
  `PRO_Date_Debut` date DEFAULT NULL,
  `PRO_Nature` varchar(100) DEFAULT NULL,
  `PRO_Description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`PRO_ID`, `PRO_Nom`, `PRO_Date_Fin`, `PRO_Date_Debut`, `PRO_Nature`, `PRO_Description`) VALUES
(1, 'Orientation', '2017-05-17', '2016-12-05', 'Game Design', 'C\'est le projet que je fais en game design '),
(2, 'ETP', '2017-05-17', '2017-01-18', 'serious game', 'Projet sur la morphologie infantile'),
(3, 'Apli mobile', '2017-03-15', '2017-03-06', 'Gestion de projet', 'Application qui fait un appel a la base de donnée ');

-- --------------------------------------------------------

--
-- Structure de la table `ressource`
--

CREATE TABLE `ressource` (
  `RES_Type` varchar(250) NOT NULL,
  `RES_Description` varchar(250) NOT NULL,
  `RES_ID` int(11) NOT NULL,
  `RES_IDProj` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `travail`
--

CREATE TABLE `travail` (
  `TRA_IDUti` int(11) NOT NULL,
  `TRA_IDProjet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `travail`
--

INSERT INTO `travail` (`TRA_IDUti`, `TRA_IDProjet`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `UTI_ID` int(11) NOT NULL,
  `UTI_Nom` varchar(250) DEFAULT NULL,
  `UTI_MDP` varchar(250) DEFAULT NULL,
  `UTI_Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`UTI_ID`, `UTI_Nom`, `UTI_MDP`, `UTI_Email`) VALUES
(1, 'anthony', 'lol', 'anthonyardito@gmail.com'),
(2, 'bob', 'lol', '');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`CLI_ID`);

--
-- Index pour la table `finance`
--
ALTER TABLE `finance`
  ADD KEY `FIN_IDProjet` (`FIN_IDProjet`),
  ADD KEY `FIN_IDClient` (`FIN_IDClient`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`NO_ID`),
  ADD KEY `NO_IDProj` (`NO_IDProj`),
  ADD KEY `NO_IDUtil` (`NO_IDUtil`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`PRO_ID`);

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`RES_ID`),
  ADD KEY `RES_IDProj` (`RES_IDProj`);

--
-- Index pour la table `travail`
--
ALTER TABLE `travail`
  ADD KEY `TRA_IDUti` (`TRA_IDUti`),
  ADD KEY `TRA_IDProjet` (`TRA_IDProjet`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`UTI_ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `CLI_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `NO_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `PRO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `RES_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `UTI_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `finance`
--
ALTER TABLE `finance`
  ADD CONSTRAINT `finance_ibfk_1` FOREIGN KEY (`FIN_IDProjet`) REFERENCES `projet` (`PRO_ID`),
  ADD CONSTRAINT `finance_ibfk_2` FOREIGN KEY (`FIN_IDClient`) REFERENCES `client` (`CLI_ID`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`NO_IDProj`) REFERENCES `projet` (`PRO_ID`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`NO_IDUtil`) REFERENCES `utilisateur` (`UTI_ID`);

--
-- Contraintes pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD CONSTRAINT `ressource_ibfk_1` FOREIGN KEY (`RES_IDProj`) REFERENCES `projet` (`PRO_ID`);

--
-- Contraintes pour la table `travail`
--
ALTER TABLE `travail`
  ADD CONSTRAINT `travail_ibfk_1` FOREIGN KEY (`TRA_IDProjet`) REFERENCES `projet` (`PRO_ID`),
  ADD CONSTRAINT `travail_ibfk_2` FOREIGN KEY (`TRA_IDUti`) REFERENCES `utilisateur` (`UTI_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
