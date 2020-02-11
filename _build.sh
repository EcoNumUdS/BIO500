#!/bin/sh

# Compile Rmd in html pages
for dir in $(ls -d bloc*); do
    cd $dir
    cat *.Rmd | grep -v index.Rmd > index.Rmd
    Rscript -e "rmarkdown::render('index.Rmd')"
    rm index.Rmd
    cd ..
done

# Prepare files to deployment
for dir in $(ls -d bloc*); do
    mkdir -p ./slides/$dir
    mv ./$dir/index.html ./slides/$dir
    mv ./$dir/assets ./slides/$dir
done
