-- Fichier création de la table

CREATE TABLE Club (
    numClub SERIAL PRIMARY KEY,
    nomClub VARCHAR(255),
    adresse TEXT,
    numTelephone VARCHAR(20),
    nombreAdherents INT CHECK (nombreAdherents >= 0),
    ville VARCHAR(100),
    departement VARCHAR(100),
    region VARCHAR(100)
);

CREATE TABLE Utilisateur (
    numUtilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    age INT CHECK (age >= 0),
    adresse TEXT,
    login VARCHAR(100) UNIQUE,
    motDePasse TEXT,
    numClub INT REFERENCES Club(numClub) ON DELETE SET NULL
);

CREATE TABLE President (
    numPresident INT PRIMARY KEY REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE,
    prime DECIMAL(10,2) CHECK (prime >= 0)
);

CREATE TABLE Evaluateur (
    numEvaluateur INT PRIMARY KEY REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE,
    specialite VARCHAR(255)
);

CREATE TABLE Competiteur (
    numCompetiteur INT PRIMARY KEY REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE,
    datePremParticipation DATE
);

CREATE TABLE Administrateur (
    numAdministrateur INT PRIMARY KEY REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE,
    dateDebut DATE
);

CREATE TABLE Directeur (
    numDirecteur INT PRIMARY KEY REFERENCES Utilisateur(numUtilisateur) ON DELETE CASCADE,
    dateDebut DATE
);

CREATE TABLE Dirige (
    numClub INT REFERENCES Club(numClub) ON DELETE CASCADE,
    numDirecteur INT REFERENCES Directeur(numDirecteur) ON DELETE CASCADE,
    PRIMARY KEY (numClub, numDirecteur)
);

CREATE TABLE Concours (
    numConcours SERIAL PRIMARY KEY,
    theme VARCHAR(255),
    descriptif TEXT,
    dateDebut DATE,
    dateFin DATE,
    etat VARCHAR(50),
    numPresident INT REFERENCES President(numPresident) ON DELETE SET NULL
);

CREATE TABLE ParticipeClub (
    numClub INT REFERENCES Club(numClub) ON DELETE CASCADE,
    numConcours INT REFERENCES Concours(numConcours) ON DELETE CASCADE,
    PRIMARY KEY (numClub, numConcours)
);

CREATE TABLE ParticipeCompetiteur (
    numCompetiteur INT REFERENCES Competiteur(numCompetiteur) ON DELETE CASCADE,
    numConcours INT REFERENCES Concours(numConcours) ON DELETE CASCADE,
    PRIMARY KEY (numCompetiteur, numConcours)
);

CREATE TABLE Dessin (
    numDessin SERIAL PRIMARY KEY,
    commentaire TEXT,
    classement INT CHECK (classement >= 0),
    dateRemise DATE,
    leDessin BYTEA,
    numConcours INT REFERENCES Concours(numConcours) ON DELETE CASCADE,
    numCompetiteur INT REFERENCES Competiteur(numCompetiteur) ON DELETE CASCADE
);

CREATE TABLE Evaluation (
    numDessin INT REFERENCES Dessin(numDessin) ON DELETE CASCADE,
    numEvaluateur INT REFERENCES Evaluateur(numEvaluateur) ON DELETE CASCADE,
    dateEvaluation DATE,
    note INT CHECK (note BETWEEN 0 AND 20),
    commentaire TEXT,
    PRIMARY KEY (numDessin, numEvaluateur)
);

CREATE TABLE MembreJury (
    numConcours INT REFERENCES Concours(numConcours) ON DELETE CASCADE,
    numEvaluateur INT REFERENCES Evaluateur(numEvaluateur) ON DELETE CASCADE,
    PRIMARY KEY (numConcours, numEvaluateur)
);
