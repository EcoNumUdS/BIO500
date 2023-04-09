# Exemple d'un pipeline `targets`

Ce répertoire présente comment organiser un projet en un répertoire de travail
reproductible. Il représente un exemple répondant aux attentes pour le travail terminal. 
Notez que la librarie `rticles` est requise pour ce gabarit de rapport.
D'abord, les différents fichiers sont organisés selon la structure suivante :

```

├── data                                                    # Dossier de données
│   ├── data.txt                                            # Jeu de données 1
│   ├── data_2.txt                                          # Jeu de données 2


├── R                                                       # Dossier de scripts R
│   ├── prep_donnees.R                                      # Fonction utilisér comme targets
│   ├── analyse.R                                           # Fonction utilisée comme targets


├── results                                                 # Contient les résultats 
│   ├── resultats_modele.csv                                # predictions on test data

├── rapport                                                 # Contient le rapport et fichiers associés
│   ├── rapport.Rmd                                         # Rapport
│   ├── pnas-sample.bib                                     # Fichier de bibliographie

├── _targets.R                                              # Fichier targets qui définie le pipeline


```


## Le `_targets.R`

Le fichier `_targets.R` présenté dans ce répertoire est un exemple de pipeline permettant
d'automatiser l'exécution et d'optimiser la mise à jour du projet dans un souci de reproductibilité.
Une target rerpésente une étape du projet dont l'exécution dépend du produit d'une ou de targets 
précédents.

Le pipeline présenté dans cet exemple suit l'état de plusieurs jeux de données, les assemble,
produit une analyse et présente les résultats à l'aide d'une visualisation dans un rapport `RMarkdown`.

L'exemple présenté permet de suivre **plusieurs fichiers de données** et de définir les
**dépendances du rapport**. Comme établir ces dépendances requiert [certaines technicalités](https://econumuds.github.io/BIO500/bloc4/#16), je vous suggère
de vous inspirer grandement de l'exemple présente. Celui-ci est conçu pour être *très*
similaire à votre tâche dans le travail final et répondre aux attentes. Je dis ça, je dis rien !


## Le rapport

Le rapport présente comment intégrer des citations, des figures, des références internes
à des figures.
