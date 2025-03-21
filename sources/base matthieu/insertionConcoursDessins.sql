-- Remplissage de la base de données selon les contraintes

-- Insertion des clubs
INSERT INTO Club (nomClub, adresse, numTelephone, nombreAdherents, ville, departement, region) VALUES
('Club A', '10 rue des Arts, Paris', '0102030405', 100, 'Paris', '75', 'Île-de-France'),
('Club B', '20 avenue des Peintres, Lyon', '0203040506', 80, 'Lyon', '69', 'Auvergne-Rhône-Alpes'),
('Club C', '30 boulevard des Dessins, Marseille', '0304050607', 90, 'Marseille', '13', 'Provence-Alpes-Côte d''Azur'),
('Club D', '40 impasse des Artistes, Lille', '0405060708', 70, 'Lille', '59', 'Hauts-de-France'),
('Club E', '50 chemin des Couleurs, Toulouse', '0506070809', 85, 'Toulouse', '31', 'Occitanie'),
('Club F', '60 place de l''Inspiration, Nantes', '0607080910', 75, 'Nantes', '44', 'Pays de la Loire');

-- Insertion des utilisateurs (Présidents, Évaluateurs, Compétiteurs)
-- Note : On insère d'abord les utilisateurs, puis on les relie aux rôles spécifiques (President, Evaluateur, Competiteur)
INSERT INTO Utilisateur (numClub, nom, prenom, adresse, login, motDePasse) VALUES
(1, 'Dupont', 'Jean', '10 rue des Arts, Paris', 'jdupont', 'password123'),
(2, 'Martin', 'Sophie', '20 avenue des Peintres, Lyon', 'smartin', 'password123'),
(3, 'Lemoine', 'Claire', '30 boulevard des Dessins, Marseille', 'clemoine', 'password123'),
(4, 'Bernard', 'Luc', '40 impasse des Artistes, Lille', 'lbernard', 'password123'),
(5, 'Robert', 'Alice', '50 chemin des Couleurs, Toulouse', 'arobert', 'password123'),
(6, 'Durand', 'Paul', '60 place de l''Inspiration, Nantes', 'pdurand', 'password123');

-- Assignation des rôles (Présidents, Evaluateurs, Competiteurs)
INSERT INTO President (numPresident, prime) VALUES (1, 500.00);
INSERT INTO Evaluateur (numEvaluateur, specialite) VALUES (2, 'Aquarelle'), (3, 'Crayonné'), (4, 'Peinture'), (5, 'Illustration'), (6, 'Digital');
INSERT INTO Competiteur (numCompetiteur, premiereParticipation) VALUES (7, '2023-03-15'), (8, '2023-06-20'), (9, '2024-02-10'), (10, '2024-09-30');

-- Insertion des concours
INSERT INTO Concours (numPresident, theme, descriptif, dateDebut, dateFin, etat) VALUES
(1, 'Concours Printemps 2023', 'Un thème libre inspiré du printemps.', '2023-03-01', '2023-03-31', 'évalué'),
(1, 'Concours Été 2023', 'Un concours sur le soleil et la mer.', '2023-06-01', '2023-06-30', 'évalué'),
(1, 'Concours Automne 2023', 'Illustrations sur les couleurs automnales.', '2023-09-01', '2023-09-30', 'attente'),
(1, 'Concours Hiver 2023', 'Thème : Noël et hiver.', '2023-12-01', '2023-12-31', 'pas commencé'),
(2, 'Concours Printemps 2024', 'Thème nature et écologie.', '2024-03-01', '2024-03-31', 'évalué'),
(2, 'Concours Été 2024', 'Un concours inspiré du voyage.', '2024-06-01', '2024-06-30', 'en cours'),
(2, 'Concours Automne 2024', 'Illustrations sur Halloween.', '2024-09-01', '2024-09-30', 'pas commencé'),
(2, 'Concours Hiver 2024', 'Thème féérie hivernale.', '2024-12-01', '2024-12-31', 'évalué');

-- Insertion de dessins pour les compétiteurs (3 max par concours)
INSERT INTO Dessin (numConcours, numCompetiteur, commentaire, classement, dateRemise, leDessin) VALUES
(1, 7, 'Belle composition', 1, '2023-03-20', 'URL1'),
(1, 8, 'Couleurs intéressantes', 2, '2023-03-21', 'URL2'),
(1, 9, 'Originalité au top', 3, '2023-03-22', 'URL3'),
(2, 7, 'Très beau dessin', 1, '2023-06-15', 'URL4'),
(2, 8, 'Thème respecté', 2, '2023-06-18', 'URL5');

-- Insertion d'évaluations (chaque dessin est évalué par deux évaluateurs)
INSERT INTO Evaluation (numDessin, numEvaluateur, dateEvaluation, note, commentaire) VALUES
(1, 2, '2023-03-25', 18.5, 'Très bon dessin'),
(1, 3, '2023-03-25', 17.0, 'Bonne utilisation des couleurs'),
(2, 4, '2023-03-26', 16.5, 'Bonne technique'),
(2, 5, '2023-03-26', 15.0, 'Manque un peu de contraste');

-- Insertion des participations des clubs aux concours
INSERT INTO Participe_club (numClub, numConcours) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1),
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2);

-- Insertion des participations des compétiteurs aux concours
INSERT INTO Participe_competiteur (numConcours, numCompetiteur) VALUES
(1, 7), (1, 8), (1, 9), (2, 7), (2, 8), (2, 9);

-- Insertion des membres du Jury
INSERT INTO Jury (numConcours, numEvaluateur) VALUES
(1, 2), (1, 3), (2, 4), (2, 5);
