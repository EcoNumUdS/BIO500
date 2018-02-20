---
title       : "Séance 2: La gestion des données biologiques"
subtitle    : "BIO 500 - Méthodes en écologie computationnelle"
author      : "Steve Vissault & Dominique Gravel"
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
---
# Séance 2

- Ces diapositives sont disponibles en [version web](https://econumuds.github.io/BIO500/cours2/) et en [PDF](./assets/pdf/S2-BIO500.pdf).
- L'ensemble du matériel de cours est disponible sur la page du portail [moodle](https://www.usherbrooke.ca/moodle2-cours/course/view.php?id=12189).


--- .transition

# Les données en biologie

---

# La collecte de données

<div style='text-align:center;'>
<img src="assets/img/flow_cours2.png" width="90%"></img>
</div>

--- &twocol

# Le constat

*** =left

Trop souvent en écologie, les données sont représentées et entreposées dans un format proche des analyses que l'on veut réaliser.

Par exemple, on utilise une matrice $site \times espèces$ pour analyser la structure des communautées.

La question ne devrait jamais conditionner notre facon de stocker l'information sur un système écologique.

*** =right

<div style='text-align:center;'>
<img src="assets/img/matrix.jpg" width="90%"></img>
</div>


---

# La collecte de données en biologie

## D'abord, qu'est ce qu'une donnée en écologie?


<!-- Présenter qu'est qu'une données biologiques, comme elle est représentée -->
<!-- Qu'est ce qui est représenté en ligne versus en colonne -->


<div style='text-align:center;'>
<img src="assets/img/data_cube_2n.png" width="100%"></img>
</div>


---

# La collecte de données en biologie

## Le problème de multidimensionnalité

<div style='text-align:center;'>
<img src="assets/img/data_cube_3n.png" width="100%"></img>
</div>


---

# La collecte de données en biologie

## Le problème de multidimensionnalité

<div style='text-align:center;'>
<img src="assets/img/data_cube_4n.png" width="100%"></img>
</div>

**Note:** Pour la prise de données de facteurs environnementaux (abiotiques), on retrouverait une forme de type 3n.

---

# La collecte de données en biologie

## **En biologie**, on classifie les données selon 4 dimensions/classes d'information:

1. Biotique/abiotique
2. Taxonomique
3. Temporelle
4. Spatial

Au sein de ce cours, nous nous attarderons à la façon de structurer ses données. Les spécificités propres à chacune de ces dimensions seront présentées. D'abord le format des données, puis les types de données.

--- .transition

#  Le format des données

--- &twocol

#  Le format des données

*** =right

## <img src="assets/img/green.svg" width="10%"></img> Format long


|ID    |esp  | annees| dhp_mm|
|:-----|:----|------:|------:|
|567-1 |acsa |   2010|    460|
|567-2 |acsa |   2010|    100|
|567-3 |acsa |   2010|    120|
|598   |piru |   2011|    380|
|876   |abba |   2014|    160|

- Nom de colonnes court, sans accent, sans espace et explicite.
- Si possible, attachez les unités au nom de la colonne.

*** =left

## <img src="assets/img/red.svg" width="10%"></img> Format large


|ID    |esp  | 2010| 2011| 2014|
|:-----|:----|----:|----:|----:|
|567-1 |acsa |  460|   NA|   NA|
|567-2 |acsa |  100|   NA|   NA|
|567-3 |acsa |  120|   NA|   NA|
|598   |piru |   NA|  380|   NA|
|876   |abba |   NA|   NA|  160|

- Privilégier le format long
- Une ligne = une observation

--- &twocol

#  Le format des données: tableaux

## <img src="assets/img/green.svg" width="40px"></img> Un tableau doit contenir un type d'information

*** =left


|ID_plot | ID_arbre| ID_multi|esp  | annees| dhp_mm|
|:-------|--------:|--------:|:----|------:|------:|
|A       |      567|        1|acsa |   2010|    460|
|A       |      567|        2|acsa |   2010|    100|
|A       |      567|        3|acsa |   2010|    120|
|B       |      598|       NA|piru |   2011|    380|
|B       |      876|       NA|abba |   2014|    160|

*** =right


|ID_plot | annees|variable     | valeur|
|:-------|------:|:------------|------:|
|A       |   2010|pp_tot_mm    |    880|
|B       |   2011|pp_tot_mm    |    560|
|B       |   2014|pp_tot_mm    |    900|
|A       |   2010|temp_max_deg |     24|
|B       |   2011|temp_max_deg |     26|
|B       |   2014|temp_max_deg |     28|

- Si l'on veut ajouter des données sur le climat, on ouvrira un nouveau tableau.

--- &twocol

#  Le format des données: colonnes

## <img src="assets/img/green.svg" width="40px"></img> Ne pas agréger l'information dans une seule colonne

*** =left


|ID_arbre |esp  | annees| dhp_mm|
|:--------|:----|------:|------:|
|567-1    |acsa |   2010|    460|
|567-2    |acsa |   2010|    100|
|567-3    |acsa |   2010|    120|
|598      |piru |   2011|    380|
|876      |abba |   2014|    160|


- Une colonne = une information

*** =right


|ID_arbre |ID_multi |esp  | annees| dhp_mm|
|:--------|:--------|:----|------:|------:|
|567      |1        |acsa |   2010|    460|
|567      |2        |acsa |   2010|    100|
|567      |3        |acsa |   2010|    120|
|598      |NA       |piru |   2011|    380|
|876      |NA       |abba |   2014|    160|

---

#  Le format des données: colonnes

<span style="color:rgb(194, 0, 0);"> Important:</span> votre fichier de données brutes (destiné au stockage à long terme) ne doit pas contenir de champ calculé (c.a.d. une nouvelle colonne avec une moyenne, etc..)


--- .transition

#  Les types de données

---

#  Les types de données en informatique

## **En informatique**, on distingue plusieurs types de données:

| Appelation                | Type                 | Valeurs     | Taille           |
|---------------------------|----------------------|-------------|------------------|
| `BOLEAN`                  | Boléen               | vrai/faux   | 1 octet          |
| `INTEGER`                 | Entiers              | -998, 123   | 1 à 4 octets     |
| `DOUBLE`, `FLOAT`         | Nombres réels        | 9.98, -4.34 | 4 à 8 octets     |
| `CHAR`,`VARCHAR`          | Chaine de caractères | lapin       | n x 1 à 8 octets |
| `TIMESTAMP`,`DATE`,`TIME` | Dates et heures      | 1998-02-16  | 4 à 8 octets     |


- Ce sont ces types qui seront utilisés pour entreposer nos données biotiques et abiotiques.
- Le choix d'un type approprié permet de réduire la taille du fichier de données.

--- .transition

#  Les données temporelles

---

# Les données temporelles

La plupart des languages/programmes disposent d'un type `TIMESTAMP`, `DATE` et `TIME` pour représenter une donnée temporelle.

On utilisera préférablement la norme [ISO8601](https://fr.wikipedia.org/wiki/ISO_8601) pour représenter ces données.

- `TIMESTAMP` (Heure et temps): On utilisera la notation `YYYY-MM-ddThh:mm:ss`. *ex. `1977-04-22T01:00:00-05:00`*
- `DATE`: On utilisera la notation `YYYY-MM-dd`. *ex. 1997-04-22*
- `TIME`: On utilisera la notation `HH:mm:ss` dans un systéme de 24 heures. *ex. 01:30:00.*

---

# Les données temporelles

 Gardez à l'esprit que vos données pourraient être réutilisées à travers le Monde. Les dates ne sont pas représentées de la même manière que l'on soit en Amérique du Nord ou en Europe. **Il est donc important de normaliser la saisie de ce type d'information.**

--- &twocol

# Les données temporelles

Une autre représentation de la date du jour peut-être basé sur le calendrier Julien.

*** =left

<div style='text-align:center;'>
<img src="assets/img/jul.jpg" width="105%"></img>
</div>

*** =right

- **Inconvénient:** Le jour julien doit toujours être accompagné de l'année (YYYY).
- **Avantage:** simplifie les analyses temporelles intra-annuelles.

--- .transition

# Les données taxonomiques

--- &twocol

# Les données taxonomiques

*Un exemple avec l'érable à sucre*

*** =left

**Selon vous quelle option est la meilleure?**


|Option                             |Exemple        |
|:----------------------------------|:--------------|
|1. Code spécifique à l'étude       |ACSA           |
|2. Code du ministère               |ERS            |
|3. Genre et espèce                 |Acer saccharum |
|4. Nom vernaculaire                |Érable à sucre |
|5. Numéro Taxonomique (TSN - ITIS) |28731          |

*** =right

<div style='text-align:center;'>
<img src="assets/img/acsa.jpg" height="450px"></img>
</div>


--- &twocol

# Les données taxonomiques

*Un exemple avec l'érable à sucre*

*** =left


|Option                             |Exemple        |
|:----------------------------------|:--------------|
|1. Code spécifique à l'étude       |ACSA           |
|2. Code du ministère               |ERS            |
|3. Genre et espèce                 |Acer saccharum |
|4. Nom vernaculaire                |Érable à sucre |
|5. Numéro Taxonomique (TSN - ITIS) |28731          |

*** =right

>- <img src="assets/img/red.svg" width="20px"></img> **Option 1 et 2:** Doit être associé à des métadonnées. Risque de perte du fichier attaché.

>- <img src="assets/img/red.svg" width="20px"></img> **Option 3:** Le genre et l'espèce peuvent changer à travers le temps.

>- <img src="assets/img/red.svg" width="20px"></img> **Option 4:** Le nom vernaculaire des espèces est le pire choix. Le nom vernaculaire est propre à un pays, à une région géographique, à une culture/dialecte.


--- &twocol

# Les données taxonomiques

*Un exemple avec l'érable à sucre*

*** =left


|Option                             |Exemple        |
|:----------------------------------|:--------------|
|1. Code spécifique à l'étude       |ACSA           |
|2. Code du ministère               |ERS            |
|3. Genre et espèce                 |Acer saccharum |
|4. Nom vernaculaire                |Érable à sucre |
|5. Numéro Taxonomique (TSN - ITIS) |28731          |

*** =right


>- <img src="assets/img/green.svg" width="20px"></img> **Option 5:** Cette option couplée à l'option 3, est le meilleur choix.


---

# Les données taxonomiques

## On privilégie généralement l'utilisation de code espèce standardisée:

1. ITIS
2. VASCAN (Plantes vasculaires du Canada)
3. NCBI

**Avantage:** Chacune de ces institutions/infrastructures nous permettent de valider et retirer l'ensemble de la classification taxonomique d'une espèce à partir de son code. Même si l'identifiant change (nouvelle classification), nous serons en mesure de trouver le nouvel identifiant taxonomique à partir de l'ancien.

**Exemple:** [https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=28731#null](https://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=28731#null)


--- .transition

# Les données spatiales

---

# Les données spatiales

## Il existe plus de [65 familles de projections géographiques](https://en.wikipedia.org/wiki/List_of_map_projections) pour représenter des coordonnées sur la planète, en voici 3 des plus connues:

<div style='text-align:center;'>
<img src="assets/img/proj.png" height="200px"></img>
</div>

- Il est important de choisir un bon système de projection pour minimiser la déformation spatiale (surtout à nos latitudes)

>- À nos latitudes, on privilégiera l'utilisation d'une projection conique. Les ministères du Québec conseillent généralement l'utilisation d'une [projection conique conforme de Lambert](https://fr.wikipedia.org/wiki/Projection_conique_conforme_de_Lambert).

---

# Les données spatiales

- **Ce qu'il est important de savoir:** des coordonnées spatiales sans système de projection ne veulent strictement rien dire.
- Ainsi, lorsque l'on entrepose des données spatiales, trois colonnes doivent être représentées:
  - La coordonnée en X
  - La coordonnée en Y
  - La projection écrite en texte (voir votre GPS), ou préférablement l'identifiant unique de la projection.

---

# Les données spatiales

## Deux bases de données connues permettent de fournir des identifiants uniques:

1. `EPSG`: *European Petroleum Survey Group.*
2. `SRID`: *Spatial reference system*.

Ces deux identifiants sont généralement identiques et peuvent être trouvés à cette adresse: [http://spatialreference.org/](http://spatialreference.org/)

**Exemple:** [http://spatialreference.org/ref/epsg/2138/](http://spatialreference.org/ref/epsg/2138/)


--- .transition

# L'absence de données

---

#  L'absence de données

## On peut représenter l'absence de données de plusieurs façons:

- Laisser la cellule vide (`NULL`)
- Mettre un `NA` (*Not Available*)
- Mettre un 0
- Mettre `-9999` dans une colonne numérique

## Selon vous, quelle est l'action la plus appropriée ?

---

#  Le format des données

## On peut représenter l'absence de données de plusieurs façons:

- Laisser la cellule vide: montre que l'information n'a pas été saisie (un oublie)

>- Mettre un `NA` (*Not Available*): Montre que l'information est réellement indisponible (car le NA est saisie par un humain).

>- <span style="text-decoration: line-through;"> Mettre un 0 </span>: **JAMAIS** (empêche la distinction entre un vrai d'un faux 0, influence la moyenne)

>- Mettre `-9999` dans une colonne numérique: Ce choix peut être utilisé seulement pour les jeux de données très importants (centaine de Megas-octet), et doit être référencé dans les métadonnées.


---

# Choisir le bon type et format de données

Si l'on ne choisit pas le type de données approprié, cela aura diverses conséquences:

- Des problèmes de performance (ex. : il est plus rapide de faire une recherche sur un nombre que sur une chaîne de caractères)
- Un comportement contraire à celui attendu (ex. : trier sur un nombre stocké comme tel, ou sur un nombre stocké comme une chaîne de caractères ne donnera pas le même résultat)
- L'impossibilité d'utiliser des fonctionnalités propres à un type de données (ex. : stocker une date comme une chaîne de caractères vous prive des nombreuses fonctions temporelles disponibles).

<!-- Point supplémentaire pour les avancées: - Un gaspillage de mémoire (ex. : si vous stockez de toutes petites données dans une colonne faite pour stocker de grosses quantités de données) -->

---

# Finalement...

Pourquoi prendre soins de ces données ?

## Pour en savoir davantage:

- [Broman KW, Kara W (2017) Data organization in spreadsheets. The American Statistician.](http://www.tandfonline.com/doi/abs/10.1080/00031305.2017.1375989)
- [Hart EM, Barmby P, LeBauer D, Michonneau F, Mount S, Mulrooney P, et al. (2016) Ten Simple Rules for Digital Data Storage. PLoS Comput Biol](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005097)

--- .transition

# Entreposer et archiver ses données écologiques


<!-- TRANSTION vers SQL

# La collecte de données

En biologie, la collecte de données se résume à un hypercube.

Comme nous le verrons plus tard cette multidimensionnalité complique notre tâche, car il est difficile de la représenter dans un tableau excel (n-2). -->


---

# Où sommes-nous?

<div style='text-align:center;'>
<img src="assets/img/flow_bio.png" width="90%"></img>
</div>

---

# Pourquoi bien entreposer ces données?

<div style='text-align:center;'>
  <img src="assets/img/data_trends.jpg" height="500px"></img>
</div>

[Vines et al., 2013](https://www.nature.com/news/scientists-losing-data-at-a-rapid-rate-1.14416)

--- &twocol

# Les entrepôts existants

*** =left

1. Les `fichiers textes` comme les CSV, TSV (Format libre et ouvert)
2. Les `tableurs` comme MS Excel (Logiciel propriétaire), Libre Office Calc. (Logiciel libre)
3. Les `fichiers hierarchiques/structurés` HDF, NetCDF (Format libre et ouvert)
4. Les `bases de données relationnelles`

*** =right

## Exemple de fichier CSV

<img src="assets/img/csv.png" width="80%"></img>


--- &twocol

# Les entrepôts existants

*** =left

1. Les `fichiers textes` comme les CSV, TSV (Format libre et ouvert)
2. Les `tableurs` comme MS Excel (Logiciel propriétaire), Libre Office Calc. (Logiciel libre)
3. Les `fichiers hierarchiques/structurés` HDF, NetCDF (Format libre et ouvert)
4. Les `bases de données relationnelles`

*** =right

## Structure NetCDF

<img src="assets/img/netcdf.png" width="100%"></img>

---

# Le Tesseract de la biologie

<div style='text-align:center;'>
<img src="assets/img/data_cube_4n.png" width="90%"></img>
</div>

- Il est difficile de stocker les données écologiques dans un tableau excel (n-2) lorsque les données écologiques ont (n-4).
- Conduit à une redondance dans l'information (par exemple. repeter les coordonnées de l'emplacement du site lorsqu'il est mesuré plusieurs fois).

---

# Les bases de données (BDs) à la rescousse

<div style='text-align:center;'>
  <img src="assets/img/star_eg.png" width="50%"></img>
</div>

- Les BDs permettent de redimensionner ce problème (plusieurs tableaux de n-2 avec des relations) grâce au modèle d'entités-relations.
- Chaque table correspond à une dimension. Les tables sont liées entre elles par des relations. Cette structure est appelée [schéma en étoile](https://en.wikipedia.org/wiki/Star_schema).

---

# Avantages des bases de données

- **Maintenir l'intégrité entre les enregistrements de nos tableaux**. Une observation ne peut être faite sur un site qui n'existe pas.
- **Normaliser et contrôler la qualité des données**. Chaque colonne est un type précis de données. Des contraintes peuvent être appliquées sur chaque colonne.
- **Éviter les redondances dans le stockage de l'information** (obtenir une [forme normale](https://fr.wikipedia.org/wiki/Forme_normale_(bases_de_donn%C3%A9es_relationnelles)), voir la section [Format de donnée du cours 2](https://econumuds.github.io/BIO500/cours2/#10).

---

# Avantages des bases de données

## Autres avantages indéniables:

- Obtenir un gain de temps et de performance.
- Séparer les données brutes des données destinées aux analyses.
- Rendre flexible la préparation des données pour les analyses.
- Pemettre le travail simultané de plusieurs utilisateurs grâce à l'approche client-serveur.
- Déclencher des procédures de sauvegardes.
- Suivre les modifications/ajouts à la BD (journal de transactions).

--- .transition

# Conceptualisation d'une base de données en 5 étapes

---

# Étape 1. Faire une liste des variables

**Exercice (15-20 minutes):**

1. Dresser la liste des informations collectées par les différents groupes.
2. Regrouper les variables communes entre les équipes pour obtenir une ontologie conjointe.

---

# Étape 2. Regrouper les variables dans des tables

**Exercice (15-20 minutes):** Regrouper les variables dans des tables.

1. Déterminer les tables/entités:
  - Qu'elles sont les unités d'échantillonnage? Autrement dit, sur quelles entités portent nos mesures?
2. Remplir les tables avec les variables de l'étape 1.


À ce stade de la conceptualisation, une table est une entité possédant des attributs. Chaque attribut est une colonne.

---

# Étape 3. Établir le type d'association entre les tables

## Le concept d'association

<div style='text-align:center;'>
  <img src="assets/img/card.svg" width="80%"></img>
</div>

---

# Étape 3. Établir le type d'association entre les tables

## Il existe plusieurs types d'association:

| Table 1   | Table 2   | Relation                                       | exemple                        |
|:----------|:----------|:-----------------------------------------------|:-------------------------------|
| 1         | 1         | *one-to-one*                                   | personne ←→ permis de conduire |
| 0..1      | 1         | optionnel dans la table 1, *one-to-one*        | permis de conduire ←→ personne |
| 0..n ou n | 0..n or n | optionnel dans les deux tables, *many-to-many* | personne ←→ livre              |
| 1..n ou n | 1         | *many-to-one*                                  | personne ←→ lieu de naissance  |

**Exercice (5 minutes)**: Quel(s) type(s) d'association retrouve-t-on entre nos tables?

---

# Étape 4. Établir les clés primaires et étrangères

## Le concept des clés primaires et des clés étrangères

<div style='text-align:center;'>
  <img src="assets/img/keys_1.svg" width="45%"></img>
</div>

## Important:
  - Une clé primaire garantie le caractère unique d'un enregistrement (ligne d'une table).
  - Une clé primaire ne peut donc jamais être `NULL`.
  - Une clé primaire peut être composite, une combinaison de colonnes.

---

# Étape 4. Établir les clés primaires et étrangères

**Exercice (5 minutes)**

1. Déterminer quels sont les attributs/colonnes garantissant le caractère unique d'un enregistrement (ligne d'une table).
2. Déterminer quelles sont les clés étrangères.


---

# Étape 5. Assigner un type de données aux attributs

Chaque attribut d'une table doit correspondre à un type de données:

| Appelation                | Type                 | Valeurs     | Taille           |
|:--------------------------|:---------------------|:------------|:-----------------|
| `BOLEAN`                  | Boléen               | vrai/faux   | 1 octet          |
| `INTEGER`                 | Entiers              | -998, 123   | 1 à 4 octets     |
| `DOUBLE`, `FLOAT`, `REAL` | Nombres réels        | 9.98, -4.34 | 4 à 8 octets     |
| `CHAR`,`VARCHAR`          | Chaine de caractères | lapin       | n x 1 à 8 octets |
| `TIMESTAMP`,`DATE`,`TIME` | Dates et heures      | 1998-02-16  | 4 à 8 octets     |

Pour tous les types de données, [voir la documentation SQLite3](https://www.sqlite.org/datatype3.html)

**Exercice (15 minutes):** Associer à chaque attribut un type de données.

---

# En résumé

## Finalement, qu'est-ce qu'un modèle conceptuel pour une base de données?

Une façon de représenter l'information dans un modèle de type entités-relations où chaque entité (table) possède des attributs (colonnes).

L'étape suivante est de se connecter à la base de données afin de transcrire ce modèle conceptuel en modèle logique (c.a.d compréhensible par l'ordinateur).


--- .transition

# Les Systèmes de Gestion de Base de Données (SGBDs)

--- &twocol

# La diversité des SGBDs

*** =left

## Il en existe une multitude:

<div style='text-align:center;'>
  <img src="assets/img/sgbd.png" width="100%"></img>
</div>

*** =right

>- Pour créer, interroger, gérer et maintenir des bases de données, on utilisera un **[Système de Gestion de Base de Données](https://fr.wikipedia.org/wiki/Syst%C3%A8me_de_gestion_de_base_de_donn%C3%A9es) (souvent appelé SGBD)**.
>- Mais ces systèmes disposent tous d'un dénominateur commun: le `langage SQL`
>- Dans ce cours, nous utiliserons le système de gestion de données `SQLite3` (**Approche fichier de base de données**).

---

# Le langage SQL

## Définition

> Le SQL (Structured Query Language) est le langage des SGBDs. Il permet de communiquer avec une base de données.

---

# Le langage SQL

## Le `SQL` permet de:

1. Créer une base de données (`CREATE DATABASE`).
2. Créer des tables et établir des relations (`CREATE TABLE`).
3. Insérer des données (`INSERT`).
4. Interroger les données par requête (`SELECT`).
5. Supprimer des données ou des tables (`DROP`, `DELETE`).
6. Mettre à jour des données ou des tables (`UPDATE`, `ALTER`).
7. Supprimer la base de données (`DROP DATABASE`).

Chacune de ces commandes est une instruction `SQL` envoyée au serveur pour manipuler et interroger la base de données.

---

# Le langage SQL

## Pour cette séance, nous nous attarderons seulement à:

1. Créer une base de données (`CREATE DATABASE`).
2. Créer des tables et établir des relations (`CREATE TABLE`).
3. Supprimer ou modifier des tables (`DROP TABLE`, `ALTER TABLE`).
4. Supprimer la base de données (`DROP DATABASE`).

Soyez attentifs, car le travail de cette semaine consiste à écrire un script qui permet la création de la base de données (les tables et leurs relations) pour entreposer les données que vous aurez collectées pour le travail de session.


--- &twocol

# Deux approches avec les bases de données

*** =right

## Serveur de base de données

<img src="assets/img/flow_db.png" height="450px"></img>

*** =left

## Fichier de base de données

<img src="assets/img/db_flow2.png" height="450px"></img>


--- &twocolw w1:40% w2:60%

# L'approche: Serveur de base de données

*** =left

<div style='text-align:center;'>
  <img src="assets/img/flow_db.png" height="450px"></img>
</div>


*** =right

- Le **client** est un logiciel installé sur votre ordinateur.
- On se sert de ce logiciel pour interagir avec le serveur de base de données présent localement ou à distance.
- **Avantage:** On peut avoir plusieurs **clients** de connecté sur un même serveur (contexte multi-utilisateurs).

--- &twocolw w1:40% w2:60%

# L'approche: Fichier de base de données

*** =left

<div style='text-align:center;'>
  <img src="assets/img/db_flow2.png" height="450px"></img>
</div>


*** =right

- On se connecte au fichier a l'aide d'un **client** (logiciel)
- **Avantage:** Portabilité
- **Désavantage:** On ne peut pas se connecter à plusieurs utilisateurs en même temps.

<!-- ---

# L'approche client-serveur

## On pourrait envisager la situation suivante...


<div style='text-align:center;'>
  <img src="assets/img/db_flow_multi.png" width="55%"></img>
</div>

L'approche multi-utilisateurs peut uniquement se faire si le serveur est distant. -->

--- .transition

# Pratique: Du modèle conceptuelle vers le modèle logique

---

# Les grandes étapes avec SQLite3

0. Créer un fichier de base de données
1. Se connecter avec le fichier de base de données
2. Créer les tables et spécifier les clés
3. Ajouter de l'information dans les tables
4. Faire des requêtes pour extraire l'information


---&twocolw w1:30% w2:70%

# Créer un fichier de base de données

*** =left

À l'aide de votre gestionnaire de fichiers, créer un nouveau fichier qui s'intitulera `films.bd`

*** =right

<div style='text-align:center;'>
  <img src="assets/img/gf.png" width="90%"></img>
</div>


---&twocolw w1:40% w2:60%

# Se connecter au fichier la BD (SQLite3) via R

*** =right




```r
library(RSQLite)
con <- dbConnect(SQLite(), dbname="./assets/data/films.db")
## !ATTENTION!: Ceci est mon chemin d'accès vers le fichier!
## Astuces: getwd() et setwd()
```


```r
dbSendQuery(con,"Instructions SQL à envoyer")
```

*** =left

- `con` est un objet contenant la connexion avec le serveur/fichier de base de données.
- On utilisera la fonction `dbSendQuery()` pour envoyer les instructions SQL.
- Le deuxième argument de la fonction `dbSendQuery()` est une chaine de caractères contenant les instructions SQL.


---&twocolw w1:50% w2:50%

# Création de la base de données via R


```r
dbSendQuery(con,"CREATE DATABASE films;")
```

## Important:

1. `CREATE DATABASE` serait importante seulement avec d'autres SGBDs (approche serveur). Dans le cas de SQLite3, un fichier = une base de données.
2. En SQL, chaque instruction se termine par un point-virgule.
3. Les instructions sont écrites en majuscules et les variables en minuscules.
4. Toutes les instructions SQL sont énumérées et expliquées en Français à cette adresse: [http://docs.postgresql.fr/9.5/sql-commands.html](http://docs.postgresql.fr/9.5/sql-commands.html)


---&twocol

# Création d'une première table avec clé primaire

*** =left

Voici un exemple d'instruction SQL pour créer la table `films`.

```sql
CREATE TABLE films (
    code        VARCHAR(5),
    titre       VARCHAR(40),
    did         INTEGER,
    date_prod   DATE,
    genre       VARCHAR(10),
    duree       INTEGER,
    PRIMARY KEY(code,titre)
);
```

*** =right

- `films` est le nom de la table
- Chaque attribut de la table (`code`,`titre` etc) dispose d'un type de données (`char(5)`, `varchar(40)` etc) [Type de données SQLite](https://www.sqlite.org/datatype3.html)
- La dernière ligne correspond aux contraintes de la table telle que la clé primaire.
- **Question:** Cette clé primaire est composite ou simple?

---&twocol

# Création d'une table avec clé étrangère

*** =left

Si l'on veut créer une table `acteurs` et référencer cette table à la table `films`.

```sql
CREATE TABLE acteurs (
    nom         VARCHAR(40),
    prenom      VARCHAR(40),
    naissance   DATE,
    code        CHAR(5),
    titre       VARCHAR(40),
    PRIMARY KEY (nom,prenom),
    FOREIGN KEY (code, titre) REFERENCES
        films (code, titre) ON DELETE CASCADE
);
```

*** =right

- On déclare `prenom` et `nom` comme étant la clé primaire de la table `acteurs`.
- On référence les attributs `code` et `titre` comme étant la clé étrangère.

---&twocol

# Création d'une table avec clé étrangère

*** =left

Si l'on veut créer une table `acteurs` et référencer cette table à la table `films`.

```sql
CREATE TABLE acteurs (
    nom         VARCHAR(40),
    prenom      VARCHAR(40),
    naissance   DATE,
    code        CHAR(5),
    titre       VARCHAR(40),
    PRIMARY KEY (nom,prenom),
    FOREIGN KEY (code, titre) REFERENCES
        films (code, titre) ON DELETE CASCADE
);
```

*** =right

## Important:

- On ne peut plus insérer d'acteurs jouant dans un film qui n'est pas référencé dans la table `films`. C'est ce que l'on appelle l'intégrité référentielle.
- Lorsque l'on supprime un enregistrement dans `films`, les acteurs référencés à ce film vont être automatiquement supprimés grâce à l'instruction `CASCADE`.


---

# Ajout de contraintes à une table

SQL présente également l'avantage de pouvoir mettre des contraintes sur les champs:

```sql
CREATE TABLE films (
    code        VARCHAR(5) NOT NULL,
    titre       VARCHAR(40) NOT NULL,
    did         INTEGER,
    date_prod   DATE,
    genre       VARCHAR(10) DEFAULT "COMEDIE",
    duree       INTEGER CHECK( duree > 0 ),
    PRIMARY KEY(code,titre)
);
```


---

# Création d'une table avec R

## On se sert de R pour envoyer l'instruction SQL de création de la table:


```r
films_sql <- "
CREATE TABLE films (
    code        VARCHAR(5),
    titre       VARCHAR(40),
    did         INTEGER,
    date_prod   DATE,
    genre       VARCHAR(10),
    duree       INTEGER,
    PRIMARY KEY(code,titre)
);"

dbSendQuery(con,films_sql)
dbListTables(con)
```

---

# Création d'une table

## Exercice pour le travail de session (20 minutes):

En vous inspirant des [exemples](http://www.sqlitetutorial.net/sqlite-create-table/) et de la syntaxe SQL expliquée précédemment, écrivez le script contenant les instructions SQL permettant la création de table `personnes`.

- [Documentation SQL pour SQLite3](https://www.sqlite.org/lang.html)
- [Type de données SQLite](https://www.sqlite.org/datatype3.html)


---

# Modifier la table existante

```sql
ALTER TABLE database_name.table_name RENAME TO new_table_name;
ALTER TABLE database_name.table_name ADD COLUMN column_def...;
```

Il peut être parfois préférable supprimer la table et de la reconstruire plutôt que de la modifier à la volée.

---

# Supprimer la table de données et se déconnecter


```r
dbSendQuery(con,"DROP TABLE films;")
dbDisconnect(con)
```

- `DROP TABLE` supprime l'ensemble de la table et ses données.
- `dbDisconnect(con)` permet de fermer la connection avec le fichier de base de données (permet à un autre utilisateur de se connecter).

---

# Supprimer la base de données


```r
dbSendQuery(con,"DROP DATABASE films;")
dbDisconnect(con)
```

- `DROP DATABASE` fonctionne seulement avec d'autres SGBDs (approche serveur).
- Dans le cas de SQLite3, on supprime simplement le fichier `*.db`.

---

# Lectures et travail pour la semaine prochaine

## Travail

Maintenant que vous en savez plus sur le format des données, vous devez écrire le script R pour créer votre base de données en spécifiant les tables, les champs et les clés liant les tables entre elles.


---

# Lectures et travail pour la semaine prochaine

## Travail

- Poisot et al. 2014. Moving toward a sustainable ecological science: don't let data go to waste ! Ideas in Ecology and Evolution 6: 11-19
- Mills et al. 2015. Archivin Primary Data: Solutions for Long-term Studies. Trends in Ecology and Evolution.
