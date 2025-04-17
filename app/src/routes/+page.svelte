<script lang="ts">
    import { getUserClub } from "$lib/outils/generalApiCommands";
    import { onMount } from "svelte";

    let clubData: Promise<any>;

    onMount(() => {
        clubData = getUserClub();
    });
</script>

{#await clubData}
    <p>Chargement du club en cours</p>
{:then data}
{#if data}
    <div class="card container">
        <div class="col-12 text-center">
            <div class="row">
                <div class="col-12 mt-3">
                    <h4>Mon club :</h4>
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

<style>
    .card {
        background-color: #242424;
        border-radius: 4px;
        box-shadow: 5px 5px 8px rgba(39, 39, 39, 0.5);
    }

    h1, h4, p {
        color: #d8d8d8;
    }
</style>
