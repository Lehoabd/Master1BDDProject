import { db } from '$lib/outils/db';
import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

export const GET: RequestHandler = async ()=>{
    try {
        const query = "SELECT utilisateur.*, administrateur.numadministrateur as admin, club.* FROM utilisateur LEFT JOIN administrateur ON administrateur.numadministrateur = utilisateur.numutilisateur JOIN club ON utilisateur.numclub = club.numclub";
        const dbResult = await db.query(query);
          if (dbResult![0])
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

    