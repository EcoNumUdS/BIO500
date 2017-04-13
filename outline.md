# INTRODUCTION (3 heures)

## Cours 1

# Introduction (30 min)
- Le "Bacon number"
- Définition
- Exemple
- Histoire du Bacon number
- Histoire du 'six degrees of separation'
- Internet
- Réseaux sociaux
- Réseau trophique
- Réseau plantes-pollinisateurs
- Réseau bactéries phages
- Question de session : est-ce que les réseaux de collaboration entre les étudiants du bacc ont les mêmes propriétés que les réseaux écologiques ?


# La crise de reproductibitlié (30min)
- Les étapes d'une étude scientifique (schéma)

- Exemples de situations problématiques dans la pratique professionnelle

- Discussion sur la crise de reproductibilité (30-60min) : identification des étapes d'une étude scientifique susceptibles d'influer sur la reproductibilité



# Présentation du plan de cours (15 min)
    - Objectif général
    - Objectifs spécifiques
    - Contenu du cours
    - Approche
    - Évaluation

# Présentation sur les réseaux (30 min)
    - théorie des graphs en physique, informatique, socio etc...
    - les types de réseaux écologiques
    - descripteurs de base des réseaux

# Utilisation de la VM et utilisation de base de Ubuntu (30 min)
    - ouvrir le terminal
    - répertoires
    - ouvrir R
    - ouvrir sublimeText
    - exécuter un script sur le terminal





*** Lectures pour la semaine suivante:
Baker2016
Munafo2017
OpenScience015

*** Devoir : explorer l'utilisation de la VM

================================================

# BLOC 1 : Planification de la collecte et organisation des données (9 heures)

## Cours 2: Collecte des données (120 min)

- Présentation : définition des données (30 min)

- Activité : Récolte des données dans le cours (60 min)
<<<<<<< Updated upstream
    - instructions
=======
    - instructions
>>>>>>> Stashed changes
>>>>>>> Stashed changes
    - planification
    - récolte
    - formulaire de saisie

- Activité : intégration des données entre les équipes (30 min)
    - Inventaire des champs
    - Format des tables
    - Définition en classe du format standard
    - Gestion des doublons

- Activité de collecte de données

Suite du cours: création d'un formulaire sur libre office.

### Discussion : est-ce qu'il y a une crise de la reproductibilité en science ? (30 min)

*** Lectures pour la semaine suivante:
Pereira 2016
Miraldo et al. 2016

*** Devoir : préparation des données dans format approprié pour intégration ultérieure

======

## Cours 3: base de données relationnelles

<!-- le client psql sera utilisé pour la création de la BD
 La visualisation de la BD dans pgadmin est envisageable -->

- Présentation : organisation relationnelle des données

  1. Pourquoi les bases de données relationnelles.
      - Difficulé de stocker les données en 2D
      - Éviter les redondances (voir règles de normalisation BD)
      - Séparer les données raw des analyses

  2. Intro SQL
      - La couche serveur
      - la couche client
          - La diversité des clients (pgadmin4, psql, R etc..)
      - L'interaction entre les deux couches (adressage serveur via psql)
      - comment ca fonctionne en local? émulation d'un serveur (localhost)
      - Qu'est que le language SQL? Language d'interrogation, création et manipulation de la BD
      - La représentation de la données en SQL:
          - Les tables
            - Diversité des types de données
          - Les relations
            - 1:1
            - 1:n
            - n:n
            - Intégrité relationnelle
          - Les clés primaires et étrangères
      - Introduction à UML pour conceptualiser la DB
          - Représentation des tables
          - Représentation
      - Exercice : design du schéma de la DB

  3. Le language SQL
      - Création de table:
          - CREATE - Déclaration de la table
      - Manipulation de table:
          - DROP
          - UPDATE


EXERCICE : monter la base de données pour le cours  
          - Créer les tables
          - Déterminer enregistrement unique (clés primaires)
          - Contrôle des relations


### Discussion : les promesses de l'utilisation des données ouvertes

*** Lectures pour la semaine suivante:
Poisot2014
Mills2015

======

## Cours 4: Input / output

<!-- R sera utiliser pour injecter et retirer les donées -->

- Présentation SQL Suite - saisie de données additionnelles (insert):
    - Les insertions de données en SQL
      - INSERT (ligne par ligne)
        - Rappel sur l'importance des clés et des types
      - COPY (fichier txt, csv)
    - La manipulation de données:
      - SELECT
      - AS
      - FROM
      - WHERE
      - GROUP BY
      - HAVING
      - JOIN: Les type de jointure entre table
          - LEFT/RIGHT JOIN
          - INNER JOIN
          - OUTER JOIN
      - les requêtes séquentielles
        - SELECT * FROM (SELECT * FROM table) AS query1
      - DELETE (une ligne/plusieurs lignes) basé sur des critères
      - UPDATE (une ligne/plusieurs lignes) basé sur des critères

