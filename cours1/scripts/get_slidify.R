if(Sys.getenv('TRAVIS') != TRUE){
  ## Installation package slidify if not installed
  if (!require(slidify)){
    if (!require(devtools)) install.packages("devtools")
    else {
      install_github("ramnathv/slidify")
      install_github("ramnathv/slidifyLibraries")
    }
  }
  ## Load package slidify
  library(slidify)
}

slidify::slidify('./pres/index.Rmd')
