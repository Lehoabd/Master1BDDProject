<script lang="ts">
    import { goto } from "$app/navigation";
    import image from "$lib/images/aboutImage.webp"
    import { cookies } from "$lib/outils/cookies";
    import { isNotNull } from "$lib/outils/utils";

    function gotoBtn(){
      if(isNotNull(cookies.get('userId'))){
        goto('/');
      }
      else
      {
        goto('/login')
      }
    }

</script>
<section id="a-propos">
    <div class="container">
      <div class="row justify-content-center text-center mb-4">
        <div class="col-lg-8">
          <h2 class="fw-bold">À propos du Concours</h2>
          <p class="text-muted">
            Bienvenue sur notre site officiel du <strong>J'adore dessiner comme j'adore rire</strong> ! Un espace dédié à la créativité, à l’expression artistique, et à la découverte de nouveaux talents.
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
          <button class="btn btn-primary mt-3" onclick={gotoBtn}>Participer à un concours</button>
        </div>
      </div>
    </div>
  </section>
