<script lang="ts">
    import type { PageData } from './$types';
    import image from "$lib/images/aboutImage.webp"

    let { data }: { data: PageData } = $props();
</script>
<section id="a-propos">
    <div class="container">
      <div class="row justify-content-center text-center mb-4">
        <div class="col-lg-8">
          <h2 class="fw-bold">À propos du Concours</h2>
          <p class="text-muted">
            Bienvenue sur notre site officiel du <strong>Concours de Dessin</strong> ! Un espace dédié à la créativité, à l’expression artistique, et à la découverte de nouveaux talents.
          </p>
        </div>
      </div>
      <div class="row align-items-center">
        <div class="col-md-6">
          <img src={image} alt="Concours" class="img-fluid rounded shadow">
        </div>
        <div class="col-md-6">
          <h4 class="mb-3">Un événement pour petits et grands</h4>
          <p>
            Que vous soyez amateur ou artiste confirmé, ce concours est ouvert à tous ! Chaque édition met en avant un thème original pour inspirer vos plus belles créations.
          </p>
          <p>
            Rejoignez une communauté passionnée, partagez votre vision et tentez de remporter des prix incroyables. L'art est un langage universel – exprimez-vous à travers le dessin !
          </p>
          <a href="#inscription" class="btn btn-primary mt-3">Participer au concours</a>
        </div>
      </div>
    </div>
  </section>
