import { error } from "@sveltejs/kit";
import { cookies } from "./cookies";
import { nomLogin, userPrivilege } from "./stores";

export async function actualizeStores() {
    if (!cookies.get('userId')) return;
    const apiUrl = `/api/utilisateur/byId/?numUtilisateur=${encodeURIComponent(cookies.get('userId'))}`;
    const response = await fetch(apiUrl, {
        method: "GET",
        headers: {
            "content-type": "application/json",
        },
    });

    response.json().then((data) => {
        nomLogin.set(data.login);
        userPrivilege.set(data.admin !== null)
    });
}

export async function getUserClub() {
    if (!cookies.get('userId')) return;
    const apiUrl = `/api/club/byUserId/?numUtilisateur=${encodeURIComponent(cookies.get('userId'))}`;
    const response = await fetch(apiUrl, {
        method: "GET",
        headers: {
            "content-type": "application/json",
        },
    });

    return response.json();
}

export async function getConcours() {
    const apiUrl = `/api/concours/`;
    const response = await fetch(apiUrl, {
        method: "GET",
        headers: {
            "content-type": "application/json",
        },
    });

    return response.json();
}

export async function getConcoursById(concoursId: number) {
    const apiUrl = `/api/concours/byId/?numConcours=${encodeURIComponent(concoursId.toString())}`;
    const response = await fetch(apiUrl, {
        method: "GET",
        headers: {
            "content-type": "application/json",
        },
    });

    return response.json();
}

export async function getUtilisateurs() {
    const apiUrl = `/api/utilisateur`;
    const response = await fetch(apiUrl, {
        method: "GET",
        headers: {
            "content-type": "application/json",
        },
    });

    return response.json();
}

export async function getUtilisateursWithClub() {
    const apiUrl = `/api/utilisateur/withclub`;
    const response = await fetch(apiUrl, {
        method: "GET",
        headers: {
            "content-type": "application/json",
        },
    });

    return response.json();
}

export async function putConcours(theme: string, dateDeb: string, dateFin: string, descr: string, president: string) {
    const response = await fetch("/api/concours", {
        method: "POST",
        body: JSON.stringify({ theme, dateDeb, dateFin, descr, president }),
        headers: {
            "content-type": "application/json",
        },
    });

    return response.json()
}

export async function putDessin(commentaire: string, file: FileList, numConcours: string, numCompetiteur: string) {

    if(!file)
    {
        error(500, 'Aucun blob lors de l\'upload du dessin');
    }

    const response = await fetch("/api/concours", {
        method: "POST",
        body: JSON.stringify({ commentaire, file, numConcours}),
        headers: {
            "content-type": "application/json",
        },
    });

    return response.json()
}

