# _targets.R file
library(targets)
source("R/analyse.R")
source("R/figure.R")
tar_option_set(packages = c("MASS", "igraph"))
list(
  tar_target(
    data, # Le nom de l'objet
    read.table("data/data.txt", header = T) # Lecture du fichier
  ), 
  tar_target(
    resultat_modele, # Cible pour le modèle 
    mon_modele(data) # Exécution de l'analyse
  ),
  tar_target(
    figure, # Cible pour l'exécution de la figure
    ma_figure(data, resultat_modele) # Réalisation de la figure
  )
)