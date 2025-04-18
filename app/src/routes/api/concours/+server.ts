import type { RequestHandler } from './$types';
import { db } from '$lib/outils/db';
import { json } from '@sveltejs/kit';

export const GET: RequestHandler = async () => {

  try {
      const query = "SELECT * FROM concours;";
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
};

export const POST: RequestHandler = async ({request})=>{
    const requestData = await request.json()
    const { theme, dateDeb, dateFin, descr, president } = await requestData;
    const query = "INSERT INTO Concours (theme, descriptif, dateDebut, dateFin, etat, numPresident) VALUES ('"+theme+"', '"+descr+"', '"+dateDeb+"', '"+dateFin+"', 'non_commence', "+president+");"
    const dbResult = await db.queryDebug(query);
      if (dbResult)
      {
        return json(dbResult);
      }
      else
      {
        return json(null);
      }
    }
