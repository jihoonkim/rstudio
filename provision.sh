#!/bin/bash

#-----------------------------------------------------------------------------
# File: provision.sh
# Author: Jihoon Kim 
# Date: 12/6/2017
# Description: Install R and RStudio on Ubuntu
#-----------------------------------------------------------------------------

# set time zone non-interactive way
export DEBIAN_FRONTEND=noninteractive
apt-get install -y tzdata
ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
### echo "America/Los_Angeles" |  tee /etc/timezone 
### dpkg-reconfigure --frontend noninteractive tzdata

# add a following line to sources.list
#export CRAN_URL=http://cran.r-project.org
export CRAN_URL=http://cran.stat.ucla.edu
bash -c " echo -e '\n'deb ${CRAN_URL}/bin/linux/ubuntu  xenial/ >>  /etc/apt/sources.list "

# add key to sign CRAN pacakges
# The Ubuntu archives on CRAN are signed with the key of 
#  "Michael Rutter <marutter@gmail.com>" with key ID E084DAB9. 
#   reference  http://cran.r-project.org/bin/linux/ubuntu/
apt-key adv --keyserver keyserver.ubuntu.com  --recv-keys E084DAB9

# update
apt-get update -y

# add specfic PPA
apt-get install -y python-software-properties 
add-apt-repository -y ppa:marutter/rdev

# update
apt-get update -y

# upgrade
#apt-get upgrade -y

# install R base version
apt-get install -y r-base

# install R packages 
#apt-get install -y r-base-dev

#-----------------------------------------------------------------------------
# Install R Studio
#-----------------------------------------------------------------------------
apt-get install -y libapparmor1 gdebi-core wget
#wget https://download1.rstudio.org/rstudio-1.0.136-amd64.deb
#gdebi -n rstudio-1.0.136-amd64.deb
#wget https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb
#gdebi -n rstudio-1.1.383-amd64.deb
#wget --no-check-certificate http://www.rstudio.com/products/rstudio/download/
#export TEMPNAME=$(grep "amd64\.deb" index.html | grep rstudio-server | tail -n 1 | grep -o -P '(?<=rstudio-).*(?=amd64)')
#export DOWNLOADFILE="rstudio-"${TEMPNAME}"amd64.deb"
#wget https://download1.rstudio.org/${DOWNLOADFILE}
#gdebi -n $DOWNLOADFILE
#rm index.html

wget --no-check-certificate  https://www.rstudio.com/products/rstudio/download-server/
export TEMPNAME=$(grep "amd64\.deb" index.html | grep rstudio-server | tail -n 1 | grep -o -P '(?<=rstudio-server-).*(?=amd64)')
export DOWNLOADFILE="rstudio-server-"${TEMPNAME}"amd64.deb"
wget https://download2.rstudio.org/${DOWNLOADFILE}
gdebi -n $DOWNLOADFILE
rm index.html



#-----------------------------------------------------------------------------
# Install R packages
#-----------------------------------------------------------------------------
# create an R script to install R packages
# cat > install_Rpackages.R << EOL
# options(repos = c(CRAN = "http://cran.cnr.berkeley.edu/"))
# install.packages("dplyr")
# install.packages("entropy")
# install.packages("ggplot2")
# install.packages("ggtern")
# install.packages("plyr")
# install.packages("reshape2")
# install.packages("tidyr")
# EOL

# # run the R script 
# Rscript install_Rpackages.R
