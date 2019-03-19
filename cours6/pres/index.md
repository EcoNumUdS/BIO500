---
title       : "Séance 6: La visualisation des données"
subtitle    : "BIO 500 - Méthodes en écologie computationnelle"
author      : "Dominique Gravel & Steve Vissault"
job         : "Laboratoire d'écologie intégrative"
logo        : "logo.png"
framework   : io2012       # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      #
mode        : selfcontained
knit        : slidify::knit2slides
widgets     : [mathjax]
url:
  lib   : ./libraries
license     : by-nc-sa
assets      :
  css: "https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css"

---

# Séance 6

- Ces diapositives sont disponibles en [version web](https://econumuds.github.io/BIO500/cours5/) et en [PDF](./assets/pdf/S6-BIO500.pdf).
- L'ensemble du matériel de cours est disponible sur la page du portail [moodle](https://www.usherbrooke.ca/moodle2-cours/course/view.php?id=12189).
- Vous trouverez du matériel supplémentaire dans le [cours](http://kevincazelles.fr/talks/assets/QCBSGraphsR/Rgraphics.html#4) de [Kevin Cazelles](http://kevincazelles.fr/) et [Nicolas Casajus](http://www.cen.ulaval.ca/membre.aspx?id=3945098&membre=ncasajus) lors d'un atelier de communication visuelle du CSBQ.
- Certaines diapositives sont également extraites de la présentation de [David Taylor](http://dtdata.io/prm/intro_dataviz_csbq.pdf)

--- .transition

# Qu'est-ce qui fait une bonne figure ?

---

# Trop d'information

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/Pacala.png" width="70%"></img>
</div>

---

# Non respect des normes graphiques

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/Desjardins.png" width="70%"></img>
</div>

---

# Abus de symboles et de couleurs

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/Boulangeat.png" width="100%"></img>
</div>


---.transition

# L'art graphique

---

# L'importance des graphiques

<!-- La représentation visuelle de nos données est un **outil de persuasion** permettant d'illustrer nos résultats auprès du public et de nos pairs. Cet outil permet également de mieux comprendre les relations à l'intérieur de nos données par la visualisation. -->

## La représentation visuelle des données permet de:

- Synthétiser l'information.
- Communiquer plus efficacement qu'un tableau.
- Explorer nos données par la visualisation.
- Présenter nos résultats et convaincre.

---

# Explorer nos données par la visualisation

## Voici un exemple illustrant l'importance de visualiser ses données:

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/table_visu.png" width="100%"></img>
</div>

---

# Explorer nos données par la visualisation

## Voici un exemple illustrant l'importance de visualiser ses données:

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/plot_visu.png" height="450px"></img>
</div>

--- &twocol

# Communiquer par les graphiques

*** =left

- Les graphiques sont généralement **plus efficaces à communiquer** un message/un résultat qu'un tableau.

- **Problème:** La représentation graphique peut parfois nous conduire à une **fausse interprétation**. L'idée est de transmettre une idée sans biaiser le lecteur.


--- &twocol

# Communiquer par les graphiques

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/deformation.png" width="100%"></img>
</div>


<!-- - Problème: ratio 8/3 -->


---

# Communiquer par les graphiques

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/Weisgerber_1.png" width="70%"></img>
</div>

---

# Communiquer par les graphiques

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/Weisgerber2.png" width="70%"></img>
</div>


---.transition

# Règles et composantes graphiques

--- &twocol

# Les composantes graphiques

*** =left

- Les axes et échelles.
- Le titre de la figure.
- La légende
- Le [type de représentation des données](http://www.datavizcatalogue.com/).


*** =right

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/viz.png" width="100%"></img>
</div>

--- &twocol

# Les règles graphiques

*** =left

- Une figure doit renvoyer un seul message/résultat.
- Chaque élément d'une figure doit **aider à comprendre** ce message.
- **Choisir le bon type de représentation** permet de mettre en valeur plus facilement ce qui doit être illustré.
- **Attention aux normes graphiques**: Choix des couleurs, taille des caractères, épaisseur de la ligne, disposition des marges, cadrage etc.

*** =right

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/viz.png" width="100%"></img>
</div>

---

# Quelques conseils

- Ne pas **JAMAIS** utiliser de diagramme en pointe de tarte

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/pies_vs_bars.png" width="80%"></img>
</div>

--- &twocol

# Quelques conseils

*** =left

- Éviter les figures 3D.
- Limiter le nombre de dimensions (3 ou 4 dimensions max).
- La multi-dimensionnalité peut être gérée en:
  - Modifiant la forme et la la taille des points
  - Ajoutant des couleurs

*** =right

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/Pacala.png" height="350px"></img>
</div>


--- &twocol

# Quelques conseils

- Limiter le ratio encre/données afin de faciliter la lecture.

<div style='text-align:center;margin-top:10px;'>
  <img src="assets/img/data2ink.jpg" width="100%"></img>
</div>


--- .transition

# Types de figures

---

# Diagramme de dispersion (Scatter plot)

<img src="assets/fig/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" height="550px" style="display: block; margin: auto;" />

---

# Diagrammes à bâtons (Bar plot)

<img src="assets/fig/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" height="550px" style="display: block; margin: auto;" />

---

# Histogrammes

<img src="assets/fig/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" height="550px" style="display: block; margin: auto;" />

--- &twocol

# Représentation 3-D

<img src="assets/fig/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" height="550px" style="display: block; margin: auto;" />

---

# Lignes de contour

<img src="assets/fig/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" height="550px" style="display: block; margin: auto;" />
---

--- .transition

# Faire une figure étape par étape avec R

---

# Préparer les données adéquatement

- Habituellement un `data.frame` ou `une matrice`
- Une observation par ligne (format long)

--- &twocol

# Ouvrir une fenêtre graphique

*** =left

```r
dev.new(width = 10, height = 7)
```

*** =right


--- &twocol

# Fixer certains paramètres


```r
# Fixer la largeur et la hauteur des marges
par(mar = c(5,6,2,1))

# Fixer le nombre de figures en colonnes et rangées
par(mfrow = c(1,1))
```

*** =right


--- &twocol

# Démarrer une figure avec `plot()`

*** =left

```r
arbres <- read.csv2("donnees/arbres.csv")
densite <- table(arbres[,c(3,5)])
elevation <- as.numeric(row.names(densite))
plot(elevation, densite[,1], axes = FALSE,
      xlab = "Élévation", ylab = "Densité")
```

*** =right
<img src="assets/fig/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Échelles logarithmiques

*** =left

```r
plot(elevation, densite[,1], axes = FALSE,
      xlab = "Élévation", ylab = "Densité",
      log = "xy")
```

*** =right
<img src="assets/fig/unnamed-chunk-13-1.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Ajuster les tailles de caractères

## Arguments `cex`, `cex.lab` et `cex.axis`

*** =left

```r
plot(elevation, densite[,1], axes = FALSE,
      xlab = "Élévation", ylab = "Densité",
      cex.lab = 1.5, cex.axis = 1.25, cex = 1.5)
```

*** =right
<img src="assets/fig/unnamed-chunk-15-1.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Modifier les axes

*** =left

```r
axis(1, seq(0,1000,100))
axis(2)
```

*** =right
<img src="assets/fig/unnamed-chunk-17-1.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" width="100%" style="display: block; margin: auto;" />

--- &twocolw w1:55% w2:45%

# Ajouter un titre

*** =left

```r
title(main = "Densité au long du gradient d'élévation")
```

*** =right
<img src="assets/fig/unnamed-chunk-19-1.png" title="plot of chunk unnamed-chunk-19" alt="plot of chunk unnamed-chunk-19" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Superposer des points d'une autre série de données

*** =left

```r
points(elevation, densite[,3], pch = 19, cex = 1.5)
```

*** =right
<img src="assets/fig/unnamed-chunk-21-1.png" title="plot of chunk unnamed-chunk-21" alt="plot of chunk unnamed-chunk-21" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Superposer des lignes

*** =left

```r
lines(elevation, densite[,1],lty = 1, lwd = 1.5)
lines(elevation, densite[,3], lty  = 3, lwd = 1.5)
```

*** =right
<img src="assets/fig/unnamed-chunk-23-1.png" title="plot of chunk unnamed-chunk-23" alt="plot of chunk unnamed-chunk-23" width="100%" style="display: block; margin: auto;" />

--- &twocolw w1:40% w2:60%

# Ajouter une ligne de tendance

*** =left

```r
model = lm(densite[,3]~elevation)
summary(model)
abline(model, col = "darkred")
```

*** =right

```
## 
## Call:
## lm(formula = densite[, 3] ~ elevation)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -59.796 -26.743  -3.565  24.050  92.175 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 148.10588   11.23433  13.183   <2e-16 ***
## elevation    -0.16650    0.01976  -8.428    5e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 40.32 on 48 degrees of freedom
## Multiple R-squared:  0.5968,	Adjusted R-squared:  0.5884 
## F-statistic: 71.04 on 1 and 48 DF,  p-value: 4.999e-11
```

--- &twocol

# Ajouter une ligne de tendance

*** =left

```r
model = lm(densite[,3]~elevation)
abline(model, col = "darkred")
```

*** =right
<img src="assets/fig/unnamed-chunk-27-1.png" title="plot of chunk unnamed-chunk-27" alt="plot of chunk unnamed-chunk-27" width="100%" style="display: block; margin: auto;" />


--- &twocol

# Ajouter une légende

*** =left

```r
legend("top", bty = "n", pch = c(19,1), lty = 1,
    legend = c("Érable à sucre", "Sapin baumier"),
    cex = 1.5)
```

*** =right
<img src="assets/fig/unnamed-chunk-29-1.png" title="plot of chunk unnamed-chunk-29" alt="plot of chunk unnamed-chunk-29" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Ajouter du texte

*** =left

```r
r2 <- round(summary(model)$r.squared, 2)
text(x = 850, y = 25, paste("R2=",r2),
    cex = 21.5)
```

*** =right
<img src="assets/fig/unnamed-chunk-31-1.png" title="plot of chunk unnamed-chunk-31" alt="plot of chunk unnamed-chunk-31" width="100%" style="display: block; margin: auto;" />

---

# Pour plus d'information

- `?plot`
- `?par`
- `?axis`
- `?mtext`

--- .transition

# Créer d'autres types de figure

--- &twocol

# Diagramme de dispersion (Scatter plot)

*** =left


```r
arbres  <- read.csv2("donnees/arbres.csv")
densite <- table(arbres[,c(3,5)])
elevation <- as.numeric(row.names(densite))
plot(elevation, densite[,1], pch = 19,
  xlab = "Elevation", ylab = "Densité")
points(elevation, densite[,3])
```

*** =right

<img src="assets/fig/unnamed-chunk-33-1.png" title="plot of chunk unnamed-chunk-33" alt="plot of chunk unnamed-chunk-33" height="500px" style="display: block; margin: auto;" />

--- &twocol

# Diagrammes à bâtons (Bar plot)

*** =left

```r
arbres  <- read.csv2("donnees/arbres.csv")
n_tot <- table(arbres$esp)
barplot(n_tot)
```

*** =right
<img src="assets/fig/unnamed-chunk-35-1.png" title="plot of chunk unnamed-chunk-35" alt="plot of chunk unnamed-chunk-35" height="500px" style="display: block; margin: auto;" />

--- &twocol

# Histogrammes

*** =left


```r
hist(densite[,3])
```

*** =right
<img src="assets/fig/unnamed-chunk-37-1.png" title="plot of chunk unnamed-chunk-37" alt="plot of chunk unnamed-chunk-37" height="500px" style="display: block; margin: auto;" />

--- &twocol

# Représentation 3-D

*** =left


```r
x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))

image(x, y, volcano,
  col = terrain.colors(100), axes = FALSE)

axis(1, at = seq(100, 800, by = 100))
axis(2, at = seq(100, 600, by = 100))
box()

title(main = "Maunga Whau Volcano", font.main = 4)
```

*** =right

<img src="assets/fig/unnamed-chunk-39-1.png" title="plot of chunk unnamed-chunk-39" alt="plot of chunk unnamed-chunk-39" height="500px" style="display: block; margin: auto;" />

--- &twocol

# Lignes de contour

*** =left

```r
x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))

image(x, y, volcano,
  col = terrain.colors(100), axes = FALSE)

axis(1, at = seq(100, 800, by = 100))
axis(2, at = seq(100, 600, by = 100))
box()

title(main = "Maunga Whau Volcano", font.main = 4)

contour(x, y, volcano,
  levels = seq(90, 200, by = 5),
  add = TRUE, col = "black")
```

*** =right

<img src="assets/fig/unnamed-chunk-41-1.png" title="plot of chunk unnamed-chunk-41" alt="plot of chunk unnamed-chunk-41" height="500px" style="display: block; margin: auto;" />

---

# Enregistrer une figure



```r
dev.copy2pdf(file = "test.pdf")
dev.copy2png(file = "test.png")
dev.copy2eps(file = "test.eps")
```

--- .transition

# Exercice: faire une représentation visuelle de la distribution de degrés

--- .transition

# La visualisation de réseau avec igraph

---

# Installation


```r
install.packages("igraph")
library(igraph)
```

---

# Transformer une matrice d'adjacence en objet `igraph`


```r
library(igraph)
```

```
## Loading required package: methods
```

```
## 
## Attaching package: 'igraph'
```

```
## The following objects are masked from 'package:stats':
## 
##     decompose, spectrum
```

```
## The following object is masked from 'package:base':
## 
##     union
```

```r
C <- 0.1
S <- 15
L <- matrix(0, nr = S, nc = S)
L[runif(S*S) < C] = 1
sum(L)
```

```
## [1] 19
```

```r
g <- graph.adjacency(L)
```

--- &twocol

# Utiliser la fonction `plot` pour faire une représentation d'un réseau

*** =left

```r
plot(g)
```

*** =right
<img src="assets/fig/unnamed-chunk-46-1.png" title="plot of chunk unnamed-chunk-46" alt="plot of chunk unnamed-chunk-46" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Version plus esthétique sans les paramètres par défaut

*** =left

```r
plot(g, vertex.label=NA, edge.arrow.mode = 0,
    vertex.frame.color = NA)
```

*** =right
<img src="assets/fig/unnamed-chunk-48-1.png" title="plot of chunk unnamed-chunk-48" alt="plot of chunk unnamed-chunk-48" width="100%" style="display: block; margin: auto;" />


--- .transition

# Exercice : Compiler la matrice d'adjacence et faire une première représentation du réseau avec `igraph`

--- &twocol

# Changer la couleur des noeuds

*** =left

```r
# Calculer le degré
deg <- apply(L, 2, sum) + apply(L, 1, sum)

# Le rang pour chaque noeud
rk <- rank(deg)

# Faire un code de couleur
col.vec <- heat.colors(S)

# Attribuer aux noeuds la couleur
V(g)$color = col.vec[rk]

# Refaire la figure
plot(g, vertex.label=NA, edge.arrow.mode = 0,
    vertex.frame.color = NA)
```

*** =right
<img src="assets/fig/unnamed-chunk-50-1.png" title="plot of chunk unnamed-chunk-50" alt="plot of chunk unnamed-chunk-50" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Changer la taille des noeuds

*** =left

```r
# Faire un code de ctaille
col.vec <- seq(10, 25, length.out = S)

# Attribuer aux noeuds la couleur
V(g)$size = col.vec[rk]

# Refaire la figure
plot(g, vertex.label=NA, edge.arrow.mode = 0,
    vertex.frame.color = NA)
```

*** =right
<img src="assets/fig/unnamed-chunk-52-1.png" title="plot of chunk unnamed-chunk-52" alt="plot of chunk unnamed-chunk-52" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Changer la disposition des noeuds

*** =left

```r
plot(g, vertex.label=NA, edge.arrow.mode = 0,
    vertex.frame.color = NA, layout = layout.reingold.tilford(g))
```

*** =right
<img src="assets/fig/unnamed-chunk-54-1.png" title="plot of chunk unnamed-chunk-54" alt="plot of chunk unnamed-chunk-54" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Changer la disposition des noeuds

*** =left

```r
plot(g, vertex.label=NA, edge.arrow.mode = 0,
    vertex.frame.color = NA,
    layout = layout.circle(g))
```

*** =right
<img src="assets/fig/unnamed-chunk-56-1.png" title="plot of chunk unnamed-chunk-56" alt="plot of chunk unnamed-chunk-56" width="100%" style="display: block; margin: auto;" />

--- &twocol

# Changer la disposition des noeuds

*** =left

```r
plot(g, vertex.label=NA, edge.arrow.mode = 0,
    vertex.frame.color = NA,
    layout = layout.kamada.kawai(g))
```

*** =right
<img src="assets/fig/unnamed-chunk-58-1.png" title="plot of chunk unnamed-chunk-58" alt="plot of chunk unnamed-chunk-58" width="100%" style="display: block; margin: auto;" />

---

# Calcul de propriétés

## La modularité


```r
wtc = walktrap.community(g)
modularity(wtc)
```

```
## [1] 0.267313
```

---

# Calcul de propriétés

## La distance entre les noeuds


```r
distances(g)
```

```
##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
##  [1,]    0    2    3  Inf    3    2    1  Inf    3     2     2     1     3
##  [2,]    2    0    3  Inf    3    2    3  Inf    1     2     2     1     3
##  [3,]    3    3    0  Inf    2    3    4  Inf    4     1     1     2     2
##  [4,]  Inf  Inf  Inf    0  Inf  Inf  Inf  Inf  Inf   Inf   Inf   Inf   Inf
##  [5,]    3    3    2  Inf    0    3    4  Inf    4     1     3     2     2
##  [6,]    2    2    3  Inf    3    0    1  Inf    1     2     2     1     3
##  [7,]    1    3    4  Inf    4    1    0  Inf    2     3     3     2     4
##  [8,]  Inf  Inf  Inf  Inf  Inf  Inf  Inf    0  Inf   Inf   Inf   Inf   Inf
##  [9,]    3    1    4  Inf    4    1    2  Inf    0     3     3     2     4
## [10,]    2    2    1  Inf    1    2    3  Inf    3     0     2     1     1
## [11,]    2    2    1  Inf    3    2    3  Inf    3     2     0     1     3
## [12,]    1    1    2  Inf    2    1    2  Inf    2     1     1     0     2
## [13,]    3    3    2  Inf    2    3    4  Inf    4     1     3     2     0
## [14,]    3    1    2  Inf    4    3    4  Inf    2     3     1     2     4
## [15,]  Inf  Inf  Inf  Inf  Inf  Inf  Inf  Inf  Inf   Inf   Inf   Inf   Inf
##       [,14] [,15]
##  [1,]     3   Inf
##  [2,]     1   Inf
##  [3,]     2   Inf
##  [4,]   Inf   Inf
##  [5,]     4   Inf
##  [6,]     3   Inf
##  [7,]     4   Inf
##  [8,]   Inf   Inf
##  [9,]     2   Inf
## [10,]     3   Inf
## [11,]     1   Inf
## [12,]     2   Inf
## [13,]     4   Inf
## [14,]     0   Inf
## [15,]   Inf     0
```

---

# Calcul de propriétés

## La centralité des noeuds


```r
eigen_centrality(g)$vector
```

```
##  [1] 4.334476e-01 5.328634e-01 5.435316e-01 7.295705e-17 2.808946e-01
##  [6] 5.322721e-01 4.230058e-01 8.437987e-17 3.244403e-01 9.221754e-01
## [11] 8.622356e-01 1.000000e+00 2.808946e-01 4.249472e-01 8.437987e-17
```

--- .transition

# Exporter des tableaux

---

# Exporter des tableaux

Exporter des tableaux depuis R vers son document de travail peut être difficile.

## La procédure habituelle serait:

1. Enregistrer le `data.frame` dans un fichier avec la fonction `write.table()` ou `write.csv()`
2. Éditer et faire la mise en page dans MS Excel ou MS Word.

Le package `knitr` permet de faciliter cette procédure en exportant le `data.frame` directement dans son document de travail LaTeX.

---

# Exporter des tableaux

Prenons le jeu de données `iris` directement disponible sous R.


```r
data(iris)
class(iris)
```

```
## [1] "data.frame"
```

```r
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

---

# Exporter des tableaux

Je souhaite maintenant exporter ce `data.frame` en LateX (un format que nous verrons lors de la prochaine séance):


```r
library(knitr)
iris_tex <- kable(iris,format="latex")
writeLines(iris_tex, con = "./donnees/iris.tex", sep = "\n", useBytes = FALSE)
```

--- .transition

# Travail de la semaine

---

# Consignes

- Identifier clairement vos questions de recherche
- Illustrer le réseau de collaborations
- Compléter votre analyse au moyen de 3 figures et 1 tableau
- Mettre à jour le makefile

---

# Évaluation

- Clareté des questions et adéquation des figures et du tableau
- Efficacité de la présentation
- Respect de normes graphiques
- Originalité

---
--- .transition

# Essai

---

# Objectifs

L'objectif d'un essai est de présenter une perspective sur un enjeu scientifique, appuyé par une argumentation logique et une lecture critique de la littérature. L'objectif spécifique de ce travail est de formuler et défendre une opinion sur les enjeux de reproductibilité en écologie. 

---

# Mise en situation

Vous êtes invités à préparer un article pour le journal Québec Science, où on vous a demandé de rédiger l'éditorial du mois sur cet enjeu.  Vous devez défendre par quels moyens vous pourriez améliorer la reproductibilité de la science si vous étiez en charge d'un laboratoire dans une institution universitaire. Vous êtes invités à faire une lecture critique de la situation actuelle et à proposer des mesures qui permettront de répondre aux enjeux identifiés.   

---

# Attentes

Québec Science est un journal destiné à un grand public, alors je vous invite à personnaliser votre argumentation et à rendre original sa présentation. Vous pouvez utiliser des tableaux, des figures ou encore des encadrés pour étayer vos propos. Essayez de faire plus que de rapporter les arguments présentés en classe, n'hésitez pas à personnaliser votre essai. 

---

# Consignes

- Le texte doit faire au maximum 1500 mots et doit être accompagné d'un résumé court, provocateur de 100 mots. Le document peut être supporté par une figure et/ou un tableau.
- Le texte peut être structuré en sections afin de permettre au lecteur de suivre le développement de l'argumentaire. 
- La section finale doit résumer les points principaux.
- Utiliser LaTeX pour la mise en forme du document.
- L'argumentaire doit être supporté de littérature scientifique appropriée. Vous pouvez certes utiliser les articles discutés en classe, mais essayez d'aller puis au-delà de ces références pour alimenter vos arguments. 

---

# Évaluation

- Respect des consignes
- Titre et résumé 
- Formulation de la proposition 
- Qualité de l'argumentation 
    + Identification des problèmes
    + Proposition de solutions
- Originalité 
- Mise en page
- Bibliographie
- Qualité de la langue

---
