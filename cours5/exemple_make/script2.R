# Script 2 : réalisation de l'analyse statistique

data <- read.table("data.txt", header = T)
model <- lm(data$Y ~ data$X)
save(model, file = "model.Rdata")
