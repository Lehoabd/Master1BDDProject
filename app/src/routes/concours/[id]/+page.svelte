<script lang="ts">
    import { page } from '$app/stores';
    import { onMount } from 'svelte';
    import type { PageData } from './$types';
    import { getConcoursById } from '$lib/outils/generalApiCommands';

    let { data }: { data: PageData } = $props();


    onMount(()=>{
        const id = parseInt($page.params.id);
        getConcoursById(id).then(()=>{
            console.log(data);
        }
        )
    })
</script>
