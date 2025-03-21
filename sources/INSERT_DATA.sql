INSERT INTO Club (nomClub, adresse, numTelephone, nombreAdherents, ville, departement, region) VALUES
('ArtClub Paris', '12 Rue des Arts, 75001 Paris', '0145896321', 150, 'Paris', 'Île-de-France', 'Île-de-France'),
('DesignHub Lyon', '45 Avenue du Design, 69003 Lyon', '0478529632', 200, 'Lyon', 'Rhône', 'Auvergne-Rhône-Alpes'),
('GraphiX Toulouse', '78 Boulevard de l''Image, 31000 Toulouse', '0563987412', 120, 'Toulouse', 'Haute-Garonne', 'Occitanie'),
('Digital Art Bordeaux', '34 Rue de l''Innovation, 33000 Bordeaux', '0556789234', 180, 'Bordeaux', 'Gironde', 'Nouvelle-Aquitaine'),
('CréaMarseille', '90 Avenue des Créateurs, 13008 Marseille', '0491345678', 220, 'Marseille', 'Bouches-du-Rhône', 'Provence-Alpes-Côte d''Azur');

INSERT INTO Utilisateur (nom, prenom, age, adresse, login, motDePasse, numClub) VALUES
('Dupont', 'Jean', 30, '10 Rue de Paris, 75001 Paris', 'jdupont', 'password123', 1),
('Martin', 'Sophie', 25, '23 Rue de Lyon, 69003 Lyon', 'smartin', 'securepwd', 2),
('Lemoine', 'Pierre', 28, '56 Boulevard Toulouse, 31000 Toulouse', 'plemoine', 'toulouse123', 3),
('Bernard', 'Luc', 35, '99 Avenue de Bordeaux, 33000 Bordeaux', 'lbernard', 'bordeauxpass', 4),
('Rossi', 'Elena', 27, '15 Rue de la Mer, 13008 Marseille', 'erossi', 'marseillepass', 5);

INSERT INTO President (numPresident, prime) VALUES
(1, 5000.00),
(4, 4800.00);

INSERT INTO Evaluateur (numEvaluateur, specialite) VALUES
(2, 'Illustration'),
(5, 'Peinture'),
(3, 'Sculpture');

INSERT INTO Competiteur (numCompetiteur, datePremParticipation) VALUES
(3, '2020-06-15'),
(5, '2021-07-20'),
(1, '2019-05-10');

INSERT INTO Administrateur (numAdministrateur, dateDebut) VALUES
(1, '2022-01-01'),
(4, '2023-03-15');

INSERT INTO Directeur (numDirecteur, dateDebut) VALUES
(2, '2021-09-10'),
(5, '2022-04-20');

INSERT INTO Dirige (numClub, numDirecteur) VALUES
(1, 2),
(3, 5);

INSERT INTO Concours (theme, descriptif, dateDebut, dateFin, etat, numPresident) VALUES
('Peinture Abstraite', 'Concours de peinture sur le thème abstrait', '2025-05-10', '2025-05-15', 'Ouvert', 1),
('Sculpture Moderne', 'Exposition de sculptures contemporaines', '2025-06-01', '2025-06-10', 'Ouvert', 4),
('Dessin Numérique', 'Concours de dessin digital', '2025-07-05', '2025-07-12', 'Ouvert', 1);

INSERT INTO ParticipeClub (numClub, numConcours) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);

INSERT INTO ParticipeCompetiteur (numCompetiteur, numConcours) VALUES
(3, 1),
(5, 2),
(1, 3);

INSERT INTO Dessin (commentaire, classement, dateRemise, leDessin, numConcours, numCompetiteur) VALUES
('Belle composition', 1, '2025-05-12', decode('89504E470D0A1A0A', 'hex'), 1, 3),
('Créatif et original', 2, '2025-06-08', decode('89504E470D0A1A0A', 'hex'), 2, 5),
('Très bien exécuté', 1, '2025-07-10', decode('89504E470D0A1A0A', 'hex'), 3, 1);

INSERT INTO Evaluation (numDessin, numEvaluateur, dateEvaluation, note, commentaire) VALUES
(1, 2, '2025-05-13', 18, 'Très bon travail'),
(2, 3, '2025-06-09', 17, 'Technique impressionnante'),
(3, 5, '2025-07-11', 19, 'Superbe maîtrise des couleurs');

INSERT INTO MembreJury (numConcours, numEvaluateur) VALUES
(1, 2),
(2, 3),
(3, 5);