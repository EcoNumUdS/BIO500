# Data available at https://www.cs.duke.edu/courses/cps100e/spring09/class/12_Bacon/data/
# load libraries
library(stringr)
library(reshape2)

# Open file
db_films <- read.csv2(file("./assets/donnees/bd_beacon/films_db.txt", encoding="ISO-8859-1"),fill=TRUE,stringsAsFactors=FALSE,header=FALSE)

# Extraire les 4 chiffres entre parantheses pour l'années
annees <- str_extract_all(db_films$V1,"\\([[:digit:]]{4}\\)")
annees <- str_extract_all(annees,"[[:digit:]]{4}")

for (i in 1:length(annees)) {
  if(identical(annees[[i]],character(0))){
    annees[[i]] <- NA
  }
}

annees <- str_trim(unlist(annees))

# Extraire la chaine à gauche de la parantheses
titre <- str_split(db_films$V1, "[(]")
titre <- str_trim(unlist(lapply(titre,function(x) return(x[1]))))

# Recompose df
films <- cbind(titre=titre,annees=annees,db_films[,2:ncol(db_films)],stringsAsFactors=FALSE)

# Drop duplicated films
films <- films[!duplicated(films$titre),]

# melt films
films <- melt(films,id=c("titre","annees"),na.rm=TRUE,value.name="acteurs")
films <- films[,-c(3)]
films$acteurs[films$acteurs==""] <- NA
films$titre[films$titre==""] <- NA
films <- subset(films,!is.na(titre))
films <- subset(films,!is.na(acteurs))


# split acteur nom et prénom
films$acteur_nom <- str_trim(unlist(lapply(str_split(films$acteurs,"[,]"),function(x) {return(x[1])})))
films$acteur_prenom <- str_trim(unlist(lapply(str_split(films$acteurs,"[,]"),function(x) {return(x[2])})))

# create subtables
films$id_film <- as.numeric(as.factor(films$titre))

# Table acteurs
acteurs <- films[,c('id_film','acteur_nom','acteur_prenom')]
acteurs$id_acteur <- 1:nrow(acteurs)
acteurs <- acteurs[,c('id_acteur','acteur_nom','acteur_prenom','id_film')]

# Table films
films <- unique(films[,c('id_film','titre','annees')])
films$annees <- as.numeric(films$annees)

# save as CSV and rda
write.csv2(acteurs,file="./assets/donnees/bd_beacon/bd_acteurs.csv",row.names=FALSE)
write.csv2(films,file="./assets/donnees/bd_beacon/bd_films.csv",row.names=FALSE)


## Prep for exercice
# subset on 2007
ex_films <- subset(films,annees=="2007")
ex_acteurs <- subset(acteurs,id_film %in% ex_films$id)
write.csv2(ex_acteurs,file="./assets/donnees/bd_beacon/ex_2007_acteurs.csv",row.names=FALSE)
write.csv2(ex_films,file="./assets/donnees/bd_beacon/ex_2007_films.csv",row.names=FALSE)
