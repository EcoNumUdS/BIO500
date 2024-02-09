# Arbres d'une parcelle en forêt

Ce jeu de données présente les arbres d'une parcelle en forêt. Il est issu d'un inventaire forestier réalisé en 2012 dans une parcelle divisée en quadrats de 20 mètres de côté. Les arbres sont identifiés par un numéro unique et leur position est donnée par les coordonnées géographique et par l'identifiant du quadrat dans lequel ils se trouvent. L'inventaire a permis de mesurer le dhp de chaque arbre et le pH du sol dans lequel il se trouve.

L'inventaire s'est effectué dans une parcelle de 200m de large par 1000m de long. Les quadrats sont identifiés par la position de leur coin inférieur gauche. Le quadrat (0,0) est donc le quadrat en bas à gauche de la parcelle. Les coordonnées des arbres sont données par rapport à ce quadrat. Par exemple, un arbre situé à 10m à l'est et 30m au nord du coin inférieur gauche du quadrat (0,0) aura pour coordonnées (10,30).


## Fichiers de données

- `quadrat_X_Y.csv` arbres du quadrat d'identifiant X et Y
- `pH.csv` pH du sol dans chaque quadrat
- `code.csv` description des codes d'espèces

### Description des variables

quarat_X_Y.csv

- `arbre` : identifiant de l'arbre
- `Esp` code d'espèce
- `Etat` état de l'arbre (vivant ou mort)
- `Multi` vrai ou faux. Présence de multiples tiges sur le même arbre
- `id_tige` identifiant de la tige
- `DHP_mm` diamètre à hauteur de poitrine (mm)
- `BorX` coordonnée X du quadrat
- `BorY` coordonnée Y du quadrat
- `Nord_m`
- `Est_m`
- `elevation_m` élévation (m)
- `Altitude_m` altitude (m)
- `X_UTM` coordonnée X UTM
- `Y_UTM` coordonnée Y UTM

pH.csv

- `X` coordonnée X du quadrat
- `Y` coordonnée Y du quadrat
- `pH` pH du sol

code.csv

- `Esp` code d'espèce
- `Nom` nom de l'espèce


## Validation

Il est possible qu'il y ait des erreurs dans les données. Il est important de valider les données avant de les utiliser. Par exemple, certaines colonnes peuvent ne pas se combiner si elles ne sont pas du même type (ex. une colonne de texte ne peut pas se combiner avec une colonne de nombre).