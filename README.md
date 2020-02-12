# Méthodes en écologie computationnelle
(2 crédits)

- **Professeur:** Dominique Gravel
- **Assistant:** [Willian Vieira](https://github.com/willvieira)

# Mise en ligne des cours

Notre ami robot, [Travis](https://travis-ci.org) est en charge de la mise en ligne des cours sur internet.

[![Build Status](https://travis-ci.org/EcoNumUdS/BIO500.svg?branch=master)](https://travis-ci.org/EcoNumUdS/BIO500)

## Bloc 1: Planification de la collecte et organisation des données

- [Présentation HTML](https://econumuds.github.io/BIO500/bloc1)
- [Présentation PDF](./cours1/pres/assets/pdf/S1-BIO500.pdf)

- Types de données
- Formulaires de saisie
- Bases de données relationnelles (SQL)
- Requêtes

## Bloc 2: Outils pour une science reproductible et transparente

- [Présentation HTML](https://econumuds.github.io/BIO500/bloc2)
- [Présentation PDF](./cours2/pres/assets/pdf/S2-BIO500.pdf)

- UNIX
- le makefile
- Système de contrôle de version git

## Bloc 3: Visualisation des données

- [Présentation HTML](https://econumuds.github.io/BIO500/cours3)
- [Présentation PDF](./cours3/pres/assets/pdf/S3-BIO500.pdf)

- Les types de graphiques
- Fonctions graphiques de base sur R
- Paramètres graphiques
- Packages R spécialisés

## Bloc 4: Communication scientifique au moyen de LaTeX

- [Présentation HTML](https://econumuds.github.io/BIO500/bloc4)
- [Présentation PDF](./cours3/pres/assets/pdf/S4-BIO500.pdf)

- Rédaction de rapports et d'articles scientifiques
- Mise en page
- Insertion de figures et tableaux
- Gestion des références
- Utilisation de Beamer pour les présentations

## Compiler les présentations localement

Avant la première compilation, il est recommandé d'installer les dépendances necessaires:

```bash
make install
```

Pour générer tous les présentations, il suffit juste de taper:

```bash
make
```

Ce commande là va nous compiler les fichiers `html` que ne sont pas à jours avec leur respecives fichers `.Rmd`.

Pour compiler une seule présentation, il faut spécifier le nom du bloc du cours envisagé:

```bash
# compiler première bloc du cours
make -C bloc1
```

### Workflow

Pour chaque bloc de présentation, `make` va vérifier s'il y a des fichers `.Rmd`
avec des editions plus recentes que la présentation compilé (`index.html`).
Si oui, il va fusionner tous les `.Rmd` en un seul ficher `index.Rmd`, pour finalement compiler la présentation
`html` avec le package `rmarkdown`. Vous pouvez enfin accéder à la présentation
avec le fichier `index.html`.


### Utilisation du diaporama

### Taille écran:

  - `F` pour basculwer en plein écran,
  - zoom du navigateur pour ajuster la taille de la présentation (typiquement `cmd +/-`),
  - `W` pour basculer en mode "large".

### Naviguer entre diapo

  - `G` pour entrer le numéro d'une slide,
  - `O` pour naviguer facilement dans la présentation,
  - `T` pour avoir une barre avec le numéro des diapositive.


# Exporter en format pdf

- Utiliser l'exportation pdf du navigateur,
- Utiliser [Decktape](https://github.com/astefanutti/decktape).
