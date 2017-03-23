---
title       : "Séance 3: L'organisation des données - 1"
subtitle    : "BIO 500 - Méthodes en écologie computationnelle"
author      : "Dominique Gravel & Steve Vissault"
job         : "Laboratoire d'écologie intégrative"
logo        : "logo.png"
framework   : io2012       # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      #
mode        : selfcontained
knit        : slidify::knit2slides
widgets     : [mathjax]
url:
  lib   : ./libraries
license     : by-nc-sa
assets      :
  css: "https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css"
---
# Séance 3

- Ces diapositives sont disponibles en [version web](https://econumuds.github.io/BIO500/cours3/) et en [PDF](./assets/pdf/S3-BIO500.pdf).
- L'ensemble du matériel de cours est disponible sur la page du portail [moodle](https://www.usherbrooke.ca/moodle2-cours/course/view.php?id=12188).

<!-- TODO 1: Mettre cours 2 en PDF -->
<!-- TODO 2: Changer le lien moodle -->

--- .transition

# L'organisation des données

---

# Où sommes-nous?

<div style='text-align:center;'>
<img src="assets/img/flow_bio.png" width="90%"></img>
</div>

---

# Le Tesseract de la biologie

<div style='text-align:center;'>
<img src="assets/img/data_cube_4n.png" width="90%"></img>
</div>

- Il est difficile de stocker les données écologiques dans un tableau excel (n-2) lorsque les données écologiques ont (n-4).

---

# Les bases de données (BDs) à la rescousse

<div style='text-align:center;'>
  <img src="assets/img/star_eg.png" width="50%"></img>
</div>

- Les BDs permettent de redimensionner ce problème (plusieurs tableaux de n-2 avec des relations).
- Chaque table corresponds à une dimension. Les tables sont liées entre-elles par des relations. Cette structure est appelé [schéma en étoile](https://en.wikipedia.org/wiki/Star_schema)

---

# Avantages des bases de données

- **Maintenir l'intégrité entre les enregistrements de nos tableaux**. Une observation ne peut être faite sur un site qui n'existe pas.
- **Normaliser et contrôler la qualité des données**. Chaque colonne est un type précis de données. Des contraintes peuvent être établies sur chaque colonne.
- **Éviter les redondances dans le stockage de l'information** (obtenir une [forme normale](https://fr.wikipedia.org/wiki/Forme_normale_(bases_de_donn%C3%A9es_relationnelles)), voir la section [Format de donnée du cours 2](https://econumuds.github.io/BIO500/cours2/#14).

---

# Avantages des bases de données

## Autres avantages indéniables:

- Gain de temps et de performance.
- Séparer les données brutes des données destinées aux analyses.
- Flexibilité dans la préparation des données pour les analyses.
- Multi-utilisateurs grâce à l'approche client-serveur.

--- &twocolw w1:40% w2:60%

# L'approche client-serveur


*** =left

<div style='text-align:center;'>
  <img src="assets/img/flow_db.png" height="450px"></img>
</div>


*** =right

- Le **serveur** est un ordinateur contenant la base de données.
- Le serveur peut être votre machine, on se connectera alors **localement** (Généralement, environnement de développement).
- Si le serveur est quelque part d'autre (accessible via le réseau), on parlera de **serveur distant** (Généralement, environnement de production).


--- &twocolw w1:40% w2:60%

# L'approche client-serveur


*** =left

<div style='text-align:center;'>
  <img src="assets/img/flow_db.png" height="450px"></img>
</div>


*** =right

- Le **client** peut être un logiciel tout comme un langage installé sur votre ordinateur. On se sert de ce langage ou logiciel pour interagir avec le serveur de base de données présent localement ou à distance.

- On peut donc avoir plusieurs **clients** sur un même ordinateur.

--- &twocolw w1:40% w2:60%

# L'approche client-serveur

*** =left

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/pgadmin.png" width="90%"></img>
</div>
<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/psql.jpg" width="90%"></img>
</div>

*** =right

- Il existe une grande diversité de clients, mais nous utiliserons essentiellement ces trois là:
  - **pgadmin3**: logiciel avec une interface graphique.
  - **R**: language de programmation scientifique.
  - **psql**: un autre language pratique à savoir (si le temps le permet).

<!-- Question, qu'est qui distingue un logiciel d'un langage? -->

**Note:** La plupart des langages de programmation disposent de librairies permettant de se connecter à une base de données sur un serveur local ou distant.

--- &twocolw w1:40% w2:60%

# L'approche client-serveur


*** =left

<div style='text-align:center;'>
  <img src="assets/img/flow_db.png" height="450px"></img>
</div>


*** =right

**Le client** se connecte pour réaliser différentes opérations:

1. Créer une base de données
2. Créer des tables et établir des relations
3. Insérer des données
4. Interroger les données par requête
5. Supprimer des données ou des tables
6. Mettre à jour des données ou des tables
7. Supprimer la base de données


--- &twocolw w1:40% w2:60%

# L'approche client-serveur


*** =left

<div style='text-align:center;'>
  <img src="assets/img/flow_db.png" height="450px"></img>
</div>


*** =right

**Le serveur** répond avec des données, des messages d'erreurs ou des status (e.g. Données insérées).

---

# L'approche client-serveur avec multi-utilisateurs

## On pourrait envisager la situation suivante...


<div style='text-align:center;'>
  <img src="assets/img/db_flow_multi.png" width="55%"></img>
</div>

L'approche multi-utilisateurs peut uniquement se faire si le serveur est distant.

--- .transition

# Les Systèmes de gestion de base de données

--- &twocol

# Les Systèmes de gestion de base de données

*** =left

<div style='text-align:center;'>
  <img src="assets/img/flow_db.png" height="450px"></img>
</div>

*** =right

- Les base de données sont présente sur un serveur.
- Pour créer, interroger, gérer et maintenir des bases de données on utilisera un **[Système de Gestion de Base de Données](https://fr.wikipedia.org/wiki/Syst%C3%A8me_de_gestion_de_base_de_donn%C3%A9es) (souvent appelé SGBD)** installée sur le serveur.

--- &twocol

# La diversités des SGBDs

*** =left

## Il en existe une multitude:

<div style='text-align:center;'>
  <img src="assets/img/sgbd.png" width="100%"></img>
</div>

*** =right

>- Mais ces systèmes disposent tous d'un dénominateur commun: le `langage SQL`
>- Dans ce cours, nous utiliserons le système de gestion de données `PostgreSQL`.

---

# Le langage SQL

## Définition

> Le SQL (Structured Query Language) est un langage permettant de communiquer avec une base de données.

---

# Le langage SQL

## Le SQL permet:

1. Créer une base de données (`CREATE DATABASE`).
2. Créer des tables et établir des relations (`CREATE TABLE`)
3. Insérer des données (`INSERT`)
4. Interroger les données par requête (`SELECT`)
5. Supprimer des données ou des tables (`DROP`, `DELETE`)
6. Mettre à jour des données ou des tables (`UPDATE`, `ALTER`).
7. Supprimer la base de données (`DROP DATABASE`).

Chacune de ces commandes est une instruction SQL envoyée au serveur pour manipuler et interroger la base de données.

---

# Le langage SQL

## Pour cette séance, nous nous attaderons seulement à:

1. Créer une base de données (`CREATE DATABASE`).
2. Créer des tables et établir des relations (`CREATE TABLE`).
3. Supprimer des tables (`DROP TABLE`).
4. Supprimer la base de données (`DROP DATABASE`).

Soyez attentif car le travail de cette semaine consiste écrire un script qui permet la création de la base de données (tables et relations) pour entreposer vos données que vous avez collecté lors de la séance 2.

--- .transition

# Exercice: Création d'une base de données
