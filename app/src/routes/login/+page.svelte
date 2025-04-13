<script lang="ts">
    import type { PageData } from './$types';

    let { data }: { data: PageData } = $props();
</script>
<h3 class="text-center">Se connecter</h3>
<div class="container">
    <div class="row justify-content-center mt-3">
        <div class="col-4">
            <label for="id">Identifiant</label>
            <input id="id" name="id" class="form-control" required>
        </div>
    </div>
    <div class="row justify-content-center mt-4">
        <div class="col-4">
            <label for="password">Mot de passe</label>
            <input id="password" name="password" type="password" class="form-control" required>
        </div>
    </div>
    <div class="row justify-content-center mt-4">
        <div class="col-2">
            <input id="submit" name="submit" type="submit" value="Connexion" class="form-control btn btn-primary">
        </div>
    </div>
</div>
<style>
    @import "./style.css";
</style>
