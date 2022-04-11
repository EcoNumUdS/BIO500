# _targets.R file
library(targets)
library(tarchetypes)
source("R/analyse.R")
source("R/figure.R")
tar_option_set(packages = c("rmarkdown","knitr"))

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
  ),
  tar_render(
    rapport, # Cible du rapport
    "rapport/rapport.Rmd" # Le path du rapport à renderiser
  )
)