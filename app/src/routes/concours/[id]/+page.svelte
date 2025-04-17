<script lang="ts">
    import { page } from "$app/stores";
    import { onMount } from "svelte";
    import {
        getConcoursById,
        getUtilisateursWithClub,
        putDessin,
    } from "$lib/outils/generalApiCommands";
    import { cookies } from "$lib/outils/cookies";

    let id: number;

    let concours: Promise<any>;

    let users: Promise<any>;

    let commentaireDessin: string;
    let dessin: FileList;

    $: console.log(dessin);

    onMount(() => {
        id = parseInt($page.params.id);
        concours = getConcoursById(id);
        users = getUtilisateursWithClub();
    });

    function addDessinBtnClick(){
        putDessin(commentaireDessin, dessin, id.toString(), cookies.get('userId'));
    }
</script>

{#await concours}
    <h1>Chargement en cours...</h1>
{:then concours}
    {#if concours}
        <div class="container d-flex justify-content-center">
            <div class="col-5 mx-4 row">
                <div>
                    <label for="theme">Theme</label>
                    <input
                        id="theme"
                        name="theme"
                        class="form-control"
                        bind:value={concours.theme}
                        disabled
                    />
                </div>
                <div>
                    <label for="dateDebut">Date de début</label>
                    <input
                        id="dateDebut"
                        name="dateDebut"
                        type="date"
                        class="form-control"
                        bind:value={concours.datedebut}
                        disabled
                    />
                </div>
                <div>
                    <label for="dateFin">Date de fin</label>
                    <input
                        id="dateFin"
                        name="dateFin"
                        type="date"
                        class="form-control"
                        bind:value={concours.datefin}
                        disabled
                    />
                </div>
                <div>
                    <label for="etat">État</label>
                    <input
                        id="etat"
                        name="etat"
                        class="form-control"
                        bind:value={concours.etat}
                        disabled
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
                        bind:value={concours.descriptif}
                        disabled
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
                                bind:value={concours.numpresident}
                                disabled
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
        <div class="container text-center justify-content-center">
            <hr class="m-5" />
            {#if concours.etat === "non_commence"}
                <p>
                    Le concours n'a pas encore commencé !<br />Attends encore un
                    peu 😉
                </p>
            {:else if concours.etat === "en_cours"}
                <div class="row justify-content-center">
                    <div class="col-5 mx-4 row text-start">
                        <div>
                            <label for="commentaireDessin">Descriptif</label>
                            <textarea
                                id="commentaireDessin"
                                name="commentaireDessin"
                                class="form-control"
                                bind:value={commentaireDessin}
                            ></textarea>
                        </div>
                        <div class="my-5 text-center">
                            <label for="dessin">Upload a picture:</label>
                            <input
                                accept="image/png, image/jpeg"
                                bind:files={dessin}
                                id="dessin"
                                name="dessin"
                                type="file"
                            />
                        </div>
                        <div class="text-center mt-4">
                            <button class="btn btn-success col-6" onclick={addDessinBtnClick}>Envoyer 📨 </button>
                        </div>
                    </div>

                </div>
            {:else if concours.etat === "en_attente"}
                <p>Tu n'a pas participé à ce concours 🥲</p>
            {:else if concours.etat === "evalue"}
                <p>Tu n'a pas participé à ce concours 🥲</p>
            {/if}
        </div>
    {/if}
{/await}

<style>
    textarea {
        height: 100px;
    }
</style>
