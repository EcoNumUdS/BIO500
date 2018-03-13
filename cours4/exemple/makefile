# Troisième étape, on produit une figure à partir du modèle
# et des données
figure.pdf: model.Rdata data.txt
	Rscript script3.R

# Seconde étape, on fait un modèle statistique à partir
# de ces données
model.Rdata: data.txt
	Rscript script2.R

# Première étape, on génère des données
data.txt :
	Rscript script1.R