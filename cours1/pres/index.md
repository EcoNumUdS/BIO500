---
title       : "Séance 1: Introduction"
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
# Séance 1

- Ces diapositives sont disponibles en [version web](https://econumuds.github.io/BIO500/cours1/) et en [PDF](./assets/pdf/S1-BIO500.pdf).
- L'ensemble du matériel de cours est disponible sur la page du portail [moodle](https://www.usherbrooke.ca/moodle2-cours/course/view.php?id=12188).

--- .transition

# Introduction

---

# Le Bacon number

<div style='text-align:center;'>
<img src="assets/img/bacon.jpg" height="500px"></img>
</div>

---
# Le Bacon number

Une hypothèse selon laquelle n'importe quel acteur peut être relié à Kevin Bacon via ses rôles dans 6 films ou moins.

---
# Exemple

- Kevin Bacon a lui-même un Bacon number de 0
- Sean Penn a un Bacon number de 1 pour son rôle dans *Mystic River*
- Madonna a un Bacon number de 2 pour son rôle dans *Shadows and Fog*, dans lequel figurait Camille Saviola, qui a elle-même joué avec Kevin Bacon dans *Queens Logic*

Si le jeux vous amusent, allez consulter le site [The Oracle of Bacon](https://oracleofbacon.org/movielinks.php)

---
# Six degrés de séparation

Le jeu est une parodie du mythe urbain de six degrés de séparation, qui propose que tous les humains sur la terre sont à moins de six degrés de séparation dans une chaine "d'ami à ami".

Kochen a proposé dans les années 50 que "*it is practically certain that any two individuals can contact one another by means of at most two intermediaries. In a [socially] structured population it is less likely but still seems probable. And perhaps for the whole world's population, probably only one more bridging individual should be needed.*"

---
# L'expérience de Milgram

- Inspiré des travaux de Gurevich
- Étude des réseaux sociaux
- Souhait d'évaluer la probabilité que deux personnes sélectionnées au hasard se connaissent

---
# L'expérience de Milgram

- Individus choisis au hasard au Nebraska et au Kansas, et qui devaient rejoindre des personnes à Boston.
- Un paquet était envoyé, incluant des instructions, une lettre ainsi que de l'information sur la personne ciblée à Boston
- Si la personne de départ connaissait directement la cible, elle devait lui envoyer directement la lettre
- Si non, la personne devait choisir un ami ou une connaissance qui était susceptible de connaître la personne cible
- Une fois rendue à destination, le destinataire envoyait la chaîne de communication au chercheur

---
# Résultats

- 64 lettres sur 296 envoyées sont arrivées à destination
- Le nombre de degré moyens était entre 5 et 6

---
# Suivi

- L'expérience a été répliquée de nombreuses fois, notamment par Dodds et al. qui ont aussi confirmé un nombre de 6
- Watts et Strogatz (1998) ont élaboré un modèle qui permet d'expliquer les propriétés de petit monde trouvées dans de nombreux réseaux

---
# Le modèle de petits mondes

<div style='text-align:center;'>
<img src="assets/img/small_world.png" height="500px"></img>
</div>

---
# Les propriétés de petits monde en écologie

<div style='text-align:center;'>
<img src="assets/img/williams2002.png" height="500px"></img>
</div>

---

# Les propriétés de petits monde en écologie

<div style='text-align:center;'>
<img src="assets/img/foodweb.png" height="500px"></img>
</div>

---

# Les propriétés de petits monde en écologie

<div style='text-align:center;'>
<img src="assets/img/cod.png" height="500px"></img>
</div>

---

# Les propriétés de petits monde en écologie

<div style='text-align:center;'>
<img src="assets/img/pollinisateur.png" height="500px"></img>
</div>

<!-- ---

TODO: MISSING FILE bacteries.png

# Les propriétés de petits monde en écologie

<div style='text-align:center;'>
<img src="assets/img/bacteries.png" height="500px"></img>
</div> -->

---

# Les propriétés de petits monde en écologie

<div style='text-align:center;'>
<img src="assets/img/csbq.png" height="500px"></img>
</div>

---
# Le projet de session

Est-ce que le réseau de collaboration entre les étudiants du bacc en écologie a les mêmes propriétés que les réseaux écologiques ?

---.transition

# La science reproductible

---

# L'importance de la reproductibilité.

## Certaines de ces situations peuvent survenir lors de votre carrière professionnelle:

**Situation 1.** Un employeur souhaite que vous réalisez les même analyses 3 ans plus tard sur des données difféntes.

**Situation 2.** Vous avez commis une erreur dans votre saisie de données, vous devez reconduire vos analyses.

**Situation 3.** Un des réviseurs de votre article scientifique vous demande de refaire vos analyses en tenant compte d'une nouvelle variable environnemental.

---

# Les étapes du travail d'un biologiste

<div style='text-align:center;'>
<img src="assets/img/flow_biometrie.png"  width="90%"></img>
</div>

---

# Les étapes du travail d'un biologiste

<div style='text-align:center;'>
<img src="assets/img/flow_bio500.png" width="90%"></img>
</div>

## Certaines étapes intermédiaires sont souvent oubliées.


---

# Discussion:

Identification des étapes d'une étude scientifique susceptibles d'influer sur la reproductibilité.


--- .transition

# Présentation du cours BIO500

---

# Objectif général

Au terme de ce cours, l'étudiant sera en mesure de réaliser l'ensemble de la  séquence d'une étude d'écologie en respectant les standards de gestion,  d'analyse et de présentation des données. Le cours portera sur la réalisation d'un projet intégrateur, de la collecte des données à la production du rapport final.

---

# Objectifs spécifiques

- Planifier une base de données et la préparation de formulaires pour leur acquisition ;
- Programmer et interroger une base de données relationnelle ;
- Compiler et exécuter un script au moyen de makefile ;
- Représenter visuellement les données au moyen de R ;
- Préparer un rapport d'étude au moyen de LaTeX ;
- Utiliser un système de contrôle de version pour le suivi des modifications sur du code ;
- Porter un regard critique sur la reproductibilité et la transparence d'études scientifiques ;

---

# Contenu du cours

## Bloc 1: Planification de la collecte et organisation des données

- Types de données
- Formulaires de saisie
- Bases de données relationnelles (SQL)
- Requêtes

---

# Contenu du cours

## Bloc 2: Outils pour une science reproductible et transparente

- UNIX
- le makefile
- Système de contrôle de version git

---

# Contenu du cours

## Bloc 3: Visualisation des données

- Les types de graphiques
- Fonctions graphiques de base sur R
- Paramètres graphiques
- Packages R spécialisés

---

# Contenu du cours

## Bloc 4: Communication scientifique au moyen de LaTeX

- Rédaction de rapports et d'articles scientifiques
- Mise en page
- Insertion de figures et tableaux
- Gestion des références
- Utilisation de Beamer pour les présentations

---

# Approche

Les cours vont comprendre une période de présentation entre-coupée d'exercices, suivi d'une discussion générale sur des références clés (45).

Nous progresserons dans l'exécution du travail de session et l'évaluation portera sur les étapes intermédiaires.

---

# Évaluation

L'évaluation porte sur la réalisation d'un travail de session (75%), réalisé en équipe de 4 personnes. Le travail sera divisé en 3 étapes réparties au cours de la session. L'évaluation finale (25%) portera sur la rédaction d'un essai de 1500 mots sur les enjeux de reproductibilité en science expérimentale.  

--- .transition

# Présentation sur les réseaux écologiques

---

# Définition

<div style='text-align:center;'>
<img src="assets/img/def.png" width="90%"></img>
</div>

---

# Types de réseaux

## Internet

<div style='text-align:center;'>
<img src="assets/img/internet.png" width="60%"></img>
</div>

---

# Types de réseaux
## Sociaux

<div style='text-align:center;'>
<img src="assets/img/sociaux.png" width="50%"></img>
</div>

---

# Types de réseaux
## Trophiques

<div style='text-align:center;'>
<img src="assets/img/foodweb.png" width="65%"></img>
</div>

---

# Types de réseaux
## Plante-pollinisateur

<div style='text-align:center;'>
<img src="assets/img/pollinisateur.png" height="500px;"></img>
</div>

---

# Types de réseaux
## Plante-disperseur

<div style='text-align:center;'>
<img src="assets/img/dispersion.png" height="500px;"></img>
</div>

---

# Types de réseaux
## Plante-herbivore

<div style='text-align:center;'>
<img src="assets/img/herbivore.png" height="500px"></img>
</div>

---

# Types de réseaux
## Plante-fongi

<div style='text-align:center;'>
<img src="assets/img/fongi.png" width="90%"></img>
</div>

---

# Types de réseaux
## Hote-parasite

<div style='text-align:center;'>
<img src="assets/img/parasite.png" height="500px"></img>
</div>

---

# Glossaire
## S, L, C

<div style='text-align:center;'>
<img src="assets/img/foodweb.png" height="500px;"></img>
</div>

---

# Glossaire
## Rang trophique

<div style='text-align:center;'>
<img src="assets/img/rang.png" height="500px"></img>
</div>

---

# Glossaire
## Distribution de degrés

<div style='text-align:center;'>
<img src="assets/img/degres.png" height="500px"></img>
</div>

---

# Glossaire
## Centralité

<div style='text-align:center;'>
<img src="assets/img/centralite.png" height="500px"></img>
</div>

---

# Glossaire
## Nestedness

<div style='text-align:center;'>
<img src="assets/img/nestedness.png" height="500px"></img>
</div>

---

# Glossaire
## Modularité

<div style='text-align:center;'>
<img src="assets/img/modularite.png" height="500px"></img>
</div>

---

# Glossaire
## Motifs

<div style='text-align:center;'>
<img src="assets/img/motifs.png" width="90%"></img>
</div>

---

# Glossaire
## Robustesse

<div style='text-align:center;'>
<img src="assets/img/robustesse.png" height="500px"></img>
</div>

--- .transition

# L'utilisation d'une machine virtuelle (VM)

--- &twocolw w1:50% w2:50%

# Définition

*** =left

[VirtualBox](https://www.virtualbox.org/) est une application qui `émule` une machine/ordinateur virtuel à l'intérieur de votre ordinateur.

Une machine virtuelle est donc un environnement confiné sur lequel on peut installer un autre système d'exploitation qui utilise les ressources matériels de l'hôte (votre ordinateur).

Nous utiliserons [VirtualBox](https://www.virtualbox.org/) pour exécuter une machine Linux (distribution Ubuntu 16.04), sur votre PC Windows ou votre Mac créée spécifiquement pour ce cours.

*** =right

<div style='text-align:center;'>
<img src="assets/img/VM.png" width="90%"></img>
</div>


---

# Pourquoi une VM?

- Simplifier l'installation des outils nécessaires pour le cours
- Être certain que tout le monde dispose des mêmes outils
- Permet d'uniformiser l'enseignement
- Un système d'exploitation de type `UNIX` est nécessaire pour exécuter certaines tâches de ce cours


--- &twocolw w1:40% w2:60%

# Procédure d'importation et de lancement de la VM

*** =left

- Étape 1: Installer [VirtualBox](https://www.virtualbox.org/)

--

- Étape 2: Téléchargez [l'image de la machine virtuelle](https://ielab-o.dbio.usherbrooke.ca/index.php/s/W8XIQcC1Dc9tUYD) créée pour le cours


--- &twocolw w1:40% w2:60%

# Procédure d'importation de la VM

*** =left

- Étape 3: Ouvrir **VirtualBox**
- Étape 4: Dans le menu **Machine**, sélectionnez **Ajouter**

*** =right

<div style='text-align:center;'>
<img src="assets/img/VM1.png" width="95%"></img>
</div>

--- &twocolw w1:40% w2:60%

# Procédure d'importation de la VM

*** =left

- Étape 5: **Sélectionner le fichier de l'image de la machine virtuelle** créée pour le cours (téléchargé à l'étape 2)

*** =right

<div style='text-align:center;'>
<img src="assets/img/VM2.png" width="95%"></img>
</div>

--- &twocolw w1:40% w2:60%

# Procédure de lancement de la VM

*** =left

- Étape 6: Clique droit sur la machine virtuelle `VM-BIO500`, puis `Démarrer` et enfin sur `Démarrage normal`.
- Étape 7: Et voilà ! La machine virtuelle est en train de démarrer.

**Veuillez prendre note que le mot de passe utilisateur est: `etudiant`**

*** =right

<div style='text-align:center;'>
<img src="assets/img/VM3.png" width="95%"></img>
</div>

--- &twocol

# Une nouveau monde s'ouvre à vous...

*** =left

Il éxiste une [grande diversité de distributions](https://fr.wikipedia.org/wiki/Liste_des_distributions_Linux) Linux (Systèmes d'exploitation). L'ensemble de ces distributions sont gratuites et libres (OpenSource) !


## Alors, pourquoi Ubuntu?

- Une importante communauté d'utilisateurs (estimé à 25 millions)
- Aussi facile d'utilisation que Microsoft Windows


*** =right

<div style='text-align:center;'>
<img src="assets/img/linux_distros.png" width="90%"></img>
</div>


---

# Sur la machine virtuelle Ubuntu...

**Les logiciels/languages que nous utiliserons dans le cours ont déjà été installés pour vous.**

- R (avec les librairies nécessaires)
- La distribution complète de LaTeX
- Git
- SQL
- SublimeText
- Le terminal (crt+alt+t)




---.transition

# Lectures et travail pour la semaine prochaine

---

# Lectures et travail

## Travail

- Prenez le temps de vous familiariser avec la Machine virtuelle Ubuntu.
  - Exemples: Créer des fichiers et des dossiers, changer le fond d'écran etc.

## Lectures

- Baker, M. 2016. Is there a reproducibility crisis ? Nature, 533 : 452:454
- Munafo, M.R. et al. 2017. A manifesto for reproducible science. Nature Human Behaviour 1: 0021
- Open Science Collaboration. 2015. Estimating the reproducibility of psychological science. Science 349 : 943.
