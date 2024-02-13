# Inventaires des oiseaux au Québec

Ce jeu de données mesure la composition et la phénologie acoustique des oiseaux au Québec. Il est issu d'un programme de suivi de la biodiversité acoustique réalisé par le Ministère de l'Environnement, de la Lutte contre les Changements Climatiques, de la Faune et des Parcs (MELCCFP) dans le cadre du Réseau de suivi de la biodiversité du Québec. Ces données recensent les observations acoustiques d'oiseaux.

Les inventaires acoustiques d'oiseaux sont réalisés à l'aide d'un enregistreur acoustique qui enregistre les sons de la nature. Les enregistrements sont ensuite analysés par un taxonomiste qui identifie les espèces d'oiseaux présentes. Les inventaires sont réalisés à l'aide d'un protocole standardisé qui permet de comparer les inventaires entre eux.

Le protocole est décrit dans le document suivant : [Protocole d’inventaire acoustique multiespèce avec appareil Song Meter Mini Bat (SMMB)](https://mffp.gouv.qc.ca/documents/faune/protocole-inventaire-acoustique-multiespece.pdf)


## Fichiers de données

- `site_1_*` tableau de données des observations d'oiseaux pour le site 1 à une date *. Par exemple, `site_1_2020-06-01.csv` est le tableau de données des observations d'oiseaux pour le site 1 à la date du 1er juin 2020.

### Description des variables

- `site_id` identifiant unique du site
- `lat` latitude du site
- `time_start` heure de début d'observation
- `time_finish` heure de fin d'observation
- `date_obs` date de l'observation
- `time_obs` heure de l'observation
- `variable` variable mesurée
- `valid_scientific_name` nom scientifique valide du taxon observé
- `rank` rang taxonomique du taxon observé
- `vernacular_en` nom vernaculaire anglais du taxon observé
- `vernacular_fr` nom vernaculaire français du taxon observé

## Considérations importantes

### Validation

Les données ont été validées par le après leur collection. Il est possible qu'il y ait des erreurs ou des inconsistances dans les données. Il est important de valider les données avant de les utiliser. Par exemple, certaines colonnes peuvent ne pas se combiner si elles ne sont pas du même type (ex. une colonne de texte ne peut pas se combiner avec une colonne de nombre).


## Informations complémentaires

[Biodiversité Québec / Oiseaux](https://biodiversite-quebec.ca/fr/inventaires/inventaires/oiseaux)