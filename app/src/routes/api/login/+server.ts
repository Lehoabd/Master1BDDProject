import { json, type RequestHandler } from '@sveltejs/kit';
import { db } from '$lib/outils/db';


export const POST: RequestHandler = async ({request})=>{
    const requestData = await request.json()
    const {login, password} = await requestData;
    const query = "SELECT numutilisateur FROM utilisateur WHERE utilisateur.login = '"+login+"' AND utilisateur.motdepasse = '"+password+"'";
    const dbResult = await db.query(query);
      if (dbResult[0])
      {
        return json(dbResult[0].numutilisateur);
      }
      else
      {
        return json(null);
      }
    }
