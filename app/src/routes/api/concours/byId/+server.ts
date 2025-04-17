import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import { db } from '$lib/outils/db';

export const GET: RequestHandler = async ({url})=>{
    const num = url.searchParams.get('numConcours');

    if(!num){
        return json({ error: 'Paramètre numConcours manquant' }, { status: 400 });
    }

    try {
        const query = "SELECT * FROM concours WHERE numconcours = "+num;
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