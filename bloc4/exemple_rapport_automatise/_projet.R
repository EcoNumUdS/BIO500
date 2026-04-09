###############################################################################
# Fichier _projet.R
#
# Défini le pipeline du projet. Peut être exécuté avec `source("_projet.R")`
#
# Victor Cameron
# 2026
###############################################################################

# Notez qu'il n'est pas nécessaire de définir le working directory lorsqu'on
# travaille dans un projet contenu dans un seul répertoire. Ce répertoire parent est
# le `root` du projet et par définition, le wd s'y trouve.

#---------------------------------------------------------------
# 0. Paramètres globaux
#---------------------------------------------------------------
donnees_path <- "./data" # Dossier contenant les fichiers de données
rapport_path <- "rapport/rapport.Rmd" # Le chemin du rapport à renderiser

#---------------------------------------------------------------
# 1. Charger les librairies à utiliser 
#---------------------------------------------------------------à
library(rmarkdown)

#---------------------------------------------------------------
# 2. Charger les fonctions customs à utiliser dans le pipeline
#---------------------------------------------------------------
source("R/analyse.R")
source("R/prep_donnees.R")

#---------------------------------------------------------------
# 3. Définir le pipeline
#---------------------------------------------------------------
# 1. Lecture des données
fichiers_donnees <- list.files(donnees_path, full.names = TRUE)

# 2. Lecture et jointure des donnéesà
donnees <- prep_donnees(fichiers_donnees)

# 3. Analyse des données
resultats <- mon_modele(donnees)

# 4. Compilation du rapport
render(rapport_path, params = list(donnees = donnees, resultats = resultats)) # Notez que les paramètres du rapport (objets et valeurs nécessaires à l'exécution) sont définis à partir des objets produits dans le pipeline. Ils doivent aussi être définis dans le YAML du fichier de rapport. Ils seront accessibles dans le rapport à l'aide de `params$nom_parametre`. Voir le rapport pour plus de détails.

