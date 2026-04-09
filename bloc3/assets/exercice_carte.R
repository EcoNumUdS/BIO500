###########################################################
# Ce script produit une carte de la polution lumineuse 
# sur le territoire du Mont Bellevue.
#
# Auteur: Victor Cameron
#############################################################

# Charger les bibliothèques nécessaires
library(sf)
library(terra)

# Charger les données de pollution lumineuse (format GeoTIFF)
pollution <- rast('night_lights.tif')

# Charger les données géographiques du Mont Bellevue (format GeoJSON)
mont_bellevue <- st_read('bellevue.geojson')

# Inspecter les systèmes de coordonnées
st_crs(mont_bellevue) # EPSG4326
crs(pollution) # EPSG4229
## Il est nécessaire de reprojeter les données de pollution lumineuse pour correspondre au système de coordonnées du Mont Bellevue.
pollution_reproj <- project(pollution, 'EPSG:4326')

# Extraire les valeurs de pollution lumineuse pour la zone du Mont Bellevue
pollution_bellevue <- crop(pollution_reproj, mont_bellevue)

# Visualiser les résultats
plot(pollution_bellevue, main = "Pollution lumineuse au Mont Bellevue")
plot(mont_bellevue, add = TRUE, border = "red", col = NA)
