-- Requête 1 : Compétiteurs ayant participé à un concours en 2024
SELECT
    u.nom,
    u.prenom,
    u.age,
    u.adresse,
    c.descriptif,
    c.dateDebut,
    c.dateFin,
    cl.nomClub,
    cl.departement,
    cl.region
FROM Competiteur comp
JOIN Utilisateur u ON comp.numCompetiteur = u.numUtilisateur
JOIN ParticipeCompetiteur pc ON pc.numCompetiteur = comp.numCompetiteur
JOIN Concours c ON c.numConcours = pc.numConcours
JOIN Club cl ON u.numClub = cl.numClub
WHERE EXTRACT(YEAR FROM c.dateDebut) = 2024;


-- Requête 2 : Dessins évalués en 2023 avec note et infos
SELECT 
    d.numDessin,
    e.note,
    u.nom AS nomCompetiteur,
    c.descriptif,
    c.theme
FROM Evaluation e
JOIN Dessin d ON e.numDessin = d.numDessin
JOIN Competiteur comp ON d.numCompetiteur = comp.numCompetiteur
JOIN Utilisateur u ON comp.numCompetiteur = u.numUtilisateur
JOIN Concours c ON d.numConcours = c.numConcours
WHERE EXTRACT(YEAR FROM e.dateEvaluation) = 2023
ORDER BY e.note ASC;

-- Requête 3 : Informations sur tous les dessins évalués
SELECT 
    d.numDessin,
    EXTRACT(YEAR FROM e.dateEvaluation) AS annee,
    c.descriptif AS concoursDescription,
    uCompetiteur.nom AS nomCompetiteur,
    d.commentaire AS commentaireDessin,
    e.note,
    e.commentaire AS commentaireEvaluation,
    uEvaluateur.nom AS nomEvaluateur
FROM Evaluation e
JOIN Dessin d ON d.numDessin = e.numDessin
JOIN Concours c ON d.numConcours = c.numConcours
JOIN Competiteur comp ON d.numCompetiteur = comp.numCompetiteur
JOIN Utilisateur uCompetiteur ON comp.numCompetiteur = uCompetiteur.numUtilisateur
JOIN Evaluateur eval ON e.numEvaluateur = eval.numEvaluateur
JOIN Utilisateur uEvaluateur ON eval.numEvaluateur = uEvaluateur.numUtilisateur;


-- Requête 4 : Compétiteurs ayant participé à tous les concours de 2023 et 2024
SELECT 
    u.nom, u.prenom, u.age
FROM Competiteur comp
JOIN Utilisateur u ON comp.numCompetiteur = u.numUtilisateur
WHERE NOT EXISTS (
    SELECT 1
    FROM Concours c
    WHERE EXTRACT(YEAR FROM c.dateDebut) IN (2023, 2024)
    AND NOT EXISTS (
        SELECT 1
        FROM ParticipeCompetiteur pc
        WHERE pc.numConcours = c.numConcours
        AND pc.numCompetiteur = comp.numCompetiteur
    )
)
ORDER BY u.age ASC;


-- Requête 5 : Région avec la meilleure moyenne des notes
SELECT 
    cl.region,
    AVG(e.note) AS moyenne_note
FROM Evaluation e
JOIN Dessin d ON e.numDessin = d.numDessin
JOIN Competiteur comp ON d.numCompetiteur = comp.numCompetiteur
JOIN Utilisateur u ON comp.numCompetiteur = u.numUtilisateur
JOIN Club cl ON u.numClub = cl.numClub
GROUP BY cl.region
ORDER BY moyenne_note DESC
LIMIT 1;





-- Requête 6 : Nombre de dessins soumis par chaque compétiteur
SELECT u.numUtilisateur, u.nom, u.prenom, COUNT(d.numDessin) AS nb_dessins
FROM Competiteur c
JOIN Utilisateur u ON c.numCompetiteur = u.numUtilisateur
LEFT JOIN Dessin d ON c.numCompetiteur = d.numCompetiteur
GROUP BY u.numUtilisateur, u.nom, u.prenom;

-- Requête 7 : Nombre d'évaluations faites par chaque évaluateur
SELECT u.numUtilisateur, u.nom, u.prenom, COUNT(e.numDessin) AS nb_evaluations
FROM Evaluateur ev
JOIN Utilisateur u ON ev.numEvaluateur = u.numUtilisateur
LEFT JOIN Evaluation e ON ev.numEvaluateur = e.numEvaluateur
GROUP BY u.numUtilisateur, u.nom, u.prenom;

-- Requête 8 : Liste des concours et leur nombre de compétiteurs
SELECT co.numConcours, co.theme, COUNT(pc.numCompetiteur) AS nb_competiteurs
FROM Concours co
LEFT JOIN ParticipeCompetiteur pc ON co.numConcours = pc.numConcours
GROUP BY co.numConcours, co.theme;

-- Requête 9 : Compétiteur avec la meilleure note moyenne
SELECT u.numUtilisateur, u.nom, u.prenom, AVG(e.note) AS moyenne_note
FROM Competiteur c
JOIN Utilisateur u ON c.numCompetiteur = u.numUtilisateur
JOIN Dessin d ON c.numCompetiteur = d.numCompetiteur
JOIN Evaluation e ON d.numDessin = e.numDessin
GROUP BY u.numUtilisateur, u.nom, u.prenom
ORDER BY moyenne_note DESC
LIMIT 1;

-- Requête 10 : Compétiteurs ayant participé à un concours sans recevoir d'évaluation
SELECT DISTINCT u.numUtilisateur, u.nom, u.prenom
FROM Competiteur c
JOIN Utilisateur u ON c.numCompetiteur = u.numUtilisateur
JOIN ParticipeCompetiteur pc ON c.numCompetiteur = pc.numCompetiteur
LEFT JOIN Dessin d ON c.numCompetiteur = d.numCompetiteur
LEFT JOIN Evaluation e ON d.numDessin = e.numDessin
WHERE e.numDessin IS NULL;
