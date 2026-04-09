# Exemple d'un pipeline automatisé avec un rapport `Rmarkdown`

Ce répertoire présente comment organiser un projet en un répertoire de travail
reproductible. Il représente un exemple répondant aux attentes pour le travail terminal. 
Notez que la librarie `rticles` est requise pour ce gabarit de rapport.
D'abord, les différents fichiers sont organisés selon la structure suivante :

```

├── data                                                    # Dossier de données
│   ├── data.txt                                            # Jeu de données 1
│   ├── data_2.txt                                          # Jeu de données 2


├── R                                                       # Dossier de scripts R
│   ├── prep_donnees.R                                      # Fonction utilisée dans le processus de préparation des données
│   ├── analyse.R                                           # Fonction utilisée dans le processus d'analyse des données


├── results                                                 # Contient les résultats 
│   ├── resultats_modele.csv                                # predictions sur les données tests

├── rapport                                                 # Contient le rapport et fichiers associés
│   ├── rapport.Rmd                                         # Rapport
│   ├── pnas-sample.bib                                     # Fichier de bibliographie

├── _projet.R                                              # Fichier principal qui défini le pipeline


```


## Le `_projet.R`

Le fichier `_projet.R` présenté dans ce répertoire est un exemple de pipeline permettant
d'automatiser l'exécution et d'optimiser la mise à jour du projet dans un souci de reproductibilité.
Chaque étape du projet dépend du produit d'une ou de plusieurs étapes précédentes.

Le pipeline présenté dans cet exemple suit l'état de plusieurs jeux de données, les assemble,
produit une analyse et présente les résultats à l'aide d'une visualisation dans un rapport `RMarkdown`.

L'exemple présenté permet de suivre **plusieurs fichiers de données** et de définir les **dépendances du rapport**.


## Le rapport

Le rapport présente comment intégrer des citations, des figures, des références internes à des figures, le tout dans un rapport `RMarkdown` depuis un gabarit `rticles`.
