# Inventaires du Benthos au Québec

Ce jeu de données contient les inventaires du benthos réalisés par le ministère de l'Environnement, de la Lutte contre les Changements Climatiques, de la Faune et des Parcs (MELCCFP) dans le cadre du suivi de la qualité de l'eau des rivières du Québec. Ces données recensent l'abondance des espèces de macroinvertébrés benthiques présentes dans les rivières du Québec. 

Les inventaires du benthos sont réalisés à l'aide d'un filet à mailles fines (D-net) qui est traîné sur le fond de la rivière à trois reprises. L'effort d'échantillonnage est de 3m². Les échantillons sont ensuite ramenés en laboratoire et étalés sur des plateaux de tri « Bogorov » où les espèces sont identifiées et dénombrées. Seule une portion (fraction) de l'échantillon est analysée. L'abondance des espèces est calculée en fonction de la quantité d'individus trouvés dans l'échantillon et de la fraction analysée.

Le protocole est décrit dans le document suivant : [Protocole d’échantillonnage des macroinvertébrés benthiques d’eau douce du Québec](https://www.environnement.gouv.qc.ca/eau/eco_aqua/macroinvertebre/protocole/index.htm)


## Fichiers de données

- `site_1_*` tableau de données des abondances et covariables de macroinvertébrés benthiques pour le site 1 à une date *. Par exemple, `site_1_2020-06-01.csv` est le tableau de données des abondances pour le site 1 à la date du 1er juin 2020.

### Description des variables

Certaines colonnes vous seront utiles. Voici la description de colonnes dont le nom ne parle pas d'elle-même.

- `date` date de l'échantillonnage
- `site` identifiant unique du site
- `date_obs` date de l'observation
- `heure_obs` heure de l'observation
- `fraction` fraction de l'échantillon qui a été analysé
- `nom_sci` nom scientifique de l'espèce
- `abondance` quantité d'individus de l'espèce trouvée dans l'échantillon
- `largeur_riviere` largeur de la rivière (m)
- `profondeur_riviere` profondeur de la rivière (m)
- `vitesse_courant` vitesse du courant
- `transparence_eau` transparence de l'eau
- `temperature_eau_c` température de l'eau en degrés Celsius
- Voir les métadonnées pour les autres covariables 
- 
Pour plus d'information sur les variables, consultez le document suivant : [Métadonnées - Suivi du benthos](https://www.donneesquebec.ca/recherche/dataset/suivi-du-benthos/resource/ecb8b75f-7e4d-4729-be61-b3330d02d165)


## Considérations importantes

### Validation

Les données ont été validées par le MELCCFP. Il est possible qu'il y ait des erreurs dans les données ou que le format d'un champ aie changé en cours de collecte. Il est important de valider les données avant de les utiliser. Par exemple, certaines colonnes peuvent ne pas se combiner si elles ne sont pas du même type (ex. une colonne de texte ne peut pas se combiner avec une colonne de nombre).


## Calcul de l'abondance

L'abondance (nombre organisme / m2) des espèces est calculée à l'aide de la formule suivante :

Exemple : `abondance_BONAV07.csv` , abondance totale de 228 et fraction 10,42% 

(228 * 100)/10,42 = 2188 organismes pour 3 m²

Pour 1 m², diviser par 3 = 729 org/m2


## Informations complémentaires

[Guide de surveillance biologique basée sur les macroinvertébrés benthiques d'eau douce du Québec (gouv.qc.ca)](https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.environnement.gouv.qc.ca%2Feau%2Feco_aqua%2Fmacroinvertebre%2Fsurveillance%2Fbenthiques.pdf&data=05%7C01%7CVictor.Cameron%40USherbrooke.ca%7C10921baf6084499beec908db9cd34465%7C3a5a8744593545f99423b32c3a5de082%7C0%7C0%7C638276203602274357%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=qbhPytqLNVgiZOxd9U5xnalCKdIepokrfuwgZf%2Bu%2FFU%3D&reserved=0)

[Biodiversité Québec / Benthos](https://biodiversite-quebec.ca/fr/inventaires/inventaires/benthos)