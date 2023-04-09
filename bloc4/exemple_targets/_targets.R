###############################################################################
# Fichier _targets.R
#
# Défini le pipeline du projet
#
# Victor Cameron
# 2023
###############################################################################

# Notez qu'il n'est pas nécessaire de définir le working directory lorsqu'on
# travail dans un projet contenu dans un seul dossier. Ce dossier parent est
# le `root` du projet et par définition, le wd s'y trouve.

#---------------------------------------------------------------
# 1. Charger les fonctions à utiliser dans les targets
#---------------------------------------------------------------
library(targets)
library(tarchetypes) # Utilisé pour render le rapport (tar_render)
tar_option_set(packages = c("rmarkdown","knitr")) # Charger les libraries dans l'environnement global


#---------------------------------------------------------------
# 2. Charger les fonctions à utiliser dans les targets
#---------------------------------------------------------------
source("R/analyse.R")
source("R/prep_donnees.R")

#---------------------------------------------------------------
# 3. Définir le pipeline
#---------------------------------------------------------------
list(
  tar_target(
    name = path, # Cible
    command = "./data", # Dossier contenant les fichiers de données
    format = "file" # Format de la cible
  ),
  tar_target(
    name = file_paths, # Cible
    command = list.files(path, full.names = TRUE) # Liste les fichiers dans le dossier
  ),
  tar_target(
    name = data, # Cible pour le modèle 
    command = prep_donnees(file_paths) # Jointure des jeux de données
  ),
  tar_target(
    name = resultat_modele, # Cible pour le modèle 
    command = mon_modele(data) # Exécution de l'analyse
  ),
  tar_render(
    name = rapport, # Cible du rapport
    path = "rapport/rapport.Rmd" # Le path du rapport à renderiser
  )
)