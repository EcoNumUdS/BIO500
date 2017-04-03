---
title       : "Séance 4: L'organisation des données - 2"
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

# Séance 4

- Ces diapositives sont disponibles en [version web](https://econumuds.github.io/BIO500/cours4/) et en [PDF](./assets/pdf/S4-BIO500.pdf).
- L'ensemble du matériel de cours est disponible sur la page du portail [moodle](https://www.usherbrooke.ca/moodle2-cours/course/view.php?id=12189).

<!-- TODO 1: Mettre cours 2 en PDF -->
<!-- TODO 2: Changer le lien moodle -->

---

# Les grandes étapes

1. Spécifier la connexion avec le serveur
2. Créer la base de données
3. Créer les tables et spécifier les clés
4. Ajouter de l'information dans les tables
5. Faire des requêtes pour extraire l'information

**Important:**

1. Pour cette partie assurez vous que êtes connecté au réseau **Aerius Sécurisé**.
2. Pour ceux dont la VM ne fonctionne pas, il possible de faire les exercices de ce cours sur Windows ou MacOSX.


--- .transition

# Retour rapide sur la séance de la semaine dernière

---

# Connexion au serveur de l'UdS

L'adresse du serveur est `pyrole.dbio.fsci.usherbrooke.ca` sur le port `5432`.
Il faut remplacer l'objet `pass` par le mot de passe du tableau.



## On ouvre la connexion:


```r
library(RPostgreSQL)

con <- dbConnect(PostgreSQL(),
        host="pyrole.dbio.fsci.usherbrooke.ca",
        port=5432,
        user= "postgres",
        password=pass)

# On créé la base de données
dbSendQuery(con,"DROP DATABASE IF EXISTS bd_films;")
dbSendQuery(con,"CREATE DATABASE bd_films;")
# On se connect à la nouvelle base de données
con <- dbConnect(con,dbname="bd_films")
```

---

# Création de la table `films`


```r
tbl_films <- "CREATE TABLE films (
    id_film     integer,
    titre       varchar(300),
    annee_prod   integer,
    PRIMARY KEY (id_film)
);"

dbSendQuery(con,tbl_films)
```

```
## <PostgreSQLResult>
```

**Question:** Sur ce script, où sont les instructions SQL? Òu sont les commandes R?

---

# Création de la table `acteurs`



```r
tbl_acteurs <- "CREATE TABLE acteurs (
    id_acteur   integer,
    nom         varchar(100),
    prenom      varchar(100),
    id_film     integer,
    PRIMARY KEY (id_acteur),
    FOREIGN KEY (id_film) REFERENCES films (id_film) ON DELETE CASCADE
);"

dbSendQuery(con,tbl_acteurs)
```

```
## <PostgreSQLResult>
```

---

# pgAdmin3

`pgAdmin3` est un client avec une interface graphique permettant de visualiser si les opérations de création de tables ont bien été réalisées.


--- .transition

# Ajouter de l'information dans les tables

---

# SQL - `INSERT`

On veut maintenant insérer des données dans les tables `acteurs` et `films`.

## L'instruction `INSERT` permet d'insérer une ligne à la fois:

```sql
INSERT INTO films(id_film,titre,annee_prod) VALUES (1,'la vie est belle',1997);
INSERT INTO acteurs(id_acteur,prenom,nom,id_film) VALUES(1,'Nicoletta','Braschi',1);
INSERT INTO acteurs(id_acteur,prenom,nom,id_film) VALUES(2,'Robertox','Benigni',1);
```

---

# Exercice (10 minutes)

1. Prenez un film de votre choix et insérer son titre et son année de parution dans la table `films`.
2. Insérer les acteurs de ce film dans la tables `acteurs`.

---

# SQL - `COPY ... FROM`

L'instruction `COPY ... FROM` permet d'insérer plusieurs ligne à la fois:

```sql

COPY  FROM

```

---

# RPostgreSQL - `dbWriteTable`

La librairie RPostgreSQL peut nous aider plus facilement à accomplir cette tâche:


```r
# Lecture des fichiers CSV
bd_films <- read.csv2(file='./assets/donnees/bd_beacon/bd_films.csv')
bd_acteurs <- read.csv2(file='./assets/donnees/bd_beacon/bd_acteurs.csv')

# Injection des enregistrements dans la BD
dbWriteTable(con,append=TRUE,name="films",value=bd_films, row.names=FALSE)
```

```
## [1] TRUE
```

```r
dbWriteTable(con,append=TRUE,name="acteurs",value=bd_acteurs, row.names=FALSE)
```

```
## [1] TRUE
```

---

# pgAdmin3

Il est également possible d'insérer des données à partir du logiciel `pgAdmin3`.

Ajouter

---

# Exercice (15 minutes)

1. Dans une base de données locale `bd_films`, injecter les films de l'année 2007 avec leurs acteurs. Les données brutes sont contenues dans les fichiers [ex_2007_acteurs.csv](./assets/donnees/bd_beacon/ex_2007_acteurs.csv) et [ex_2007_films.csv](./assets/donnees/bd_beacon/ex_2007_films.csv).

Vous pouvez utiliser la commande R `dbWriteTable`, l'instruction SQL `COPY` ou encore pgAdmin3 pour insérer les données.

---.transition

# Les requêtes

---&twocol

# Sélectionner des tables et des colonnes

La connection est ouverte et accessible depuis l'objet `con`.

*** =left



```r
sql_requete <- "
SELECT id_film, titre, annee_prod
  FROM films LIMIT 10
;"

films <- dbGetQuery(con,sql_requete)
head(films)
```

```
##   id_film                   titre annee_prod
## 1       4        'Breaker' Morant       1980
## 2       5             'burbs, The       1989
## 3       6   'Crocodile' Dundee II       1988
## 4       7 *batteries not included       1987
## 5       3  ...And Justice for All       1979
## 6       8                      10       1979
```

*** =right

- `SELECT` spécifie les colonnes.
- `FROM` spécifie la table.
- On peut également ajouter une `LIMIT`.
- [Documentation SQL Select](http://docs.postgresqlfr.org/9.5/sql-select.html).


---&twocol

# Ordonner la table

*** =left


```r
sql_requete <- "
SELECT titre, annee_prod, id_film
  FROM films ORDER BY annee_prod DESC
;"
derniers_films <- dbGetQuery(con,sql_requete)
head(derniers_films)
```

```
##              titre annee_prod id_film
## 1  Wilson, Michael         NA    5496
## 2     Khan, George         NA    2732
## 3   Walker, Amanda         NA    5350
## 4 Franklin, Cherie         NA    1823
## 5     Thomas, Meda         NA    5030
## 6    Cicco, Johnny         NA     984
```

*** =right

- `ORDER BY` permet de trier par odre croissant (`ASC`) ou décroissant (`DESC`).

---&twocol

# Filtrer les absences de valeurs

*** =left


```r
sql_requete <- "
SELECT id_film, titre, annee_prod
  FROM films WHERE annee_prod IS NOT NULL
  ORDER BY annee_prod DESC
;"
derniers_films <- dbGetQuery(con,sql_requete)
head(derniers_films)
```

```
##   id_film                titre annee_prod
## 1    2354             Hot Fuzz       2007
## 2    3663       Number 23, The       2007
## 3    5473            Wild Hogs       2007
## 4     727 Bridge to Terabithia       2007
## 5    3487     Music and Lyrics       2007
## 6    4159     Reno 911!: Miami       2007
```

*** =right

- `WHERE`, spécifie les critères de la requète.
- `IS NULL`

---&twocol

# Modifier les critères

*** =left


```r
sql_requete <- "
SELECT id_film, titre, annee_prod
  FROM films WHERE titre LIKE '%Voyage%'
  AND annee_prod >= 1950
;"
derniers_films <- dbGetQuery(con,sql_requete)
head(derniers_films)
```

```
##   id_film                         titre annee_prod
## 1    1662              Fantastic Voyage       1966
## 2    4770 Star Trek IV: The Voyage Home       1986
```

*** =right

- Multi-critères: `AND` `OR`
- Recherche sur le texte: `LIKE`, `_`
- Opérateurs de comparaison: `>=`,`<=`, `==` (Valeurs numériques)
- https://www.postgresql.org/docs/9.1/static/functions-comparison.html

---&twocol

# Opération sur la table

*** =left


```r
sql_requete <- "
SELECT avg(annee_prod) AS moyenne,
  min(annee_prod), max(annee_prod)
  FROM films;"

resume_films <- dbGetQuery(con,sql_requete)
head(resume_films)
```

```
##    moyenne  min  max
## 1 1989.853 1902 2007
```

*** =right

- Faire des opérations sur les champs: `max`, `min`, `sum`, `avg`.
- Renommer les colonnes: `AS`.

---&twocol

# Opération sur la table

*** =left


```r
sql_requete <- "
SELECT count(titre) AS nb_films, annee_prod
  FROM films
  GROUP BY annee_prod;"

resume_films <- dbGetQuery(con,sql_requete)
head(resume_films)
```

```
##   nb_films annee_prod
## 1     1278         NA
## 2       29       1975
## 3        9       1947
## 4       44       1981
## 5       27       1972
## 6       11       1956
```

*** =right

- `GROUP BY` définit les champs sur lequel se fera l'aggregation des données.

---

# Exercice


Compter le nombre d'acteurs par films
Ordonner par acteur plus prolifique.

---

# Jointures entre tables

Le `INNER JOIN` est un type de jointure, renvoyant seulement les films et les acteurs ayant un identifiant `id_film` commun.


```r
sql_requete <- "
SELECT titre, annee_prod, films.id_film, acteurs.id_film
  FROM films
  INNER JOIN acteurs ON films.id_film = acteurs.id_film
  ;"

acteurs_films <- dbGetQuery(con,sql_requete)
head(acteurs_films,4)
```

```
##                     titre annee_prod id_film id_film
## 1        'Breaker' Morant       1980       4       4
## 2             'burbs, The       1989       5       5
## 3   'Crocodile' Dundee II       1988       6       6
## 4 *batteries not included       1987       7       7
```

---

# Les type de jointures

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/sql_joins.png" width="80%"></img>
</div>


---

# Jointures entre tables

On peut spécifier la jointure avec `USING` seulement si les deux clés possèdent le même nom.


```r
sql_requete <- "
SELECT titre, annee_prod, nom, prenom
  FROM films
  INNER JOIN acteurs USING (id_film)
  ;"

acteurs_films <- dbGetQuery(con,sql_requete)
head(acteurs_films,4)
```

```
##                     titre annee_prod         nom    prenom
## 1        'Breaker' Morant       1980 Fitz-Gerald     Lewis
## 2             'burbs, The       1989        Gage     Kevin
## 3   'Crocodile' Dundee II       1988    Carrasco    Carlos
## 4 *batteries not included       1987     Vasquez David (I)
```


---

# Exercice 3

## Combien il y a d'acteurs par film depuis les 10 dernières années?

Toujours avec la même base de données,
on voudrait savoir le nombre d'acteurs par film depuis les 10 dernières années.

---

# Exercice 4

## Existe-t-il un film sans acteurs?

En vous servant de la base de données sur le serveur `pyrolle` et des types de jointures, on voudrait savoir s'il existe des films sans acteurs.


---

# Exercice 4

## Croisé dynamique

Nombre d'acteurs par année, par film

---

# Requêtes emboitées

On s'interroge sur le nombre moyen d'acteurs par années.
Pour ce faire, on peut batîr une requête à partir d'autre requête.


```r
sql_requete <- "
SELECT annee_prod, avg(nb_acteurs) AS mu FROM (
  SELECT titre, annee_prod, count(nom) AS nb_acteurs
    FROM films
    INNER JOIN acteurs USING (id_film)
    GROUP BY annee_prod, titre
) AS nb_acteurs_film
GROUP BY annee_prod;"

nb_acteurs <- dbGetQuery(con,sql_requete)
head(nb_acteurs)
```

```
##   annee_prod mu
## 1         NA  1
## 2       1975  1
## 3       1947  1
## 4       1981  1
## 5       1972  1
## 6       1956  1
```

---

# Filtrer les requêtes

 <!-- Reprendre ici -->

Avec HAVING


```r
sql_requete <- "
SELECT annee_prod, avg(nb_acteurs) AS mu FROM (
  SELECT titre, annee_prod, count(nom) AS nb_acteurs
    FROM films
    INNER JOIN acteurs USING (id_film)
    GROUP BY annee_prod, titre
) AS nb_acteurs_film
GROUP BY annee_prod
HAVING avg(nb_acteurs) > 10;"

nb_acteurs <- dbGetQuery(con,sql_requete)
head(nb_acteurs)
```

```
## data frame with 0 columns and 0 rows
```

---.transition

# Sauvegarder les requêtes

---

# Sauvegarder une requête

Avec COPY ... TO

---

# Sauvegarder une requête

Avec RPostgreSQL

---

# Les vues

- Deux sortes
  - Vue normale
  - Vue qui se met à jour sur demande (vue matérialisé)


---.transition

# Manipuler les enregistrements

---

# Mettre à jour des enregistrements

Avec UPDATE

---

# Supprimer des enregistrements  

Avec DELETE
