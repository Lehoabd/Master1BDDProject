-- Suppression des données existantes
TRUNCATE TABLE Evaluation, Dessin, ParticipeCompetiteur, ParticipeClub, MembreJury, Concours, Dirige, Administrateur, Directeur, Competiteur, Evaluateur, President, Utilisateur, Club RESTART IDENTITY CASCADE;

-- INSERT INTO Club (nomClub, adresse, numTelephone, nombreAdherents, ville, departement, region) VALUES
-- ('ArtClub Paris', '12 Rue des Arts, 75001 Paris', '0145896321', 3, 'Paris', 'Île-de-France', 'Île-de-France'),
-- ('DesignHub Lyon', '45 Avenue du Design, 69003 Lyon', '0478529632', 4, 'Lyon', 'Rhône', 'Auvergne-Rhône-Alpes'),
-- ('GraphiX Toulouse', '78 Boulevard de l''Image, 31000 Toulouse', '0563987412', 5, 'Toulouse', 'Haute-Garonne', 'Occitanie'),
-- ('Digital Art Bordeaux', '34 Rue de l''Innovation, 33000 Bordeaux', '0556789234', 4, 'Bordeaux', 'Gironde', 'Nouvelle-Aquitaine'),
-- ('CréaMarseille', '90 Avenue des Créateurs, 13008 Marseille', '0491345678', 3, 'Marseille', 'Bouches-du-Rhône', 'Provence-Alpes-Côte d''Azur');


INSERT INTO Club (numClub, nomClub, adresse, numTelephone, nombreAdherents, ville, departement, region) VALUES
(1, 'Club des Artistes', '12 rue des Lilas', '0102030405', 75, 'Lyon', 69, 'Auvergne-Rhône-Alpes'),
(2, 'Atelier du Crayon', '22 avenue Victor Hugo', '0607080910', 54, 'Paris', 75, 'Île-de-France'),
(3, 'Club Couleur & Vie', '5 rue des Peupliers', '0203040506', 68, 'Toulouse', 31, 'Occitanie'),
(4, 'Art & Passion', '33 boulevard Carnot', '0405060708', 80, 'Lille', 59, 'Hauts-de-France'),
(5, 'Les Croqueurs', '7 rue des Fleurs', '0506070809', 45, 'Nantes', 44, 'Pays de la Loire'),
(6, 'Club Palette Libre', '18 rue du Lac', '0708091011', 63, 'Annecy', 74, 'Auvergne-Rhône-Alpes'),
(7, 'Les Maîtres Crayons', '88 avenue de la Plage', '0605040302', 92, 'Marseille', 13, 'Provence-Alpes-Côte d''Azur'),
(8, 'Les Esquisseurs', '3 rue du Château', '0807060504', 55, 'Bordeaux', 33, 'Nouvelle-Aquitaine'),
(9, 'Couleurs Urbaines', '12 avenue de la Gare', '0302010405', 60, 'Rennes', 35, 'Bretagne'),
(10, 'Studio Graphique', '55 rue Victor Basch', '0205060807', 48, 'Dijon', 21, 'Bourgogne-Franche-Comté');


