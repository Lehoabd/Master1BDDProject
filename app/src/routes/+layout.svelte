<script lang="ts">
    import { onMount, type Snippet } from 'svelte';
    import type { LayoutData } from './$types';
    import { nomLogin } from '$lib/outils/stores';
    import { getUserLogin } from '$lib/outils/generalApiCommands';

    let { data, children }: { data: LayoutData, children: Snippet } = $props();

    let nomUtilisateur: string = $derived($nomLogin);

    onMount(()=>{
        getUserLogin();
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
                <a class="mx-2" href="/">home</a>
                <a class="mx-2" href="/about">a propos</a>
                <a class="mx-2" href="/contact">contact</a>
                {#if nomUtilisateur}
                    <a class="mx-2" href="/login">{nomUtilisateur}</a>
                {:else}
                    <a class="mx-2" href="/login">connexion</a>
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