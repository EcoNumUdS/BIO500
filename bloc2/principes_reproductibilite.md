---
title: "Séance 5 — Modularité, testing et automatisation"
author: "Victor Cameron"
date: "`r Sys.Date()`"
output:
  html_document:
    toc: true
    toc_depth: 2
---

## Objectifs de la séance

À la fin de cette séance, vous serez capables de :

- Identifier les limites d’un script non modulaire
- Comprendre l’importance de la séparation des responsabilités
- Structurer un flux de données reproductible
- Modulariser un script en fonctions cohérentes
- Automatiser l’exécution d’un pipeline
- Ajouter des logs pour suivre l’exécution
- Écrire des tests unitaires simples

---

## Introduction

Dans cette séance, nous allons volontairement partir d’un **script fragile**.

On partira d'un script qui **casse** lorsque :

- les données augmentent ([scalabilité](https://fr.wiktionary.org/wiki/scalabilit%C3%A9))
- le contexte change (robustesse)
- le script est réutilisé (réutilisabilité)

Nous utiliserons cet échec comme point de départ pour reconstruire un pipeline robuste. Le but est de faire échouer volontairement un script monolithique pour révéler les limites de non‑modularité, puis de le reconstruire en suivant les principes de modularité, d’automatisation et de testing.

---

## 1. Script initial (non modulaire)

```{r, eval=FALSE}
# Script volontairement non modulaire

# Générer des données simulées
data <- data.frame(
    espece = paste0("Plante_", 1:100),
    site = rep(c("Sherbrooke", "Magog", "Laval", "Amqui"), length.out = 10000)
)

# Inspection rapide
head(data)
summary(data)

# Calcul : nombre de plantes par site
system.time({                           # system.time() pour mesurer le temps d'exécution
    result <- data.frame()
    for (inst in unique(data$site)) {
        n <- sum(data$site == inst)
        result <- rbind(
            result,
            data.frame(site = inst, n_plantes = n)
        )
    }
})

# Trier les résultats en ordre décroissant
result <- result[order(result$n_plantes, decreasing = TRUE), ]

# Afficher les résultats
summary(result)
print(result)
```

✍️ Notez ce que vous observez :
- Temps d'exécution :
- Erreurs d'exécution :
- Lisibilité du code :
- Résultats obtenus (sont-ils corrects ?) :


## 2. Passage à l'échelle (volontairement problématique)

### Scalabilité

Dupliquez le jeu de données pour atteindre plusieurs centaines de milliers de lignes. Si votre ordinateur a de la difficulté à gérer un très gros jeu de données, vous pouvez ajuster à la baisse le nombre de répétitions.

```{r, eval=FALSE}
# Exemple (à adapter)

data_big1 <- data[rep(seq_len(nrow(data)), times = 3000), ]
data_big2 <- data[rep(seq_len(nrow(data)), times = 6000), ]
data_big3 <- data[rep(seq_len(nrow(data)), times = 9000), ]
```

Relancez ensuite le script de calcul avec `data_big`.

✍️ Notez ce que vous observez :
- Temps d'exécution :

### Robustesse

Modifiez les données pour simuler une donnée manquante.

```{r, eval=FALSE}
# Exemple (à adapter)

data_modif <- data_big
data_modif[data_modif$site == "Sherbrooke", "site"] <- NA
```

Relancez ensuite le script de calcul avec `data_modif`.

✍️ Notez ce que vous observez :
- Erreurs d'exécution :
- Résultats obtenus :
- Où est-ce que le script a échoué ?

### Réutilisabilité

👉 Copiez-collez le code de calcul et essayez de l’adapter pour le nouveau jeu de données suivant légèrement différent.

```{r, eval=FALSE}
data <- data.frame(
    espece = paste0("Plante_", 1:100),
    localisation = rep(c("Québec", "Ontario", "Nouvelle-écosse", "Labrador"), length.out = 10000)
)
```

✍️ Notez ce que vous observez :
- Facilité de modification du code :

---

### Observations

**1. Répondez brièvement aux questions suivantes :**

- Scalabilité: le temps d'exécution augmente-t-il linéairement ou non lorsque le volume de données double, puis triple ?

- Robustesse: le code gère-t-il les données manquantes ?

- Réutilisabilité: le code est-il facilement adaptable à un nouveau jeu de données ? Combien de lignes à modifier pour un petit changement ?


**2. Listez les responsabilités du script initial (ex. lecture de données, assemblage, affichage) et notez les problèmes associés à chacune d’elles (ex. code dupliqué, manque de flexibilité, erreurs potentielles).**

**3. Proposez une nouvelle structure pour le script en séparant les responsabilités en fonctions distinctes et en définissant clairement les entrées et sorties de chaque fonction.**

```{r, eval=FALSE}
# Exemple de structure modulaire
```

---

## 3. Principes clés pour la reproductibilité

**Séparation des responsabilités** (*Separation of Concerns*)

> Une fonction = une responsabilité

**Flux de données**

.center[
![:scale 70%](assets/img/etl_processus.png)
]

> Entrée → transformation → sortie

**Scalabilité avant performance**

> Ne pas optimiser trop tôt, structurer d’abord

**Traçabilité et maintenance**

> Paramètres explicites

> Logs

> Automatisation

> Tests

**Principes FAIR**

- **Findable** : données et code facilement localisables
- **Accessible** : données et code accessibles à tous
- **Interoperable** : données et code compatibles avec d’autres systèmes
- **Reusable** : données et code réutilisables dans d’autres contextes

Les principes FAIR seront explorés séparéments, dans la lecture de la semaine.

---

## 4. Exercice - Modularisation du script

### Étape 1 : données

Isolez la production des données dans une fonction et complétez le code suivant. Notez les paramètres utilisés et leurs valeurs par défaut.

```{r, eval=FALSE}
simu_data <- function(n_rep, site_col = "site", espece_col = "espece") {
    # Votre code ici
}
```

### Étape 2 : Calcul

Assemblez le calcul dans une fonction distincte et complétez le code suivant. Notez les paramètres utilisés. Ici, il n'y a pas de valeurs par défaut, mais vous pouvez le faire si vous le souhaitez.

```{r}
compte_especes_par_site <- function(df, site_col, espece_col) {
    # Votre code ici
}
```

## 5. Script maitre (automatisation)

> NOTE : Le script master ne fait aucun calcul.

À l'aide des fonctions que vous précédement créées, générez les deux jeux de données avec les paramètres définis ici-bas, puis calculez les résultats pour chacun.

```{r, eval=FALSE}
# Paramètres
## Jeu de données 1
site_col1 <- "site"
espece_col1 <- "espece"
n_rep1 <- 1000
## Jeu de données 2
site_col2 <- "localisation"
espece_col2 <- "espece"
n_rep2 <- 2000

# Pipeline
## Vous devez implémenter les fonctions simu_data et compte_especes_par_site 

# Résultats
## Vous devez imprimer les résultats de chaque jeu de données
```

## 6. Logs

Pourquoi des logs ?

- Comprendre ce que fait le script
- Localiser les erreurs
- Suivre l’exécution

**Ajout de logs simples**

`cat()` est une fonction de base pour afficher des messages dans la console. En l'encapsulant dans une fonction `log_message()`, on peut standardiser le format des messages et ajouter des informations utiles comme l'heure.

```{r, eval=FALSE}
log_message <- function(msg) {
cat(Sys.time(), "-", msg, "\n")
}

log_message("Lecture des données")
authors <- simu_data(n_rep1)

log_message("Calcul des indicateurs")
result <- compte_especes_par_site(authors, site_col1, espece_col1)

log_message("Fin du script")
```

### Types de messages

- INFO : information générale sur l'exécution
- WARNING : avertissement sur un problème potentiel. Le script continue malgré un problème (ex. données manquantes)
- ERROR : message d'erreur indiquant un problème critique. Le script s’arrête (ex. division par zéro)

## 7. Tests

L'ajout de tests permet de vérifier que les fonctions font ce qu'elles sont censées faire et de détecter les erreurs rapidement. On peut écrire des tests unitaires simples avant la conception d'une fonction pour guider son développement. Le but est alors de s'assurer que la fonction répond aux attentes dès le départ. Des tests peuvent aussi être ajoutés après la conception pour vérifier le fonctionnement de la fonction dans divers cas d'utilisation.

### Pourquoi tester ?

- Détecter les erreurs tôt
- Vérifier que les fonctions font ce qu’elles promettent
- Protéger le code contre les changements futurs

**Exemple de test simple**

Un test peut être ajoutée à l'intérieur d'une fonction ou dans une fonction de test séparé. Dans l'exemple suivant, on crée un jeu de données de test avec des résultats connus, puis on utilise `stopifnot()` pour vérifier que les résultats obtenus correspondent aux attentes.

```{r, eval=FALSE}
test_compte_especes <- function(df_test) {
res <- compte_especes_par_site(df_test)
stopifnot(res$n_plantes[res$site == "X"] == 2) # `stopifnot()` vérifie que la condition est vraie, sinon elle arrête l'exécution et affiche un message d'erreur
stopifnot(res$n_plantes[res$site == "Y"] == 1)
log_message("Test *compte_especes_par_site* passé avec succès") # Retourne un message de succès si les tests sont passés
}

df_test <- data.frame(
espece = c("A", "B", "C"),
site = c("X", "X", "Y")
)
test_compte_especes(df_test)
```

## 8. Question finale (réflexion)

✍️ **Répondez en quelques lignes :**

> Qu’est-ce qui, dans votre code, protège le futur vous ? Pensez à votre futur vous qui, dans 6 mois, devra relancer ce script pour faire une mise à jour ou pour l’adapter à un nouveau projet. Qu’est-ce qui lui permettra de comprendre rapidement ce que fait le code, où il brise et de le modifier sans introduire d’erreurs ?


---

Cet atelier est inspiré de matériel pédagogique de diverses sources sur la gestion de données et la programmation en R. Copilot a été utilisée pour générer certaines parties du contenu.
