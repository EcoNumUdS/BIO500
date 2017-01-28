#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "s.vissault@yahoo.fr"
git config --global user.name "SteveViss"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git slides
rm -rf slides/*

for dir in $(ls -d cours*); do
    mkdir -p ./slides/$dir
    mv ./$dir/pres/* ./slides/$dir
done

cd slides
git add --all *
git commit -m "Update the slides" || true
git push origin gh-pages
