import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import { db } from '$lib/outils/db';

export const GET: RequestHandler = async ()=>{
    try {
        const query = "SELECT utilisateur.*, administrateur.numadministrateur as admin, club.* FROM utilisateur LEFT JOIN administrateur ON administrateur.numadministrateur = utilisateur.numutilisateur JOIN club ON utilisateur.numclub = club.numclub INNER JOIN president ON utilisateur.numutilisateur = president.numpresident ;";
        const dbResult = await db.query(query);
          if (dbResult[0])
          {
            return json(dbResult);
          }
          else
          {
            return json(null);
          }
    }catch (error) {
        console.error('Erreur DB:', error);
        return json({ error: 'Erreur de base de données' }, { status: 500 });
      }

    }