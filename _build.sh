#!/bin/sh

for dir in $(ls -d bloc*); do
    cd $dir
    cat *.Rmd | grep -v index.Rmd > index.Rmd
    Rscript -e "rmarkdown::render('index.Rmd')"
    rm index.Rmd
    cd ..
done
