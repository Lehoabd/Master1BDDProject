-- Suppression des données existantes
TRUNCATE TABLE Evaluation, Dessin, ParticipeCompetiteur, ParticipeClub, MembreJury, Concours, Dirige, Administrateur, Directeur, Competiteur, Evaluateur, President, Utilisateur, Club RESTART IDENTITY CASCADE;

INSERT INTO Club (nomClub, adresse, numTelephone, nombreAdherents, ville, departement, region) VALUES
('ArtClub Paris', '12 Rue des Arts, 75001 Paris', '0145896321', 3, 'Paris', 'Île-de-France', 'Île-de-France'),
('DesignHub Lyon', '45 Avenue du Design, 69003 Lyon', '0478529632', 4, 'Lyon', 'Rhône', 'Auvergne-Rhône-Alpes'),
('GraphiX Toulouse', '78 Boulevard de l''Image, 31000 Toulouse', '0563987412', 5, 'Toulouse', 'Haute-Garonne', 'Occitanie'),
('Digital Art Bordeaux', '34 Rue de l''Innovation, 33000 Bordeaux', '0556789234', 4, 'Bordeaux', 'Gironde', 'Nouvelle-Aquitaine'),
('CréaMarseille', '90 Avenue des Créateurs, 13008 Marseille', '0491345678', 3, 'Marseille', 'Bouches-du-Rhône', 'Provence-Alpes-Côte d''Azur');

INSERT INTO Utilisateur (nom, prenom, age, adresse, login, motDePasse, numClub) VALUES
('Dupont', 'Jean', 30, '10 Rue de Paris, 75001 Paris', 'jdupont', 'password123', 3),
('Martin', 'Sophie', 25, '23 Rue de Lyon, 69003 Lyon', 'smartin', 'securepwd', 3),
('Lemoine', 'Pierre', 28, '56 Boulevard Toulouse, 31000 Toulouse', 'plemoine', 'toulouse123', 3),
('Bernard', 'Luc', 35, '99 Avenue de Bordeaux, 33000 Bordeaux', 'lbernard', 'bordeauxpass', 4),
('Rossi', 'Elena', 27, '15 Rue de la Mer, 13008 Marseille', 'erossi', 'marseillepass', 4),
('Petit', 'Claire', 32, '12 Rue des Lilas, 67000 Strasbourg', 'cpetit', 'strasbourg123', 4),
('Garcia', 'Thomas', 29, '44 Avenue des Alpes, 74000 Annecy', 'tgarcia', 'annecypass', 1),
('Morel', 'Julie', 26, '5 Rue du Soleil, 34000 Montpellier', 'jmorel', 'montpellier456', 5),
('Fabre', 'Nicolas', 31, '88 Rue de la Liberté, 21000 Dijon', 'nfabre', 'dijonpass', 2),
('Renard', 'Camille', 24, '17 Rue des Vosges, 54000 Nancy', 'crenard', 'nancy789', 2),
('Lemoine', 'Marc', 32, '101 Rue de Rennes, 75006 Paris', 'mlemoine', 'parispass123', 1),
('Dufresne', 'Amandine', 29, '45 Rue des Champs, 69001 Lyon', 'adufresne', 'lyonsecure456', 2),
('Boucher', 'Jean-Pierre', 34, '89 Rue du Moulin, 31000 Toulouse', 'jboucher', 'toulouse2024', 3),
('Charpentier', 'Isabelle', 28, '54 Boulevard de la Libération, 33000 Bordeaux', 'icharpentier', 'bordeaux987', 4),
('Lemoine', 'David', 30, '33 Rue de la Plage, 13009 Marseille', 'dlemoine', 'marseille345', 5),
('Vidal', 'Sophie', 26, '74 Rue des Fleurs, 74000 Annecy', 'svidal', 'annecy789', 1),
('Tanguy', 'Lucie', 31, '22 Avenue des Vignes, 54000 Nancy', 'ltanguy', 'nancy456', 2),
('Roche', 'Julien', 27, '11 Rue de l Orme, 34000 Montpellier', 'jroche', 'montpellier2024', 3),
('Lemoine', 'Chloé', 24, '120 Avenue de Bordeaux, 33000 Bordeaux', 'clemoine', 'bordeauxpass12', 4),
('Bastien', 'Nicolas', 33, '15 Rue de la Gare, 13006 Marseille', 'nbastien', 'marseille678', 5);

INSERT INTO President (numPresident, prime) VALUES
(1, 5000.00),
(4, 4800.00),
(7, 5200.00),
(2, 4900.00);

INSERT INTO Evaluateur (numEvaluateur, specialite) VALUES
(1, 'Illustration'),
(2, 'Peinture'),
(3, 'Sculpture'),
(6, 'Photographie'),
(8, 'Dessin numérique'),
(9, 'Street Art'),
(13, 'Art numérique'),
(15, 'Arts décoratifs'),
(17, 'Art conceptuel'),
(18, 'Gravure'),
(19, 'Mosaïque'),
(20, 'Performance artistique');

INSERT INTO Competiteur (numCompetiteur, datePremParticipation) VALUES
(3, '2023-01-11'),
(5, '2023-04-21'),
(1, '2023-08-06'),
(2, '2023-11-14'),
(4, '2024-01-02'),
(6, '2024-04-11'),
(8, '2024-08-11'),
(9, '2024-12-18'),
(12, '2023-01-10'),
(14,'2023-01-12'),
(16, '2023-01-10'),
(17, '2023-01-11'),
(18, '2023-01-10'),
(19, '2023-01-10');

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
('Peinture Abstraite', 'Concours de peinture sur le thème abstrait', '2023-01-10', '2023-01-20', 'évalué', 1),
('Sculpture Moderne', 'Exposition de sculptures contemporaines', '2023-04-20', '2023-04-30', 'évalué', 4),
('Dessin Numérique', 'Concours de dessin digital', '2023-08-05', '2023-08-12', 'évalué', 1),
('Photographie Urbaine', 'Concours de photos mettant en valeur l architecture et les scènes de vie en ville', '2023-11-13', '2023-11-25', 'évalué', 7),
('Street Art', 'Concours de créations artistiques inspirées par le street art : graffiti, collage, fresque', '2024-01-01', '2024-01-15', 'évalué', 2),
('Art Naturel', 'Concours d œuvres réalisées à partir d éléments naturels : bois, pierre, feuilles, sable', '2024-04-10', '2024-04-15', 'évalué', 4),
('Portraits Créatifs', 'Concours d art visuel autour du portrait revisité, tous supports confondus', '2024-08-10', '2024-08-15', 'évalué', 4),
('Noël Féérique', 'Concours artistique sur le thème magique et féérique de Noël', '2024-12-17', '2024-12-24', 'en attente des résultats', 1);

INSERT INTO ParticipeClub (numClub, numConcours) VALUES
(1, 1),
(1, 4),
(1, 5),
(2, 1),
(2, 6),
(2, 7),
(2, 8),
(3, 5),
(4, 7),
(4, 8),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5);

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
(3, 6, '2025-07-11', 19, 'Superbe maîtrise des couleurs');

INSERT INTO MembreJury (numConcours, numEvaluateur) VALUES
(1, 2),
(2, 3),
(3, 6);