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

# Word vs $\LaTeX$



---

# Qu'est ce que $\LaTeX$?

- Language introduit en 1983 par l'informaticien Leslie Lamport.
- C'est un language à balise.
- Concu spécifiquement pour l'écriture de rapports scientifiques.
- L'utilisation de $\LaTeX$ est une norme chez les mathématiciens et les physiciens.

--- &twocol

# La structure d'un document $\LaTeX$

*** =left

```tex
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


1. ```\documentclass``` détermine la class du document.
2. ```\usepackage```: Comme R, $\LaTeX$ permet l'utilisation de librairies. ```inputec``` et ```fontec``` sont des libraries permettant de gérer *l'encoding* du document (caractères avec accent etc.). Les ```[]``` déterminent les options.
4. On ouvre l'environnement ```Document``` avec ```\begin```

---

# Séparer le contenu du contenant

- La mise en page est gérer par des balises et environnements.
- Les balises et environnements déclarent le contenant (la forme)
- Le texte se place entre les balises (le contenu)
- Si l'on change tout simplement de balises $\LaTeX$, on obtient une nouvelle mise en forme.

---

# Avantages

- $\LaTeX$ est un language gratuit et OpenSource.
- Stable et doté d'une riche communauté d'utilisateur.
- Stack Overflow entièrement dédié à $\LaTeX$: [https://tex.stackexchange.com/](https://tex.stackexchange.com/)
- Ajustement automatique du contenant au contenu
  - Mise en page automatique (Figures etc.)
  - Table des matières
  - Gestion des références
- Comme R, $\LaTeX$ dispose de plusieurs libraries (packages) pour satisfaire nos besoins.


---

# Désavantages

- La courbe d'apprentissage peut être plus rude.
- La compilation requière plusieurs étapes
- Les erreurs de compilation sont souvent difficile à comprendre.
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

\lipsum[2-4]

\end{document}
```

*** =right

## Exercice (10 minutes):

Recopier dans votre document ```.tex``` ce code.

**Note:** ```\usepackage{lipsum}``` est un package permettant de générer du faux texte (latin de mise en forme).



---.transition

# La compilation d'un document $\LaTeX$ sans bibliographie


---

# La compilation

Afin d'obtenir le rendu PDF de notre document, nous devons compiler ce dernier à l'aide du compilateur ```pdflatex```.


- **Étape 1.** Ouvrez votre terminal.

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

- **Étape 3.** Nous pouvons maintenant compiler le document avec la commande:

```bash
pdflatex mon_document.tex
```

- **Étape 4.** Une fois la compilation terminé, les deux dernières lignes de la sortie devraient être:

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
- Les métadonnées doivent être placé avant l'environnement ```\begin{document}```.
- Les ```\\``` dans la balise ```\author``` permettent une mise à la ligne.
- Enfin, la balise ```\today``` remplie la date du jour pour nous.


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

## Exercice 3:

Ajouter vos métadonnées puis compiler votre document avec la page titre.

*** =right

<div style='text-align:center;'>
<img src="assets/img/doc2.png" height="500px" style="border-style:solid;border-width:1px;"></img>
</div>


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
- Une section est par défault numéroté.
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

## Exercice 4:

Ajouter des sections à votre document, et construisez la table des matières.
Prenez le temps de lire la sortie affichée par le compilateur ```pdflatex```.

---

# Le fichier auxiliaire (```.aux```)

Lors du dernier exercice, vous avez remarqué que la table des matières n'était pas insérer dans le document.

1. La première compilation scanne le document à la recherche de références internes tels que les sections.

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

# Mise en forme du texte

## Emphase sur le texte

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

- \textbf{...}
- \textit{...}
- \texttt{...}
- \underline{...}
- \emph{...}

---

# Interligne

- \textbf{...}
- \textit{...}
- \texttt{...}
- \underline{...}
- \emph{...}

---

# Séparateur entre paragraphes

- \textbf{...}
- \textit{...}
- \texttt{...}
- \underline{...}
- \emph{...}

---

# Saut de page et saut de section

- \textbf{...}
- \textit{...}
- \texttt{...}
- \underline{...}
- \emph{...}


---

# Référence interne au document

- URL
- Ancre de page


---

# Personnalisation du document

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


---.transition

# Les principaux environnement $\LaTeX$


---

# Ajouter une figure


---

# Ajouter une équation


---

# Ajouter un tableau


---

# Ajouter un label à ces environnements

- Définir un label
- Référer la figure, l'équation à l'aide du label


---

# Ajouter des énumérations

---.transition

# La bibliographie


---.transition

# Organiser son travail
