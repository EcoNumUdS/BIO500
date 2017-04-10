if(Sys.getenv('TRAVIS') != TRUE){
  if (!require(devtools)) install.packages("devtools")
  if (!require(slidify)) devtools::install_github("ramnathv/slidify"); devtools::install_github("ramnathv/slidifyLibraries")

  ## Load package slidify & DiagrammeR
  library(slidify)
}

slidify::slidify('./pres/index.Rmd')
