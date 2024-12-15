# Séries temporelles de populations

Ce jeu de données contient des inventaires de populations répétés dans le temps qui témoignent de l'évolution de la biodiversité dans le temps (<https://www.livingplanetindex.org/>) Ces séries temporelles de taille de populations proviennent de différentes sources et ont déjà été strandardisées pour faciliter leur utilisation. La standardisation comprend la conversion des abondances en unités de densité pour un effort constant (ex. nombre d'individus par mètre carré).

Les données ont été collectées de plusieurs sources par Biodiversité Québec et comprennent l'identification taxonomique, temporelle et spatiale des densités de populations. Il y a aussi l'information sur l'origine des données, les auteurs, les propriétaires et les licences.


## Fichiers de données

- `*.csv` séries temporelles d'un ensemble de populations mesuré dans un même jeu de données. Chaque ligne correspond à une population distincte.
- `taxonomie.csv` correspondance entre les noms scientifiques observés et la taxonomie validée, les noms communs et la taxonomique complète des espèces. Le lient entre les données de population et la taxonomie se fait à l'aide de la colonne `observed_scientific_name`.

### Description des variables

Certaines colonnes vous seront utiles. Voici une description de celles-ci :

- `observed_scientific_name` Nom scientifique de l'espèce observée
- `years` Années de mesurage
- `unit` Unité de mesure
- `values` Abondance de la population observée
- `geom` Coordonnées géographiques de l'observation
- `original_source` Source originale des données
- `creator` Auteur des données
- `title` Titre du jeu de données dont les données sont extraites
- `publisher` Éditeur des données
- `intellectual_rights` Droits intellectuels
- `license` Licence des données
- `owner` Propriétaire des données


## Considérations importantes

### Validation

Les données ont été validées par le MELCCFP. Il est possible qu'il y ait des erreurs dans les données ou que le format d'un champ aie changé en cours de collecte. Il est important de valider les données avant de les utiliser. Par exemple, certaines colonnes peuvent ne pas se combiner si elles ne sont pas du même type (ex. une colonne de texte ne peut pas se combiner avec une colonne de nombre).
