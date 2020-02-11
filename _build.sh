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
# Send all assets and html files to the slides folder
# Travis will send the slides folder to the gh-pages branch
for dir in $(ls -d bloc*); do
    mkdir -p ./slides/$dir
    mv ./$dir/index.html ./slides/$dir
    mv ./$dir/assets ./slides/$dir
done

# Send layout assets to slides folder
mv ./assets ./slides
