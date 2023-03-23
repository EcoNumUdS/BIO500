# Automatisation de processus

Un projet d'analyse de données comprend de nombreuses étapes, qui vont de la construction de la base de données, à la production du rapport, en passant par les analyses statistiques. L'ensemble du processus peut-être long et frustrant, surtout lorsque l'on a une boucle du genre :

1. Lancer le code
2. Attendre qu'il s'exécute
3. Découvrir un bug
4. Recommencer la boucle

Des petites modifications en amont peuvent affecter toute la chaîne en aval. Inversement, parfois on a seulement besoin de refaire une figure sans avoir à refaire toute la chaîne.

La programmation d'une séquence d'instructions permet de formaliser ce processus et de s'attarder seulement aux étapes qui doivent être mises à jour. 


## Qu'est-ce qu'un outil d'automatisation ?

C'est un fichier qui contient un ensemble de directives qui sont exécutées par l'ordinateur. Les instructions et leurs dépendances sont spécifiées.


## Targets

Nous utiliserons la librairie `targets` pour assurer la reproductibilité de la démarche entreprise dans le cours. L'ensemble des instructions nécessaires à la production du rapport, de la création de la base de données à la compilation du document écrit, seront contenues dans une séquence d'instructions, plus généralement appelée 'workflow' ou 'pipeline'.


## Un exemple minimal

Ce répertoire contient un exemple minimal d'automatisation. Le processus automatisé :

1. Lire le fichier de données "data.txt"
2. Faire une régression linéaire
3. Faire une figure et l'enregistrer

Vous trouverez les données sauvées dans un sous-dossier 'data', les sripts pour faire l'analyse et la figure dans le dossier 'R' et un fichier `_targets.R` qui exécute le pipeline.

Il y a deux scripts d'analyse, `./R/analyse.R` et `./R/figure.R`. Le deuxième dépend du premier qui dépend des données (données -> analyse -> figure).


## La target

Une target est une étape de la séquence d'instructions, elle est utilisée comme argument dans une étape suivante.

Une target est au minimum une cible (nom d'un objet) et une dépendance (commande R). Une target produit un objet R qui est enregistré dans la mémoire de la session. Une dépendance est une expression qui dépent d'une target précédente. Le package `targets` exécute seulement les targets qui ne sont pas à jour. Ainsi, Une target est exécutée seulement lorsque la target dont elle dépend est plus récente que l'objet qu'elle produit. 

**Faire une bonne target**

Comme une fonction, une target peut faire trois choses :

1. Produire des données
2. Analyser des données
3. Résumer une analyse ou des données (e.g. figure, tableau)

Si une target est trop longue, vous avez avantage à la briser en petits morceaux pour que chaque étape soit vérifiée. Alternativement, pour une séquence d'analyse très compliquée, on pourrait vouloir regrouper les étapes pour éviter d'avoir une liste trop longue. 

Le grain d'une séquence dépend donc d'un compromis :

1. Les targets sont suffisamment importantes pour sauver du temps si elles sont ignorées (e.g. construire votre base de données et faire les injections)
2. Suffisamment petites pour qu'il soit pertinent d'automatiser le processis
3. Retourne un seul objet qui
    - est facile à comprendre et interpréter
    - pertinent pour le projet
    - peut être sauvé comme objet


## Exécuter le pipeline

Utiliser la commande `tar_make()` pour exécuter le pipeline. De nombreuses informations utiles sont générées automatiquement lors de l'opération.

**Visualiser les étapes qui doivent être mises à jour**
```
tar_visnetwork()
```

## Trucs et astuces

Par expérience, `targets` est une librairie de haut niveau pour utilisateurs expérimentés. Les erreurs sont difficiles à trouver et à régler. Il faut s'assurer que chaque étape fonctionne avant d'en ajouter une autre. Il faut donc ***construire progressivement*** sont fichier `_target.R` et s'assurer qu'une étape s'exécute parfaitement avant de passer à la suivante.

**Pour plus d'information**

Manuel de targets [https://books.ropensci.org/targets/](https://books.ropensci.org/targets/)