-- Requête 1 : Afficher les compétiteurs ayant participé à un concours en 2024

SELECT DISTINCT c.nom, c.prenom
FROM Competiteur c
JOIN ParticipeCompetiteur pc ON c.numCompetiteur = pc.numCompetiteur
JOIN Concours co ON pc.numConcours = co.numConcours
WHERE EXTRACT(YEAR FROM co.dateDebut) = 2024;


-- Requête 2 : Afficher les dessins évalués en 2023 avec la note et les infos associées

SELECT d.numDessin, d.commentaire, d.classement, e.note, e.dateEvaluation, e.commentaire AS commentaire_evaluation
FROM Dessin d
JOIN Evaluation e ON d.numDessin = e.numDessin
WHERE EXTRACT(YEAR FROM e.dateEvaluation) = 2023;


-- Requête 3 : Informations sur tous les dessins évalués

SELECT d.numDessin, d.commentaire, d.classement, e.note, e.dateEvaluation, e.commentaire AS commentaire_evaluation
FROM Dessin d
JOIN Evaluation e ON d.numDessin = e.numDessin;


-- Requête 4 : Compétiteurs ayant participé à tous les concours de 2023 et 2024

SELECT c.nom, c.prenom
FROM Competiteur c
JOIN ParticipeCompetiteur pc ON c.numCompetiteur = pc.numCompetiteur
JOIN Concours co ON pc.numConcours = co.numConcours
WHERE EXTRACT(YEAR FROM co.dateDebut) IN (2023, 2024)
GROUP BY c.numCompetiteur
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM co.dateDebut)) = 2;


-- Requête 5 : Région avec la meilleure moyenne de notes des dessins

SELECT cl.region, AVG(e.note) AS moyenne_notes
FROM Club cl
JOIN Utilisateur u ON cl.numClub = u.numClub
JOIN Competiteur c ON u.numUtilisateur = c.numCompetiteur
JOIN ParticipeCompetiteur pc ON c.numCompetiteur = pc.numCompetiteur
JOIN Concours co ON pc.numConcours = co.numConcours
JOIN Dessin d ON co.numConcours = d.numConcours
JOIN Evaluation e ON d.numDessin = e.numDessin
GROUP BY cl.region
ORDER BY moyenne_notes DESC
LIMIT 1;


-- Requête 6 : Nombre de dessins soumis par chaque compétiteur

SELECT c.nom, c.prenom, COUNT(d.numDessin) AS nombre_dessins
FROM Competiteur c
JOIN Dessin d ON c.numCompetiteur = d.numCompetiteur
GROUP BY c.numCompetiteur;


-- Requête 7 : Nombre d'évaluations faites par chaque évaluateur

SELECT e.numEvaluateur, COUNT(ev.numDessin) AS nombre_evaluations
FROM Evaluateur e
JOIN Evaluation ev ON e.numEvaluateur = ev.numEvaluateur
GROUP BY e.numEvaluateur;


-- Requête 8 : Liste des concours et leur nombre de compétiteurs

SELECT co.numConcours, co.theme, COUNT(pc.numCompetiteur) AS nombre_competiteurs
FROM Concours co
JOIN ParticipeCompetiteur pc ON co.numConcours = pc.numConcours
GROUP BY co.numConcours;


-- Requête 9 : Compétiteur avec la meilleure note moyenne sur tous ses dessins

SELECT c.nom, c.prenom, AVG(e.note) AS moyenne_notes
FROM Competiteur c
JOIN Dessin d ON c.numCompetiteur = d.numCompetiteur
JOIN Evaluation e ON d.numDessin = e.numDessin
GROUP BY c.numCompetiteur
ORDER BY moyenne_notes DESC
LIMIT 1;


-- Requête 10 : Compétiteurs ayant participé à un concours sans recevoir d’évaluation

SELECT c.nom, c.prenom
FROM Competiteur c
JOIN ParticipeCompetiteur pc ON c.numCompetiteur = pc.numCompetiteur
JOIN Concours co ON pc.numConcours = co.numConcours
LEFT JOIN Dessin d ON co.numConcours = d.numConcours AND d.numCompetiteur = c.numCompetiteur
LEFT JOIN Evaluation e ON d.numDessin = e.numDessin
WHERE e.numDessin IS NULL;
