# Script 2 : réalisation de l'analyse statistique

data <- read.table("~/Bureau/exemple/data.txt", header = T)
model <- lm(data$Y ~ data$X)
save(model, file = "~/Bureau/exemple/model.Rdata")