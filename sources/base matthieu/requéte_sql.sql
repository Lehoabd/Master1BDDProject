-- Requête 1 : Afficher les compétiteurs ayant participé à un concours en 2024
SELECT U.nom, U.prenom, U.adresse, TIMESTAMPDIFF(YEAR, U.premiereParticipation, CURDATE()) AS age,
       C.theme, C.descriptif, C.dateDebut, C.dateFin, CL.nomClub, CL.departement, CL.region
FROM Competiteur CO
JOIN Utilisateur U ON CO.numCompetiteur = U.numUtilisateur
JOIN Participe_competiteur PC ON CO.numCompetiteur = PC.numCompetiteur
JOIN Concours C ON PC.numConcours = C.numConcours
JOIN Club CL ON U.numClub = CL.numClub
WHERE YEAR(C.dateDebut) = 2024;

-- Requête 2 : Afficher les dessins évalués en 2023 avec la note et les infos associées
SELECT D.numDessin, E.note, U.nom AS Competiteur, C.descriptif, C.theme
FROM Dessin D
JOIN Evaluation E ON D.numDessin = E.numDessin
JOIN Competiteur CO ON D.numCompetiteur = CO.numCompetiteur
JOIN Utilisateur U ON CO.numCompetiteur = U.numUtilisateur
JOIN Concours C ON D.numConcours = C.numConcours
WHERE YEAR(C.dateDebut) = 2023
ORDER BY E.note ASC;

-- Requête 3 : Informations sur tous les dessins évalués
SELECT D.numDessin, YEAR(C.dateDebut) AS annee, C.descriptif,
       U.nom AS Competiteur, D.numDessin, D.commentaire AS dessin_commentaire,
       E.note, E.commentaire AS evaluation_commentaire, UE.nom AS Evaluateur
FROM Dessin D
JOIN Evaluation E ON D.numDessin = E.numDessin
JOIN Competiteur CO ON D.numCompetiteur = CO.numCompetiteur
JOIN Utilisateur U ON CO.numCompetiteur = U.numUtilisateur
JOIN Concours C ON D.numConcours = C.numConcours
JOIN Evaluateur EV ON E.numEvaluateur = EV.numEvaluateur
JOIN Utilisateur UE ON EV.numEvaluateur = UE.numUtilisateur;

-- Requête 4 : Compétiteurs ayant participé à tous les concours de 2023 et 2024
SELECT U.nom, U.prenom, TIMESTAMPDIFF(YEAR, U.premiereParticipation, CURDATE()) AS age
FROM Competiteur CO
JOIN Utilisateur U ON CO.numCompetiteur = U.numUtilisateur
WHERE NOT EXISTS (
    SELECT C.numConcours
    FROM Concours C
    WHERE YEAR(C.dateDebut) IN (2023, 2024)
    AND NOT EXISTS (
        SELECT PC.numConcours
        FROM Participe_competiteur PC
        WHERE PC.numCompetiteur = CO.numCompetiteur
        AND PC.numConcours = C.numConcours
    )
)
ORDER BY age ASC;

-- Requête 5 : Région avec la meilleure moyenne de notes des dessins
SELECT CL.region, AVG(E.note) AS moyenne_notes
FROM Evaluation E
JOIN Dessin D ON E.numDessin = D.numDessin
JOIN Competiteur CO ON D.numCompetiteur = CO.numCompetiteur
JOIN Utilisateur U ON CO.numCompetiteur = U.numUtilisateur
JOIN Club CL ON U.numClub = CL.numClub
GROUP BY CL.region
ORDER BY moyenne_notes DESC
LIMIT 1;

-- Requête 6 : Nombre de dessins soumis par chaque compétiteur
SELECT U.nom, U.prenom, COUNT(D.numDessin) AS nombreDessins
FROM Dessin D
JOIN Competiteur CO ON D.numCompetiteur = CO.numCompetiteur
JOIN Utilisateur U ON CO.numCompetiteur = U.numUtilisateur
GROUP BY U.numUtilisateur;

-- Requête 7 : Nombre d'évaluations faites par chaque évaluateur
SELECT U.nom, U.prenom, COUNT(E.numEvaluation) AS nombreEvaluations
FROM Evaluation E
JOIN Evaluateur EV ON E.numEvaluateur = EV.numEvaluateur
JOIN Utilisateur U ON EV.numEvaluateur = U.numUtilisateur
GROUP BY U.numUtilisateur;

-- Requête 8 : Liste des concours et leur nombre de compétiteurs
SELECT C.theme, COUNT(PC.numCompetiteur) AS nombreCompetiteurs
FROM Concours C
JOIN Participe_competiteur PC ON C.numConcours = PC.numConcours
GROUP BY C.numConcours;

-- Requête 9 : Compétiteur avec la meilleure note moyenne sur tous ses dessins
SELECT U.nom, U.prenom, AVG(E.note) AS moyenneNote
FROM Evaluation E
JOIN Dessin D ON E.numDessin = D.numDessin
JOIN Competiteur CO ON D.numCompetiteur = CO.numCompetiteur
JOIN Utilisateur U ON CO.numCompetiteur = U.numUtilisateur
GROUP BY U.numUtilisateur
ORDER BY moyenneNote DESC
LIMIT 1;

-- Requête 10 : Compétiteurs ayant participé à un concours sans recevoir d’évaluation
SELECT U.nom, U.prenom, C.theme
FROM Competiteur CO
JOIN Utilisateur U ON CO.numCompetiteur = U.numUtilisateur
JOIN Participe_competiteur PC ON CO.numCompetiteur = PC.numCompetiteur
JOIN Concours C ON PC.numConcours = C.numConcours
WHERE NOT EXISTS (
    SELECT 1
    FROM Evaluation E
    JOIN Dessin D ON E.numDessin = D.numDessin
    WHERE D.numCompetiteur = CO.numCompetiteur
    AND D.numConcours = C.numConcours
);