-- INSERT INTO Utilisateur (nom, prenom, age, adresse, login, motDePasse, numClub) VALUES
-- ('Dupont', 'Jean', 30, '10 Rue de Paris, 75001 Paris', 'jdupont', 'password123', 3),
-- ('Martin', 'Sophie', 25, '23 Rue de Lyon, 69003 Lyon', 'smartin', 'securepwd', 3),
-- ('Lemoine', 'Pierre', 28, '56 Boulevard Toulouse, 31000 Toulouse', 'plemoine', 'toulouse123', 3),
-- ('Bernard', 'Luc', 35, '99 Avenue de Bordeaux, 33000 Bordeaux', 'lbernard', 'bordeauxpass', 4),
-- ('Rossi', 'Elena', 27, '15 Rue de la Mer, 13008 Marseille', 'erossi', 'marseillepass', 4),
-- ('Petit', 'Claire', 32, '12 Rue des Lilas, 67000 Strasbourg', 'cpetit', 'strasbourg123', 4),
-- ('Garcia', 'Thomas', 29, '44 Avenue des Alpes, 74000 Annecy', 'tgarcia', 'annecypass', 1),
-- ('Morel', 'Julie', 26, '5 Rue du Soleil, 34000 Montpellier', 'jmorel', 'montpellier456', 5),
-- ('Fabre', 'Nicolas', 31, '88 Rue de la Liberté, 21000 Dijon', 'nfabre', 'dijonpass', 2),
-- ('Renard', 'Camille', 24, '17 Rue des Vosges, 54000 Nancy', 'crenard', 'nancy789', 2),
-- ('Lemoine', 'Marc', 32, '101 Rue de Rennes, 75006 Paris', 'mlemoine', 'parispass123', 1),
-- ('Dufresne', 'Amandine', 29, '45 Rue des Champs, 69001 Lyon', 'adufresne', 'lyonsecure456', 2),
-- ('Boucher', 'Jean-Pierre', 34, '89 Rue du Moulin, 31000 Toulouse', 'jboucher', 'toulouse2024', 3),
-- ('Charpentier', 'Isabelle', 28, '54 Boulevard de la Libération, 33000 Bordeaux', 'icharpentier', 'bordeaux987', 4),
-- ('Lemoine', 'David', 30, '33 Rue de la Plage, 13009 Marseille', 'dlemoine', 'marseille345', 5),
-- ('Vidal', 'Sophie', 26, '74 Rue des Fleurs, 74000 Annecy', 'svidal', 'annecy789', 1),
-- ('Tanguy', 'Lucie', 31, '22 Avenue des Vignes, 54000 Nancy', 'ltanguy', 'nancy456', 2),
-- ('Roche', 'Julien', 27, '11 Rue de l Orme, 34000 Montpellier', 'jroche', 'montpellier2024', 3),
-- ('Lemoine', 'Chloé', 24, '120 Avenue de Bordeaux, 33000 Bordeaux', 'clemoine', 'bordeauxpass12', 4),
-- ('Bastien', 'Nicolas', 33, '15 Rue de la Gare, 13006 Marseille', 'nbastien', 'marseille678', 5);

INSERT INTO Utilisateur (numUtilisateur, nom, prenom, age, adresse, login, motDePasse, numClub) VALUES
(1, 'Dupont', 'Alice', 25, '10 rue des Lilas', 'alice.d', 'mdp1', 1),
(2, 'Martin', 'Lucas', 32, '12 avenue de Paris', 'lucas.m', 'mdp2', 1),
(3, 'Petit', 'Emma', 29, '3 rue des Champs', 'emma.p', 'mdp3', 2),
(4, 'Lefevre', 'Hugo', 41, '15 boulevard Carnot', 'hugo.l', 'mdp4', 2),
(5, 'Morel', 'Clara', 23, '2 rue du Lac', 'clara.m', 'mdp5', 3),
(6, 'Lambert', 'Maxime', 35, '7 place des Fleurs', 'maxime.l', 'mdp6', 3),
(7, 'Fontaine', 'Lea', 28, '9 avenue des Peupliers', 'lea.f', 'mdp7', 4),
(8, 'Rousseau', 'Nathan', 45, '20 rue Victor Hugo', 'nathan.r', 'mdp8', 4),
(9, 'Gauthier', 'Camille', 30, '18 rue des Rosiers', 'camille.g', 'mdp9', 5),
(10, 'Lopez', 'Jules', 38, '1 rue du Stade', 'jules.l', 'mdp10', 5),
(11, 'Perrin', 'Zoe', 26, '17 rue des Prés', 'zoe.p', 'mdp11', 6),
(12, 'Girard', 'Thomas', 33, '14 rue des Arènes', 'thomas.g', 'mdp12', 6),
(13, 'Andre', 'Chloe', 24, '4 rue des Jardins', 'chloe.a', 'mdp13', 7),
(14, 'Marchand', 'Enzo', 40, '5 avenue du Parc', 'enzo.m', 'mdp14', 7),
(15, 'Colin', 'Manon', 27, '8 rue du Moulin', 'manon.c', 'mdp15', 8),
(16, 'Renard', 'Tom', 31, '13 rue des Ecoles', 'tom.r', 'mdp16', 8),
(17, 'Bonnet', 'Sarah', 22, '19 rue du Château', 'sarah.b', 'mdp17', 9),
(18, 'Noel', 'Louis', 36, '11 rue des Alpes', 'louis.n', 'mdp18', 9),
(19, 'Blanchard', 'Pauline', 34, '6 avenue Victor Basch', 'pauline.b', 'mdp19', 10),
(20, 'Millet', 'Adrien', 43, '16 rue des Pyrénées', 'adrien.m', 'mdp20', 10);


-- INSERT INTO President (numPresident, prime) VALUES
-- (1, 5000.00),
-- (4, 4800.00),
-- (7, 5200.00),
-- (2, 4900.00);

INSERT INTO President (numPresident, prime)
VALUES
(1, 500),
(2, 600),
(3, 550),
(4, 620),
(5, 500),
(6, 650),
(7, 700),
(8, 550);


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

