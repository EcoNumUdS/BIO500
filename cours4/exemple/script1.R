# Script 1 : génération de données aléatoires

set.seed(1)
X <- runif(25, 0, 100)
Y <- rnorm(25, mean = X*2 + 10, sd = 25)
write.table(cbind(X,Y), file = "~/Bureau/exemple/data.txt")