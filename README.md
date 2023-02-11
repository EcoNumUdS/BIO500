# Méthodes en écologie computationnelle

[![Build html](https://github.com/EcoNumUdS/BIO500/workflows/Build%20html/badge.svg)](https://github.com/EcoNumUdS/BIO500/actions) [![Build pdf](https://github.com/EcoNumUdS/BIO500/workflows/Build%20pdf/badge.svg)](https://github.com/EcoNumUdS/BIO500/actions)

(2 crédits)

- **Enseignant:** Victor Cameron


## Bloc 1: Planification de la collecte et organisation des données

[![](https://img.shields.io/badge/HTML-Pr%C3%A9sentation-blue)](https://econumuds.github.io/BIO500/bloc1/) [![](https://img.shields.io/badge/PDF-Pr%C3%A9sentation-yellow)](https://econumuds.github.io/BIO500/bloc1/bloc1.pdf)

- Types de données
- Formulaires de saisie
- Bases de données relationnelles (SQL)
- Requêtes

## Bloc 2: Outils pour une science reproductible et transparente

[![](https://img.shields.io/badge/HTML-Pr%C3%A9sentation-blue)](https://econumuds.github.io/BIO500/bloc2/) [![](https://img.shields.io/badge/PDF-Pr%C3%A9sentation-yellow)](https://econumuds.github.io/BIO500/bloc2/bloc2.pdf)

- Système de contrôle de version git
- Le cahier de laboratoire RMarkdown
- L'utilisation de Target pour l'automatisation des tâches

## Bloc 3: Visualisation des données

[![](https://img.shields.io/badge/HTML-Pr%C3%A9sentation-blue)](https://econumuds.github.io/BIO500/bloc3/) [![](https://img.shields.io/badge/PDF-Pr%C3%A9sentation-yellow)](https://econumuds.github.io/BIO500/bloc3/bloc3.pdf)

- Les types de graphiques
- Fonctions graphiques de base sur R
- Paramètres graphiques
- Packages R spécialisés

## Bloc 4: Communication scientifique

[![](https://img.shields.io/badge/HTML-Pr%C3%A9sentation-blue)](https://econumuds.github.io/BIO500/bloc4/) [![](https://img.shields.io/badge/PDF-Pr%C3%A9sentation-yellow)](https://econumuds.github.io/BIO500/bloc4/bloc4.pdf)

- Rédaction de rapports et d'articles scientifiques
- Mise en page
- Insertion de figures et tableaux
- Gestion des références

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


## Mise en ligne des cours

Notre ami robot, [GitHub Actions](https://github.com/features/actions) est en charge de la mise en ligne des cours sur internet. Il y a deux [workflows](https://github.com/EcoNumUdS/BIO500/tree/master/.github/workflows) capables d'automatiser la compilation et déploiement des présentation a chaque push. Le première (`build.yml`) compile les les fichers `.Rmd` en html, et télécharge les présentations html sur la branche `gh-pages`. Le deuxième utilise [`Decktape`](https://github.com/astefanutti/decktape) pour pour exporter les html en format pdf, et aussi le télécharger sur la branche `gh-pages`.
