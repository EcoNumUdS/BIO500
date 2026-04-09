###############################################################################
# Fonction qui assemble les jeux de données en un seul dataframe
#
# Arguments
# - data_files : vecteur de chemin vers les fichiers de données
#
# Victor Cameron
# 2023
###############################################################################

prep_donnees <- function(data_files) {
  # Fonction qui lit les fichiers de données et les joint
  data <- data.frame()

  for (file in data_files) {
    new_dat <- read.table(file, header = T)
    data <- rbind(data, new_dat)
  }

  return(data)
}