import type { RequestHandler } from './$types';
import {db} from '$lib/images/outils/db';
import { json } from '@sveltejs/kit';

export const GET: RequestHandler = async () => {
    return json(
        {
            
        }
    );
};


initApp();

function initApp(){

    db.isUp();

}


db.queryDebug("select * from utilisateur");
