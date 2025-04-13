import { cookies } from '$lib/outils/cookies';
import { db } from '$lib/outils/db';
import type { LayoutServerLoad } from './$types';

export const load = (async () => {
    return {};
}) satisfies LayoutServerLoad;

console.log(checkUser().then());

async function checkUser(){
    // let connectedUser = cookies.get("user");
    // if(connectedUser === "") return false;
    let res = await db.query("SELECT numUtilisateur FROM UTILISATEUR WHERE numUtilisateur = 1");
    return res![0] ? true : false;
}