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

 - Partie Scripts : tous les fichies nécessaires pour créer et peupler les tables, pour lancer les requêtes et créer deux conteneurs Docker : PostGreSQL & PGAdmin.

 - Partie page web : l'application web Svelte pour requeter de manière interactive.


## Prérequis

Pour executer le projet, vous aurez besoin de :

- [Docker](https://www.docker.com/) pour l'éxecution des conteneurs PostGreSQL et PGAdmin
- [Node.js](https://nodejs.org/en/download) pour executer localement l'application web Svelte.

## Partie Script

Pour mettre en marche les serveurs PostGreSQL et PGAdmin, lancez les commandes suivantes (Linux)

```bash
# Naviguer dans le dossier sources
~/Master1BDDProject$ cd sources/

# Executer le script "Docker compose"
~/Master1BDDProject/sources$ docker compose up -d
```

Vous pouvez désormais accéder a l'interface d'administration PGAdmin depuis le lien [localhost:5050](http://localhost:5050) en utilisant les identifiants :
>Email : admin@admin.com

>Mot de passe : admin

Une fois sur l'interface PGAdmin, vous pouvez ajouter un serveur depuis la page d'accueil en cliquant sur "Add New Server"

Entrez les information suivante :

```bash
General
└ Name : serveur_projet (peu importe)

Connection
├ Host name/Adress : postgres_server
├ Port : 5432
├ Maintenance database : Concours-dessin
├ Username : admin
└ Password : admin
```

Si votre fenêtre se ferme, félicitation, votre BDD est connecté à votre interface administrateur 🥳 !

Vous pouvez maintenant tester nos fichiers [CREATE_TABLE.sql](https://github.com/Lehoabd/Master1BDDProject/blob/main/sources/CREATE_TABLE.sql), [INSERT_DATA.sql](https://github.com/Lehoabd/Master1BDDProject/blob/main/sources/INSERT_DATA.sql) et les requetes du fichier [REQUEST.sql](https://github.com/Lehoabd/Master1BDDProject/blob/main/sources/REQUEST.sql).

## Partie application web

Un fois la partie Script mis en place, vous pouvez démarrer le serveur local Svelte en executant les commande suivante :

```bash
# Naviguer dans le dossier racine (si vous êtes dans le dossier sources)
~/Master1BDDProject/sources$ cd ..

# Naviguer dans le dossier app
~/Master1BDDProject$ cd app/

# Installer les dépendances npm
~/Master1BDDProject/app$ npm i

# Executer l'application web en mode développeur
~/Master1BDDProject/app$ npm run dev
```

Félicitation, vous pouvez maintenant acceder à l'application web depuis le lien [localhost:5173](http://localhost:5137) 🥳 !
