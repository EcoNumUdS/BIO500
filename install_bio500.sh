#!/bin/bash

# Installation de Texlive, postgresql, postgresql-contrib, postgresql-client-9.5, pgAdmin3, git, make, pandoc
apt-get install texlive postgresql postgresql-contrib postgresql-client-9.5 pgadmin3 git make pandoc

# Installation de Sublime
add-apt-repository ppa:webupd8team/sublime-text-2
apt-get update
apt-get install sublime-text
