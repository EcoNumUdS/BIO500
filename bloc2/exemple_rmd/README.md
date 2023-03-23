# Introduction à RMarkdown

Trois exemples d'utilisation d'un RMarkdown sont présentés dans ce dépôt. Un exemple de base est présenté dans le fichier `rmd_de_base.Rmd`. Des exemples plus avancés sont présentés dans les fichiers `rmd_fancy.Rmd` et `rmd_pagedown.Rmd`.

Pour débuter un document RMarkdown, RStudio propose des 'templates'. Pour accéder aux templates il sufit d'accéder au menu File -> New File -> R Markdown -> From Template.
 

## Débuter avec RMarkdown

1. Ouvrir Rstudio
2. Installer la libraire RMarkdown si necessaire (`install.packages('Rmarkdown')`)
3. Creer nouveau document RMarkdown (New File > RMarkdown > Document)
4. Compiler le document en html (bouton 🧶 `knit`)


## Commandes de base

Une brève introduction aux commandes de base et à l'utilisation de fichiers RMarkdown est présenté dans `rmd_de_base.Rmd`. 

Pour débuter un tel document, il sufit d'accéder dans RStudio au menu File -> New File -> R Markdown -> Document. Lorsque vous êtes prêts à compiler le document pour en produire un html ou pdf, cliquez sur le bouton 🧶 `knit`.


## Fonctionalités avancées

`rmd_fancy.Rmd` présente quelques fonctionalités avancées. Avant de pouvoir compiler ce document, il vous faudra installer la librairie `prettydoc`.

Par la suite, vous pourrez débuter un tel document à partir d'un template dans RStudio : File -> New File -> R Markdown -> From Template -> Lightweight and Pretty Document (html).


## Mise en page stylisée

Il est possible d'aller beaucoup plus loin dans la production de document avec RMarkdown. Un exemple avancé est présenté dans `rmd_pagedown.Rmd`. Ce document est le template porposé par RStudio.

Accéder au template et compiler ce document requiert d'abord l'installation de la librairie `pagedown`. Le template est accessible à partir de RStudio : File -> New File -> R Markdown -> From Template -> Journal of Statistical Software HTML document.

Pour plus d'information sur l'utilisation du template, voir [le manuel pagedown](https://pagedown.rbind.io/). Éditer la mise en page requiert une forte base en programmation. La mise en page est définie dans les fichiers contenu dans le sous répertoire `paged-0.20`. Ces fichiers contiennent du code `css` et `js` (javascript), ce qui dépasse largement le cadre du présent cours.