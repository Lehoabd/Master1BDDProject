<script lang="ts">
    import { onMount } from "svelte";
    import {
        getUtilisateursWithClub,
        putConcours,
    } from "$lib/outils/generalApiCommands";
    import { isNull } from "$lib/outils/utils";
    import { goto } from "$app/navigation";

    let users: Promise<any>;

    let themeInput: string;
    let dateDebInput: string;
    let dateFinInput: string;
    let descriptifInput: string;
    let presidentInput: string;

    onMount(() => {
        users = getUtilisateursWithClub();
    });

    function creerBtnClick() {
        if (
            isNull(themeInput) ||
            isNull(dateDebInput) ||
            isNull(dateFinInput) ||
            isNull(descriptifInput) ||
            isNull(presidentInput)
        ) {
            alert(
                "Veuillez compléter tous les champs avant de continuer et que les valeurs soient corrects.",
            );
        } else {
            try {
                putConcours(
                    themeInput,
                    dateDebInput,
                    dateFinInput,
                    descriptifInput,
                    presidentInput,
                );
                alert("Le concours a bien été enregistré.");
                goto("/");
            } catch (error) {
                alert("Erreur non géré ! : " + error);
            }
        }
    }
</script>

<div class="container d-flex justify-content-center">
    <div class="col-5 mx-4 row">
        <div>
            <label for="theme">Theme</label>
            <input
                id="theme"
                name="theme"
                class="form-control"
                bind:value={themeInput}
            />
        </div>
        <div>
            <label for="dateDebut">Date de début</label>
            <input
                id="dateDebut"
                name="dateDebut"
                type="date"
                class="form-control"
                bind:value={dateDebInput}
            />
        </div>
        <div>
            <label for="dateFin">Date de fin</label>
            <input
                id="dateFin"
                name="dateFin"
                type="date"
                class="form-control"
                bind:value={dateFinInput}
            />
        </div>
    </div>
    <div class="col-5 mx-4 row">
        <div>
            <label for="descriptif">Descriptif</label>
            <textarea
                id="descriptif"
                name="descriptif"
                class="form-control"
                bind:value={descriptifInput}
            ></textarea>
        </div>
        <div>
            {#await users}
                <label for="president">Président</label>
                <select
                    id="president"
                    name="president"
                    class="form-control"
                    placeholder="chargement..."
                    disabled
                ></select>
            {:then userList}
                {#if userList}
                    <label for="president">Président</label>
                    <select
                        id="president"
                        name="president"
                        class="form-control"
                        bind:value={presidentInput}
                    >
                        {#each userList as user}
                            <option value={user.numutilisateur}
                                >{user.nom.toUpperCase()}
                                {user.prenom} - {user.nomclub}</option
                            >
                        {/each}
                    </select>
                {/if}
            {/await}
        </div>
    </div>
</div>
<div class="col-12 mt-5 text-center">
    <button class="btn btn-primary col-1" onclick={creerBtnClick}>Créer</button>
</div>

<style>
    textarea {
        height: 100px;
    }
</style>
