---
title       : "Séance 6: Documents dynamiques avec LaTeX"
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

- Ces diapositives sont disponibles en [version web](https://econumuds.github.io/BIO500/cours6/) et en [PDF](./assets/pdf/S6-BIO500.pdf).
- L'ensemble du matériel de cours est disponible sur la page du portail [moodle](https://www.usherbrooke.ca/moodle2-cours/course/view.php?id=12189).

--- .transition

# Introduction

---

# Où sommes-nous?

<div style='text-align:center;'>
<img src="assets/img/flow_full.png" width="100%"></img>
</div>


---

# Pourquoi $\LaTeX$?

<div style='text-align:center;'>
<img src="assets/img/latex_comp.gif" width="60%"></img>
</div>

---

# Qu'est ce que $\LaTeX$?

- Language introduit en 1983 par l'informaticien Leslie Lamport.
- C'est un language à balise.
- Concu spécifiquement pour l'écriture de rapports scientifiques.
- L'utilisation de $\LaTeX$ est une norme chez les mathématiciens et les physiciens.

---

# Avantages de $\LaTeX$?

1. Qualité de la mise en page
  - Mise en page automatique
  - Table des matières
  - Gestion des références
2. Performance pour l'intégration de matériel (e.g. figures, tableaux)
3. Stabilité
4. Inter-opérabilité
5. Reproductibilité (tout est scripté)

---&twocol

# La structure d'un document $\LaTeX$

*** =left

```TeX
\documentclass[12pt]{article}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}

\title{Un document minimalist}
\author{Dominique Gravel}

\begin{document}

Je peux écrire du texte ici.

\end{document}
```

*** =right


1. ```\documentclass``` détermine la classe du document.
2. ```\usepackage```: Comme R, $\LaTeX$ permet l'utilisation de librairies. ```inputec``` et ```fontec``` sont des librairies permettant de gérer *l'encoding* du document (caractères avec accent etc.). Les ```[]``` déterminent les options.
4. On ouvre l'environnement ```Document``` avec ```\begin```

---

# Séparer le contenu du contenant

- La mise en page est gérée par des balises et environnements.
- Les balises et environnements déclarent le contenant (la forme)
- Le texte se place entre les balises (le contenu)
- Si l'on change tout simplement de balises $\LaTeX$, on obtient une nouvelle mise en forme.

--- &twocolw w1:55% w2:45%

# Un exemple d'efficacité

*** =left

```tex
\documentclass[12pt]{article}
\usepackage[utf8]{inputenc}
\usepackage{color,dcolumn,graphicx,hyperref}
\usepackage{wrapfig}

\begin{document}

\title{How likely is speciation in neutral ecology ?}

\author{Philippe Desjardins-Proulx, Dominique Gravel}

\maketitle

\section{Introduction}
```

*** =right

<div style='text-align:center;'>
<img src="assets/img/ex2_pg1.png" height="500px" style="border-style:solid;border-width:1px;"></img>
</div>

--- &twocolw w1:55% w2:45%

# Un exemple d'efficacité

*** =left

```tex
\documentclass[letterpaper,twocolumn,showkeys]{revtex4-1}
\usepackage[utf8]{inputenc}
\usepackage{color,dcolumn,graphicx,hyperref}
\usepackage{wrapfig}

\begin{document}

\title{How likely is speciation in neutral ecology ?}

\author{Philippe Desjardins-Proulx, Dominique Gravel}

\maketitle

\section{Introduction}
```

*** =right

<div style='text-align:center;'>
<img src="assets/img/ex1_pg1.png" height="500px" style="border-style:solid;border-width:1px;"></img>
</div>

---

# Autres avantages

- $\LaTeX$ est un language gratuit et OpenSource.
- Stable et doté d'une riche communauté d'utilisateur.
- Stack Overflow entièrement dédié à $\LaTeX$: [https://tex.stackexchange.com/](https://tex.stackexchange.com/)
- Compilateur en ligne: [https://fr.sharelatex.com/](https://fr.sharelatex.com/)
- Ajustement automatique du contenant au contenu
- Comme R, $\LaTeX$ dispose de plusieurs libraries (packages) pour satisfaire nos besoins.

---

# Désavantages

- La courbe d'apprentissage peut être plus rude.
- La compilation requière plusieurs étapes
- Les erreurs de compilation sont souvent difficiles à comprendre.
- Son principal point faible réside dans l'absence d'un système de révision multi-utilisateurs.

---

# Faire du $\LaTeX$ avec Sublime Text2

1. Créer un dossier sur votre bureau qui va contenir votre document $\LaTeX$
2. Ouvrir Sublime Text2
3. Sélectionner votre dossier nouvelle créer: ```Fichier > Ouvrir```
4. Créer un nouveau document: ```Fichier > Nouveau```
5. Enregistrer votre document avec l'extension ```.tex```: ```Fichier > Enregistrer sous```

Et voilà, l'extension ```.tex``` détermine que le fichier est un document $\LaTeX$.


---.transition

# Mon premier document $\LaTeX$

---&twocolw w1:60% w2:35%

# Mon premier document $\LaTeX$

*** =left

```tex
\documentclass[12pt]{article}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lipsum}

\begin{document}

\section{Mon premier article en latin}

% Ceci est un commentaire
\lipsum[2-4]

\end{document}
```

*** =right

## Exercice 1 (10 minutes):

Recopier dans Sublime Text 2 ce code ```.tex```.

**Note:** ```\usepackage{lipsum}``` est un package permettant de générer du faux texte (latin de mise en forme).



---.transition

# La compilation d'un document $\LaTeX$ sans bibliographie

---

# La compilation

Afin d'obtenir le rendu PDF de notre document, nous devons compiler ce dernier à l'aide du compilateur ```pdflatex```.


- **Étape 1.** Ouvrez votre terminal (touches Ctrl+Alt+t).

- **Étape 2.** À l'aide de la commande ```cd``` (*Change Directory*), vous devez vous déplacer dans le terminal vers le dossier que vous venez de créer:

```bash
cd ~/Bureau
```
```bash
cd /home/etudiant/Bureau
```

---&twocolw w1:50% w2:45%

# La compilation

*** =left

- **Étape 3.** Vous pouvez maintenant compiler le document avec la commande:

```bash
pdflatex mon_document.tex
```

- **Étape 4.** Une fois la compilation terminée, les deux dernières lignes de la sortie devraient être:

```bash
Output written on doc.pdf (1 page, 31402 bytes).
Transcript written on doc.log.
```

*** =right

<div style='text-align:center;'>
<img src="assets/img/doc.png" height="500px" style="border-style:solid;border-width:1px;"></img>
</div>


---&twocolw w1:50% w2:45%

# Définir les métadonnées

*** =left

```bash
\title{Comment structurer un document \LaTeX{}}
\author{Prof. Dominique Gravel\\
   Chaire de recherche en Écologie Intégrative,\\
   Faculté des Sciences,\\
   Département de Biologie,\\
   Université de Sherbrooke,\\
   \texttt{dominique.gravel@usherbrooke.ca}}
\date{\today}
```

*** =right

- On définit les métadonnées avec ```\title```, ```\author```, ```\date```.
- Les métadonnées doivent être placées avant l'environnement ```\begin{document}```.
- Les ```\\``` dans la balise ```\author``` permettent une mise à la ligne.
- Enfin, la balise ```\today``` remplie la date du jour pour nous.

Note : pour une date en français, il faut utiliser le package ```\usepackage[rench]{babel}```

---&twocolw w1:50% w2:45%

# Créer la page titre à partir des métadonnées

*** =left

La page titre est généré grâce à la balise ```\maketitle``` dans l'environnement document.


```bash
[...]

\begin{document}

\maketitle

[...]

\end{document}
```

*** =right

<div style='text-align:center;'>
<img src="assets/img/doc2.png" height="500px" style="border-style:solid;border-width:1px;"></img>
</div>

---

# Exercice 3

Ajoutez vos métadonnées puis compilez votre document avec la page titre.

---&twocolw w1:50% w2:45%

# Insérer un résumé

*** =left

On écrit notre résumé entre dans l'environnement ```abstract```.

```bash
[...]

\begin{document}

\maketitle

\begin{abstract}
\lipsum[1]
\end{abstract}

\section{Mon premier article en latin}
\lipsum[2-4]

\end{document}
```

*** =right

<div style='text-align:center;'>
<img src="assets/img/doc3.png" height="500px" style="border-style:solid;border-width:1px;"></img>
</div>

---&twocolw w1:50% w2:45%

# Ajouter des sections

*** =left

```bash
[...]

\begin{document}

\section{Ma première section}

\section{Ma seconde section}

\subsection{Une sous-section de la seconde section}

\subsubsection{Une sous-section de sous-section}

\section*{Une troisième section sans numéro}

\end{document}
```

*** =right

- Nous n'avons pas besoin d'utiliser de ```\begin``` ou ```\end```.
- Une section est numérotée par défault.
- Pour éviter cette numérotation vous pouvez ajouter une ```*``` avant les accolades.

---&twocolw w1:50% w2:45%

# Insérer la table des matières

*** =left

```bash
[...]

\begin{document}

\maketitle

\tableofcontent

\section{Ma première section}

\section{Ma seconde section}

\subsection{Une sous-section de la seconde section}

\subsubsection{Une sous-section de sous-section}

\section*{Une troisième section sans numéro}

\end{document}
```

*** =right

La simple déclaration de la balise ```\tableofcontent``` permet la création d'une table des matières.

---

# Exercice 4

Ajoutez des sections à votre document, et construisez la table des matières.
Prenez le temps de lire la sortie affichée par le compilateur ```pdflatex```.

---

# Le fichier auxiliaire (```.aux```)

Lors du dernier exercice, vous avez remarqué que la table des matières n'était pas insérée dans le document.

1. La première compilation scanne le document à la recherche de références internes telles que les sections.

  #### Écriture d'un fichier ```mon_document.aux```:

  ```bash
  \relax
  \@writefile{toc}{\contentsline {section}{\numberline {1}Mon premier article en latin}{1}}
  ```

2. La deuxième compilation assemble l'ensemble du document à partir du fichier ```mon_document.aux``` de la première compilation.

## Il faut deux compilations successives pour obtenir la table des matières dans le document pdf.


---

# Le fichier auxiliaire (```.aux```)

<div style='text-align:center;'>
<img src="assets/img/flow_comp1.png" height="500px"></img>
</div>


---.transition

# Mise en forme du document

---&twocolw w1:50% w2:45%

# Emphase sur le texte

*** =left

```
[...]
\begin{document}

Voici un texte
\textit{en italique},
\textbf{en gras},
\textsc{avec des petites capitales},
\textsf{avec des caractères sans empattement},
\texttt{avec des caractères à chasse fixe},
avec des mots avec {\small{un corps plus petit}}
ou {\large{plus grand}}.

\end{document}
```

*** =right

<div style='text-align:center;'>
<img src="assets/img/doc4.png" width="100%" style="border-style:solid;border-width:1px;"></img>
</div>

<!-- Il est également possible de combiner la mise en forme:

```bash
\textit{\textbf{Ceci est du texte}}
``` -->

[Documentation complémentaire en FR](https://fr.wikibooks.org/wiki/LaTeX/Mise_en_forme_du_texte)

---

# Votre meilleur professeur

<div style='text-align:center;'>
<img src="assets/img/latexsheet.png" height="500px" style="border-style:solid;border-width:1px;"></img>
</div>

---

# Taille de la police de caractères

**Corps très petit**

```
\footnotesize texte très petit \normalsize, ou bien
\begin{footnotesize} texte très petit \end{footnotesize}
```

**Corps petit**

```
\small texte petit \normalsize, ou bien
\begin{small} texte petit \end{small}
```

**Corps grand**

```
\large texte grand \normalsize, ou bien
\begin{large} texte grand \end{large}
```

**Corps très grand**

```
\Large texte très grand \normalsize, ou bien
\begin{Large} texte très grand \end{Large}.
```

---

# Alignement des paragraphes

Par défault, les paragraphes sont justifiés.

**Alignement gauche**

```
\raggedleft texte à gauche
\begin{flushleft} texte très petit \end{flushleft}
```

**Alignement à droite**

```
\raggedright texte à droite
\begin{flushright} texte à droite \end{flushright}
```

**Alignement au centre**

```
\centering texte au centre
\begin{center} texte au centre \end{center}
```

---&twocolw w1:50% w2:45%

# Indentation des paragraphes

*** =left

Par défault, la première ligne des paragraphes est indentée.

```
[...]
\setlength{\parindent}{10mm}

\begin{document}

\lipsum[1]
\noindent\lipsum[2]
\lipsum[3]

\end{document}
```

```\noindent```: permet de retirer l'indentation pour un paragraphe spécifique.
```\setlength{\parindent}{10mm}```: permet de spécifier l'indentation pour l'ensemble du document.

*** =right

<div style='text-align:center;'>
<img src="assets/img/doc5.png" height="500px" style="border-style:solid;border-width:1px;"></img>
</div>

---

# Indentation des paragraphes

## $\LaTeX$ couvre un grand nombre d'unités:

- ```pt```: 1/72.27 pouces, utilisé dans la plupart des éditeurs de texte.
- ```mm```: Millimètres
- ```cm```: Centimètres
- ```em```: Grossièrement la hauteur d'un 'M' (relatif à la police de caractères)
- ```ex```: Grossièrement la hauteur d'un 'x' (relatif à la police de caractères)

---

# Interligne

Pour spécifier si le document doit être en double ou simple interligne, il suffit d'ajouter le package ```setspace``` et d'y rattacher l'option désiré.

```bash
\documentclass[12pt]{article}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[singlespacing]{setspace}

OU

\usepackage[onehalfspacing]{setspace}

OU

\usepackage[doublespacing]{setspace}

```

**Attention:** Les packages doivent toujours se retrouver dans le préambule, c.a.d avant le ```\begin{document}```

---&twocolw w1:50% w2:45%

# Séparateur entre paragraphes

Par défault, il n'y a pas d'espace entre les paragraphes.

*** =left

```
[...]
\setlength{\parskip}{2em}

\begin{document}

\lipsum[1]
\noindent\lipsum[2]
\lipsum[3]

\end{document}
```

*** =right

- ```\setlength{\parskip}{2em}```: permet de mettre de déterminer l'espace désiré entre les paragraphes.

- Attention, comme ```\setlength{\parindent}{10mm}```, cette configuration doit être placé dans le préambule pour être appliqué sur l'ensemble du document.

---

# Double colonnes et double page

Il est possible de basculer un document d'une colonne à deux colonnes en une ligne de commande grâce aux options de la classe de document (```\documentclass```).

```
\documentclass[11pt,twocolumn,doublepage]{article}

\begin{document}

\lipsum[1]
\noindent\lipsum[2]
\lipsum[3]

\end{document}
```

```\usepackage{multicol}``` permet encore d'aller plus loin en offrant davantage de fonctionnalités.
Pour le constater, vous pouvez vous rendre sur [https://fr.sharelatex.com/learn/Multiple_columns](https://fr.sharelatex.com/learn/Multiple_columns)

---&twocolw w1:50% w2:45%

# Saut de page et saut de section

*** =left

```
\documentclass[11pt,twocolumn]{article}

\begin{document}

\section{Introduction}

\lipsum[1]

\clearsection

\section{Matériels et méthodes}

\lipsum[2]

\clearpage

\lipsum[3]

\end{document}
```

*** =right

- ```\clearpage```: le texte écrit après cette commande est renvoyé sur une nouvelle page.
- ```\cleardoublepage```: le texte écrit après cette commande est renvoyé sur une nouvelle page (recto).
- ```\clearsection```: même comportement que ```\clearpage``` mais pour une section.

---

# Espacements, justification verticale et horizontale.

## Justification:

- ```\vfill``` introduit un espace « ressort » : cette balise pousse ce qu'il y a à gauche et à droite pour occuper tout l'espace restant sur la ligne.
- ```\hfill```, même chose mais cette balise pousse ce qu'il y a au dessus et en dessous pour occuper tout l'espace restant sur la page.

Le ```\hfill``` est très pratique pour la page titre d'un document qui a généralement besoin d'une justification horizontale.

## Espacements:

- ```\hspace{1em}``` et ```\vspace{1em}``` déterminent un espacement fixe entre deux éléments (une figure et un texte par exemple)

Pour ceux qui sont familiés avec le traitement de texte (MS Word), c'est l'équivalent (en mieux) des tabulations.

---

# Taille et marges du document

Les marges du document peuvent être définis grâce au package ```geometry```:

```
\usepackage{geometry}

\geometry{
letterpaper,
landscape,
left=20mm,
right=20mm,
top=20mm,
bottom=20mm
}

OU

\usepackage[letterpaper,landscape,margin=20mm]{geometry}
```

Pour un contrôle fin des marges, vous pouvez vous rendre sur ce site: [https://fr.sharelatex.com/learn/Page_size_and_margins](https://fr.sharelatex.com/learn/Page_size_and_margins).


---

# Référence interne au document

Il est possible à tout moment de référer une partie de son document à une section particulière grâce aux balises ```\label``` et ```\ref```. On appelle ça des *ancres de page*.

```
[...]
\begin{document}

\section{Introduction}
\label{sec:intro}

\subsection{Les réseaux écologiques}
\label{subsec:res}

\section{Matériel et méthodes}

Dans mon introduction (section \ref{sec:intro}),
je vous ai présenté les réseaux écologiques (section \ref{subsec:res},
\href{ielab.recherche.usherbrooke.ca}{site internet}).

\end{document}
```

Les numéros de sections s'ajusteront automatiquement si vous ajouter ou enlever des sections.

<!-- **Important:** Tout comme la table des matières, il faudra deux compilations consécutives pour visualiser les références dans le texte.
-->

---

# Personnalisation du document

Les références internes (```\ref``` et ```\href```) du document auront des couleurs par défault.
Vous pouvez modifier ce comportement par défaut en modifiant la balise ```\hypersetup``` suivante:

```bash
\hypersetup{
   backref=true,                           % Permet d ajouter des liens dans
   pagebackref=true,                       % les bibliographies
   hyperindex=true,                        % Ajoute des liens dans les index.
   colorlinks=true,                        % Colorise les liens.
   breaklinks=true,                        % Permet le retour à la ligne dans les liens trop longs.
   urlcolor= blue,                         % Couleur des hyperliens.
   linkcolor= blue,                        % Couleur des liens internes.
   bookmarks=true,                         % Créé des signets pour Acrobat.
   bookmarksopen=true,                     % Si les signets Acrobat sont créés,
                                           % les afficher complètement.
   pdftitle={Mon document au format TeX},  % Titre du document.
                                           % Informations apparaissant dans
   pdfauthor={PoluX},                      % dans les informations du document
   pdfsubject={Projet wikiBooks}           % sous Acrobat.
}
```

---

# Exercice 5 (15 minutes):

Essayer de produire la page titre du département de Biologie (sans utiliser les métadonnées et ```\maketitle```).

Si vous désirez utiliser les métadonnées pour produire la page titre, la procédure est la suivante:

```
[...]

\begin{document}

\makeatletter
\begin{titlepage}

Ceci est le titre du document: \@title
Il a été écrit par \@author\space le \@date

\end{titlepage}
\makeatother

[...]
```

---.transition

# Les principaux environnements $\LaTeX$

---&twocolw w1:50% w2:45%

# Ajouter une figure

*** =left

```
\begin{figure}

\includegraphics[width=0.35\textwidth]{fig.eps}

\caption{The metacommunity as a graph
  of local communities. Each community is
  connected by dispersal to one or more
  communities.}  

\end{figure}
```
*** =right

- ```\begin{figure}``` ouvre l'environnement figure
- ```\includegraphics``` spécifie la figure à ajouter et sa taille relative
- ```\caption``` définie la légende de la figure
- ```\end{figure}``` ferme l'environnement figure

---&twocol

# Ajouter une équation

*** =left

## Dans le texte

```TeX
La théorie de la biogéographie
des îles donne la richesse
en espèces $S$ à l'équilibre
au point où les courbes
$I(S)$ et $E(S)$ se croisent.
```

*** =right

## En retrait du texte

```
\begin{equation}
  S^* = \frac{I}{I+E}
\end{equation}
```

---

# Ajouter un tableau

Nous avons vu la semaine dernière comment extraire un tableau à l'aide de la fonction ```kable()```

---&twocolw

# Ajouter un label à ces environnements

```
\begin{equation}
  label{e:tib}
  S^* = \frac{I}{I+E}
\end{equation}
```

*** =left

## Et ensuite on y réfère dans le texte ainsi

```
La théorie de la biogéographie des îles donne la richesse
en espèces $S$ à l'équilibre au point où les courbes
$I(S)$ et $E(S)$ se croisent, ce qui donne pour solution \ref{tib}.
```

---&twocol

# Ajouter des énumérations

*** =left

## On peut y aller simplement de points

```
\begin{itemize}
  \item Premier élément
  \item Second élément
  \item Troisième élément
\end{itemize}
```

*** =left

## Ou encore d'une liste numérotée

```
\begin{enumerate}
  \item Premier élément
  \item Second élément
  \item Troisième élément
\end{enumerate}
```

---.transition

# La bibliographie

steve

---.transition

# Organiser son travail


---.transition

# Travail 3

---

# Objectif

Écrire un rapport sous forme d'article scientifiques

---

# Consignes

Vous devez remettre les résultats de votre analyse des données de collaboration entre les étudiants de la classe.

Le rapport doit contenir :

- L'illustration du réseau
- 3 figures
- 1 tableau
- Un titre et un résumé
- Une courte introduction spécifiant les questions
- Une courte description de la méthode et des résultats
- Une discussion, enrichie de citations provenant de la littérature scientifique
- Une bibliographie

---

# Consignes

Nous vous demandons de remettre les scripts permettant de générer l'ensemble du document, incluant la création de la base de données, les requêtes, les figures et tableaux, ainsi que le document LaTeX.

À terme, selon les principes de science reproductible, nous devrions pouvoir exécuter l'ensemble de votre analyse sur un autre ordinateur, sans avoir à changer le code.

---

# Évaluation

- Respect des consignes (tous les éléments sont inclus - 60%)
- Reproductibilité (30%)
- Originalité (10%)
