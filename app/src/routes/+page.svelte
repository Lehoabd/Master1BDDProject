<script lang="ts">
    import { goto } from "$app/navigation";
    import { getConcours, getUserClub } from "$lib/outils/generalApiCommands";
    import { nomLogin } from "$lib/outils/stores";
    import { isNotNull } from "$lib/outils/utils";
    import { onMount } from "svelte";

    let clubData: Promise<any> = $state()!;
    let concoursList: Promise<any> = $state()!;

    let nomUtilisateur: string = $derived($nomLogin);

    onMount(() => {
        clubData = getUserClub();
        concoursList = getConcours();
    });

    function cardClick(id: any) {
        goto("/concours/" + id);
    }
</script>

{#if isNotNull(nomUtilisateur)}
    {#await clubData}
        <p>Chargement du club en cours</p>
    {:then data}
        {#if data}
            <div class="cardClub container">
                <div class="col-12 text-center">
                    <div class="row">
                        <div class="col-12 mt-3">
                            <h4>🖋️ Mon club :</h4>
                            <h1>
                                {#if data && data.nomclub !== undefined}
                                    {data.nomclub}
                                {/if}
                            </h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-2">
                            <p>Membres : {data.nombreadherents}</p>
                            <p>Téléphone : {data.numtelephone}</p>
                        </div>
                        <div class="col-6 mb-2">
                            <p>{data.adresse}</p>
                            <p>{data.departement} {data.region}</p>
                            <p>{data.ville}</p>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    {/await}
    <div class="container">
        <hr class="mx-5 mt-5" />
        <div class="text-center mt-5">
            <h2>Liste des concours :</h2>
        </div>
    </div>
    {#await concoursList}
        <p>Chargement des concours</p>
    {:then concours}
        <div class="container mt-5 text-center">
            <div class="row justify-content-center">
                <!-- svelte-ignore a11y_no_static_element_interactions -->
                {#each concours as unConcours}
                    <!-- svelte-ignore a11y_click_events_have_key_events -->
                    <div
                        class="card col-3 m-2 pt-3"
                        onclick={() => cardClick(unConcours.numconcours)}
                    >
                        <h5>📜 {unConcours.theme}</h5>
                        <p>{unConcours.descriptif}</p>
                        {#if unConcours.etat === "non_commence"}
                            <p style="color:crimson">📍 Non commencé</p>
                        {:else if unConcours.etat === "en_cours"}
                            <p style="color:chartreuse">✏️ En cours</p>
                        {:else if unConcours.etat === "en_attente"}
                            <p style="color:gold">⏰ En attente</p>
                        {:else if unConcours.etat === "evalue"}
                            <p style="color:darkturquoise">📩 Evalué</p>
                        {/if}
                    </div>
                {/each}
            </div>
        </div>
    {/await}
{:else}
    <h1>Salut</h1>
{/if}

<style>
    .cardClub {
        background-color: #242424;
        border-radius: 4px;
        box-shadow: 5px 5px 8px rgba(39, 39, 39, 0.5);
    }
    .card {
        background-color: rgba(0, 0, 0, 0.068);
        border-radius: 4px;
        box-shadow: 5px 5px 8px rgba(39, 39, 39, 0.5);
        transition: 0.3s;
        transition-timing-function: ease-in-out;
    }
    .card:hover {
        transform: translate(-4px, -4px);
        background-color: rgba(0, 0, 0, 0);
        transition: 0.3s;
        transition-timing-function: ease-in-out;
        cursor: pointer;
    }

    .cardClub h1,
    .cardClub h4,
    .cardClub p {
        color: #d8d8d8;
    }
</style>
