#############################################
# Ce script définit la fonction 'lecture' qui prend en entrée
# le nom d'un fichier CSV et retourne un data frame contenant les données lues.
#
# Auteur: Victor Cameron
# Date: 2025-01-13
#############################################

lecture <- function(filename) {
  df <- read.csv(
    file = filename,
    stringsAsFactors = FALSE
  )
  
  return(df)
}