-- INSERT INTO Evaluateur (numEvaluateur, specialite)
-- VALUES
-- (21, 'Portrait'),
-- (22, 'Paysage'),
-- (23, 'Abstrait'),
-- (24, 'Nature'),
-- (25, 'Architecture'),
-- (26, 'Science-Fiction'),
-- (27, 'Fantastique'),
-- (28, 'Humour'),
-- (29, 'Manga'),
-- (30, 'Digital Art'),
-- (31, 'Animaux'),
-- (32, 'Street Art');


-- INSERT INTO Competiteur (numCompetiteur, datePremParticipation) VALUES
-- (3, '2023-01-11'),
-- (5, '2023-04-21'),
-- (1, '2023-08-06'),
-- (2, '2023-11-14'),
-- (4, '2024-01-02'),
-- (6, '2024-04-11'),
-- (8, '2024-08-11'),
-- (9, '2024-12-18'),
-- (12, '2023-01-10'),
-- (14,'2023-01-12'),
-- (16, '2023-01-10'),
-- (17, '2023-01-11'),
-- (18, '2023-01-10'),
-- (19, '2023-01-10');

INSERT INTO Competiteur (numCompetiteur, datePremParticipation)
VALUES
(7, '2023-01-10'),
(15, '2023-02-15'),
(2, '2023-03-12'),
(19, '2023-04-20'),
(11, '2023-05-18'),
(4, '2023-06-25'),
(10, '2023-07-30'),
(6, '2023-08-05'),
(3, '2023-09-12'),
(20, '2023-10-18'),
(1, '2023-11-24'),
(9, '2023-12-30'),
(12, '2024-01-12'),
(17, '2024-02-14'),
(14, '2024-03-22'),
(18, '2024-04-18');


-- INSERT INTO Administrateur (numAdministrateur, dateDebut) VALUES
-- (1, '2022-01-01'),
-- (4, '2023-03-15');

INSERT INTO Administrateur (numAdministrateur, dateDebut)
VALUES
(5, '2022-01-01'),
(13, '2022-02-01'),
(8, '2022-03-01');


-- INSERT INTO Directeur (numDirecteur, dateDebut) VALUES
-- (2, '2021-09-10'),
-- (5, '2022-04-20');

INSERT INTO Directeur (numDirecteur, dateDebut)
VALUES
(11, '2022-01-01'),
(12, '2022-02-01'),
(13, '2022-03-01'),
(14, '2022-04-01'),
(15, '2022-05-01');


-- INSERT INTO Dirige (numClub, numDirecteur) VALUES
-- (1, 2),
-- (3, 5);

INSERT INTO Dirige (numClub, numDirecteur)
VALUES
(1, 11),
(2, 11),
(3, 12),
(4, 12),
(5, 13),
(6, 13),
(7, 14),
(8, 14),
(9, 15),
(10, 15);


-- INSERT INTO Concours (theme, descriptif, dateDebut, dateFin, etat, numPresident) VALUES
-- ('Peinture Abstraite', 'Concours de peinture sur le thème abstrait', '2023-01-10', '2023-01-20', 'évalué', 1),
-- ('Sculpture Moderne', 'Exposition de sculptures contemporaines', '2023-04-20', '2023-04-30', 'évalué', 4),
-- ('Dessin Numérique', 'Concours de dessin digital', '2023-08-05', '2023-08-12', 'évalué', 1),
-- ('Photographie Urbaine', 'Concours de photos mettant en valeur l architecture et les scènes de vie en ville', '2023-11-13', '2023-11-25', 'évalué', 7),
-- ('Street Art', 'Concours de créations artistiques inspirées par le street art : graffiti, collage, fresque', '2024-01-01', '2024-01-15', 'évalué', 2),
-- ('Art Naturel', 'Concours d œuvres réalisées à partir d éléments naturels : bois, pierre, feuilles, sable', '2024-04-10', '2024-04-15', 'évalué', 4),
-- ('Portraits Créatifs', 'Concours d art visuel autour du portrait revisité, tous supports confondus', '2024-08-10', '2024-08-15', 'évalué', 4),
-- ('Noël Féérique', 'Concours artistique sur le thème magique et féérique de Noël', '2024-12-17', '2024-12-24', 'en attente des résultats', 1);

