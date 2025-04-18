import { db } from '$lib/outils/db';
import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

export const GET: RequestHandler = async ({url})=>{
    const numutilisateur = url.searchParams.get('numUtilisateur');

    if(!numutilisateur){
        return json({ error: 'Paramètre numutilisateur manquant' }, { status: 400 });
    }

    try {
        const query = "SELECT utilisateur.*, administrateur.numadministrateur as admin FROM utilisateur LEFT JOIN administrateur ON administrateur.numadministrateur = utilisateur.numutilisateur WHERE utilisateur.numutilisateur = "+numutilisateur;
        const dbResult = await db.query(query);
          if (dbResult[0])
          {
            return json(dbResult[0]);
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

    