# OUVRIR LA CONNECTION 
library(RSQLite)
con <- dbConnect(SQLite(), dbname="reseau.db")

# CRÉER LA TABLE D'AUTEURS
tbl_auteurs <- "
CREATE TABLE auteurs (
  auteur      VARCHAR(50),
  statut      VARCHAR(40),
  institution VARCHAR(200),
  ville       VARCHAR(40),
  pays        VARCHAR(40),
  PRIMARY KEY (auteur)
);"

dbSendQuery(con, tbl_auteurs)

# CRÉER LA TABLE D'ARTICLES
tbl_articles <- "
CREATE TABLE articles (
articleID   VARCHAR(20) NOT NULL,
titre       VARCHAR(200) NOT NULL,
journal     VARCHAR(80),
annee       DATE,
citations   INTEGER CHECK(annee >= 0),
PRIMARY KEY (articleID)
);"

# CRÉER LA TABLE DE COLLABORATIONS
tbl_collaborations <- "
CREATE TABLE collaborations (
  auteur1     VARCHAR(40),
  auteur2     VARCHAR(40),
  articleID   VARCHAR(20),
  PRIMARY KEY (auteur1, auteur2, articleID),
  FOREIGN KEY (auteur1) REFERENCES auteurs(auteur),
  FOREIGN KEY (auteur2) REFERENCES auteurs(auteur),
  FOREIGN KEY (articleID) REFERENCES articles(articleID)
);"

dbSendQuery(con, tbl_collaborations)

# LECTURE DES FICHIERS CSV
bd_auteurs <- read.csv(file = 'authors.csv')
bd_articles <- read.csv(file = 'articles.csv')
bd_collab <- read.csv(file = 'collaboration.csv')

# INJECTION DES DONNÉES
dbWriteTable(con, append = TRUE, name = "auteurs", value = bd_auteurs, row.names = FALSE)
dbWriteTable(con, append = TRUE, name = "articles", value = bd_articles, row.names = FALSE)
dbWriteTable(con, append = TRUE, name = "collaborations", value = bd_collab, row.names = FALSE)

# EXERCICE : TROUVER LES AUTEURS DONT L'INSTITUTION EST UNIVERSITÉ DE SHERBROOKE
sql_requete <- "
SELECT auteur, institution
  FROM auteurs WHERE institution LIKE '%Sherbrooke%'
;"
auteurs <- dbGetQuery(con, sql_requete)
head(auteurs)

# EXERCICE : DÉNOMBRER LE NOMBRE DE COLLABORATIONS PAR AUTEUR
sql_requete <- "
SELECT auteur1, count(auteur2) AS nb_collaborations
  FROM collaborations
  GROUP BY auteur1
  ORDER BY nb_collaborations DESC;"

resume_auteurs <- dbGetQuery(con, sql_requete)
head(resume_auteurs)

# VERSION 2 EN EXCLUANT LES ENREGISTREMENTS MULTIPLES
sql_requete <- "
SELECT auteur1, count(auteur2) AS nb_collaborations FROM (
	SELECT DISTINCT auteur1, auteur2
	  FROM collaborations
	)
	GROUP BY auteur1
	ORDER BY nb_collaborations DESC
;"

resume_auteurs <- dbGetQuery(con, sql_requete)
head(resume_auteurs)

# EXERCICE : QUEL ARTICLE A LE PLUS D'AUTEURS ?
sql_requete <- "
SELECT articleID, annee, count(DISTINCT auteur1) AS nb_auteurs
FROM collaborations
INNER JOIN articles USING (articleID)
GROUP BY articleID
ORDER BY nb_auteurs DESC;"

resume_articles <- dbGetQuery(con, sql_requete)
head(resume_articles)


# EXERCICE : Est-ce que le nombre de citations est proportionnel au nombre d'auteurs' par article ?
lsql_requete <- "
SELECT articleID, citations, count(auteur1) AS nb_auteurs FROM (
	SELECT DISTINCT articleID, auteur1, citations
	  FROM collaborations
	  INNER JOIN articles USING (articleID)
) GROUP BY articleID;"

resume_articles <- dbGetQuery(con, sql_requete)
head(resume_articles)
plot(resume_articles$nb_auteurs, resume_articles$citations)
