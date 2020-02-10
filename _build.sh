#!/bin/sh

for dir in $(ls -d cours*); do
    cd $dir
    cat *.Rmd | grep -v index.Rmd > index.Rmd
    Rscript -e "rmarkdown::render('index.Rmd')"
    rm index.Rmd
    cd ..
done
