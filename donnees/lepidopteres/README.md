# Observations de lépidoptères

Ce jeu de données présente des observations de lépidoptères dans le temps et l'espace. Ces données sont fidèles à ce qu'on peut s'attendre d'une extraction de sources différentes et peuvent contenir des erreurs. Notez qu'elles ont déjà été standardisées pour vous.

Les données ont été collectées dans le cadre d'un programme de surveillance de la biodiversité, d'études scientifiques et de science citoyenne. Les observations sont caractérisées par l'espèce observée, la date et l'heure de l'observation, le lieu, le nombre d'individus observés et d'autres informations pertinentes. Il est possible que la nature des données ne soit pas homogène, car elles proviennent de différentes sources. Parfois une observation ponctuelle, parfois un dénombrement. Il est important de valider les données avant de les utiliser.

Les données ont été collectées de plusieurs sources par Biodiversité Québec et comprennent l'identification taxonomique, temporelle et spatiale des densités de populations. Il y a aussi l'information sur l'origine des données, les auteurs, les propriétaires et les licences.


## Fichiers de données

- `*.csv` Ensemble d'observations de lépidotères pour une année donnée. Chaque ligne correspond à une observation distincte.
- `taxonomie.csv` correspondance entre les noms scientifiques observés et la taxonomie validée, les noms communs et la taxonomique complète des espèces. Le lient entre les données de population et la taxonomie se fait à l'aide de la colonne `observed_scientific_name`.

### Description des variables

Certaines colonnes vous seront utiles. Voici une description de celles-ci :

- `observed_scientific_name` Nom scientifique de l'espèce observée
- `year_obs` Année de l'observation
- `day_obs` Jour de l'observation
- `time_obs` Heure de l'observation
- `dwc_event_date` Date de l'observation
- `obs_variable` Variable observée
- `obs_unit` Unité de mesure
- `obs_value` Valeur observée
- `lat` Latitude de l'observation
- `lon` Longitude de l'observation
- `original_source` Source originale des données
- `creator` Auteur des données
- `title` Titre du jeu de données dont les données sont extraites
- `publisher` Éditeur des données
- `intellectual_rights` Droits intellectuels
- `license` Licence des données
- `owner` Propriétaire des données


## Considérations importantes

### Validation

Les données représentent ce qui peut être attendu d'une extraction de sources différentes. Il est possible qu'il y ait des erreurs dans les données ou que le format d'un champ aie changé en cours de collecte. Il est important de valider les données avant de les utiliser. Par exemple, certaines colonnes peuvent ne pas se combiner si elles ne sont pas du même type (ex. une colonne de texte ne peut pas se combiner avec une colonne de nombre).
