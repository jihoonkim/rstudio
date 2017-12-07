### set the base image to Ubuntu
FROM ubuntu:16.04

### File author / maintainer
MAINTAINER Jihoon Kim "j5kim@ucsd.edu"

### change a working directory to /opt
WORKDIR /opt

### update the repository source list, install dependent packages,
###   install R add-on packages, and install iadmix
RUN apt-get update -y                                  && \
    apt-get install -y git                             && \
    git clone https://github.com/jihoonkim/rstudio.git && \
    bash /opt/rstudio/provision.sh                     
