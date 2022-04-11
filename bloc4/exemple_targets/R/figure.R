ma_figure = function(data, resultat_modele) {
  pdf(file = "results/plot_lm.pdf")
  plot(data$X, data$Y, xlab = "X", ylab = "Y", cex.axis = 1.5, cex.lab = 1.5, pch = 19)
  abline(resultat_modele)
  dev.off()
}