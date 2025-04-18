# Projet SQL - Master 1 Cybersécurité

Projet d'équipe, composé de Thomas DECAUDIN, Leho ERREÇARRET et Théo MAYANS

## Composition du projet

```bash
 Master1BDDProject/
 ├ app/
 │ └ {Application Web}
 ├ docs/
 │ └ {Documents et cahiers des charges}
 ├ nodes_modules/
 │ └ {Fichiers Node.js nécessaires pour notre application web}
 ├ sources/
 │ ├ CREATE_TABLE.sql
 │ ├ INSERT_DATA.sql
 │ ├ REQUEST.sql
 │ └ package.json
 docker-compose.yml
 ├ README.md
 ├ package-lock.json
 └ package.json
```

Le projet se divise en deux parties :

 - Partie Scripts : tous les fichies nécessaires pour créer et peupler les tables, pour lancer les requêtes et créer deux conteneurs Docker : PostGresSQL & PGAdmin.

 - Partie page web : l'application web Svelte pour requeter de manière interactive.


## Prérequis

Pour executer le projet, vous aurez besoin de :

- [Docker](https://www.docker.com/) pour l'éxecution des conteneurs PostGresSQL et PGAdmin
- [Node.js](https://nodejs.org/en/download) pour executer localement l'application web Svelte.

## Partie Script

Pour mettre en marche les serveurs PostGresSQL et PGAdmin, lancer les commandes suivantes (Linux)

```bash
# Naviguer dans le dossier sources
~/Master1BDDProject$ cd sources/

# Executer le script "Docker compose"
~/Master1BDDProject/sources$ docker compose up -d
```

Vous pouvez désormais accéder a l'interface d'administration PGAdmin en utilisant comment identifiants :
>Email : admin@admin.com

>Mot de passe : admin

## Developing

Once you've created a project and installed dependencies with `npm install` (or `pnpm install` or `yarn`), start a development server:

```bash
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

## Building

To create a production version of your app:

```bash
npm run build
```

You can preview the production build with `npm run preview`.

> To deploy your app, you may need to install an [adapter](https://svelte.dev/docs/kit/adapters) for your target environment.
