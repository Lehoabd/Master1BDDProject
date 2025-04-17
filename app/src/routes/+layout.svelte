<script lang="ts">
    import { onMount, type Snippet } from 'svelte';
    import type { LayoutData } from './$types';
    import { nomLogin, userPrivilege } from '$lib/outils/stores';
    import { actualizeStores } from '$lib/outils/generalApiCommands';

    let { data, children }: { data: LayoutData, children: Snippet } = $props();

    let nomUtilisateur: string = $derived($nomLogin);

    onMount(()=>{
        actualizeStores();
    })

</script>

<header class="container mt-2">
    <div class="col-12 text-center">
        <div class="row">
            <div class="col-12 mt-3">
                <h1>J'adore dessiner comme j'adore rire</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mb-2">
                <a class="mx-2" href="/">Home</a>
                <a class="mx-2" href="/about">A propos</a>
                <a class="mx-2" href="/contact">Contact</a>
                {#if $userPrivilege}
                    <a class="mx-2" href="/concours/creation">Créer un concours</a>
                {/if}
                {#if nomUtilisateur}
                    <a class="mx-2" href="/login">{nomUtilisateur}</a>
                {:else}
                    <a class="mx-2" href="/login">Connexion</a>
                {/if}
            </div>
        </div>
    </div>
</header>
<div class="mt-5">
    {@render children()}
</div>

<style>
    header {
        background-color: #e49cde;
        border-radius: 4px;
        box-shadow: 5px 5px 8px rgba(105, 0, 119, 0.5)    }

    a {
        color : #0f0f0f;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>