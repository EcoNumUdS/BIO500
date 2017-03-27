#!/bin/bash

# Installation de Texlive, postgresql, postgresql-contrib, postgresql-client-9.5, pgAdmin3, git, make, pandoc
apt-get install texlive postgresql postgresql-contrib postgresql-client-9.5 pgadmin3 git make pandoc r-base r-base-dev

# Installation de Sublime text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

# Installation de Rstudio
wget https://download1.rstudio.org/rstudio-1.0.136-amd64.deb
sudo dpkg -i rstudio-1.0.136-amd64.deb

# Installation de packages R
sudo su - -c "R -e \"install.packages('RPostgreSQL',  repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ggplot2',  repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('reshape2',  repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('igraph',  repos = 'http://cran.rstudio.com/')\""
