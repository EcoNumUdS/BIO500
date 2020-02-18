###############################
# Create link table
# Will Vieira
# February 17, 2020
###############################


###############################
## Steps
# - load bib file with publications
# - filter year == 2019
# - Create a list of articleID and fullName of authors
# - Create a data frame with information for each articleID
# - Create a data frame with information for each author
# - Put the three tables together in a database
###############################


library(bibtex)


## load bib file with publications

  refs <- read.bib(file = "/Users/wvieira/GitHub/jekyll_ieLab/_bibliography/labo.bib")

##



## filter to publications  from 2019

  refs <- refs[refs$year == 2019]

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

    df$id <- rep(article[['id']], nrow(df))
    names(df)[1:2] <- c('author1', 'author2')

    collab <- rbind(collab, df)
  }

  write.csv(collab, file = 'collaboration.csv')

##



## Create a data frame with information for each articleID

  # load Dom's google scholar profile (used here for citation)
  refsDom <- readRDS('refsDom.RDS')

  # get journal, title, citation and year for each articleID
  articleInfo <- function(ref) {

    id <- ref[['articleID']]

    journal <- refs[[id]]$journal
    title <- refs[[id]]$title
    year <- refs[[id]]$year

    # get citation from database
    # scraped from google scholar using scholar R package
    matchingTitle <- grep(title, refsDom$title)
    if(length(matchingTitle) == 0) {
      cites <- NA
    }else {
      cites <- refsDom[grep(title, refsDom$title), 'cites']
    }

    return( setNames(c(id, journal, title, year, cites), c('articleID', 'journal', 'titre', 'annee', 'citations')) )
  }

  articleID <- lapply(paperList, articleInfo)

  # get articles in which the tittle did not merge with refsDom
  toFixCitation <- articleID[is.na(unlist(lapply(articleID, function(x) x[['citations']])))]

  # First fix is with the characer `-`
  fixDone <- numeric(length(toFixCitation))
  for(article in names(toFixCitation)) {
    pos <- grep(sub('-', ' ', toFixCitation[[article]][['title']]), sub('‐', ' ', as.character(refsDom$title)))

    if(length(pos) > 0) {
      articleID[[article]][['citations']] <- refsDom$cites[pos]
      fixDone[which(article == names(toFixCitation))] <- 1
    }
  }

  # update articles to fix
  toFixCitation <- toFixCitation[fixDone == 0]

  ## TODO last 3 papers another time...

  # convert to DF
  articleDF <- data.frame(matrix(unlist(articleID), ncol = length(articleID[[1]]), byrow = T), stringsAsFactors = FALSE)
  names(articleDF) <- c('articleID', 'journal', 'titre', 'annee', 'citations')
  articleDF$year <- as.numeric(articleDF$year)
  articleDF$cites <- as.numeric(articleDF$cites)

  write.csv(articleDF, file = 'articles.csv')

##



## Create a data frame with information for each author

  authors <- unique(unlist(lapply(paperList,  function(x) unlist(x$authors))))

  authorDF <- data.frame(author = authors, status = NA, institution = NA)
  write.csv(authorDF, file = 'authors1.csv')

  authors <- read.csv('authors.csv')

##



## Create database

  library(RSQLite)
  con <- dbConnect(SQLite(), dbname = "reseau.db")

  # create author table
  authorTB <- '
CREATE TABLE auteurs (
  author      VARCHAR(50),
  status      VARCHAR(40),
  institution VARCHAR(200),
  city        VARCHAR(40),
  country     VARCHAR(40),
  PRIMARY KEY (author)
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
    author1     VARCHAR(40),
    author2     VARCHAR(40),
    articleID   VARCHAR(20),
    PRIMARY KEY (author1, author2, articleID),
    FOREIGN KEY (author1) REFERENCES auteurs(author),
    FOREIGN KEY (author2) REFERENCES auteurs(author),
    FOREIGN KEY (articleID) REFERENCES articles(articleID)
);'


  dbSendQuery(con, authorTB)
  dbSendQuery(con, articleTB)
  dbSendQuery(con, collabTD)


  authors <- read.csv('authors.csv')[, -1]
  dbWriteTable(con, append = TRUE, name = "auteurs", value = authors, row.names = FALSE)

  articles <- read.csv('articles.csv')[, -1]
  dbWriteTable(con, append = TRUE, name = "articles", value = articles, row.names = FALSE)

  collaboration <- read.csv('collaboration.csv')[, -1]
  dbWriteTable(con, append = TRUE, name = "collaborations", value = collaboration, row.names = FALSE)

  dbGetQuery(con, 'select * FROM collaborations;')

  dbDisconnect(con)

##
