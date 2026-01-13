#############################################
# Ce script définit la fonction 'calcul' qui prend en entrée
# un data frame contenant des informations sur des auteurs et leurs institutions,
# et retourne un nouveau data frame avec le nombre d'auteurs par institution.
#
# Auteur: Victor Cameron
# Date: 2025-01-13
#############################################

calcul <- function(df) {
  # Calculer le nombre d'auteurs par institution
  resultat <- table(df$institution)

  # Ordonner le résultat par le nombre d'auteurs décroissant
  resultat <- sort(resultat, decreasing = TRUE)
  
  return(resultat)
}