- Présentation : environnement de développement
    - diversité d'outils (atom)
    - L'importance de se détacher de la pensée: 1 logiciel = 1 language. Deux choses différentes
    - présentation sublimeText (On peut écrire/développer sur plusieurs language à partir d'un logiciel)
    - Communauté et packages additionnelles à installer (color picker)
    - envoyer des commandes vers R
    - Interaction avec la BD depuis R (RPostgreSQL)
        - Pourquoi? Amener des dfs directement depuis R
        - Connecter l'entrepot, retirer les données, reformater les données pour l'analyse
        - présentation du package RPostgreSQL
        - Connection à la BD
        - Lister les tables
        - Envoyer des instructions SQL
    - Exercice : ajout d'une table (informations sur les cours) depuis R
    - Exercie: requête sur ....

- Devoir: évaluation 1 - Ontologie commune au groupe, formulaire, script pour construire la base + insérer les données. Requêtes sur les tableaux

### Débat : les enjeux du partage de données

*** Lectures pour la semaine suivante:
Wilson2014
Barba2016
Peng2011
Sandve2013

================================================

# BLOC 2: Outils pour science reproductible (1 cours)

## Cours 5: outils pour science reproductible

- Présentation : UNIX
    - commandes unix de base
        cd : déplacement de dossiers
        cp et mv : manipulation de fichiers
        ls
        mkdir
        touch
        lancer subl
        supprimer des fichiers
        find
    - lancer un script R : RScript
    - lancer une tâche en background: nohup COMMANDE &
    - tâches en cours: top, ps
    - lancer une séquence de tâches simultanément: bash

Le fichier makefile
    - définition
    - syntaxe
    - exemple

- Exercice : préparation du makefile pour la réalisation des requêtes

- Système de contrôle de version
    - principe
        contrôle de version
        serveur local et serveur distant
    - cloner un dépot
    - Commandes de base
        git add
        git commit
        git push
        git branch
        git pull
    - Fichier gitignore
    - récupérer version actuelle
    - gestion des conflits entre versions
    - visualisation du travail sur github
    - git log
    - git checkout
- Exercice : mettre sur un dépôt GIT les données et les scripts

### Discussion : bonnes pratiques en science computationnelle

*** Lectures pour la semaine suivante:
Weissberger2015


================================================

# BLOC 3: Visualisation (2 cours)

## Cours 6 : figures 1

### Discussion : critique de figures
  cas pathologiques mélangés avec figures très informatives

Présentation: notions de base pour la visualisation
  objectifs: exploration / statistiques / communication
  règles de base
  types de figures
    scatter plot
    barplot
    histograms
    3D plots
    contour plot
  formats de base: vectoriel versus bitmap

Faire une figure étape par étape sur R avec 'plot'
  ouvrir une fenêtre graphique
  fixer les marges
  plot
  modification des axes
  ajout d'une légende
  ajout de texte
  ajout d'un titre
  ajout d'une ligne (abline)
  ajout de flèches
  superposition de figures

Enregistrer une figure
  Commandes de base
  Différences entre formats

Autres figures
  barplot
  boxplot
  hist
  image
  contour

Représentation de réseaux avec iGraph
    matrice adjacence
    plot
    changer les tailles et couleurs de noeuds
    changer les tailles et couleurs de liens
    changer la représentation
    Calcul de propriétés de réseau avec igraph
      modularité
      path length
      centrality

Faire des tableaux: kable

Exercice 
- Discussion en équipe sur les questions
- Trouver les figures et représentations


*** Lectures pour la semaine suivante
Silberzahn2015








## Cours 7 : figures 2


- Packages R spécialisés
   ggplot2
   lattice     
   igraph   
   RColorBrewer

- Faire des schémas avec DiagrammeR

- Faire des tableau: kable

- Intégration dans le makefile

### Discussion : la reproductibilité des analyses statistiques

*** Lectures pour la semaine suivante :
Sand-Jensen2007
Fawcett2012


================================================

# BLOC 4: Communication (3 cours)

## Cours 8 : Introduction à LaTex

### Discussion : comment présenter adéquatement un article scientifique


- Présentation : pourquoi LaTeX
    - Historique
    - Dissociation entre contenu et forme
    - Gain de productivité
    - Qualité de la présentation
    - Contrôle et stabilité
    - Édition d'équations
    - Inter-opérabilité
    - Automatisation
    - Stabilité

- Un exemple de base avec un template par défaut

- Comment compiler 

- Comparaison de différents templates -- passer d'un type de document à l'autre 

- Faire des commentaires

- Préparer la présentation du travail de session
    - Titre
    - Auteurs
    - Résumé
    - Sections
    - Ajout de figures
    - Ajout de tableaux
    - Ajouter des énumérations
    - Table des matières
    - types de caractères (gras, italique, taille)
    - Ajouter des symboles
    - Ajouter une équation
    - LaTeX Cheat sheet

- Comment citer une référence

- Le format bibtex

- Comment générer un bibtex avec Mendeley

- Le fichier bst

- Compiler le bibtex et le document

- Révisions: comparaison de deux documents avec la commande diff





- Intégration dans le makefile



*** Lectures pour la semaine suivante :
Borregaard2016



============================================================
- Notions avancées de mise en page
    - Page titre
    - Table des matières
    - Gérer des chapitres
    - Édition d'équations
    - Utiliser différents templates
        CV
        Lettre

- Démonstration de Markdown

- Utilisation de pandoc pour la conversion de documents


## Cours 10 : LaTeX (fin)

- Beamer pour les présentations

- Problème final : on rajoute des données, il faut tout refaire

### Discussion finale : enjeux de science reproductible en écologie


================================================


## Exercice:


évaluation / exemple final: modification des données

Travail final: essai sur le problème de reproductibilité en science expérimentale (1500 mots)
Critères d'évaluation:
    - originalité
    - documentation
    - validité des arguments
    - présentation visuelle
    - reproductible  


MATÉRIEL SUPPLÉMENTAIRE POUR DOCUMENT ÉCRIT ET ÉTUDIANTS GRADUÉS
- bestiaire des commandes UNIX
- utilisation de SAGE pour la notation symbolique
- notions de base en python
- calcul haute performance
-