INSERT INTO Concours (numConcours, theme, descriptif, dateDebut, dateFin, etat, numPresident)
VALUES
(1, 'Printemps 2023', 'Concours du printemps', '2023-03-01', '2023-03-31', 'evalue', 1),
(2, 'Ete 2023', 'Concours de l ete', '2023-06-01', '2023-06-30', 'evalue', 2),
(3, 'Automne 2023', 'Concours de l automne', '2023-09-01', '2023-09-30', 'evalue', 3),
(4, 'Hiver 2023', 'Concours de l hiver', '2023-12-01', '2023-12-31', 'evalue', 4),
(5, 'Printemps 2024', 'Concours du printemps', '2024-03-01', '2024-03-31', 'en_cours', 5),
(6, 'Ete 2024', 'Concours de l ete', '2024-06-01', '2024-06-30', 'non_commence', 6),
(7, 'Automne 2024', 'Concours de l automne', '2024-09-01', '2024-09-30', 'en_attente', 7),
(8, 'Hiver 2024', 'Concours de l hiver', '2024-12-01', '2024-12-31', 'evalue', 8);

-- INSERT INTO ParticipeClub (numClub, numConcours) VALUES
-- (1, 1),
-- (1, 4),
-- (1, 5),
-- (2, 1),
-- (2, 6),
-- (2, 7),
-- (2, 8),
-- (3, 5),
-- (4, 7),
-- (4, 8),
-- (5, 1),
-- (5, 2),
-- (5, 3),
-- (5, 4),
-- (5, 5);

-- Concours 1
INSERT INTO ParticipeClub (numClub, numConcours)
VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1),
(2, 2), (3, 2), (4, 2), (5, 2), (6, 2), (7, 2),
(3, 3), (4, 3), (5, 3), (6, 3), (7, 3), (8, 3),
(4, 4), (5, 4), (6, 4), (7, 4), (8, 4), (9, 4),
(5, 5), (6, 5), (7, 5), (8, 5), (9, 5), (10, 5),
(1, 6), (2, 6), (3, 6), (4, 6), (5, 6), (6, 6),
(2, 7), (3, 7), (4, 7), (5, 7), (6, 7), (7, 7),
(3, 8), (4, 8), (5, 8), (6, 8), (7, 8), (8, 8);


-- INSERT INTO ParticipeCompetiteur (numCompetiteur, numConcours) VALUES
-- (3, 1),
-- (5, 2),
-- (1, 3);

INSERT INTO ParticipeCompetiteur (numCompetiteur, numConcours)
VALUES
(7, 1), (15, 1), (2, 1),
(19, 2), (11, 2), (4, 2),
(10, 3), (6, 3), (3, 3),
(20, 4), (1, 4), (9, 4),
(12, 5), (17, 5),
(14, 6), (18, 6);

-- INSERT INTO Dessin (commentaire, classement, dateRemise, leDessin, numConcours, numCompetiteur) VALUES
-- ('Belle composition', 1, '2025-05-12', decode('89504E470D0A1A0A', 'hex'), 1, 3),
-- ('Créatif et original', 2, '2025-06-08', decode('89504E470D0A1A0A', 'hex'), 2, 5),
-- ('Très bien exécuté', 1, '2025-07-10', decode('89504E470D0A1A0A', 'hex'), 3, 1);

INSERT INTO Dessin (numDessin, commentaire, classement, dateRemise, leDessin, numConcours, numCompetiteur)
VALUES
(1, 'Premier dessin', 1, '2023-01-20', 'image1.png', 1, 7),
(2, 'Deuxieme dessin', 2, '2023-01-20', 'image2.png', 1, 15),
(3, 'Troisieme dessin', 3, '2023-01-21', 'image3.png', 1, 2),
(4, 'Quatrieme dessin', 4, '2023-01-21', 'image4.png', 1, 19),
(5, 'Cinquieme dessin', 5, '2023-01-22', 'image5.png', 1, 17),
(6, 'Sixieme dessin', 6, '2023-01-22', 'image6.png', 1, 18);


-- INSERT INTO Evaluation (numDessin, numEvaluateur, dateEvaluation, note, commentaire) VALUES
-- (1, 2, '2025-05-13', 18, 'Très bon travail'),
-- (2, 3, '2025-06-09', 17, 'Technique impressionnante'),
-- (3, 6, '2025-07-11', 19, 'Superbe maîtrise des couleurs');

INSERT INTO Evaluation (numDessin, numEvaluateur, dateEvaluation, note, commentaire)
VALUES
(1, 20, '2023-01-25', 15, 'Bon dessin'),
(1, 19, '2023-01-25', 8, 'Original');


-- INSERT INTO MembreJury (numConcours, numEvaluateur) VALUES
-- (1, 2),
-- (2, 3),
-- (3, 6);

INSERT INTO MembreJury (numConcours, numEvaluateur)
VALUES
(1, 20), (1, 15), (1, 19), (1, 8);
