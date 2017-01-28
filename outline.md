# OBJECTIFS :

- adopter une pensée critique face aux enjeux de la reproductibilité et de la transparence en science et en pratique professionnelle


# Outils à installer / VM à préparer

# Plan d'un cours
- Alternance entre présentations et exercices
- Discussion en clôture

# Exercices

# Activités sur le potentiel de la science ouverte

- Discussion sur article de Miraldo
- Débat sur le partage des données à partir de l'article de Mills
- Présentation de mangal
- Article de Jetz sur la distribution de la biodiversité
- Présentation sur la reconstruction des megawebs
- Survol des outils disponibles en science ouverte
- Discussion sur el prix des données


================================================

# INTRO :
- Bonnes pratiques
- Crise de la reproductibilité
- Étapes d'un projet
    Récolte des données
    Organisation des données
    Documentation:
    Visualisation
- Bonnes pratiques
- Présentation du projet
- Présentation sur les réseaux écologiques
- Utilisation de la VM et utilisation de base de Ubuntu

================================================

# BLOC 1 : Planification de la collecte et organisation des données (3 cours)

## Cours 2: Collecte

- Présentation : définition des données
- Activité : Récolte des données dans le cours
    - instructions
    - planification
    - récolte
    - formulaire de saisie
- Activité : intégration des données entre les équipes
    - Inventaire des champs
    - Format des tables
    - Définition en classe du format standard
    - Gestion des doublons
- Discussion : corruption et sécurité des données
- Devoir : préparation des données dans format approprié pour intégration ultérieure

## Cours 3: base de données relationnelles

- Présentation : organisation relationnelle des données
- Exercice : design du schéma de la DB
- Présentation : utilisation de SQLite
    - Créer les tables et importation des données
    - Déterminer enregistrement unique (clés primaires)
    - Contrôle des relations
- Exercice : monter la base de données pour le cours

## Cours 4: Input / output

- Présentation : saisie de données additionnelles (insert)
- Exercice : ajout d'une table (informations sur les cours)
- Présentation : commandes de bases pour la réalisation de requêtes
- Exercice : requête sur ....
- Présentation : interface avec R
- Présentation : autres outils SQL
    - pré-traitement des données
    - serveur
    - postgSQL / spatial

================================================


# BLOC 2: Outils pour science reproductible (1 cours)

## Cours 5: outils pour science reproductible

- Présentation : environnement de développement
    - diversité d'outils
    - présentation de ATOM ? gedit ? sublimeText

- Présentation : UNIX
    - commande 'say coucou Kevin'
    - commandes unix de base
        déplacement de dossiers
        manipulation de fichiers
        ls
        wordcount: wc
    - chercher un fichier: find
    - lancer un script R
    - lancer une tâche en background: nohup COMMANDE &
    - tâches en cours: top, ps
    - lancer une séquence de tâches simultanément: bash
    - makefile
    - utilisation du serveur SQL pour le cours
- Exercice : préparation du makefile pour la réalisation des requêtes

- Présentation : GIT
    - principe
        contrôle de version
        serveur local et serveur distant
    - cloner un dépot
    - commit et push
    - branches et travail de groupe
    - gitignore
    - récupérer version actuelle: git pull
    - gestion des conflits entre versions
    - visualisation du travail sur github
    - git log
    - git checkout
- Exercice : mettre sur un dépôt GIT les données et les scripts


## Exercice:

================================================

# BLOC 3: Visualisation (2 cours)

- Exercice: critique de figures
    - cas pathologiques mélangés avec figures très informatives

- Présentation: notions de base pour la visualisation
    - objectif: exploration / communication
    - règles de base
    - types de figures: scatter plot, barplot, histograms, 3D plots, contour plot....
    - règles de base
    - formats de base: vectoriel versus bitmap

- Présentation : fonctions de base sur R
        ouvrir une fenêtre graphique
        plot
        superposition de figures
        barplot
        boxplot
        hist
        image
        contour

- Enregistrer une figure
    Commandes de base
    Différences entre formats

- Paramètres graphiques
        par
        layout

- Présentation : édition supplémentaire
        legend
        text
        title
        axis
        abline
        point
        polygon
        arrows

- Exercice : illustrer les données d'une régression linéaire

- Packages R spécialisés
   ggplot2
   lattice     
   igraph   
   RColorBrewer

- Faire des schémas avec DiagrammeR

- Tableau: cable

- Intégration dans le makefile

================================================


# BLOC 4: Communication (3 cours)

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

- Présentation : un exemple de base

- Exercice : faire la mise en page d'un article
  - Un document de base

- Exercice : faire la mise en page d'un article
    - Table des matières
    - Intégration des figures
    - Intégration des tableaux
    - Gérer des chapitres


- Gestion des références
    - bibtex
    - bst

- Beamer
    -

- Démonstration de Markdown

- Intégration dans le makefile



1. éléments de base pour produire un document
    -
    - compilation

2. insertion de tableaux, figures, équations et références

3. mise en page
    - utilisation de packages
    - template
    - marges
    - table des matières

4. Beamer




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
