FROM jupyterhub/singleuser

RUN apt-get update && \
    apt-get install -y software-properties-common

USER root

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

RUN apt-get update 
