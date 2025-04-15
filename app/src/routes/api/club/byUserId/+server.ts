import { json } from '@sveltejs/kit';
import type { RequestHandler } from '../$types';
import { db } from '$lib/outils/db';

export const POST: RequestHandler = async ({url})=>{
    const numutilisateur = url.searchParams.get('numUtilisateur');

    if(!numutilisateur){
        return json({ error: 'Paramètre numutilisateur manquant' }, { status: 400 });
    }

    try {
        const query = "SELECT club.* FROM club JOIN utilisateur ON utilisateur.numclub = club.numclub WHERE utilisateur.numutilisateur = "+numutilisateur;
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