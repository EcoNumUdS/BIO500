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

# Qu'est ce que $\LaTeX$?

- Language introduit en **** par un mathématicien.
- C'est un language à balise.
- Concu sépcifiquement pour la production de rapports scientifiques.
- L'utilisation de $\LaTeX$ est une norme pour les mathématiciens et les physiciens.



--- &twocol

# La structure d'un document $\LaTeX$

*** =left

```tex
\documentclass[12pt]{article}

\usepackage[T1]{fontenc}
\usepackage[latin1]{inputenc}

\title{Un document minimalist}
\author{Dominique Gravel}

\begin{document}

Je peux écrire du texte ici.

\end{document}
```

*** =right


1. ```\documentclass``` détermine la class du document.
2. ```\usepackage```: Comme R, $\LaTeX$ permet l'utilisation de librairies. ```inputec``` et ```fontec``` sont des libraries permettant de gérer *l'encoding* du document (caractères avec accent etc.). Les ```[]``` déterminent les options.
3. On définit les métadonnées avec ```\title```, ```\author```, ```\date```
4. On ouvre l'environnement ```Document``` avec ```\begin```

---

# Séparer le contenu du contenant

- La mise en page est gérer par des balises (environnement)
- Les balises déclarent le contenant (la forme)
- Le texte se place entre les balises (le contenu)
- Le contenu est écrit entre les balises.
- Si l'on change tout simplement de balises $\LaTeX$, on obtient une nouvelle mise en forme.

---

# Avantages

- $\LaTeX$ est un language gratuit et OpenSource.
- Stable et doté d'une riche communauté d'utilisateur.
- Stack Overflow entièrement dédié à $\LaTeX$: [https://tex.stackexchange.com/](https://tex.stackexchange.com/)
- Ajustement automatique du contenant au contenu
  - Mise en page automatique (Figure etc.)
  - Table des matières
  - Gestion des références
- Comme R, $\LaTeX$ dispose de plusieurs libraries (packages) pour satisfaire nos besoins.


---

# Désavantages

- La courbe d'apprentissage peut être plus rude.
- La compilation requière plusieurs étapes
- Les erreurs de compilation sont souvent difficile à comprendre.

- Son principal point faible réside dans l'abscence d'un système de révision multi-utilisateurs.

---

# Faire du $\LaTeX$ avec Sublime Text2


---.transition

# La compilation du document $\LaTeX$


---

<!-- Sans biblio -->


---.transition

# Les balises de base $\LaTeX$


---

# Ouvrir un document



---

# Définir les métadonnées



---

# Créer la page titre à partir des métadonnées



---

# Insérer un résumé


---

# Ajouter des sections


---

# Insérer la table des matières


---.transition

# Mise en forme du texte

---

# Mise en forme standard

- Texte en gras, italique, souligné


---

- URL
- Equation Symbole Inline


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