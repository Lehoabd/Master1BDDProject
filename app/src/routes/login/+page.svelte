<script lang="ts">
    import { goto } from "$app/navigation";
    import { cookies } from "$lib/outils/cookies";
    import { actualizeStores } from "$lib/outils/generalApiCommands";
    import { nomLogin } from "$lib/outils/stores";
    import { isNull } from "$lib/outils/utils";
    import type { PageData } from "./$types";

    let { data }: { data: PageData } = $props();

    let login: string = $state("");
    let password: string = $state("");

    let nomUtilisateur: string = $derived($nomLogin);

    async function btnConnexion() {
        const response = await fetch("/api/login", {
            method: "POST",
            body: JSON.stringify({ login, password }),
            headers: {
                "content-type": "application/json",
            },
        });

        response.json().then((data) => {
            if (data === null) {
                alert("Couple login/mdp erroné");
            } else {
                cookies.set("userId", data, 1);
                alert("Bienvenu !");
                actualizeStores();
                goto("/");
            }
        });
    }
</script>

{#if isNull(nomUtilisateur)}
    <h3 class="text-center">Se connecter</h3>
{:else}
    <h3 class="text-center">Changer d'utilisateur ?</h3>

{/if}
<div class="container">
    <div class="row justify-content-center mt-3">
        <div class="col-4">
            <label for="id">Identifiant</label>
            <input
                id="id"
                name="id"
                class="form-control"
                bind:value={login}
                required
            />
        </div>
    </div>
    <div class="row justify-content-center mt-4">
        <div class="col-4">
            <label for="password">Mot de passe</label>
            <input
                id="password"
                name="password"
                type="password"
                class="form-control"
                bind:value={password}
                required
            />
        </div>
    </div>
    <div class="row justify-content-center mt-4">
        <div class="col-2">
            <button
                id="submit"
                name="submit"
                type="submit"
                onclick={btnConnexion}
                class="form-control btn btn-primary"
            >
                Connexion
            </button>
        </div>
    </div>
</div>

<style>
    @import "./style.css";
</style>
