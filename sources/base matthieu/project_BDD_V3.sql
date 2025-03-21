-- Désactivation des contraintes pour éviter les erreurs de dépendance
SET FOREIGN_KEY_CHECKS = 0;

-- Suppression des anciennes tables
DROP TABLE IF EXISTS Jury, Evaluation, Participe_competiteur, Participe_club, Dessin, Concours, President, Competiteur, Administrateur, Directeur, Evaluateur, Utilisateur, Club, Statistiques;

-- Création des tables sans dépendance
CREATE TABLE Utilisateur (
    numUtilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    adresse VARCHAR(255),
    login VARCHAR(50) UNIQUE NOT NULL,
    motDePasse VARCHAR(255) NOT NULL
);

CREATE TABLE Club (
    numClub INT PRIMARY KEY AUTO_INCREMENT,
    nomClub VARCHAR(255) NOT NULL,
    adresse VARCHAR(255),
    numTelephone VARCHAR(15),
    nombreAdherents INT,
    ville VARCHAR(100),
    departement VARCHAR(100),
    region VARCHAR(100)
);

CREATE TABLE Concours (
    numConcours INT PRIMARY KEY AUTO_INCREMENT,
    theme VARCHAR(255) NOT NULL,
    descriptif TEXT,
    dateDebut DATE NOT NULL,
    dateFin DATE NOT NULL,
    etat ENUM('pas commencé', 'en cours', 'attente', 'évalué') DEFAULT 'pas commencé'
);

-- Ajout des tables liées à Utilisateur
CREATE TABLE Directeur (
    numDirecteur INT PRIMARY KEY,
    dateDebut DATE,
    FOREIGN KEY (numDirecteur) REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE
);

CREATE TABLE Administrateur (
    numAdministrateur INT PRIMARY KEY,
    dateDebut DATE,
    FOREIGN KEY (numAdministrateur) REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE
);

CREATE TABLE President (
    numPresident INT PRIMARY KEY,
    prime DECIMAL(10, 2),
    FOREIGN KEY (numPresident) REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE
);

CREATE TABLE Competiteur (
    numCompetiteur INT PRIMARY KEY,
    premiereParticipation DATE,
    FOREIGN KEY (numCompetiteur) REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE
);

CREATE TABLE Evaluateur (
    numEvaluateur INT PRIMARY KEY,
    specialite VARCHAR(255),
    FOREIGN KEY (numEvaluateur) REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE
);

-- Ajout des tables avec relations multiples
ALTER TABLE Club ADD COLUMN numDirecteur INT UNIQUE;
ALTER TABLE Club ADD FOREIGN KEY (numDirecteur) REFERENCES Utilisateur(numUtilisateur) ON DELETE SET NULL;

ALTER TABLE Utilisateur ADD COLUMN numClub INT;
ALTER TABLE Utilisateur ADD FOREIGN KEY (numClub) REFERENCES Club(numClub) ON DELETE SET NULL;

ALTER TABLE Concours ADD COLUMN numPresident INT;
ALTER TABLE Concours ADD FOREIGN KEY (numPresident) REFERENCES President(numPresident) ON DELETE SET NULL;

-- Table Dessin (liée à Concours et Competiteur)
CREATE TABLE Dessin (
    numDessin INT PRIMARY KEY AUTO_INCREMENT,
    numConcours INT,
    numCompetiteur INT,
    commentaire TEXT,
    classement INT,
    dateRemise DATE,
    leDessin TEXT,
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours) ON DELETE CASCADE,
    FOREIGN KEY (numCompetiteur) REFERENCES Competiteur(numCompetiteur) ON DELETE CASCADE
);

-- Participation des Clubs
CREATE TABLE Participe_club (
    numClub INT,
    numConcours INT,
    PRIMARY KEY (numClub, numConcours),
    FOREIGN KEY (numClub) REFERENCES Club(numClub) ON DELETE CASCADE,
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours) ON DELETE CASCADE
);

-- Participation des Compétiteurs
CREATE TABLE Participe_competiteur (
    numConcours INT,
    numCompetiteur INT,
    PRIMARY KEY (numConcours, numCompetiteur),
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours) ON DELETE CASCADE,
    FOREIGN KEY (numCompetiteur) REFERENCES Competiteur(numCompetiteur) ON DELETE CASCADE
);

-- Table Evaluation (liée à Dessin et Evaluateur)
CREATE TABLE Evaluation (
    numEvaluation INT PRIMARY KEY AUTO_INCREMENT,
    numDessin INT,
    numEvaluateur INT,
    dateEvaluation DATE,
    note DECIMAL(5, 2),
    commentaire TEXT,
    FOREIGN KEY (numDessin) REFERENCES Dessin(numDessin) ON DELETE CASCADE,
    FOREIGN KEY (numEvaluateur) REFERENCES Evaluateur(numEvaluateur) ON DELETE CASCADE
);

-- Table Jury (liée à Concours et Evaluateur)
CREATE TABLE Jury (
    numConcours INT,
    numEvaluateur INT,
    PRIMARY KEY (numConcours, numEvaluateur),
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours) ON DELETE CASCADE,
    FOREIGN KEY (numEvaluateur) REFERENCES Evaluateur(numEvaluateur) ON DELETE CASCADE
);

-- Table pour les Statistiques et rapports
CREATE TABLE Statistiques (
    idStatistique INT PRIMARY KEY AUTO_INCREMENT,
    numConcours INT,
    nombreParticipants INT,
    moyenneNotes DECIMAL(5,2),
    rapport TEXT,
    dateGeneration DATE,
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours) ON DELETE CASCADE
);

-- Réactivation des contraintes après la création des tables
SET FOREIGN_KEY_CHECKS = 1;
