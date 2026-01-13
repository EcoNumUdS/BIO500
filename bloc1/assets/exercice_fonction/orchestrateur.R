#############################################
# Ce script orchestrateur.R utilise les fonctions 'lecture' et 'calcul'
# pour lire un fichier CSV contenant des informations sur des auteurs et leurs institutions,
#
# Auteur: Victor Cameron
# Date: 2025-01-13
#############################################

# Charger les fonctions
source("lecture.R")
source("calcul.R")

# Nom du fichier de données
data_file <- "authors.csv"

# Lecture des données
authors_df <- lecture(data_file)

# Calcul du nombre d'auteurs par institution
auteurs_par_institution <- calcul(authors_df)

# Affichage du résultat
print(auteurs_par_institution)