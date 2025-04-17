import type { RequestHandler } from './$types';
import { db } from '$lib/outils/db';
import { json } from '@sveltejs/kit';

export const GET: RequestHandler = async () => {
    return new Response();
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
