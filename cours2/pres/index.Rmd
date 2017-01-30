---
title       : "Séance 2: Les données en biologie"
subtitle    : "BIO 500 - Méthodes en écologie computationnelle"
author      : "Dominique Gravel"
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
# Séance 2

- Ces diapositives sont disponibles en [version web](https://econumuds.github.io/BIO500/cours1/) et en [PDF](./assets/pdf/S1-BIO500.pdf).
- L'ensemble du matériel de cours est disponible sur la page du portail [moodle](https://www.usherbrooke.ca/moodle2-cours/course/view.php?id=12188).

<!-- TODO 1: Mettre cours 2 en PDF -->
<!-- TODO 2: Changer le lien moodle -->

--- .transition

# Les types de données

---

# La collecte de données

<div style='text-align:center;'>
<img src="assets/img/flow_cours2.png" width="90%"></img>
</div>

---

# La collecte de données

## **En biométrie**, il éxiste plusieurs grandes familles de données:

1. Quantitative (variables continues)
2. Semi-quantitative (variables discrètes)
3. Qualitatives (variables de rang)

Le type de données collectées conditionne les analyses statistiques que l'on pourra réaliser sur les données.

<!-- ## Probléme - La structure des données est par conséquent déterminé par les analyses que l'on va réaliser. On est une étape plus loin dans notre cheminement (voir schéma précédent) -->

---

# La collecte de données en biologie

## Qu'est ce qu'une donnée biologique ?

<!-- Présenter qu'est qu'une données biologiques, comme elle est représenté -->
<!-- Qu'est ce qui est représenté en ligne versus en colonne -->


<div style='text-align:center;'>
<img src="assets/img/data_cube_2n.png" width="100%"></img>
</div>


---

# La collecte de données en biologie

## Le problème de multi-dimensionnalité

<div style='text-align:center;'>
<img src="assets/img/data_cube_3n.png" width="100%"></img>
</div>


---

# La collecte de données en biologie

## Le problème de multi-dimensionnalité

<div style='text-align:center;'>
<img src="assets/img/data_cube_4n.png" width="100%"></img>
</div>

---

# La collecte de données en biologie


<!-- Ajouter la partie sur les données abiotiques, une dimension de moins (taxonomique) -->


---

# La collecte de données en biologie

## **En biologie**, on classifie les données selon 4 dimensions/classes d'information:

1. Taxonomique
2. Biotique/abiotique
3. Temporel
4. Spatial


--- .transition

#  Les type de données


---

# Les données taxonomiques

<!-- Présenté les types de chaines de caractère -->


---

# Les données temporelles

<!-- Voir Borer -->
<!-- Représentation en jour julien Annuelle -->


---

# Les données spatiales


---

# L'absence de données


---

# Choisir le bon type de données

Si l'on ne choisit pas le type de données approprié, cela aura diverses conséquences:

- Des problèmes de performance (ex. : il est plus rapide de faire une recherche sur un nombre que sur une chaîne de caractères)
- Un comportement contraire à celui attendu (ex. : trier sur un nombre stocké comme tel, ou sur un nombre stocké comme une chaîne de caractères ne donnera pas le même résultat)
- L'impossibilité d'utiliser des fonctionnalités propres à un type de données (ex. : stocker une date comme une chaîne de caractères vous prive des nombreuses fonctions temporelles disponibles).

<!-- Point supplémentaire pour les avancées: - Un gaspillage de mémoire (ex. : si vous stockez de toutes petites données dans une colonne faite pour stocker de grosses quantités de données) -->

---

# Finalement

Pourquoi prendre soin de ces données ?

Les 3 R.
C'est comme un livre, ca nous raconte l'histoire d'individu, d'une pop à un instant t à un endroit donné.
Sommes-nous capable de juger de la valeur de ces données?


<!-- ---

TRANSTION vers SQL

# La collecte de données

En biologie, la collecte de données se résume à un hypercube.


Comme nous le verrons plus tard cette multi-dimensionnalité complique notre tâche, car il est difficile de la représenter dans un tableau excel (n-2). -->
