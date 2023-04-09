###############################################################################
# Fonction qui exécute un modèle linéaire
#
# Arguments
# - data : dataframe contenant deux colonnes numériques (x et y)
#
# Victor Cameron
# 2023
###############################################################################

mon_modele <- function(data) glm(data$Y~data$X)
