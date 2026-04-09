###############################################################################
# Fonction qui produit une figure des données et de la courbe de tendance
#
# Arguments
# - data : dataframe contenant deux colonnes numériques (x et y)
# - resultat_modele : un objet produit par `lm()`
#
# Victor Cameron
# 2023
###############################################################################

ma_figure <- function(data, resultat_modele) {
  plot(data$X, data$Y, xlab = "X", ylab = "Y", cex.axis = 1.5, cex.lab = 1.5, pch = 19)
  abline(resultat_modele, col = "red", lwd = 2)
}