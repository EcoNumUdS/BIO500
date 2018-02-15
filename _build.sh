#!/bin/sh

for dir in $(ls -d cours*); do
    cd $dir
    rm -rf ./pres/.cache
    cat *.Rmd > ./pres/index.Rmd
    Rscript -e "slidify::slidify('./pres/index.Rmd')"
    cd ..
done
