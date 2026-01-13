# exercice_fonction : Exercice sur la création de fonctions et la modularisation de programmes en R

Ce répertoire contient un exercice visant à pratiquer la création de fonctions en R et la modularisation de programmes. L'objectif est de renforcer la compréhension des concepts fondamentaux de la programmation, notamment la définition de fonctions, les arguments, les valeurs de retour, et l'organisation du code pour une meilleure reproductibilité et réutilisabilité.

**Avant de débuter**

Assurez-vous d'avoir une compréhension de base des concepts suivants :
[Bonnes pratiques de programmation](https://econumuds.github.io/BIO500/bonnes_pratiques.html)


**Ressources**

- [Chapitre 17 - Fonctions](https://econumuds.github.io/BIO500/fonctions.html)
- [Functions in R](https://intro2r.com/functions-in-r.html)
- [Objects in R](https://rstudio-education.github.io/hopr/r-objects.html)
- [Environments in R](https://rstudio-education.github.io/hopr/environments.html)


## Structure des fichiers du répertoire

```
exercice_fonction/
│
├── main.R
├── read_authors.R
├── count_authors_by_institution.R
└── authors.csv
```

- `orchestrateur.R` : Le script principal qui orchestre l'exécution du programme.
- `lecture.R` : Un script qui défini une fonction responsable de la lecture des données des auteurs à partir d'un fichier CSV.
- `calcul.R` : Un script qui contient une fonction pour compter le nombre d'auteurs par institution.
- `authors.csv` : Un fichier de données contenant des informations sur les auteurs, y compris leurs institutions.
