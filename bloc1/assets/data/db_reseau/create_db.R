###############################
# Create link table
# Will Vieira
# February 17, 2020
###############################


###############################
## Steps
# - load bib file with publications
# - Create a list of articleID and fullName of authors
# - Create a data frame with information for each articleID
# - Create a data frame with information for each author
# - Put the three tables together in a database
###############################


library(bibtex)

## load bib file with publications

  tmp <- tempfile()
  download.file(url = 'https://raw.githubusercontent.com/TheoreticalEcosystemEcology/jekyll_ieLab/master/_bibliography/labo.bib', destfile = tmp, quiet = TRUE)
  refs <- read.bib(file = tmp)

##



## filter to publications  from 2019

  refs <- refs[refs$year %in% c(2018, 2019)]

##



## Create a list of articleID and fullName of authors

  # function to get a list of publications with articleID and full name of authors
  fullNameID <- function(ref) {

    Given <- ref$author$given
    Family <- ref$author$family

    # Merge given name when necessary (some have a vector of more than one name)
    Given <- lapply(Given,
                   function(x)
                      if(length(x) > 1) {
                        paste(x, collapse = ' ')
                      }else{
                        x
                      })
    Family <- lapply(Family,
                   function(x)
                      if(length(x) > 1) {
                        paste(x, collapse = ' ')
                      }else{
                        x
                      })

    fullName <- list()
    for(i in 1:length(Given)) {
      fullName[[i]] <- paste(Given[[i]], Family[[i]])
    }

    return ( list(articleID = ref$key, authors = fullName) )
  }


  paperList <- lapply(refs, fullNameID)

  collab <- data.frame()
  for(article in paperList) {
    df <- expand.grid(unlist(article[['authors']]), unlist(article[['authors']]))

    # remove lines where author1 collab with author1
    lnAuthor <- length(unlist(article[['authors']]))
    df <- df[-(((0: (lnAuthor - 1)) * (lnAuthor + 1)) + 1), ]

    df$articleID <- rep(article[['articleID']], nrow(df))
    names(df)[1:2] <- c('auteur1', 'auteur2')

    collab <- rbind(collab, df)
  }

  write.csv(collab, file = 'collaboration.csv', row.names = FALSE)

##



## Create a data frame with information for each articleID

  # load Dom's google scholar profile (used here for citation)
  scholarRefs <- 'scholarRefs.RDS'
  if(!file.exists(scholarRefs)) {
    refsScholar <- scholar::get_publications('SA5E8jsAAAAJ')
    saveRDS(refsScholar, file = scholarRefs)
  }else {
    refsScholar <- readRDS(scholarRefs)
  }

  # remove repeated references from Scholar (manual work here using `agrep()`)
  refsScholar <- refsScholar[-c(160, 144, 145), ]


  # get journal, title, citation and year for each articleID
  articleInfo <- function(ref, refs, refsScholar) {

    id <- ref[['articleID']]

    journal <- refs[[id]]$journal
    title <- refs[[id]]$title
    year <- refs[[id]]$year

    # get citation from database
    # scraped from google scholar using scholar R package
    matchingTitle <- agrep(title, refsScholar$title, max.distance = 0.01, ignore.case = TRUE)
    if(length(matchingTitle) > 1) {
      stop('Matching more than one title')
    }else if(length(matchingTitle) == 0) {
      cat('Did not match for ', id, '\n')
      cites <- NA
    }else {
      cites <- refsScholar[matchingTitle, 'cites']
    }

    return( setNames(c(id, journal, title, year, cites), c('articleID', 'journal', 'titre', 'annee', 'citations')) )
  }

  articleID <- lapply(paperList, articleInfo, refs = refs, refsScholar = refsScholar)

  # convert to DF
  articleDF <- data.frame(matrix(unlist(articleID), ncol = length(articleID[[1]]), byrow = T), stringsAsFactors = FALSE)
  names(articleDF) <- c('articleID', 'journal', 'titre', 'annee', 'citations')
  articleDF$annee <- as.numeric(articleDF$annee)
  articleDF$citations <- as.numeric(articleDF$citations)

  write.csv(articleDF, file = 'articles.csv', row.names = FALSE)

##



## Create a data frame with information for each author

  authors <- unique(unlist(lapply(paperList,  function(x) unlist(x$authors))))
  authorDF <- data.frame(auteur = authors, statut = NA, institution = NA, ville = NA, pays = NA)

  write.csv(authorDF, file = 'authors.csv', row.names = FALSE)

  # Update author tables if new authors are added
  a2 <- read.csv('a.csv', stringsAsFactors = FALSE)
  for(i in 1:nrow(a2)) {
    pos <- which(a2$author[i] == authorDF$auteur)

    if(length(pos) > 1) {
      stop('Found more than one author')
    }else if(length(pos) == 0) {
      print(paste('Did not found author', a2$author[i]))
    }else {
      authorDF[pos, 2:5] <- a2[i, 3:6]
    }
  }

##



## Create database

  library(RSQLite)
  con <- dbConnect(SQLite(), dbname = "reseau.db")

  # create author table
  authorTB <- '
CREATE TABLE auteurs (
    auteur      VARCHAR(50),
    statut      VARCHAR(40),
    institution VARCHAR(200),
    ville       VARCHAR(40),
    pays        VARCHAR(40),
    PRIMARY KEY (auteur)
);'

  # create article table
  articleTB <- '
CREATE TABLE articles (
  articleID   VARCHAR(20) NOT NULL,
  titre       VARCHAR(200) NOT NULL,
  journal     VARCHAR(80),
  annee       DATE,
  citations   INTEGER CHECK(annee >= 0),
  PRIMARY KEY (articleID)
);'

  # create collaboration table
  collabTD <- '
CREATE TABLE collaborations (
    auteur1     VARCHAR(40),
    auteur2     VARCHAR(40),
    articleID   VARCHAR(20),
    PRIMARY KEY (auteur1, auteur2, articleID),
    FOREIGN KEY (auteur1) REFERENCES auteurs(author),
    FOREIGN KEY (auteur2) REFERENCES auteurs(author),
    FOREIGN KEY (articleID) REFERENCES articles(articleID)
);'


  dbSendQuery(con, authorTB)
  dbSendQuery(con, articleTB)
  dbSendQuery(con, collabTD)


  authors <- read.csv('authors.csv')
  dbWriteTable(con, append = TRUE, name = "auteurs", value = authors, row.names = FALSE)

  articles <- read.csv('articles.csv')
  dbWriteTable(con, append = TRUE, name = "articles", value = articles, row.names = FALSE)

  collaboration <- read.csv('collaboration.csv')
  dbWriteTable(con, append = TRUE, name = "collaborations", value = collaboration, row.names = FALSE)

  dbGetQuery(con, 'select * FROM collaborations;')

  dbDisconnect(con)

##
