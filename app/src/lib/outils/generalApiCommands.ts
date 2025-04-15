import { cookies } from "./cookies";
import { nomLogin } from "./stores";

export async function getUserLogin(){
    if(!cookies.get('userId')) return;
    const apiUrl = `/api/utilisateur?numUtilisateur=${encodeURIComponent(cookies.get('userId'))}`;
    const response = await fetch(apiUrl, {
        method: "POST",
        headers: {
            "content-type": "application/json",
        },
    });

    response.json().then((data) => {
            nomLogin.set(data.login);
        });
}

<<<<<<< HEAD
export async function getUserClub(){
        if(!cookies.get('userId')) return;
    const apiUrl = `/api/club/byUserId/?numUtilisateur=${encodeURIComponent(cookies.get('userId'))}`;
    const response = await fetch(apiUrl, {
        method: "POST",
        headers: {
            "content-type": "application/json",
        },
    });

    return response.json();
}
=======
>>>>>>> d27bbdef4d5b29371cfdace763863e70b0bd8946
